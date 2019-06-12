%%
my_system = @(t, y) systemFcn(t, y, 1, 1, 1);
figure;
drawing(my_system);

%%
function drawing(odeFun)
    maxSize = 5;
    startTime = 0;
    finishTime = 50;
    N = 6;
    x0Vec = linspace(0.01, 2, N);
    y0Vec = linspace(0.01, 2, N);
    hold on;
    % Ôàçîâûé ïîðòðåò
    for i = 1:N
        for j = 1:N
            x0 = [x0Vec(i), y0Vec(j)];
            [~, X] = ode45(odeFun, [startTime, finishTime], x0);
            x = X(:, 1);
            y = X(:, 2);
            xMask = (x <= maxSize) & (x >= -maxSize);
            x = x(xMask);
            y = y(xMask);
            yMask = (y <= maxSize) & (y >= -maxSize);
            x = x(yMask);
            y = y(yMask);
            
            % Âàðèàíò ñî ñòðåëêàìè
            quiver(x(2:end), y(2:end), x(2:end) - x(1:end-1), y(2:end)- y(1:end-1));
            
            % Êðàñèâûé âàðèàíò
            
            %count = numel(x) / 4-1;
            %for k = 1:count
            %    plot(x(4*(k-1)+1:4*k+1), y(4*(k-1)+1:4*k+1), 'Color', [(k/count), (k/count), (k/count)]);
            %end
        end
    end
    plot(1, 0, '*r');
    plot(0, 0, '*r');
    hold off;
    xlabel('u');
    ylabel('v');
    axis([0 2 0 2]);
end

% Исследуемая система
function dydx = systemFcn(t, y, a, b, c)
    dydx = [y(1).*(-a.*log(y(1)) - b.*y(2));...
        y(2).*(-1 + y(1)./(c + y(2))) ];
end