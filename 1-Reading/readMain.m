function [ HH, HV, VV ] = readMain( filename )
    file = [filename, '_lhhhh'];
    f1 = fopen(file,'r','b');
    HH = fread(f1, [1,inf],'float32');
    %HH = reshape(HH, 1024, 1024)';
    fclose(f1);
    
    file = [filename, '_lhvhv'];
    f2 = fopen(file,'r','b');
    HV = fread(f2, [1,inf],'float32');
    %HV = reshape(HV, 1024, 1024)';
    fclose(f2);
    
    file = [filename, '_lvvvv'];
    f3 = fopen(file,'r','b');
    VV = fread(f3, [1,inf],'float32');
    %VV = reshape(VV, 1024, 1024)';
    fclose(f3);
end

