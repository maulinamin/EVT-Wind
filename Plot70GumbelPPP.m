% |**********************************************************************;
% * Project           : Examinations of Assumptions of
% *                     Environmental Load Models
% *
% * Program name      : PlotGumbelPPP.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : December 18, 2018
% *
% * Purpose           : Plots exponential PPP
%
% * Note              :
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format)
% * 2018/12/18      M Amin      1      Re-write from a previously written
%                                      program.
%   2019/01/02      M Amin      2      Rename plot files to be saved.
% *
% |**********************************************************************;
function [A,Y] = PlotGumbelPPP(i,isInterArrival,Data)
A = Data;

if isInterArrival == 0
    
    %PLOT THE GUMBEL PPP for Wind Speed Data
    p = polyfit(A.GumbPi,A.KMPH,1);
    f = polyval(p,A.GumbPi);
    plot(A.GumbPi,A.KMPH,'.',A.GumbPi,f,'-')
    grid on;
    legend('data','linear fit')
    dim = [0.2 0.5 0.3 0.3];
    mdl = fitlm(A.GumbPi,A.KMPH);
    ylabel('Data(Xi-70)'); xlabel('(-Ln(-Ln(Pi)))');
    X = sprintf('Gumbel');
    legend('data','linear fit','Location','southeast')
    title(X);
    set(gca,'FontName','Times');
    set(gcf,'Units','inches') % Set figure size units of "current figure"
    set(gcf,'Color','white');
    set(gcf,'Position',[0,0,3,2.5]) % Set figure width (6 in.) and height (4 in.)
    switch i
        case 1
            print -deps2c 3-4-1-d.eps % Save as PDF
            movefile('3-4-1-d.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 2
            print -deps2c 3-4-2-d.eps % Save as PDF
            movefile('3-4-2-d.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 3
            print -deps2c 3-4-3-d.eps % Save as PDF
            movefile('3-4-3-d.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 4
            print -deps2c 3-4-4-d.eps % Save as PDF
            movefile('3-4-4-d.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 5
            print -deps2c 3-4-5-d.eps % Save as PDF
            movefile('3-4-5-d.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 6
            print -deps2c 3-4-6-d.eps % Save as PDF
            movefile('3-4-6-d.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 7
            print -deps2c 3-4-7-d.eps % Save as PDF
            movefile('3-4-7-d.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 8
            print -deps2c 3-4-8-d.eps % Save as PDF
            movefile('3-4-8-d.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
    end
    %Calculation of the value of statistics
    beta = p(1);
    alpha = ( p(2) );
    R_Sq = mdl.Rsquared.Ordinary;
    mean = alpha + (0.5772 * beta);
    var = ((pi^2)/6) * (beta^2) ;
    sd = sqrt(var);
    cov = sd/mean;
    Y = sprintf('Gumbel PPP: %f X + %f; R-squared = %f; alpha = %f, beta = %f, Mean = %f; Variance = %f, Covariance = %f',p(1),p(2),R_Sq,alpha,beta,mean,var,cov);
    
else
    
    %PLOT THE GUMBEL PPP for Inter-Arrival Time Data
    p = polyfit(A.GumbPi,A.TI,1);
    f = polyval(p,A.GumbPi);
    plot(A.GumbPi,A.TI,'.',A.GumbPi,f,'-')
    grid on;
    legend('data','linear fit')
    dim = [0.2 0.5 0.3 0.3];
    mdl = fitlm(A.GumbPi,A.TI);
    ylabel('Data(Xi-7)'); xlabel('(-Ln(-Ln(Pi)))');
    X = sprintf('Gumbel');
    legend('data','linear fit','Location','southeast')
    title(X);
    set(gca,'FontName','Times');
    set(gcf,'Units','inches') % Set figure size units of "current figure"
    set(gcf,'Color','white');
    set(gcf,'Position',[0,0,3,2.5]) % Set figure width (6 in.) and height (4 in.)
    switch i
        case 1
            print -deps2c 3-5-1-d.eps % Save as PDF
            movefile('3-5-1-d.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 2
            print -deps2c 3-5-2-d.eps % Save as PDF
            movefile('3-5-2-d.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 3
            print -deps2c 3-5-3-d.eps % Save as PDF
            movefile('3-5-3-d.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 4
            print -deps2c 3-5-4-d.eps % Save as PDF
            movefile('3-5-4-d.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 5
            print -deps2c 3-5-5-d.eps % Save as PDF
            movefile('3-5-5-d.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 6
            print -deps2c 3-5-6-d.eps % Save as PDF
            movefile('3-5-6-d.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 7
            print -deps2c 3-5-7-d.eps % Save as PDF
            movefile('3-5-7-d.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 8
            print -deps2c 3-5-8-d.eps % Save as PDF
            movefile('3-5-8-d.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
    end
    %Calculation of the value of statistics
    beta = p(1);
    alpha = ( p(2) );
    R_Sq = mdl.Rsquared.Ordinary;
    mean = alpha + (0.5772 * beta);
    var = ((pi^2)/6) * (beta^2) ;
    sd = sqrt(var);
    cov = sd/mean;
    Y = sprintf('Gumbel PPP: %f X + %f; R-squared = %f; alpha = %f, beta = %f, Mean = %f; Variance = %f, Covariance = %f',p(1),p(2),R_Sq,alpha,beta,mean,var,cov);
    
end

end

