function [ C ] = scaling( HH, HV, VV )
    HH = Norm(10*log10(HH));
    HV = Norm(10*log10(HV));
    VV = Norm(10*log10(VV));
    
    C = cat(3, HV, HH, VV);
end

