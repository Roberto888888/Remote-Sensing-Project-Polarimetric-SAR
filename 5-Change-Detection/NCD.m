function [ NC ] = NCD( T )
    NC = T(350:440 , 30:110);
    figure()
    histogram(NC,100);
end

