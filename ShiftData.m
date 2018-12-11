% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : ShiftData.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : November 22, 2018
% *
% * Purpose           : Shifts data according to the threshlold value
%                       chosen.
%                        
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format) 
% * YYYY/MM/DD      M Amin      1      Description of Revision
% *
% |**********************************************************************;
function WindData = ShiftData(data)
A = data;
%Shift the kmph data
for k = 1:numel(A.SpdOfMaxGust_km_h_)
    A.SpdOfMaxGust_km_h_(k) = A.SpdOfMaxGust_km_h_(k) - 60;
end
WindData = A;
end