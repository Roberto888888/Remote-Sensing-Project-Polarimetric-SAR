function [ Aout ] = Norm( Ain )
    Amax = max(max(Ain));
    Amin = min(min(Ain));
    Aout = (Ain - Amin)./(Amax - Amin);
end

