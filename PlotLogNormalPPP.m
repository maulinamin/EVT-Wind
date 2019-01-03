% |**********************************************************************;
% * Project           : Examinations of Assumptions of
% *                     Environmental Load Models
% *
% * Program name      : PlotLogNormalPPP.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : December 17, 2018
% *
% * Purpose           : Plots lognormal PPP
%
% * Note              :
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format)
% * 2018/12/17      M Amin      1      Re-write from a previously written
%                                      program.
% *
% |**********************************************************************;
function [A,Y] = PlotLogNormalPPP(i,isInterArrival,Data)
A = Data;

if isInterArrival == 0
    
    %PLOT THE LOGNORMAL PPP for Wind Speed Data
    p = polyfit(A.InvPi,A.Ln_KMPH,1);
    f = polyval(p,A.InvPi);
    plot(A.InvPi,A.Ln_KMPH,'.',A.InvPi,f,'-')
    grid on;
    legend('data','linear fit')
    mdl = fitlm(A.InvPi,A.Ln_KMPH);
    ylabel('Ln(Xi-60)'); xlabel('Standard Normal Percentile');
    X = sprintf('LogNormal');
    legend('data','linear fit','Location','southeast')
    title(X);
    set(gca,'FontName','Times');
    set(gcf,'Units','inches') % Set figure size units of "current figure"
    set(gcf,'Color','white');
    set(gcf,'Position',[0,0,3,2.5]) % Set figure width (6 in.) and height (4 in.)
    switch i
        case 1
            print -deps2c 3-2-1-a.eps % Save as PDF
            movefile('3-2-1-a.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 2
            print -deps2c 3-2-2-a.eps % Save as PDF
            movefile('3-2-2-a.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 3
            print -deps2c 3-2-3-a.eps % Save as PDF
            movefile('3-2-3-a.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 4
            print -deps2c 3-2-4-a.eps % Save as PDF
            movefile('3-2-4-a.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 5
            print -deps2c 3-2-5-a.eps % Save as PDF
            movefile('3-2-5-a.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 6
            print -deps2c 3-2-6-a.eps % Save as PDF
            movefile('3-2-6-a.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 7
            print -deps2c 3-2-7-a.eps % Save as PDF
            movefile('3-2-7-a.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 8
            print -deps2c 3-2-8-a.eps % Save as PDF
            movefile('3-2-8-a.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
    end
    %Calculation of the value of statistics
    eta = p(1);
    lambda = p(2);
    R_Sq = mdl.Rsquared.Ordinary;
    mean = exp( lambda + ( 0.5*(eta^2) ) );
    var = exp((2*lambda)+(eta^2)) * ((exp(eta^2)) - 1);
    sd = sqrt(var);
    cov = sd/mean;
    Y = sprintf('Lognormal PPP: %f X + %f; R-squared = %f; eta = %f; lambda = %f; Mean = %f; Variance = %f, Covariance = %f',p(1),p(2),R_Sq,eta,lambda,mean,var,cov);
    
else
    
    %PLOT THE LOGNORMAL PPP for Inter-Arrival Time Data
    p = polyfit(A.InvPi,A.Ln_TI,1);
    f = polyval(p,A.InvPi);
    plot(A.InvPi,A.Ln_TI,'.',A.InvPi,f,'-')
    grid on;
    legend('data','linear fit')
    mdl = fitlm(A.InvPi,A.Ln_TI);
    ylabel('Ln(Xi-7)'); xlabel('Standard Normal Percentile');
    X = sprintf('LogNormal');
    legend('data','linear fit','Location','southeast')
    title(X);
    set(gca,'FontName','Times');
    set(gcf,'Units','inches') % Set figure size units of "current figure"
    set(gcf,'Color','white');
    set(gcf,'Position',[0,0,3,2.5]) % Set figure width (6 in.) and height (4 in.)
    switch i
        case 1
            print -deps2c 3-3-1-a.eps % Save as PDF
            movefile('3-3-1-a.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 2
            print -deps2c 3-3-2-a.eps % Save as PDF
            movefile('3-3-2-a.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 3
            print -deps2c 3-3-3-a.eps % Save as PDF
            movefile('3-3-3-a.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 4
            print -deps2c 3-3-4-a.eps % Save as PDF
            movefile('3-3-4-a.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 5
            print -deps2c 3-3-5-a.eps % Save as PDF
            movefile('3-3-5-a.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 6
            print -deps2c 3-3-6-a.eps % Save as PDF
            movefile('3-3-6-a.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 7
            print -deps2c 3-3-7-a.eps % Save as PDF
            movefile('3-3-7-a.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 8
            print -deps2c 3-3-8-a.eps % Save as PDF
            movefile('3-3-8-a.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
    end
    %Calculation of the value of statistics
    eta = p(1);
    lambda = p(2);
    R_Sq = mdl.Rsquared.Ordinary;
    mean = exp( lambda + (0.5*(eta^2) ) );
    var = exp((2*lambda)+(eta^2)) * ((exp(eta^2)) - 1);
    sd = sqrt(var);
    cov = sd/mean;
    Y = sprintf('Lognormal PPP: %f X + %f; R-squared = %f; eta = %f; lambda = %f; Mean = %f; Variance = %f, Covariance = %f',p(1),p(2),R_Sq,eta,lambda,mean,var,cov);
    
end

end

