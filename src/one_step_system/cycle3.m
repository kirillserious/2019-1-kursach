%% В нуле
r = 13.6;
start = 1.9;

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
 axis([0 10 0 10]);
 hold off;