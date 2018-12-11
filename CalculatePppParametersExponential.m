% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : CalculatePppParameters.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : November 22, 2018
% *
% * Purpose           : Calculates the NHPP Parametes using CROW-AMSAA plot
%                       and
%                        
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format) 
% * YYYY/MM/DD      M Amin      1      Description of Revision
% *
% |**********************************************************************;
function a = CalculatePppParametersExponential(u,folder)
wind_data = ExtractCSV(folder);
wind_data = RemoveBelowThreshold(u,wind_data);
A = ShiftData(wind_data);

WindData = A;
PPTH60 = WindData(:,4);
PPTH60 = sortrows(PPTH60,1,'ascend');
PPTH60.Properties.VariableNames{'SpdOfMaxGust_km_h_'} = 'Kmph';

%calculations for PPP
z = numel(PPTH60);
for k = 1:z
    PPTH60.Ln_Kmph(k) = log(PPTH60.Kmph(k));
end
toDelete = PPTH60.Ln_Kmph == 0;
PPTH60(toDelete,:) = [];
z = numel(PPTH60.Ln_Kmph);
for k = 1:z
    PPTH60.Rank(k) = k;
end
for k = 1:z
    PPTH60.Pi(k) = k/(z+1);
end
for k = 1:z
    PPTH60.InvPi(k) = norminv(PPTH60.Pi(k));
end
for k = 1:z
    PPTH60.ExpPi(k) = -log(1-PPTH60.Pi(k));
end

%Calculate Exponential PPP Parameters
p = polyfitB(PPTH60.ExpPi,PPTH60.Kmph,1,0);
a = p(1);
