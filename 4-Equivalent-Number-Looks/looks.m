function [ n ] = looks( M, x1, x2, y1, y2 )
    A = M(x1:x2 , y1:y2);
    [r,c] = size(A);
    mi = mean2(A);
    sig = var(reshape(A', 1, r*c));
    n = mi^2 / sig;
end

