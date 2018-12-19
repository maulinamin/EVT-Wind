% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : RenameDataColumns.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : December 17, 2018
% *
% * Purpose           : Renames the wind speed and wind inter-arrival time
%                       data columns to KMPH and TI respectively for
%                       simplicity.
%                        
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format) 
% * YYYY/MM/DD      M Amin      1      Description of Revision
% *
% |**********************************************************************;
function WindData = RenameDataColumns(isInterArrival,data)
A = data;
A.Properties.VariableNames{'SpdOfMaxGust_km_h_'} = 'KMPH';
if isInterArrival == 1
    A.Properties.VariableNames{'Time_Interval'} = 'TI';
end
WindData = A;
end