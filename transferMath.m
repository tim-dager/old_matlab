function [w,fxnJWMag,k,theta] = transferMath(num,denom,wfirst,wlast,kGraph)
%should only be seen and used by transferFunction

%used for nargin != 2, not in switch statement for less lines of code
if exist('wfirst','var')
    w = linspace(wfirst,wlast,5000);
    s = 1j.*w;
    numFinal = polyval(num,s);
    denomFinal = polyval(denom,s);
    fxnJW = numFinal ./ denomFinal;
    fxnJWMag = abs(fxnJW);
    [maxfxn, indexW] = max(fxnJWMag);
    maxW = w(indexW);
    k = 1/maxfxn;
    theta = angle(fxnJW) * 180 / pi;
    %p_zf(num,denom);
end

switch(nargin)
    case(2)
        kGraph = 1;
        %find max w and set limits for x-axis
        wFind = linspace(0,10000,10000);
        s1 = 1j.*wFind;
        numJW = polyval(num,s1);
        denomJW = polyval(denom,s1);
        
        fxnFind = numJW./denomJW;
        fxnFindMag = abs(fxnFind);
        [~, indexWFind] = max(fxnFindMag);
        w = linspace(0,2*wFind(indexWFind), length(wFind));
        %find final function in terms of jw with x-axis limits
        s = 1j*w;
        fxnJW = polyval(num,s) ./ polyval(denom,s);
        fxnJWMag = abs(fxnJW);
        [maxfxn, indexW] = max(fxnJWMag);
        maxW = w(indexW);
        
        k = 1/maxfxn;
        theta = angle(fxnJW) * 180 / pi;
    case(4)
        kGraph = 1;
    case(5)
        k = kGraph/maxfxn;
end%switch(nargin)

fprintf('\nK = %f for maximum Vo/Vin of %d\nFrequency for maximum Vo/Vin = %f [rad/sec]\n\n',k,kGraph,maxW);
end