%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               IMAGES
%
% Two sections for normal and unspeckled case.
% Select the section manually by commenting and de-commenting.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               NORMAL
% Assumes channels' data available in the workspace.
% Takes only HH, HV, and VV and builds 3 1024x1024 matrices out of them.
% Scales data (Scaling + Norm).
% Creates a 1024x1024x3 matrix for imshow.
% Displays an RGB-coded picture.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hh3 = reshape(HH3, 1024, 1024)';
hv3 = reshape(HV3, 1024, 1024)';
vv3 = reshape(VV3, 1024, 1024)';

% hh4 = reshape(HH4, 1024, 1024)';
% hv4 = reshape(HV4, 1024, 1024)';
% vv4 = reshape(VV4, 1024, 1024)';

C3 = scaling(hh3, hv3, vv3);
% C4 = scaling(hh4, hv4, vv4);

Display(C3, 'fl063');
% Display(C4, 'fl064');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             AFTER DESPECKLE
% Data are already in the form of matrices
% Assumes channels' data available in the workspace as matrices.
% Scaling must work only in the inner 1022x1022 part of the matrices since
% the borders are set to 0 and must remain like that.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

C3f = zeros(1024, 1024, 3);
% C4f = zeros(1024, 1024, 3);

C3f(2:1023, 2:1023, :) = scaling(HH3f, HV3f, VV3f);
% C4f(2:1023, 2:1023, :) = scaling(HH4f, HV4f, VV4f);

Display(C3f, 'fl063 filtered');
% Display(C4f, 'fl064 filtered');