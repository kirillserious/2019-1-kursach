
%% 
 u_0 = 1;%0.628;
 v_0 = 1;%0.628;
% q = linspace(0.4,0.5,5);
 %q = linspace(0.5,0.6,5);
 q = linspace(0.95,0.15,30);
 par = linspace(2.70,2.72,4);
 %q = 0.58;
 %r = 4/3;
 z = @(x,y,r) r.*(x.^2).*exp(-y);
 plot(0,0,'.k');
 hold on;
 %u = [u_0];
 %v = [v_0];
 u_full = [];
 v_full = [];
 for j=1:10
    u_0 = q(j);
    v_0 = q(j);   
    u = [u_0];
    v = [v_0];
    r = exp(1)+0.1;%par(j);
 
    for i = 1:1000
        u_next= z(u_0,v_0,r);
        v_next = u_0;
        u = [u,u_next];
        v = [v,v_next];
        %plot(u_next,v_next,'.b');
        u_0 = u_next;
        v_0 = v_next;
    end 
  %psi = @(u) interp1(u,v, u, 'spline');
 % k = psi(u);
    u_full = [u_full, u];
    v_full = [v_full, v];
 end
 
  plot(u_full, v_full, '.', 'LineWidth', 0.1);
 xlabel('u');
 ylabel('v');
 
 grid on;