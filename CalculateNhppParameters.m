% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : CalculateNhppParameters.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : November 22, 2018
% *
% * Purpose           : Calculates the NHPP Parametes using CROW-AMSAA plot
%                       and
%                        
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format) 
% * YYYY/MM/DD      M Amin      1      Description of Revision
% *
% |**********************************************************************;
function [a,b,R_sqd,A] = CalculateNhppParameters(data)
A = data;
%Calculate the Cum_N(t)
for k = 1:numel(A.Date_Time)
    A.Cum_Nt(k) = k;
end

%Calculate the cumulative time interval
first = 0;
for k = 1:numel(A.Date_Time)
    second = A.Time_Interval(k);
    A.CumTI(k) = first+second;
    first = A.CumTI(k);
end
%Calculate the log of Cum_N(t)
for k = 1:numel(A.Date_Time)
    A.Ln_Cum_Nt(k) = log(A.Cum_Nt(k));
end
%Calculate the log of cumulative time interval
for k = 1:numel(A.Date_Time)
    A.Ln_CumTI(k) = log(A.CumTI(k));
end

A = table2timetable(A);

%PLOT THE NHPP
p = polyfit(A.Ln_CumTI,A.Ln_Cum_Nt,1); 
mdl = fitlm(A.Ln_CumTI,A.Ln_Cum_Nt);
%Parameter Calculation
b = p(1);
%a = exp(a);
a = exp(p(2));
R_sqd = mdl.Rsquared.Ordinary;
end