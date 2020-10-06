clc,clf,clear

g = 9.81; theta0 = 45 * pi / 180; v0 = 5;

t(1) = 0; x = 0; y = 0; x0 = 0; t0 = 0;

plot(x, y, 'o', 'MarkerFaceColor', 'b', 'MarkerSize', 8)

axis([0 8 0 0.8]) % x min, x max, y min, y max

M(1) = getframe;

dt = 1 / 128;

for time = 1:5
	for j = 2:1000
		t(j) = t(j - 1) + dt;
		x = x0 + v0 * cos(theta0) * (t(j) - t0);
		y = v0 * sin(theta0) * (t(j) - t0) - 0.5 * g * (t(j) - t0)^2;
		v0 = v0 - 0.01; % reduce of the energy
		plot(x, y, 'o', 'MarkerFaceColor', 'b', 'MarkerSize', 8)
		hold on % hold on current position
		axis([0 8 0 0.8])
		M(j) = getframe;
		if y <= 0
			t0 = t(j);
			x0 = x;
		end
	end
end
pause
movie(M,1)
