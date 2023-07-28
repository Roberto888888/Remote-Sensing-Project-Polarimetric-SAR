%%%%%%%%%%%%%
% lnQ       %
%%%%%%%%%%%%%

% NORMAL
     X = CMIm(Cm3, 1024);
     Y = CMIm(Cm4, 1024);
     XpY = CMIm((Cm3 + Cm4), 1024);
     
     lnQ = n*(6*log(2) + log(X) + log(Y) - 2*log(XpY));
     
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     % No changes distribution   %
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
     rho = 1 - 17/18*(1.5/n); 
     T = - 2*rho*lnQ;
     Display(T / 32, '-lnQ*2*rho');
     
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     % Selecting a no-changes area  and plot histogram  %
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
     NC = NCD(T);
   
     %%%%%%%%%%%%%%%
     % Threshold   %
     %%%%%%%%%%%%%%%
     
     [th, perc] = threshold(NC);
     TS = T;
     TS(T < th) = 0;
     TS(T >= th) = 1;
     Display(TS, 'Changes');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ X ] = CMIm( Cm, n )
    L = length(Cm);
    for k = 1:L
        V(k) = real(det(Cm(1:3, 1:3, k)));
    end
    
    X = (reshape(V, n, n))';
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ NC ] = NCD( T )
    NC = T(350:440 , 30:110);
    figure()
    histogram(NC,100);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
