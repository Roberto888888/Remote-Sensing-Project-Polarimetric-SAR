%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             CM
%
% Builds a  3x3xl matrix with all the covariance matrices, for every pixel
% (CovMat)
%
% NB: l = number of pixels
% NB: It must work for matrices of general dimensions because after 
% despeckling the dimensions of the matrices will change
%
% On the workspace:
%     Cmx (x = specific data set)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% NORMAL
%     Cm3 = CovMat(HH3, HV3, VV3, HHHV3, HHVV3, HVVV3);
%     Cm4 = CovMat(HH4, HV4, VV4, HHHV4, HHVV4, HVVV4);

% AFTER DESPECKLE
    HH3f = reshape(HH3f', 1, 1022*1022);
    HV3f = reshape(HV3f', 1, 1022*1022);
    VV3f = reshape(VV3f', 1, 1022*1022);
    HHHV3f = reshape(HHHV3f', 1, 1022*1022);
    HHVV3f = reshape(HHVV3f', 1, 1022*1022);
    HVVV3f = reshape(HVVV3f', 1, 1022*1022);
    Cm3f = CovMat(HH3f, HV3f, VV3f, HHHV3f, HHVV3f, HVVV3f);
    HH3f = reshape(HH3f, 1022, 1022)';
    HV3f = reshape(HV3f, 1022, 1022)';
    VV3f = reshape(VV3f, 1022, 1022)';
    HHHV3f = reshape(HHHV3f, 1022, 1022)';
    HHVV3f = reshape(HHVV3f, 1022, 1022)';
    HVVV3f = reshape(HVVV3f, 1022, 1022)';

    HH4f = reshape(HH4f', 1, 1022*1022);
    HV4f = reshape(HV4f', 1, 1022*1022);
    VV4f = reshape(VV4f', 1, 1022*1022);
    HHHV4f = reshape(HHHV4f', 1, 1022*1022);
    HHVV4f = reshape(HHVV4f', 1, 1022*1022);
    HVVV4f = reshape(HVVV4f', 1, 1022*1022);
    Cm4f = CovMat(HH4f, HV4f, VV4f, HHHV4f, HHVV4f, HVVV4f);
    HH4f = reshape(HH4f, 1022, 1022)';
    HV4f = reshape(HV4f, 1022, 1022)';
    VV4f = reshape(VV4f, 1022, 1022)';
    HHHV4f = reshape(HHHV4f, 1022, 1022)';
    HHVV4f = reshape(HHVV4f, 1022, 1022)';
    HVVV4f = reshape(HVVV4f, 1022, 1022)';