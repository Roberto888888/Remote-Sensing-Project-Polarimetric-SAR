%%%%%%%%%%%%%
% lnQ       %
%%%%%%%%%%%%%

% NORMAL
%     X = CMIm(Cm3, 1024);
%     Y = CMIm(Cm4, 1024);
%     XpY = CMIm((Cm3 + Cm4), 1024);
%     
%     lnQ = n*(6*log(2) + log(X) + log(Y) - 2*log(XpY));
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     % No changes distribution   %
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%     rho = 1 - 17/18*(1.5/n); 
%     T = - 2*rho*lnQ;
%     Display(T / 32, '-lnQ*2*rho');
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     % Selecting a no-changes area  and plot histogram  %
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     
%     NC = NCD(T);
%   
%     %%%%%%%%%%%%%%%
%     % Threshold   %
%     %%%%%%%%%%%%%%%
%     
%     [th, perc] = threshold(NC);
%     TS = T;
%     TS(T < th) = 0;
%     TS(T >= th) = 1;
%     Display(TS, 'Changes');

    % Chi^2 distribution:
    % I don't know how to do it.
    % 
    % w2 = - 9 / 4 * (1 - 1 / rho)^2 + ...
    %     9 * 8 / 24 * (2 / n^2 - 1 / (2*n)^2) / rho^2;   


%--------------------------------------------------------------------------
% DESPECKLE
    Xf = CMIm(Cm3f, 1022);
    Yf = CMIm(Cm4f, 1022);
    XpYf = CMIm((Cm3f + Cm4f), 1022);

    lnQ = nf*(6*log(2) + log(Xf) + log(Yf) - 2*log(XpYf));

    rho = 1 - 17/18*(1.5/nf); 
    T = - 2*rho*lnQ;
    Zf = zeros(1024, 1024);
    Zf(2:1023, 2:1023) = T;
    Display(Zf / 32, '-lnQ*2*rho Filtered');

    NC = NCD(Zf);
    [th, perc] = threshold(NC);
    TSf = Zf;
    TSf(Zf < th) = 0;
    TSf(Zf >= th) = 1;
    Display(TSf, 'Changes');