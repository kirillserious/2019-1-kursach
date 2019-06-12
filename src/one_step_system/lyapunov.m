 r_split = linspace(1, 21, 500);
    z1 = @(x,r) r.*(x.^2).*exp(-x);
    z = @(x,r) r.*x.*exp(-x).*(2-x);
  % plot(1,0,'.b');
   hold on;
   grid on;
   axis([1, 21, -6, 1]);
   sum_all = [];
   for i = 1:length(r_split)
        u = 4;
        sum = log(abs(z(u,r_split(i))));
       for j = 1:1000
           z_next = z1(u,r_split(i));
           z_now = z(u,r_split(i));
           sum = sum + log(abs(z_now));
           u = z_next;
       end
       sum_all = [sum_all,sum./1000];
      % plot(r_split(i),sum./1000,'.b');
   end
   nuu = zeros(1,length(r_split));
   plot(r_split,sum_all,'.');
   plot(r_split,nuu,'-');
   xlabel('r');
   ylabel('h (u_0)')