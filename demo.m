% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : PPP_WindSpeed.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : December 17, 2018
% *
% * Purpose           : Plots the Probability Paper Plots (PPPs) for the
%                       desired station. It plots for lognormal,
%                       exponential, weibull, and gumbel distribution. 
%                       
% * Note              : 
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format) 
% * 2018/12/17      M Amin      1      Re-write from a previously written
%                                      program.
% * 2018/12/17      M Amin      2      The program wasn't plotting the
%                                      linear fit. Referenced SixthStep to
%                                      find out that there were supposed to
%                                      be two threshold values to allow for
%                                      the data to start from '1'. If not
%                                      the case, the data starts from '0'
%                                      and that results in the log of those
%                                      values as infinity. 
% *
% |**********************************************************************;
%==================================
% Basic Initialization instructions
%==================================
clear; % Clear Memory
clc; %Clear Command Window

%===================================
% Inputs
%===================================
% Location of Trenton CSV files obtained from Environment Canada
folder='C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Research Project\Matlab\CSV\Trenton';
%Threshold Value
%The reason behind using two threshold values is that that after the
%shifting we end-up with values starting from '1' rather than '0'.
u1 = 61;
u2 = 60;
%
Column = 1;
%Are the calculations for wind-speed or inter-arrival data?
isInterArrival = 0;
t1 = 8; %in days
t2 = 7; %in days 
% Location of Trenton CSV files obtained from Environment Canada
folder='C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Research Project\Matlab\CSV\Trenton';
%Threshold Value
u = 70;
% number of year/s
%Years = 1;
Y = 82;     %counter for for loop
years = (2020:2020+81);
%percentile
p = 0.95;
%exponential parameter
a = 0.083;
%add for loop here for mutiple years
%Days = 365*Years;
for z = 1:Y
    Days(z) = (365*z)+(365*65)+16;
end
%===================================
% Outputs
%===================================
wind_data = ExtractCSV(folder);
wind_data = RemoveBelowThreshold(u,wind_data);
wind_data = CalculateIAT(wind_data);
A = wind_data;
toDelete = A.Time_Interval < 7;
A(toDelete,:) = [];
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