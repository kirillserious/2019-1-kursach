f = @(u, r) r .* u.^2 .* exp(-u);
uVec = linspace (0, 6, 1000);

%% В нуле
r = exp(3)/3 + 1;%exp(1)%3;%5;%2;
start = 3;%0.5;%0.5;%0.75;%0.75;

plot (uVec, f(uVec, r));
hold on;
plot (uVec, uVec);


tt = [0,f(start, r)];
spl = [start,start];
for i = 1:20
    spl = [spl,tt(2*i),tt(2*i)];
    tt = [tt,tt(2*i),f(spl(2*i+1), r)];
end
 quiver(spl(1:end - 1),tt(1:end -1),spl(2:end) - spl(1:end - 1),tt(2:end) - tt(1:end - 1),2.1,'m');
 plot(spl.',tt.','-m');
 axis([0 6 0 6]);
 hold off;
 