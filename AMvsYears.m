% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : AMvsYears.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : November 22, 2018
% *
% * Purpose           : This program plots the values of Annual Maximum
%                       Wind Speed vs Year. 
%                       
% * Note              : 
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format) 
% * YYYY/MM/DD      M Amin      1      Description of Revision
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
folder='C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Wind&SnowData\CSV\Trenton';
%===================================
% Outputs
%===================================
data = CollectMaxDataPointsForAStation(folder);

figure(1);
plot(data.Date_Time,data.SpdOfMaxGust_km_h_);
ylabel({'Annual Maximum Wind Speed'}); xlabel('Year');
% set(gca,'Ylim',[120 180],'Xlim',[2018 2027]) % Adjust Y limits of "current axes"
set(gca,'FontName','Times');
set(gcf,'Units','inches') % Set figure size units of "current figure"
set(gcf,'Color','white');
set(gcf,'Position',[0,0,3,2.5]) % Set figure width (6 in.) and height (4 in.)
print -deps2c 602.eps % Save as PDF
movefile('602.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');


years = [1955:2018]';

data.years = years;
figure(2);
p = polyfit(data.years,data.SpdOfMaxGust_km_h_,1); 
f = polyval(p,data.years); 
plot(data.years,data.SpdOfMaxGust_km_h_,'.',data.years,f,'-')
grid on;
dim = [0.2 0.5 0.3 0.3];
mdl = fitlm(data.years,data.SpdOfMaxGust_km_h_);
ylabel('Annual Maximum Wind Speed'); xlabel('Years');
legend('Wind Speed','Linear Fit','Location','northeast')
set(gca,'Xlim',[1955 2018]) % Adjust Y limits of "current axes"
set(gca,'FontName','Times');
set(gcf,'Units','inches') % Set figure size units of "current figure"
set(gcf,'Color','white');
set(gcf,'Position',[0,0,3,2.5]) % Set figure width (6 in.) and height (4 in.)
print -deps2c 603.eps % Save as PDF
movefile('603.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');

