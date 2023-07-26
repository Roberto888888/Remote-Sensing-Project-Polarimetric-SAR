function [ X ] = CMIm( Cm, n )
    L = length(Cm);
    for k = 1:L
        V(k) = real(det(Cm(1:3, 1:3, k)));
    end
    
    X = (reshape(V, n, n))';
end

