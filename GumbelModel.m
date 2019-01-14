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
%Look at different storm events input
t1 = 7;
% number of year/s
Y = 0;     %initialize counter for for loop
years = (2020:2020+81); years = years';
%percentile
p = 0.95;

%Are the calculations for wind-speed or inter-arrival data?
isInterArrival = 0;  % 0 = WInd 
%add for loop here for mutiple years
%Days = 365*Years;
for z = 1:Y
    Days(z) = (365*z)+(365*65)+16;
end

 %parameter variable
 par_ml= [];


%===================================
% Outputs
%===================================

wind_data = CollectMaxDataPointsForAStation(folder);
wind_data = RenameDataColumns(isInterArrival,wind_data);
%Reformat sample data for convenience
P = wind_data.KMPH;
%number of sample data
n = length(P);
%add loop for t years
 for z =  1:n
     t(z,:) = z;
 end

%find the first and last year
year1 = year(wind_data.Date_Time(1)); %first year of data
year2 = year(wind_data.Date_Time(n)); %last year of data
Y = year2-year1+1; %total number of years
Y=Y+1; %makes the prediction starting year to be 2020
Y1=length(years);
%add loop for years
 for z =  1:Y1
     t_YRS(z,:) = Y+z;
 end

%find the parameters a0, a1, and beta for the non-stationary case
csvwrite('in.csv',[P]);
system('R CMD BATCH "C:\Users\Maulin Amin\Documents\mlescript.R"');
dat = csvread('out.csv',1,1);
% % %ML estimation of parameters using fminunc to find local minimum
par_mm = [1,1,1];
fun1 = @(x) ( n*log(x(3)) ) + sum((P'-x(1)-(x(2)*t'))/x(3)) + sum(exp(-(P'-x(1)-(x(2)*t'))/x(3)));
par1 = fminunc(fun1, par_mm);
%assign parameter values to the parameter variables
a0 = dat(1); a1= dat(2); beta = dat(3);

%Calculate the percentiles for future years
for z = 1:Y1
    x95(z,:) = a0 - (a1*t_YRS(z)) - ( beta * ( log( -log(p) ) ) );
end

%Calculate the percentiles for future years
for z = 1:Y1-1
    Gx95(z,:) = a0 - ((a1*t_YRS(z+1)) - (a1*t_YRS(z))) - ( beta * ( log( -log(p) ) ) );
end
figure(1);
PlotData =  table(years,t_YRS,x95,'VariableNames',{'Year','t','P95'});
plot(PlotData.Year,PlotData.P95);
ylabel({'95th Percentile';'of Wind Speed'}); xlabel('Year');
set(gca,'Ylim',[170 220]);set(gca,'Xlim',[2020 2100]) % Adjust Y limits of "current axes"
set(gca,'FontName','Times');
set(gcf,'Units','inches') % Set figure size units of "current figure"
set(gcf,'Color','white');
set(gcf,'Position',[0,0,3,1.5]) % Set figure width (6 in.) and height (4 in.)
print -deps2c 606.eps % Save as PDF
movefile('606.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');

toDelete = years > (2020+80);
years(toDelete,:) = [];

figure(2);
PlotData2 =  table(years,Gx95,'VariableNames',{'Year','GP95'});
plot(PlotData2.Year,PlotData2.GP95,'-.');
ylabel({'95th Percentile';'of Wind Speed'}); xlabel('Year');
set(gca,'Ylim',[130 150],'Xlim',[2020 2100]) % Adjust Y limits of "current axes"
set(gca,'FontName','Times');
set(gcf,'Units','inches') % Set figure size units of "current figure"
set(gcf,'Color','white');
set(gcf,'Position',[0,0,3,1.5]) % Set figure width (6 in.) and height (4 in.)
print -deps2c 607.eps % Save as PDF
movefile('607.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
