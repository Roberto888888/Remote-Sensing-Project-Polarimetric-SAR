function [ th, P ] = threshold( NC )
    [x, y] = size(NC);
    cnt = 0;
    tot = x*y;
    x = int64(x);
    y = int64(y);
    step = 0.001;

    th = max(max(NC));
    P = 0;

    while(P <= 1)
        cnt = sum(sum(NC > th));
        P = cnt / tot * 100;
        th = th - step;
    end

    th = th + step;
    P = sum(sum(NC > th)) / tot * 100;
end

