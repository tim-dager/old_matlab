function u = ustep(t)

t = t + 1e-12;
u = (sign(t)+1)*.5;
end