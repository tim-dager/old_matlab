t = 2:1:11

f = 1./t .* cos((1/2*t));
for t = 2:10
    f(t) = f(t); 
end

plot(t,ft)
