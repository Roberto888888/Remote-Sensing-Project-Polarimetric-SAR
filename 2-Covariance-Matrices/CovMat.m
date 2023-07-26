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

