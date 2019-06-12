f     = @(u, r) r .* u.^2 .* exp(-u);
f_der = @(u, r) r .* u .* exp(-u) .* (2 - u);

f2     = @(u, r) f(f(u, r), r);
f2_der = @(u, r) f_der(f(u, r), r) .* f_der(u, r);

cur_r = 7.5;

%%
uVec = linspace (0, 10, 1000);

plot(uVec, f2(uVec, cur_r) - uVec);
hold on;
grid on;
plot(uVec, f2_der(uVec, cur_r) - 1);
legend('f^{(2)}(u) - u', 'f^{(2)}_u(u) - 1');
xlabel('u');
hold off;

%% Оказалось, что это не нужно
fsolveFunc = @(u) [f2(u, cur_r) - u, f2_der(u, cur_r) - 1];
root = fsolve(fsolveFunc, 2);

disp(root);
%% В нуле
r = 7.5;
start = 2.5; %2.164;

plot (uVec, f(uVec, r));
hold on;
plot (uVec, uVec);


tt = [0,f(start, r)];
spl = [start,start];
for i = 1:3
    spl = [spl,tt(2*i),tt(2*i)];
    tt = [tt,tt(2*i),f(spl(2*i+1), r)];
end
 quiver(spl(1:end - 1),tt(1:end -1),spl(2:end) - spl(1:end - 1),tt(2:end) - tt(1:end - 1),2.1,'m');
 plot(spl.',tt.','-m');
 axis([0 6 0 6]);
 hold off;