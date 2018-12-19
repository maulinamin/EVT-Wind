% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : 70PlotPPPs.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : December 17, 2018
% *
% * Purpose           : Plots the Probability Paper Plots (PPPs) for the
%                       desired station with a threshold of 70KMPH. 
%                       It plots for lognormal, exponential, weibull, and 
%                       gumbel distribution. 
%                       
% * Note              : 
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format) 
% * 2018/12/19      M Amin      1      Modified 60KMPH for 70KMPH. 
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
% Location of CSV files obtained from Environment Canada
allFolders = {'C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Research Project\Matlab\CSV\Trenton','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Research Project\Matlab\CSV\KW','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Research Project\Matlab\CSV\London','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Research Project\Matlab\CSV\Hamilton','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Research Project\Matlab\CSV\Sarnia','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Research Project\Matlab\CSV\Wiarton','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Research Project\Matlab\CSV\Toronto_Island','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Research Project\Matlab\CSV\Toronto_Airport'}; 
% folder='C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Research Project\Matlab\CSV\Trenton';
%Threshold Value
%The reason behind using two threshold values is that that after the
%shifting we end-up with values starting from '1' rather than '0'.
u1 = 70.5;
u2 = 70;
%
Column = 1;
%Are the calculations for wind-speed or inter-arrival data?
isInterArrival = 1;  % 0 = WInd 
t1 = 8; %in days
t2 = 7; %in days 
%===================================
% Outputs
%===================================
for i = 1:length(allFolders)
    folder = allFolders{i}; 

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
[wind_data,Y1] = PlotLogNormalPPP(i,isInterArrival,wind_data);
figure;
[wind_data,Y2] = PlotExponentialPPP(i,isInterArrival,wind_data);
figure;
[wind_data,Y3] = PlotWeibullPPP(i,isInterArrival,wind_data);
figure;
[wind_data,Y4] = PlotGumbelPPP(i,isInterArrival,wind_data);
Q{i,1} = {Y1;Y2;Y3;Y4};
%Alternative to the above statement is commented out below. The above
%statement does the same as below in less time as it requires the execution
%of less instructions.
% Parameters = {Y1,Y2,Y3,Y4};
% PARA{i,1} = StorePPPParameters(i,isInterArrival,Parameters);
end