    m1 = 1000;
    m2= 100;
    n=2000;
    r_split = linspace(1,21,n);
    z = @(x,r) r.*x.^2 .* exp(-x);
    pVec=zeros(1,m2);
    u0= 4;
  xlabel('$r$','Interpreter','latex'); 
  ylabel('$\lim u_{n}$','Interpreter','latex');
  axis([1 21 0 12]);
    for i=1:n
        hold on
        u = z(u0,r_split(1));
        for j=1:m1
            u = z(u,r_split(i));
        end
        for j=1:m2
            u = z(u,r_split(i));
            pVec(j) = u;
        end
        
        rVec = ones(1,m2).*r_split(i);
        plot(rVec,pVec,'.b');
        
    end