function f = ustep(t)
%ustep unit step function
%   Signum function (sign)
%   Y = sign(X) returns an array Y the same size as X, where each element of Y is:
%    1 if the corresponding element of X is greater than zero
%    0 if the corresponding element of X equals zero
%   -1 if the corresponding element of X is less than zero
t = t + 1e-12;
f = (sign(t) + 1)*0.5;
end
