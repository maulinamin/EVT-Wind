% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : ImpulsePlot.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : Jan 10, 2018
% *
% * Purpose           : This program plots impulses for the chapter of POT
%                       vs AM
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
%Required input for the RenameDataColumns
isInterArrival = 0;


%===================================
% Outputs
%===================================
data = CollectMaxDataPointsForAStation(folder);
data = RenameDataColumns(isInterArrival,data);

p_constant = data.KMPH;
for k = 1:numel(data.Date_Time)
   p_constant(k) = 100;
end

stem(data.Date_Time,data.KMPH,'k');
hold on
plot(data.Date_Time,p_constant,'-','LineWidth',2.1)
hold off
ylabel({'Load X';'Annual Maximum Wind-Speed'}); xlabel('Year/Time');
% set(gca,'Ylim',[120 180],'Xlim',[2018 2027]) % Adjust Y limits of "current axes"
set(gca,'FontName','Times');
set(gcf,'Units','inches') % Set figure size units of "current figure"
set(gcf,'Color','white');
set(gcf,'Position',[0,0,6.5,2.5]) % Set figure width (6 in.) and height (4 in.)
print -deps2c 6-0-2.eps % Save as PDF
movefile('6-0-2.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');


