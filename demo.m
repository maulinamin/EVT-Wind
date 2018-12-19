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
%===================================
% Outputs
%===================================
wind_data = ExtractCSV(folder);
wind_data = RemoveBelowThreshold(u1,wind_data);
wind_data = ShiftKMPHData(u2,wind_data);
if isInterArrival == 1
    wind_data = CalculateIAT(wind_data);
    wind_data = LookAtDifferentStormEvents(t1,wind_data);
    wind_data = ShiftIATData(t2,wind_data);
    Column = 2;
    wind_data = ArrangeDataInAscending(Column,wind_data);
else
    wind_data = ArrangeDataInAscending(Column,wind_data);
end
wind_data = RenameDataColumns(isInterArrival,wind_data);
wind_data = PPPCalculations(isInterArrival,wind_data);
figure;
[wind_data,Y1] = PlotLogNormalPPP(isInterArrival,wind_data);
figure;
[wind_data,Y2] = PlotExponentialPPP(isInterArrival,wind_data);
figure;
[wind_data,Y3] = PlotWeibullPPP(isInterArrival,wind_data);
figure;
[wind_data,Y4] = PlotGumbelPPP(isInterArrival,wind_data);