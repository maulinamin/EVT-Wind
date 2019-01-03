% |**********************************************************************;
% * Project           : Examinations of Assumptions of
% *                     Environmental Load Models
% *
% * Program name      : PlotGumbelModel.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : Jan 02, 2019
% *
% * Purpose           : Plots Gumbel Model
%
% * Note              :
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format)
% * 2019/01/02      M Amin      1      Re-write from a previously written
%                                      program EleventhStepTrenton.
% *
% |**********************************************************************;
function [Y,alpha,beta] = PlotGumbelModel(Data)
wind_data = Data;


%PLOT THE Gumbel wind_data
p = polyfit(wind_data.GumbPi,wind_data.KMPH,1);
f = polyval(p,wind_data.GumbPi);
plot(wind_data.GumbPi,wind_data.KMPH,'.',wind_data.GumbPi,f,'-')
grid on;
legend('data','linear fit')
mdl = fitlm(wind_data.GumbPi,wind_data.KMPH);
ylabel('Data(Xi)'); xlabel('(-Ln(-Ln(Pi)))');
X = sprintf('Gumbel Model');
legend('data','linear fit','Location','southeast')
set(gca,'FontName','Times');
set(gcf,'Units','inches') % Set figure size units of "current figure"
set(gcf,'Color','white');
set(gcf,'Position',[0,0,3,2.5]) % Set figure width (6 in.) and height (4 in.)

%Calculation of the value of statistics
beta = p(1);
alpha = p(2);
R_Sq = mdl.Rsquared.Ordinary;
mean = alpha + (0.5772 * beta);
var = ((pi^2)/6)*(beta^2);
sd = sqrt(var);
cov = sd/mean;
Y = sprintf('Gumbel Model: %f X + %f; R-squared = %f; alpha = %f; beta = %f; Mean = %f; Variance = %f, Covariance = %f',p(1),p(2),R_Sq,alpha,beta,mean,var,cov);


end

