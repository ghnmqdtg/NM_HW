clear;
close all;
format long;

lorenz = @(t, y, sigma, b, r) [- sigma * y(1) + sigma * y(2);
                                 r * y(1) - y(2) - y(1) * y(3);
                                 - b * y(3) + y(1) * y(2);];
tspan = [0 20];
y0 = [5, 5, 5];
sigma = 10;
b = 8 / 3;
r = 28;

[t, y] = ode45(lorenz, tspan, y0, [], sigma, b, r);

figure(1)
plot(t, y);
% discrete
xlabel('n');
ylabel('y');
legend('y1', 'y2', 'y3');

grid;

for i = 1 : size(y, 1)
    figure(2)
    hold on;
    plot3(y(i, 1), y(i, 2), y(i, 3), '.r');
    pause(0.005);
end

xlabel('y1');
ylabel('y2');
zlabel('y3');