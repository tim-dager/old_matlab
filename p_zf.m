function p_zf( num, den )
% Make pole/zero plot for H(s) = num(s)/den(s)
z = roots(num);
p = roots(den);
 
xz = real(z);
yz = imag(z);
xp = real(p);
yp = imag(p);
 
plot(xz,yz,'bO',xp,yp,'rX','Markersize',16)
legend('Root','Pole');
ylabel('imaginary')
xlabel('real')
v = axis; % returns current plot size 
 
axis([v(1)-0.1, v(2)+0.1,... 
             v(3)-0.1, v(4)+ 0.1]);
% if this axis trick is omitted, 
% may fail to plot pole/zero in corner of plot
 
grid on
 
end
