%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Equivalent Number of Looks Estimation   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Assumed that the data for the three channels hhhh, hvhv, vvvv are already
% available (execute after "images")

% Normal
    HH = reshape(HH3, 1024, 1024)';
    HV = reshape(HV3, 1024, 1024)';
    VV = reshape(VV3, 1024, 1024)';
    N = EqNLooks(HH, HV, VV);
    n = round(mean(N));

% After Despeckle
%     Z1 = zeros(1024, 1024);
%     Z2 = zeros(1024, 1024);
%     Z3 = zeros(1024, 1024);
%     
%     Z1(2:1023,2:1023) = HH3f;
%     Z2(2:1023,2:1023) = HV3f;
%     Z3(2:1023,2:1023) = VV3f;
%     Nf = EqNLooks(Z1, Z2, Z3);
%     nf = round(mean(Nf));