function c = autoconv(varargin)
fprintf('Total number of terms = %d\n',nargin);

for n = 2:nargin
    c = conv(varagin(n),varagin(n-1));
end

end
