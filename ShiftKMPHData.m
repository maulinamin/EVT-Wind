% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : ShiftKMPHData.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : November 22, 2018
% *
% * Purpose           : Shifts windspeed data according to the threshold
%                       value chosen.
%                        
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format) 
% * YYYY/MM/DD      M Amin      1      Description of Revision
% *
% |**********************************************************************;
function WindData = ShiftKMPHData(u, data)
A = table2timetable(data);
%Shift the kmph data
for k = 1:numel(A.SpdOfMaxGust_km_h_)
    A.SpdOfMaxGust_km_h_(k) = A.SpdOfMaxGust_km_h_(k) - u;
end
WindData = A;
end