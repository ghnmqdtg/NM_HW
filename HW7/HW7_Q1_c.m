clear;
close all;
format long;
% determine data points
X = 0 : 7;
Y = sin(X);
xx = 0: 0.25: 7;

vq1 = pchip(X, Y, xx);

%-------------------- Plot the figure --------------------%
hold on;

% Plot data points
plot(X, Y, 'o');
% Plot the estimated line
plot(xx, vq1);

% Config of figure
title('PCHIP');
xlim([-0.5 7.5])
ylim([-1.5 1.5])
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data',...
       'PCHIP',...
       'location', 'best');