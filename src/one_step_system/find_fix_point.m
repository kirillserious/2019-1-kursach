uVec = linspace(0, 10, 1000);
%% График вспомогательной функции g(x)
    g = @(u) u .* exp(-u);
    plot (uVec, g(uVec));
    hold on;
    plot (1, g(1), 'm*');
    xlabel('u');
    ylabel('g');
    hold off;
%% Варианты для вспомогательной функции
    g = @(u) u .* exp(-u);
    plot (uVec, g(uVec));
    hold on;
    plot ([0 10], [0.45, 0.45]);
    plot ([0 10], [1/2.71, 1/2.71]);
    plot ([0 10], [1/5, 1/5]);
    axis([0, 10, 0, 0.5])
    legend('g(u)', '1/r, 0 < r < e', '1/r, r = e', '1/r, r > e')
    hold off;