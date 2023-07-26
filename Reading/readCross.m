function [ hhhv, hhvv, hvvv ] = readCross( fname )
    file_hhhv = fopen([fname,'_lhhhv'],'r','b');     
    hhhv0=fread(file_hhhv,[2,inf],'float32');
    hhhv=hhhv0(1,:)+1i*hhhv0(2,:);
    fclose(file_hhhv);
     
    file_hhvv = fopen([fname,'_lhhvv'],'r','b');     
    hhvv0=fread(file_hhvv,[2,inf],'float32');
    hhvv=hhvv0(1,:)+1i*hhvv0(2,:);
    fclose(file_hhvv);

    file_hvvv = fopen([fname,'_lhvvv'],'r','b');     
    hvvv0=fread(file_hvvv,[2,inf],'float32');
    hvvv=hvvv0(1,:)+1i*hvvv0(2,:);
    fclose(file_hvvv);
end

