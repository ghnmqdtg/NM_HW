clear all
close all
format long

% the border of start and end
border_left = 1; border_right = 29;

% column indexs for the buildings
% in matlab, indexs start from 1
left = 1; height = 2; right = 3;

% coordinates of all buildings
buildings = [
%	 L  H  R;
	 1 11  5;
	 2  6  7;
	 3 13  9;
	12  7 16;
	14  3 25;
	19 18 22;
	23 13 29;
	24  4 28
];

% linspace(x1, x2, N) generates N numbers from x1 to x2
% initialize height of skyline with zeros
y = linspace(0, 0, border_right - border_left + 1)

% scan from the first building to the last
for i = 1:length(buildings)
	% 
	for x = buildings(i, left):(buildings(i, right) - 1)
		if buildings(i, height) > y(x)
			y(x) = buildings(i, height)
		end
	end
end

% set the size of the figure
% [x_min x_max y_min y_max]
axis([border_left-1 border_right+1 0 20])
hold on;
stairs(border_left-1:1:border_right, [0 y]);