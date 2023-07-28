%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Equivalent Number of Looks Estimation   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Assumed that the data for the three channels hhhh, hvhv, vvvv are already
% available (execute after "images")

% Normal
    HH = reshape(HH3, 1024, 1024)';
    HV = reshape(HV3, 1024, 1024)';
    VV = reshape(VV3, 1024, 1024)';
    N = EqNLooks(HH, HV, VV);
    n = round(mean(N));

% After Despeckle
%     Z1 = zeros(1024, 1024);
%     Z2 = zeros(1024, 1024);
%     Z3 = zeros(1024, 1024);
%     
%     Z1(2:1023,2:1023) = HH3f;
%     Z2(2:1023,2:1023) = HV3f;
%     Z3(2:1023,2:1023) = VV3f;
%     Nf = EqNLooks(Z1, Z2, Z3);
%     nf = round(mean(Nf));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ N ] = EqNLooks( HH, HV, VV )
% Area 1 - 3 channels
    x1 = int64(360);
    x2 = int64(410);
    y1 = int64(205);
    y2 = int64(255);
  
    [N(1)] = looks(HH, x1, x2, y1, y2);
    [N(2)] = looks(HV, x1, x2, y1, y2);
    [N(3)] = looks(VV, x1, x2, y1, y2);
       
% Area 2 - 3 channels
    x1 = int64(735);
    x2 = int64(770);
    y1 = int64(360);
    y2 = int64(395);

    [N(4)] = looks(HH, x1, x2, y1, y2);
    [N(5)] = looks(HV, x1, x2, y1, y2);
    [N(6)] = looks(VV, x1, x2, y1, y2);
     
% Area 3 - 3 channels
    x1 = int64(110);
    x2 = int64(170);
    y1 = int64(610);
    y2 = int64(665);
    
    [N(7)] = looks(HH, x1, x2, y1, y2);
    [N(8)] = looks(HV, x1, x2, y1, y2);
    [N(9)] = looks(VV, x1, x2, y1, y2);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ n ] = looks( M, x1, x2, y1, y2 )
    A = M(x1:x2 , y1:y2);
    [r,c] = size(A);
    mi = mean2(A);
    sig = var(reshape(A', 1, r*c));
    n = mi^2 / sig;
end