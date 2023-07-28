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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ CovMat ] = CovMat( HH, HV, VV, HHHV, HHVV, HVVV )
    l = length(HH);
    CM = zeros(3,3,l);
    
    CM(1,1,:) = HH;
    CM(1,2,:) = HHHV;
    CM(1,3,:) = HHVV;
    CM(2,1,:) = conj(HHHV);
    CM(2,2,:) = HV;
    CM(2,3,:) = HVVV;
    CM(3,1,:) = conj(HHVV);
    CM(3,2,:) = conj(HVVV);
    CM(3,3,:) = VV;
    
    CovMat = CM;
end