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