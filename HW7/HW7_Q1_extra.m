clear;
close all;
format long;
% determine data points
X = 0 : 7;
Y = sin(X);
diff_Y = diff(Y);
n = length(X);

% 0: natural
s_0 = cubic_spline(X, Y, 0);
x_tmp_0 = [];
y_tmp_0 = [];

for i = 1 : n - 1
    x = X(i) : 0.25 : X(i + 1);
    y = @(x, i) s_0(i, 1) + s_0(i, 2) * (x - X(i)) + s_0(i, 3) * (x - X(i)).^ 2 + s_0(i, 4) * (x - X(i)).^ 3;
    x_tmp_0 = [x_tmp_0 x];
    y_tmp_0 = [y_tmp_0 y(x, i)];
end

% 1: not-a-knot
s_1 = cubic_spline(X, Y, 1);
x_tmp_1 = [];
y_tmp_1 = [];

for i = 1 : n - 1
    x = X(i) : 0.25 : X(i + 1);
    y = @(x, i) s_1(i, 1) + s_1(i, 2) * (x - X(i)) + s_1(i, 3) * (x - X(i)).^ 2 + s_1(i, 4) * (x - X(i)).^ 3;
    x_tmp_1 = [x_tmp_1 x];
    y_tmp_1 = [y_tmp_1 y(x, i)];
end

% 2: clamped
s_2 = cubic_spline(X, Y, 2);
x_tmp_2 = [];
y_tmp_2 = [];

for i = 1 : n - 1
    x = X(i) : 0.25 : X(i + 1);
    y = @(x, i) s_2(i, 1) + s_2(i, 2) * (x - X(i)) + s_2(i, 3) * (x - X(i)).^ 2 + s_2(i, 4) * (x - X(i)).^ 3;
    x_tmp_2 = [x_tmp_2 x];
    y_tmp_2 = [y_tmp_2 y(x, i)];
end

% PCHIP
xx = 0: 0.25: 7;
vq1 = pchip(X, Y, xx);

%-------------------- Plot the figure --------------------%

hold on;
% Plot data points
plot(X, Y, 'o');
% Plot the estimated line
plot(x_tmp_0, y_tmp_0);
plot(x_tmp_1, y_tmp_1);
plot(x_tmp_2, y_tmp_2);
plot(xx, vq1);

% Config of figure
title('Splines');
xlim([-0.5 7.5])
ylim([-1.5 1.5])
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data',...
       'Natural',...
       'Not-a-knot',...
       'Clamped',...
       'PCHIP',...
       'location', 'best');