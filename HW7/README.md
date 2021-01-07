###### tags: `Assignment`
# Numerical Method Homework Assignment #7
I haven't solved the problem of failed to show Latex on GitHub, you can read this article on my hackmd with the following link:

https://hackmd.io/@tweizh0331/NM_HW7

## Q1. Cubic Spline
Generate eight points from the function: ${f(t) = sin^2t}$ from ${t=0}$ to ${t=2\pi}$.

### Properties of Cubic Spline Interpolation
The ${i^{th}}$ spline function for a cubic spline interpolation can be written as:

$${S_i(x) = a_i + b_i(x-x_i) + c_i(x-x_i)^2 + d_i(x-x_i)^3}$$

with the following properties:

1. Function values(interpolant) pass through all data points.
    
    ${S_i(x_i) = y_i \ and \ S_i(x_{i+1})=y_{i+1} \ for \ i = 1, 2, ..., n-1}$
2. The first derivatives are equal at knots(Continuity), except for endpoints.
    
    > ${S_{i-1}^{'}(x_i) = S_{i}^{'}(x_i) \ for \ i = 2, ..., n-1}$
    
3. The second derivatives are equal at knots(Continuity), except for endpoints.

    > ${S_{i-1}^{''}(x_i) = S_{i}^{''}(x_i) \ for \ i = 2, ..., n-1}$
    
4. Boundary conditions at the endpoints:
    a. Nantural:
    
    > ${S_{1}^{''}(x_1) = S_{n-i}^{''}(x_n) = 0}$
        
    b. Not-a-knot: 
    
    > ${S_{0}^{'''}(x_1) = S_{1}^{'''}(x_1) \ and \ S_{n-2}^{'''}(x_{n-1}) = S_{n-1}^{'''}(x_{n-1})}$
    
    c.



### Set up matrix form for the second derivatives equations
> Refer to the given supplement of spline:

1. Nantural:

    ${\begin{pmatrix}1&0&0&0&0\\ \:h_1&2\left(h_1+h_2\right)&h_2&0&0\\ 0&h_2&2\left(h_2+h_3\right)&h_3&0\\ 0&0&h_3&2\left(h_3+h_4\right)&h_4\\ \:0&0&0&0&1\end{pmatrix}\begin{pmatrix}m_1\\ m_2\\ m_3\\ m_4\\ m_5\end{pmatrix}=\begin{pmatrix}0\\ 3\left(d_2-d_1\right)\\ 3\left(d_3-d_2\right)\\ 3\left(d_4-d_3\right)\\ 0\end{pmatrix}}$

2. Not-a-knot:

    ${\begin{pmatrix}h_2&-\left(h_1+h_2\right)&h_0&0&0\\ \:\:h_1&2\left(h_1+h_2\right)&h_2&0&0\\ \:0&h_2&2\left(h_2+h_3\right)&h_3&0\\ \:0&0&h_3&2\left(h_3+h_4\right)&h_4\\ \:\:0&0&h_3&-\left(h_2+h_3\right)&h_2\end{pmatrix}\begin{pmatrix}m_1\\ \:m_2\\ \:m_3\\ \:m_4\\ \:m_5\end{pmatrix}=\begin{pmatrix}0\\ \:3\left(d_2-d_1\right)\\ \:3\left(d_3-d_2\right)\\ \:3\left(d_4-d_3\right)\\ \:0\end{pmatrix}}$

### A. Cubic spline with not-a-knot end conditions.
#### Code:
1. main:
```matlab=
clear;
close all;
format long;
% determine data points
X = 0 : 7;
Y = sin(X);
n = length(X);

% 1: not-a-knot
s = cubic_spline(X, Y, 1);

%-------------------- Plot the figure --------------------%
hold on;

% Plot data points
plot(X, Y, 'o');

% Plot the estimated line
x_tmp = [];
y_tmp = [];

for i = 1 : n - 1
    x = X(i) : 0.25 : X(i + 1);
    y = @(x, i) s(i, 1) + s(i, 2) * (x - X(i)) + s(i, 3) * (x - X(i)).^ 2 + s(i, 4) * (x - X(i)).^ 3;
    x_tmp = [x_tmp x];
    y_tmp = [y_tmp y(x, i)];
end

plot(x_tmp, y_tmp);

% Config of figure
title('Not-a-knot Spline');
xlim([-0.5 7.5])
ylim([-1.5 1.5])
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data', 'Spline', 'location', 'best');
```

2. cubic_spline:
```matlab=
function s = cubic_spline(X, Y, method)
% Newtint: Newton interpolating polynomial
%
% Syntax: s = cubic_spline(X, Y)
% 
% input:
%   X = independent variable
%   Y = dependent variable
%   method = 0: natural, 1: not-a-knot, 2: clamped
% 
% output:
%   s = coefficients of splines
    if method > 2 || method < 0 , error('Invalid Method'); end
    n = length(X);

    A = zeros(n);
    b = zeros(n, 1);
    diff_Y = diff(Y);
    % s for coefficients
    s = zeros(n - 1);

    % spacing between the points
    h = X(2 : n) - X(1 : n - 1);
    % slope
    d = (Y(2 : n) - Y(1 : n - 1))./h;

    if method == 0
        % for natural spline, second derivatives are zero at endpoints
        A(1, 1) = 1;
        A(n, n) = 1;
    elseif method == 1
        % for not-a-knot spline
        A(1, 1) = h(2);
        A(1, 2) = - (h(1) + h(2));
        A(1, 3) = h(1);
        A(n, n - 2) = h(n - 1);
        A(n, n - 1) = - (h(n - 2) + h(n - 1));
        A(n, n) = h(1);
    elseif method == 2
        % for clamped spline
        A(1, 1) = 2 * h(1);
        A(1, 2) = h(1);
        A(n, n - 1) = h(n - 1);
        A(n, n) = 2 * h(n - 1);
        % derivative end conditions equal to the exact values calculated with differentiation.
        b(1) = 6 * (d(1) - diff_Y(1));
        b(n) = 6 * (diff_Y(n - 1) - d(n - 1));
    end

    % set up the equations for the second derivatives, m(i)
    for i = 2 : n - 1
        A(i, i - 1) = h(i - 1);
        A(i, i) = 2 * (h(i - 1) + h(i));
        A(i, i + 1) = h(i);
        b(i) = 6 * (d(i) - d(i - 1));
    end

    % second derivatives
    m = A\b;

    % solve for coefficients of splines
    % # of cubic splines = # of points - 1
    for i = 1 : n - 1
        s(i, 1) = Y(i);
        s(i, 2) = d(i) - h(i) / 6 * (2 * m(i) + m(i + 1));
        s(i, 3) = m(i) / 2;
        s(i, 4) = (m(i + 1) - m(i)) / (6 * h(i));
    end
end
```

#### Result:
![](https://i.imgur.com/uA7KJrM.png)


### B. Cubic spline with derivative end conditions equal to the exact values calculated with differentiation.
#### Code:
```matlab=
clear;
close all;
format long;
% determine data points
X = 0 : 7;
Y = sin(X);
diff_Y = diff(Y);

n = length(X);

% 2: clamped
s = cubic_spline(X, Y, 2);

%-------------------- Plot the figure --------------------%
hold on;

% Plot data points
plot(X, Y, 'o');

% Plot the estimated line
x_tmp = [];
y_tmp = [];

for i = 1 : n - 1
    x = X(i) : 0.25 : X(i + 1);
    y = @(x, i) s(i, 1) + s(i, 2) * (x - X(i)) + s(i, 3) * (x - X(i)).^ 2 + s(i, 4) * (x - X(i)).^ 3;
    x_tmp = [x_tmp x];
    y_tmp = [y_tmp y(x, i)];
end

plot(x_tmp, y_tmp);

cs = spline(X, [diff_Y(1) Y diff_Y(n-1)]);
xx = 0: 0.25: 7;
plot(xx, ppval(cs, xx), '-');

% Config of figure
title('Clamped Spline');
xlim([-0.5 7.5])
ylim([-1.5 1.5])
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data',...
       'Spline(manual)',...
       'Spline(called function)',...
       'location', 'best');
```

#### Result:
![](https://i.imgur.com/5YugMMJ.png)


### C. Piecewise cubic Hermite interpolation polymonial (PCHIP).
#### Code:
```matlab=
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
```


#### Result:
![](https://i.imgur.com/zriteZv.png)


### Discussion for Q1:
I plot all the splines in Q1 to compare the differences. As you can see, splines are very close to a real sine wave, but PCHIP not.

![](https://i.imgur.com/DvsqFEC.png)

If we zoom in to see the detail of segments between endpoints and third point(or antepenultimate point), it's clear to understand the difference of them. The natural splines almost overlap with the real sine wave for the first two segments. Other splines and PCHIP are very close to it, but not overlapping.

![](https://i.imgur.com/HuGYQAu.png)

For the middle three segments, all of these polynomials(except for PCHIP) are overlap with the real sine wave.
![](https://i.imgur.com/VU5z4NK.png)

Because of different end conditions of three kinds of splines, all the first and last two segments of them perform different curvatures.

---

## Q2. Newton’s Interpolating Polynomials
Given the data:
|  ${x}$   |  1  |  2  |  3  |  5  |  7  |  8  |
|:--------:|:---:|:---:|:---:|:---:|:---:|:---:|
| ${f(x)}$ |  3  |  6  | 19  | 99  | 291 | 444 |
Calculate ${f(4)}$ using Newton’s interpolating polynomials of order 1 through 4.

Choose your base points to attain good accuracy.

What do your results indicate regarding the order of the polynomial used to generate the data in the table?

### Code:
1. main:
```matlab=
clear;
close all;
format long;

X = [1 2 3 5 7 8];
Y = [3 6 19 99 291 444];
desired_x = 4;
yint = [];

for i = 2 : length(X)
    yint = [yint Newtint(X(1:i), Y(1:i), desired_x)];
end

%-------------------- Plot the figure --------------------%
hold on;

% Plot data points
plot(X, Y, 'o');

x = 0 : 0.25 : X(length(X)) + 1;

% order = points - 1, points >= 2
% polynomials for order over 3 have the same result
for i = 2 : length(X)
    plot(x, Newtint(X(1:i), Y(1:i), x));
end

plot(desired_x, yint, 'x', 'MarkerSize', 10, 'color', 'r');

% Config of figure
title('Newton’s Interpolating Polynomial');
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data',...
       'Order 1',...
       'Order 2',...
       'Order 3',...
       'Order 4',...
       'Order 5',...
       'Desired Data',...
       'location', 'best');
```

2. Newtint:
```matlab=
function yint = Newtint(x, y, xx)
% Newtint: Newton interpolating polynomial
%
% Syntax: yint = Newtint(x,y, xx)
% 
% Uses an (n - 1)-order Newton interpolating polynomial based on n data
% points (x, y) to determine a value of the dependent variable (yint)
% at a given value of the independent variable, xx.
% 
% input:
%   x = independent variable
%   y = dependent variable
%   xx = value of independent variable at which interpolation is calculated
% 
% output:
%   yint = interpolated value of dependent variable
%   c = coefficients of interpolated polynomial

    n = length(x);

    if length(y) ~= n, error('x and y must be the same length'); end

    b = zeros(n, n);

    % assign dependent variables to the first column of b.
    % the (:) ensures that y is a column vector.
    b(:, 1) = y(:);

    for j = 2 : n
        for i = 1 : n - j + 1
            b(i, j) = (b(i + 1, j - 1) - b(i, j - 1)) / (x(i + j - 1) - x(i));
        end
    end

    % use the finite divided difference to interpolate
    xt = 1;
    yint = b(1, 1);

    for j = 1: n - 1
        xt = xt.*(xx - x(j));
        yint = yint + b(1, j + 1) * xt;
    end

end
```

### Result:
![](https://i.imgur.com/lKIykmJ.png)



### Discussion:
By setting the range of for loop that generates `yint` from 2 to `length(X)`, which is 5 here, the result shows that after iterating for 3 times, the integer yint won't change any more. It's because the values in the data set increase regularly.

I also observed that the number of order is equal to points-1, and `points` corresponds to the variable `i` in my code. So, iterating for 3 times(i=4) means the order of the interpolating polynomials is 3.

```
yint =

    12    42    48    48    48
```

**For this data set**, the similar phenomenon happens on the results of splines, higher the order provides higher accuracy, but it may not be necessary. Polynomials for order higher than 3 are very close. The 5-order polynomial can pass through all the six points, but the error between it and 3-order one is too small to be observed.

---

## Q3. Lagrange Polynomials
Repeat the above question using Lagrange polynomials of order 1 through 3.
### Code:
1. main:
```matlab=
clear;
close all;
format long;

X = [1 2 3 5 7 8];
Y = [3 6 19 99 291 444];
desired_x = 4;
yint = [];

for i = 2 : length(X)
    yint = [yint Lagrange(X(1:i), Y(1:i), desired_x)];
end

%-------------------- Plot the figure --------------------%
hold on;

% Plot data points
plot(X, Y, 'o');

x = 0 : 0.25 : X(length(X)) + 1;

% order = points - 1, points >= 2
% polynomials for order over 3 have the same result
for i = 2 : length(X)
    plot(x, Lagrange(X(1:i), Y(1:i), x));
end

plot(desired_x, yint, 'x', 'MarkerSize', 10, 'color', 'r');

% Config of figure
title('Lagrange Interpolating Polynomial');
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data',...
       'Order 1',...
       'Order 2',...
       'Order 3',...
       'Order 4',...
       'Order 5',...
       'Desired Data',...
       'location', 'best');
```

2. Lagrange:
```matlab=
function yint = Lagrange(x, y, xx)
% Lagrange: Lagrange interpolating polynomial
%
% Syntax: yint = Lagrange(x,y, xx)
% 
% Uses an (n - 1)-order Lagrange interpolating polynomial based on n data
% points (x, y) to determine a value of the dependent variable (yint)
% at a given value of the independent variable, xx.
% 
% input:
%   x = independent variable
%   y = dependent variable
%   xx = value of independent variable at which interpolation is calculated
% 
% output:
%   yint = interpolated value of dependent variable

    n = length(x);

    if length(y) ~= n, error('x and y must be the same length'); end
    
    s = 0;

    for i = 1 : n
        product = y(i);
        for j = 1 : n
            if i ~= j
                product = product.*(xx - x(j))./(x(i) - x(j));
            end
        end
        s = s + product;
    end

    yint = s;

end
```

### Result:
![](https://i.imgur.com/ScgEGNz.png)



### Discussion:
1. I guess Lagrange's form is derivative of the formula of inner division point, so I derived it and proved my assumption is right. It works for linear interpolation between two known points, but I'm not sure if it works for nonlinear interpolation.
![](https://i.imgur.com/3VdIWf2.jpg)



2. The Newton form and Lagrange form for interpolating polynomials have the same result. It makes me curious about the difference between them, so I google them and find the following statement:

    > REF: [**Source**](https://math.stackexchange.com/questions/1509340/newton-form-vs-lagrange-form-for-interpolating-polynomials#comment3074643_1509348)
    >
    > Here are two differences:
    > 
    > 1. Lagrange's form is more efficient when you have to interpolate several data sets on the same data points.
    > 
    > 2. Newton's form is more efficient when you have to interpolate data incrementally.

    For Newton's form, because the divided differences are determined recursively, **all the prior values are used in the computation of the next one**, so it's more efficient when adding data points to the existing interpolation. The picture below illustrates its property:

    ![](https://i.imgur.com/QCOuXbl.png)

---

## Q4. Splines and Interpolating Polynomials
Runge’s function is written as:
$${f(x) = \frac{1}{1+25x^2}}$$
### A. Develop a plot of this function for the interval from ${x=-1}$ to $1$.
#### Code:
```matlab=
clear;
close all;
format long;

func = @(x) 1./(1 + 25 * x.^2);

X = -1: 0.5 :1;
Y = func(X);

%-------------------- Plot the figure --------------------%
hold on;

% Plot data points
plot(X, Y, 'o');

x = -1 : 0.01 : 1;
plot(x, func(x));
% Config of figure
title('Runge’s function');
ylim([-0.6 1.2])
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data', 'Runge’s function', 'location', 'best');
```

#### Result:
![](https://i.imgur.com/rEexHHZ.png)



### B. Generate and plot e forth-order Lagrange interpolating polynomial using equispaced function values corresponding to ${x=-1}$, ${-0.5}$, ${0}$, ${0.5}$, and ${1}$.
#### Code:
```matlab=
clear;
close all;
format long;

func = @(x) 1./(1 + 25 * x.^2);

X = -1: 0.5 :1;
Y = func(X);

%-------------------- Plot the figure --------------------%
hold on;

% Plot data points
plot(X, Y, 'o');

x = -1 : 0.01 : 1;
plot(x, func(x));
plot(x, Lagrange(X, Y, x))

% Config of figure
title('Runge’s function');
ylim([-0.6 1.2])
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data',...
       'Runge’s function',...
       'Estimated 4-Order Polynomial',...
       'location', 'best');
```


#### Result:
![](https://i.imgur.com/f6VUFMu.png)



### C. Use the five points from (b) to estimate ${f(0.8)}$ with first-order through fourth-order Newton interpolating polynomials.
#### Code:
```matlab=
clear;
close all;
format long;

func = @(x) 1./(1 + 25 * x.^2);

X = -1: 0.5 :1;
Y = func(X);
desired_x = 0.8;
yint = [];

for i = 2 : length(X)
    yint = [yint Newtint(X(1:i), Y(1:i), desired_x)];
end

%-------------------- Plot the figure --------------------%
hold on;

% Plot data points
plot(X, Y, 'o');

x = -1 : 0.01 : 1;
plot(x, func(x));

for i = 2 : length(X)
    plot(x, Newtint(X(1:i), Y(1:i), x));
end

plot(desired_x, func(desired_x), 'x', 'MarkerSize', 10, 'color', 'b');
plot(desired_x, yint, 'x', 'MarkerSize', 10, 'color', 'r');

% Config of figure
title('Runge’s function');
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data',...
       'Runge’s function',...
       'Estimated 1-Order Polynomial',...
       'Estimated 2-Order Polynomial',...
       'Estimated 3-Order Polynomial',...
       'Estimated 4-Order Polynomial',...
       'True Value',...
       'Desired Value',...
       'location', 'best');
```

#### Result:
![](https://i.imgur.com/HCq7SXp.png)

```
yint =

   0.396551724137931   3.965517241379310  -2.241379310344827  -0.379310344827586
```

### D. Generate and plot a cubic spline using the five points from (b).
#### Code:
```matlab=
clear;
close all;
format long;

func = @(x) 1./(1 + 25 * x.^2);

X = -1: 0.5 :1;
Y = func(X);
n = length(X);

% 0: natural
s = cubic_spline(X, Y, 0);

%-------------------- Plot the figure --------------------%
hold on;

% Plot data points
plot(X, Y, 'o');

x = -1 : 0.01 : 1;
% plot the real function
plot(x, func(x));

% Plot the Lagrange interpolating polynomial
plot(x, Lagrange(X, Y, x))

% Plot the cubic spline
x_tmp = [];
y_tmp = [];
% for i = 1 : n - 1
for i = 1 : n - 1
    x = X(i) : 0.01 : X(i + 1);
    y = @(x, i) s(i, 1) + s(i, 2) * (x - X(i)) + s(i, 3) * (x - X(i)).^ 2 + s(i, 4) * (x - X(i)).^ 3;
    x_tmp = [x_tmp x];
    y_tmp = [y_tmp y(x, i)];
end

plot(x_tmp, y_tmp);


% Config of figure
title('Natural cubic spline');
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data',...
       'Runge’s function',...
       'Interpolating polynomials',...
       'Cubic Spline',...
       'location', 'best');
```


#### Result:
![](https://i.imgur.com/70wX7RQ.png)


### E. Discussion:
I think the point of this topic is question 4.d, to compare the difference between splines and interpolating polynomials. Both of them are methods to approximate the original function. Obviously, Lagrange interpolating polynomials shows more oscillations then cubic spline.

Oh, I also found that the example in slides illustrates the same result as this question. 

![](https://i.imgur.com/Z9eNwcS.png)