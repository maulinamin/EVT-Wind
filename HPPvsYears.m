% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : demo.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : November 22, 2018
% *
% * Purpose           : 
%                       
% * Note              : This program does not remove the data above a particular
%                       threshold. Refer to a different program for that
%                       function.
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
%Threshold Value
u = 70;
%
alpha = 0;   
%
beta = 0;
% number of year/s
%Years = 1;
Y = 82;     %counter for for loop
years = (2020:2020+81);
%percentile
p = 0.95;
%exponential parameter
a = 0.080;
%add for loop here for mutiple years
%Days = 365*Years;
for z = 1:Y
    Days(z) = (365*z)+(365*65)+16;
end
%precision
digitsOld = digits(5);
%===================================
% Outputs
%===================================
wind_data = ExtractCSV(folder);
wind_data = RemoveBelowThreshold(u,wind_data);
wind_data = CalculateIAT(wind_data);
[alpha,beta,R_Squared] = CalculateNhppParameters(wind_data);

% Calculate Delta t, Percentile Xp (shock), and real percentile Yp
% (sock+threshold)
for k = 1:Y
    Delta_t(k) = alpha * ( (Days(k))^(beta-1) ) ;
    Xp(k) = (-1/a) * log( (-log(p))/(Delta_t(k)) );
    Yp(k) = ( Xp(k) + u );
end
Data = table(years',Days',Delta_t',Xp',Yp','VariableNames',{'Year','Days','Delta_t','Xp','Yp'});

% Calculate the generalized Real Percentile
for k = 1:Y-1
    Data.General_Delta_t(k) = Data.Delta_t(k+1) - Data.Delta_t(k) ;
    Data.General_Xp(k) = (-1/a) * log( (-log(p))/(Data.General_Delta_t(k)) ) ;
    Data.General_Yp(k) = round(Data.General_Xp(k) + u,2);
end

toDelete = Data.Year > (2020+80);
Data(toDelete,:) = [];
writetable(Data,'NHPP_Prediction.csv','Delimiter',',','QuoteStrings',true)

figure(1);
plot(Data.Year,Data.Yp);
ylabel({'95th Percentile';'of Wind Speed'}); xlabel('Year');
% set(gca,'Ylim',[185 195],'Xlim',[2018 2027]) % Adjust Y limits of "current axes"
set(gca,'FontName','Times');
set(gcf,'Units','inches') % Set figure size units of "current figure"
set(gcf,'Color','white');
set(gcf,'Position',[0,0,3,2.5]) % Set figure width (6 in.) and height (4 in.)
print -deps2c 604.eps % Save as PDF
movefile('604.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');

figure(2);
plot(Data.Year,Data.General_Yp);
ylabel({'Generalized 95th Percentile';'of Wind Speed'}); xlabel('Year');
% set(gca,'Ylim',[134 139],'Xlim',[2018 2027]) % Adjust Y limits of "current axes"
set(gca,'FontName','Times');
set(gcf,'Units','inches') % Set figure size units of "current figure"
set(gcf,'Color','white');
set(gcf,'Position',[0,0,3,2.5]) % Set figure width (6 in.) and height (4 in.)
print -deps2c 605.eps % Save as PDF
movefile('605.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');