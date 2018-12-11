% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : PlotNHPP.m
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
function [a,b,R_sqd] = PlotNHPP(data)
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
f = polyval(p,A.Ln_CumTI); 
subplot(2,1,1)
plot(A.Ln_CumTI,A.Ln_Cum_Nt,'.',A.Ln_CumTI,f,'-')
grid on;
legend('data','linear fit','Location','southeast')
dim = [0.2 0.5 0.3 0.3];
mdl = fitlm(A.Ln_CumTI,A.Ln_Cum_Nt);
%Parameter Calculation
a = exp^(p(1));
b = p(2)
R_sqd = mdl.Rsquared.Ordinary;
ylabel('Ln(Cum N(t))'); xlabel('Ln(Time)');
X = sprintf('NHPP for wind speed >60kmph: %f X + %f and R-squared = %f',p(1),p(2),mdl.Rsquared.Ordinary);
title(X);
%set(gca,'Ylim',[30 160]) % Adjust Y limits of "current axes"
set(gca,'FontName','Times');
set(gcf,'Units','inches') % Set figure size units of "current figure"
set(gcf,'Color','white');