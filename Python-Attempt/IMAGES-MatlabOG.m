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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ Aout ] = Norm( Ain )
    Amax = max(max(Ain));
    Amin = min(min(Ain));
    Aout = (Ain - Amin)./(Amax - Amin);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ C ] = scaling( HH, HV, VV )
    HH = Norm(10*log10(HH));
    HV = Norm(10*log10(HV));
    VV = Norm(10*log10(VV));
    
    C = cat(3, HV, HH, VV);
end