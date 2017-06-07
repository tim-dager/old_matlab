
function transferFunction(num,denom,wfirst,wlast,kGraph)
%
%Plots transfer function H(s) and the phase angle for H(2), displays K for K*H(s) = 1,
%displays the frequency associated with the maximum value for H(s)
%
%   transferFunction(num,denom) plots the graph from 0 to the maximum
%   frequency * 2, returns a K value such that K*H(s) = 1
%   and displays the frequency associated with the maximum frequency. Not 
%   the best approximation. frequencies are only found in integers ranging
%   from 0 to 10,000.
%
%   transferFunction(num,denom,wfirst,wlast) allows for any range of
%   numbers to be used for the frequency
%
%   transferFunction(num,denom,wfirst,wlast,kGraph) plots the frequency
%   with a maximum value of kGraph, and changes the value found for K such
%   that K*H(s) = kGraph. Can be used to find graph for Vo/Vin maximum = 1.
%
%Overkill for a simple problem

%Timothy Dager
k=1;
switch(nargin)
    
    case(2)
        [w,fxnJWMag,~,theta] = transferMath(num,denom);
    case(4)
        [w,fxnJWMag,~,theta] = transferMath(num,denom,wfirst,wlast);
    case(5)
        [w,fxnJWMag,k,theta] = transferMath(num,denom,wfirst,wlast,kGraph);
    otherwise
        msg = 'Ivalid input arguments.';
        error(msg);
end%switch(nargin)

subplot(2,1,1)
plot(w,k.*fxnJWMag);
grid minor;
xlabel('Frequency [rad/sec]');
ylabel('V_o / V_{in}');
title('Frequency Response for Transfer Function');

subplot(2,1,2)
plot(w,theta)
xlabel('Frequency [rad/sec]')
ylabel('Angle [degrees]')
grid minor
title('Phase Angle');


end%function