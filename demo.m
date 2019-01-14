% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : DistOfMax.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : Jan 07, 2018
% *
% * Purpose           : 
%                       
% * Note              : This program plots the probability of exceedance vs
%                       the annual maximum values of wind speed.
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format) 
% * YYYY/MM/DD      M Amin      0      Description of Revision

%

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
u = 70;
u1 = 70.5;
u2 = 70;
%Sorting Column
Column = 1;
%Look at different storm events input
t1 = 7;
t2=7;
% number of year/s
%Years = 1;
Y = 82;     %counter for for loop
years = (2020:2020+81);
%percentile
p = 0.95;
%Are the calculations for wind-speed or inter-arrival data?
isInterArrival = 0;  % 0 = WInd 


%===================================
% Outputs
%===================================
Data = ExtractCSV(folder);
wind_data = Data;
wind_data = RemoveBelowThreshold(u,wind_data);
wind_data = CalculateIAT(wind_data);
wind_data = LookAtDifferentStormEvents(t1,wind_data);
wind_data = CalculateIAT(wind_data);
[alpha,beta,R_sq,wind_data] = CalculateNhppParameters(wind_data);

A = Data;
A = RemoveBelowThreshold(u1,A);
A = ShiftKMPHData(u2,A);
if isInterArrival == 1
    A = CalculateIAT(A);
    A = LookAtDifferentStormEvents(t1,A);
    A = ShiftIATData(t2,A);
    Column = 2;
    A = ArrangeDataInAscending(Column,A);
else
    A = ArrangeDataInAscending(Column,A);
end
A = RenameDataColumns(isInterArrival,A);
A = PPPCalculations(isInterArrival,A);

if isInterArrival == 0
   
    %PLOT THE EXPONENTIAL PPP for Wind Speed Data
    p = polyfitB(A.ExpPi,A.KMPH,1,0);
    f = polyval(p,A.ExpPi);
    %Calculation of the value of statistics
    lambda = 1/p(1);
 
else
    
    %PLOT THE EXPONENTIAL PPP for Inter-Arrival Time Data
    p = polyfitB(A.ExpPi,A.TI,1,0);
    f = polyval(p,A.ExpPi);
    %Calculation of the value of statistics
    lambda = 1/p(1); 
end

B = CollectMaxDataPointsForAStation(folder);
B = RenameDataColumns(isInterArrival,B);
P=B.KMPH;

B = ArrangeDataInAscending(2,B);

t_YRS = (0:65)';

for z = 1:64
    N(z,:) = ( exp( -alpha*((t_YRS(z+1)^beta)-(t_YRS(z)^beta)) * exp(-lambda*(B.KMPH(z,:)-u2)) ) );
end
figure;
plot(B.KMPH,N);
% figure;
% Ex = eprob(B.KMPH);

% t1 = 1:64;
% t2 = 2:65;
% n = exp((-((alpha*t2.^beta) - (alpha*t1.^beta)))* exp(-lambda*(P-70)));
% figure;
% plot(P,n);