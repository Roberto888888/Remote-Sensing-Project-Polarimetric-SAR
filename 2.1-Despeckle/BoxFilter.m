function [ newM ] = BoxFilter( M )
    M = reshape(M, 1024, 1024)';
    newM = zeros(1022, 1022);
    for i = 2:1023    
        for j = 2:1023 
           newM(i-1, j-1) = mean(mean(M((i-1):(i+1),(j-1):(j+1))));  
        end
    end
end

