%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                  READING
%
% Reads every channel (ReadMain + ReadCross);
% gives vectors of all channels 
% No further processing
% 
% On the Workspace:
%           HHx, HVx, VVx, HHHVx, HHVVx, HVVVx  (x = specific data set)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% First Data set
[HH3, HV3, VV3] = readMain('fl063');
[HHHV3, HHVV3, HVVV3] = readCross('fl063');

% Second Data set
[HH4, HV4, VV4] = readMain('fl064');
[HHHV4, HHVV4, HVVV4] = readCross('fl064');