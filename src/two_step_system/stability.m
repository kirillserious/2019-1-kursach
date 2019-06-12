f = @(u,v,r) r.*(u.^2).*exp(-v);

u_start = 10;
v_start = 10;
r_current = exp(1)+0.1;
iteration = 5;

fVec = zeros(1, iteration);
fVec(1) = v_start;
fVec(2) = u_start;

for i = 3:iteration
    fVec(i) = f(fVec(i-1), fVec(i-2), r_current);
end

plot(1:iteration, fVec, '*-');
xlabel('t');
ylabel('u_t');