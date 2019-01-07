% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : GumbelModel.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : Jan 02, 2018
% *
% * Purpose           : 
%                       
% * Note              : This program plots the return level plot with the
%                       plots being linear, thus proving gumbel model. That
%                       is, it is a plot of return level Zp vs return
%                       period 1/p (Coles p. 49)
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format) 
% * YYYY/MM/DD      M Amin      0      Description of Revision
% * 2019/01/02      M Amin      1      Copied from EleventhStepTrenton.m
% * 2019/01/03      M Amin      2      Added the portion that calculates
%                                      the parameters using MLE. 
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
%Sorting Column
Column = 2;
%Look at different storm events input
t1 = 7;
% number of year/s
%Years = 1;
Y = 82;     %counter for for loop
years = (2020:2020+81);
%percentile
p = 0.95;
%exponential parameter
a = 0.083;
%Are the calculations for wind-speed or inter-arrival data?
isInterArrival = 0;  % 0 = WInd 
%add for loop here for mutiple years
%Days = 365*Years;
for z = 1:Y
    Days(z) = (365*z)+(365*65)+16;
end
%add loop for years
 for z =  1:Y
     YRS(z) = 65+z;
 end
 %parameter variable
 par_ml= [];
%===================================
% Outputs
%===================================
MaxPoints = CollectMaxDataPointsForAStation(folder);
wind_data = ArrangeDataInAscending(Column,MaxPoints);
wind_data = RenameDataColumns(isInterArrival,wind_data);
wind_data = PPPCalculations(isInterArrival,wind_data);
[X,alpha,beta] = PlotGumbelModel(wind_data);
% x95 = alpha - ( beta * ( log( -log(0.95) ) ) );
% y95 = x95 + u;
% for z = 1:Y
%     wind_data.GumbelR(z) = ( y95^YRS(z) );
% end
% plot(years,wind_data.GumbelR)

%Reformat sample data for convenience
P = wind_data.KMPH;
par_mm = [alpha; beta];
%number of sample data
n = length(P);
%ML estimation of parameters using fminunc to find local minimum
fun1 = @(x) n*log(x(2)) + sum((P-x(1))/x(2)) + sum(exp(-(P-x(1))/x(2)));
par1 = fminunc(fun1, par_mm);
par_ml = [par_ml,par1];

% phat = mle(P,'distribution','EV')
% parmhat = evfit(P)