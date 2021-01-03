clear;
close all;
format long;

b = 2;
phi = 0; % 0.5 * pi

for r = 0 : 0.001 : 1
    a = b * r;
    t = - pi: 0.001: pi;
    x = sin(a.*t + phi);
    y = sin(b.*t);
    pause(0.0001);
    figure(1)
    plot(x, y);
    axis([-1 1 -1 1]);
end

xlabel('x');
ylabel('y');
