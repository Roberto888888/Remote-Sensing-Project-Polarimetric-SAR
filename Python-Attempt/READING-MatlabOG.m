%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                  READING
%
% Reads every channel (ReadMain + ReadCross);
% Gives vectors of all channels 
% No further processing
% 
% On the Workspace:
%           HHx, HVx, VVx, HHHVx, HHVVx, HVVVx  (x = specific data set)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% First Data set
[HH3, HV3, VV3] = readMain('fl063');
[HHHV3, HHVV3, HVVV3] = readCross('fl063');

% Second Data set
[HH4, HV4, VV4] = readMain('fl064');
[HHHV4, HHVV4, HVVV4] = readCross('fl064');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ hhhv, hhvv, hvvv ] = readCross( fname )
    file_hhhv = fopen([fname,'_lhhhv'] , 'r' , 'b');     
    hhhv0 = fread(file_hhhv , [2 , inf] , 'float32');
    hhhv = hhhv0(1 , :) + 1i*hhhv0(2 , :);
    fclose(file_hhhv);
     
    file_hhvv = fopen([fname,'_lhhvv'] , 'r' , 'b');     
    hhvv0=fread(file_hhvv,[2 , inf] , 'float32');
    hhvv=hhvv0(1 , :) + 1i*hhvv0(2 , :);
    fclose(file_hhvv);

    file_hvvv = fopen([fname,'_lhvvv'] , 'r' , 'b');     
    hvvv0=fread(file_hvvv , [2 , inf] , 'float32');
    hvvv=hvvv0(1 , :) + 1i*hvvv0(2 , :);
    fclose(file_hvvv);
end

