% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : ArrangeDataInAscending.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : December 17, 2018
% *
% * Purpose           : Arranges the data in ascending order and the
% changes the name of the wind speed variable to Kmph to simplify the
% naming convention.
%                        
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format) 
% * YYYY/MM/DD      M Amin      1      Description of Revision
% *
% |**********************************************************************;
function WindData = ArrangeDataInAscending(Column,data)
A = sortrows(data,Column,'ascend');
WindData = A;
end