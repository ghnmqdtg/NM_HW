###### tags: `Assignment`
# Numerical Method Homework Assignment #8
I haven't solved the problem of failed to show Latex on GitHub, you can read this article on my hackmd with the following link:

https://hackmd.io/@tweizh0331/NM_HW8

## Q1. Trapezoidal rule and Simpson’s rule

Evaluate the following integral:

$${\int _0^{\frac{\pi \:}{2}}\left(8+4\:\cos \left(x\right)\right)dx}$$

### A. Analytically

$${\begin{equation}
\begin{split}
\int _0^{\frac{\pi \:\:}{2}}\left(8+4\:\cos \left(x\right)\right)dx & = \int _0^{\frac{\pi }{2}}8dx+\int _0^{\frac{\pi }{2}}4\cos \left(x\right)dx +  \\
 & = 8(\frac{\pi}{2} - 0) + 4(1 - 0) \\
 & = 4\pi + 4 \\
 & = 16.56637...
\end{split}
\end{equation}}$$

### B. Single application of the trapezoidal rule
#### Code:
```javascript=
clear
close all
format long

% The given info
func = @(x) 8 + 4.*cos(x);
lower_bound = 0;
upper_bound = pi / 2;
actual = 8 * (upper_bound - lower_bound) + 4 * (sin(upper_bound) - sin(lower_bound));

% Single application of the trapezoidal rule
estimated = (upper_bound - lower_bound) * (func(upper_bound) + func(lower_bound)) / 2;
% The error
error_value = abs(estimated - actual) / actual;

% Print out the information
fprintf('Q1-b: Single application of the trapezoidal rule\n');
fprintf('Estimated Value: %.10f\n', estimated);
fprintf('Actual Value:    %.10f\n', actual);
fprintf('Percent Error:   %.2f%%\n', error_value * 100);

% Plot the figure
hold on;
x = -0.5: 0.001: 2;
plot(x, func(x));
plot([lower_bound lower_bound upper_bound upper_bound] , [0 func(lower_bound) func(upper_bound) 0]);
xlim([lower_bound-0.5 upper_bound+0.5]);
ylim([0 13])
title('Single application of the trapezoidal rule')
legend("Actual function", "Estimated");
```

#### Result:
![](https://i.imgur.com/S7suiFv.png)

```
>> HW8_Q1_b
Q1-b: Single application of the trapezoidal rule
Estimated Value: 15.7079632679
Actual Value:    16.5663706144
Percent Error:   5.18%
```

### C. Composite trapezoidal rule with ${n=2}$ and ${n=4}$ 
#### Code:
```javascript=
clear
close all
format long

% The given function
func = @(x) 8 + 4.*cos(x);
lower_bound = 0;
upper_bound = pi / 2;
actual = 8 * (upper_bound - lower_bound) + 4 * (sin(upper_bound) - sin(lower_bound));

n = 2;
step_size = (upper_bound + lower_bound) / n;
x_step = lower_bound: step_size: upper_bound;

% Composite trapezoidal rule
estimated = step_size / 2 * (func(lower_bound) + 2 * sum(func(x_step(2:length(x_step)-1))) + func(upper_bound));
% The error
error_value = abs(estimated - actual) / actual;

% Print out the information
fprintf('Q1-c: Composite trapezoidal rule with n = %d\n', n);
fprintf('Estimated Value: %.10f\n', estimated);
fprintf('Actual Value:    %.10f\n', actual);
fprintf('Percent Error:   %.2f%%\n', error_value * 100);

% Plot the figure
hold on;
x = -0.5: 0.001: 2;
plot(x, func(x));
plot([lower_bound x_step upper_bound] , [0 func(x_step) 0]);
xlim([lower_bound-0.5 upper_bound+0.5]);
ylim([0 13])
title('Q1-c: Composite trapezoidal rule with n = 2')
legend("Actual function", "Estimated");
```

#### Result:


|                 n=2                  |                 n=4                  |
|:------------------------------------:|:------------------------------------:|
| ![](https://i.imgur.com/AuD5mSB.png) | ![](https://i.imgur.com/57pNeM2.png) |


```
>> HW8_Q1_c
Q1-c: Composite trapezoidal rule with n = 2
Estimated Value: 16.3586084102
Actual Value:    16.5663706144
Percent Error:   1.25%
```
```
>> HW8_Q1_c
Q1-c: Composite trapezoidal rule with n = 4
Estimated Value: 16.5148338183
Actual Value:    16.5663706144
Percent Error:   0.31%
```

### D. Single application of Simpson’s ${\frac{1}{3}}$ rule

$${I\:=\:\int _{x_0}^{x_2}\:f_n\left(x\right)dx = \:\frac{h}{3}\left[f\left(x_0\right)+4\:f\left(x_1\right)+f\left(x_2\right)\right] }$$

#### Code: Just replace line 15 and 16 in Q1.c to this.
```Javascripit=15
% Simpson's 1/3 Rule
estimated = step_size / 3 * (func(x_step(1)) + 4 * func(x_step(2)) + func(x_step(3)))
```

#### Result:
```
Q1-d: Single application of Simpson’s 1/3 Rule
Estimated Value: 16.5754901243
Actual Value:    16.5663706144
Percent Error:   0.06%
```

### E. Composite Simpson’s ${\frac{1}{3}}$ rule with ${n=4}$;
$${I\:=\:\frac{h}{3}\left[f\left(x_0\right)+4\:\sum _{i=1,\:i,\:odd}^{n-1}\:\left(f\left(x_i\right)\right)+2\:\sum \:_{j=2,\:j,\:even}^{n-2}\:\left(f\left(x_j\right)\right)+f\left(x_n\right)\right]}$$



#### Code: Same as above, just replace line 15 and 16 in Q1.d to this.
```javascript=15
% Simpson's 1/3 Rule for n = 4
% add 1, for counting the interior points
odd = sum(func(x_step(1+1:2:end-1)));
even = sum(func(x_step(2+1:2:end-2)));
estimated = step_size / 3 * (func(x_step(1)) + 4 * odd + 2 * even + func(x_step(end)));
```

#### Result:
```
Q1-e: Composite Simpson’s 1/3 Ruled for n = 4
Estimated Value: 16.5669089543
Actual Value:    16.5663706144
Percent Error:   0.00325%
```

### F. Simpson’s ${\frac{3}{8}}$ rule
$${I\:=\:\int _{x_0}^{x_3}\:\:=\:\frac{3h}{8}\left[f\left(x_0\right)+3\:f\left(x_1\right)+3\:f\left(x_2\right)+f\left(x_3\right)\right]}$$

#### Code: Replace line 15 and 16 in Q1.d to this.
```javascript=15
% Simpson's 3/8 Rule
estimated = 3 / 8 * step_size * (func(x_step(1)) + 3 * sum(func(x_step(1+1:1:end-1))) + func(x_step(end)));
```

#### Result:
```
Q1-f: Single application of Simpson’s 3/8 Rule
Estimated Value: 16.5703903076
Actual Value:    16.5663706144
Percent Error:   0.02426%
```

### G. Composite Simpson’s rule with ${n=5}$.
For n=5, I combined Simpson’s 1/3 rule for former n=2 and 3/8 rule for later n=3:
$${I=I_{1/3}+I_{3/8}}$$

#### Code:
* `HW8_Q1_g.m`
    ```javascript=
    clear
    close all
    format long

    % The given function
    func = @(x) 8 + 4.*cos(x);
    lower_bound = 0;
    upper_bound = pi / 2;
    actual = 8 * (upper_bound - lower_bound) + 4 * (sin(upper_bound) - sin(lower_bound));

    n = [2 3];
    step_size = (upper_bound + lower_bound) / sum(n);
    estimated = 0;

    % Update the boundary
    upper_bound = lower_bound + n(1) * step_size;
    % Simpson’s 1/3 for n = 2
    estimated = estimated + Simpson(func, lower_bound, upper_bound, '1/3', n(1));
    lower_bound = lower_bound + n(1) * step_size;
    upper_bound = lower_bound + n(2) * step_size;
    % Simpson’s 3/8 for n = 3
    estimated = estimated + Simpson(func, lower_bound, upper_bound, '3/8', n(2));

    % The error
    error_value = abs(estimated - actual) / actual;

    % Print out the information
    fprintf('Q1-g: Composite Simpson’s Rule\n');
    fprintf('Estimated Value: %.10f\n', estimated);
    fprintf('Actual Value:    %.10f\n', actual);
    fprintf('Percent Error:   %.5f%%\n', error_value * 100);
    ```

* `Simpson.m`
    ```javascript=
    function I = Simpson(func, a, b, rule, n, varargin)
    % Simpson - Simpson's rule
    %
    % Syntax: I = Simpson(func, a, b, n, p1, p2,...):
    % 
    % input:
    %   func = function handle to function to be integrated
    %   a, b = integration limits
    %   rule = '1/3' or '3/8'
    %   n    = number of segments (default = 100)
    %   p1, p2,... = additional parameters used  by func
    % output:
    %   I = integral estimate

        if nargin < 4, error('at least 3 input arguments required'), end
        if ~(b > a), error('upper bound must be greater than lower'), end
        if nargin < 5 || isempty(n), n = 100; end

        h = (b - a) / n;
        x = a: h: b;
        % [1 3 3 repmat([2, 3, 3], 1, (n-3)/3), 1]

        switch rule

            case '1/3'
                if rem(n, 2) ~= 0, error('\n Argument n invalid. n should be multiple of 2'), end
                odd = sum(func(x(1+1:2:end-1)));
                even = sum(func(x(2+1:2:end-2)));
                I = h / 3 * (func(x(1)) + 4 * odd + 2 * even + func(x(end)));

            case '3/8'
                % [1 3 3 1 + 
                %        1 3 3 1 +
                %              1 3 3 1 +
                %                    1 3 3 1 +
                %                              ...]
                % [1 3 3 2 3 3 2 3 3 2 3 3 2 ... 3 3 1]
                if rem(n, 3) ~= 0, error('\n Argument n invalid. n should be multiple of 3'), end
                I = 3 / 8 * h * (sum(func(x).*[1 3 3 repmat([2, 3, 3], 1, (n-3)/3), 1]));

            otherwise
                error 'Invalid option for RULE'
        end
    end
    ```

#### Result:
```
>> HW8_Q1_g
Q1-g: Composite Simpson’s Rule
Estimated Value: 16.5667049532
Actual Value:    16.5663706144
Percent Error:   0.00202%
```

I tried to use for-loop to simplify the way to find the estimated value, but the parameter `rule` of function `Simpson.m` I wrote requires string input. And It's a struggle for me to handle a string array in Matlab, so I just give it up:(

### H. For each of the numerical estimates (b) through (g), determine the true percent relative error based on (a).

|          Rule           |  n  | Percent Error |
|:-----------------------:|:---:|:-------------:|
|       Trapezoidal       |  1  |   5.18163%    |
|  Composite Trapezoidal  |  2  |   1.25412%    |
|  Composite Trapezoidal  |  3  |   0.55417%    |
|  Composite Trapezoidal  |  4  |   0.31109%    |
|      Simpson’s 1/3      |  2  |   0.05505%    |
| Composite Simpson’s 1/3 |  4  |   0.00325%    |
| Composite Simpson’s 1/3 |  6  |   0.00064%    |
|      Simpson’s 3/8      |  3  |   0.02426%    |
| Composite Simpson’s 3/8 |  6  |   0.00144%    |
|    Composite Simpson    | 2+3 |   0.00202%    |

### Discussion:
The data in the table shows that the more points we spaced, the more accuracy we get. For the given function, the composite Simpson's 1/3 at n=6 shows the accurate estimated value.

These three methods provide approaches with the way to calculate definite integral, and there is no need for finding the integrated function.

---

## Q2. Romberg Integration:

Use Romberg integration to evaluate:

$${\int _0^2\frac{e^x\sin \left(x\right)}{1+x^2}dx}$$

to an accuracy of ${\epsilon_s = 0.5\%}$. Your results should be presented in the form of ${O(h^2) \rightarrow O(h^4) \rightarrow O(h^6) \rightarrow O(h^8)}$.

#### Code:
* `HW8_Q2.m`
    ```javascript=
    clear
    close all
    format long

    % The given function
    func = @(x, varargin) (exp(x).*sin(x))./(1+x.^2);
    lower_bound = 0;
    upper_bound = 2;
    es = 0.05;
    maxit = 50;
    varargin = [];

    [q, I, ea, iter] = romberg(func, lower_bound, upper_bound, es, maxit, varargin)

    % Print out the information
    fprintf('Q2: Romberg Integration\n');
    fprintf('Estimated Value: %.10f\n', q);
    fprintf('Accuracy: %.5f%%\n', es * 100);
    fprintf('Approximate relative error: %.5f%%\n', ea * 100);
    ```

* `romberg.m`
    ```javascript=
    function [q, I, ea, iter] = romberg(func, a, b, es, maxit, varargin)
    % romberg: Romberg integration quadrature
    % q = romberg(func, a, b, es, maxit, pl, p2,...):
    %               Romberg integration.
    % input:
    %   func  = name of function to be integrated
    %   a, b  = integration limits
    %   es    = desired relative error (default = 0.000001%)
    %   maxit = maximum allowable iterations (default = 30)
    %   pl, p2,... = additional parameters used by func
    % output:
    %   q  = integral estimate
    %   ea = approximate relative error (%)
    %   iter = number of iterations

        if nargin < 3, error('at least 3 input arguments required'), end
        if nargin < 4 || isempty (es), es = 0.000001; end
        if nargin < 5 || isempty (maxit), maxit = 50; end

        n = 1;
        I(1, 1) = trap(func, a, b, n, varargin{:});
        iter = 0;

        while iter < maxit
            iter = iter + 1;
            n = 2 ^ iter;
            I(iter + 1, 1) = trap(func, a, b, n, varargin{:});
            for k = 2 : iter + 1
                j = 2 + iter - k;
                I(j, k) = (4 ^ (k - 1) * I(j + 1, k - 1) - I(j, k - 1)) / (4 ^ (k - 1) - 1);
            end
            ea = abs((I(1, iter + 1) - I(2, iter)) / I(1, iter + 1)) * 100;
            if ea <= es, break; end
        end
        q = I (1, iter+1);
    end
    ```
    
* `trap.m`
    ```javascript=
    function I = trap(func, a, b, n, varargin)
    % trap - composite trapezoidal rule quadrature
    %
    % Syntax: I = trap(func, a, b, n, p1, p2,...):
    %                   composite trapezoidal rule
    % input:
    %   func = function handle to function to be integrated
    %   a, b = integration limits
    %   n    = number of segments (default = 100)
    %   p1, p2,... = additional parameters used  by func
    % output:
    %   I = integral estimate

        if nargin < 3, error('at least 3 input arguments required'), end
        if ~(b > a), error('upper bound must be greater than lower'), end
        if nargin < 4 || isempty(n), n = 100; end

        x = a; h = (b - a) / n;
        s = func(a, varargin{:});

        for i = 1 : n - 1
            x = x + h;
            s = s + 2 * func(x, varargin{:});
        end

        s = s + func(b, varargin{:});
        I = (b - a) * s / (2 * n);

    end
    ```

#### Result:
```
Q2: Romberg Integration
Estimated Value: 1.9399597207
Accuracy: 5.00000%
Approximate relative error: 0.15112%

I =
        h(O^2)               h(O^4)              h(O^6)             h(O^8)
   1.343769939485650   1.972826837947778   1.941836048413208   1.939959720716542
   1.815562613332246   1.943772972759119   1.939989038336802                   0
   1.911720382902401   1.940225534238197                   0                   0
   1.933099246404248                   0                   0                   0
```

### Discussion:
Romberg intergation combines the Composite Trapezoidal Rule with Richardson Extrapolation. Quote from the chapter 20, the Romberg Integration Algorithm is:
$${I_{j,k}=\frac{4^{k-1}I_{j+1,k-1}-I_{j,k-1}}{4^{k-1}-1}}$$

The Romberg integration is an extrapolation technique which allows us to take a sequence approximate solutions to an integral and calculate a better approximation. The most accurate estimate of the integral is always the last diagonal term of the array. This process is continued until the difference between two successive diagonal terms becomes sufficiently small.

---

## Q3. Generate the Function

Develop a script to generate the following function in which both independent variables ranging from -3 to 3:


### A. ${f\:\left(x,\:y\right)=e^{-\left(x^2+y^2\right)}}$
#### Code:
```javascript=
clear
close all
format long

% The given function
func = @(x, y) (exp(-(x.^2 + y.^2)));
[X, Y] = meshgrid(-3:.01:3);

% Plot the figure
mesh(X, Y, func(X, Y));
xlabel('x coordinate');
ylabel('y coordinate');
zlabel('Z');
title('Generate the Function')
```

#### Result:
|              |                Figure                |
|:------------:|:------------------------------------:|
| Oblique View | ![](https://i.imgur.com/zEmYIcW.png) |
|  Side View   | ![](https://i.imgur.com/VArVo21.png) |
|   Top View   | ![](https://i.imgur.com/7m9TMGE.png) |



### B. ${f\:\left(x,\:y\right)=xe^{-\left(x^2+y^2\right)}}$
#### Code:
```javascript=
clear
close all
format long

% The given function
func = @(x, y) (x.*exp(-(x.^2 + y.^2)));
[X, Y] = meshgrid(-3:.01:3);

% Plot the figure
mesh(X, Y, func(X, Y));
xlabel('x coordinate');
ylabel('y coordinate');
zlabel('Z');
title('Generate the Function')
```

#### Result:
|              |                Figure                |
|:------------:|:------------------------------------:|
| Oblique View | ![](https://i.imgur.com/D4KZlSD.png) |
|  Side View   | ![](https://i.imgur.com/MsGFYXy.png) |
|   Top View   | ![](https://i.imgur.com/nsW2hwI.png) |

### Discussion:
I think the question wants us to plot the figure, and we are familiar with the 3D figure since the previous homework assignments.

---

## Q4. Heun’s Method

Develop an M-file to solve a single ODE by Heun’s method with iteration. Design the M-file so that it creates a plot of the results.

#### Code:
* `HW8_Q4.m`
    ```javascript=
    clear;
    close all;
    format long;

    % e^t
    y = @(t) exp(t);
    dydt = @(t, y) 1 * y;
    tspan = [0 2];

    y0 = y(tspan(1));
    h = 0.1;

    % y is obtain by iteration
    [t_aprox, y_aprox] = HeunODE(dydt, tspan, y0, h);

    % Plot the figure
    figure(1)
    hold on;
    func_name = func2str(y);
    t_actual = tspan(1): 0.005: tspan(end);
    plot(t_actual, y(t_actual))
    plot(t_aprox, y_aprox, 'r');
    xlabel('t')
    ylabel('y')
    legend(func_name, 'Approximate')
    title('Heun’s Method')
    ```

* `HeunODE.m`
    ```javascript=
    function [t, y] = HeunODE(dydt, tspan, y0, h)
    % HeunODE: Heun ODE solver
    %   [t, y] = HeunODE(dydt, tspan, y0, h, pl, p2, ...):
    %            uses Heun's method to integrate an ODE
    % input:
    %   dydt = name of the M-file that evaluates the ODE
    %   tspan = [ti, tf] where ti and tf = initial and
    %           final values of independent variable
    %   yo = initial value of dependent variable
    %   h = step size
    %   p1, p2, ... = additional parameters used by dydt
    % output:
    %   t = vector of independent variable
    %   y = vector of solution for dependent variable

        if nargin < 4, error('at least 4 input arguments required'), end
        ti = tspan(1);
        tf = tspan(2);

        if ~ (tf > ti), error('upper limit must be greater than lower limit'), end
        t = (ti: h: tf)'; 
        n = length(t);

        % if necessary, add an additional value of t 
        % so that range goes from t=ti to tf
        if t(n) < tf
            t(n + 1) = tf;
            n = n + 1;
        end

        % preallocate y to improve efficiency
        y = y0 * ones(n, 1);

        % implement Heun's Method
        for i = 1: n - 1
            % Predict for the first time
            y(i + 1) = y(i) + dydt(t(i), y(i)) * h;
            % Fix the first prediction
            y(i + 1) = y(i) + (dydt(t(i), y(i)) + dydt(t(i + 1), y(i + 1))) / 2 * h;
        end

    end
    ```

#### Result:
![](https://i.imgur.com/fg2KmiP.png)

---

## Q5. Midpoint Method

Develop an M-file to solve a single ODE by the midpoint method. Design the M-file so
that it creates a plot of the results.

#### Code:
* `HW8_Q5.m`
    ```javascript=
    clear;
    close all;
    format long;

    % e^t
    y = @(t) exp(t);
    dydt = @(t, y) 1 * y;
    tspan = [0 2];

    y0 = y(tspan(1));
    h = 0.1;

    % y is obtain by iteration
    [t_aprox, y_aprox] = midpointODE(dydt, tspan, y0, h);

    % Plot the figure
    figure(1)
    hold on;
    func_name = func2str(y);
    t_actual = tspan(1): 0.005: tspan(end);
    plot(t_actual, y(t_actual))
    plot(t_aprox, y_aprox, 'r');
    xlabel('t')
    ylabel('y')
    legend(func_name, 'Approximate')
    title('Midpoint Method')
    ```

* `midpointODE.m`
    ```javascript=
    function [t, y] = midpointODE(dydt, tspan, y0, h)
    % midpointODE: Midpoint ODE solver
    %   [t, y] = midpointODE(dydt, tspan, y0, h, pl, p2, ...):
    %            uses Midpoint's method to integrate an ODE
    % input:
    %   dydt = name of the M-file that evaluates the ODE
    %   tspan = [ti, tf] where ti and tf = initial and
    %           final values of independent variable
    %   yo = initial value of dependent variable
    %   h = step size
    %   p1, p2, ... = additional parameters used by dydt
    % output:
    %   t = vector of independent variable
    %   y = vector of solution for dependent variable

        if nargin < 4, error('at least 4 input arguments required'), end
        ti = tspan(1);
        tf = tspan(2);

        if ~ (tf > ti), error('upper limit must be greater than lower limit'), end
        t = (ti: h: tf)'; 
        n = length(t);

        % if necessary, add an additional value of t 
        % so that range goes from t=ti to tf
        if t(n) < tf
            t(n + 1) = tf;
            n = n + 1;
        end

        % preallocate y to improve efficiency
        y = y0 * ones(n, 1);

        % implement Midpoint's Method
        for i = 1: n - 1
            y_mid = y(i) + dydt(t(i), y(i)) * h / 2;
            y(i + 1) = y(i) + dydt((t(i) + h / 2), y_mid) * h;
        end

    end
    ```

#### Result:
![](https://i.imgur.com/Xy2edZA.png)


### Discussion for Q4 and Q5:


| Methods  |             $${y=e^t}$$              |            $${y=sin(t)}$$            |
|:--------:|:------------------------------------:|:------------------------------------:|
|  **Euler**   | ![](https://i.imgur.com/BigYtr7.png) | ![](https://i.imgur.com/fTXDdLO.png) |
|   **Heun**   | ![](https://i.imgur.com/jogJFqI.png) | ![](https://i.imgur.com/pxU8EGy.png) |
| **Midpoint** | ![](https://i.imgur.com/pws8PgX.png) | ![](https://i.imgur.com/5TdlfpH.png) |

Given functions are nonlinear, estimated by Euler's, Heun's and midpoint method. It's obvious that Euler's method shows the lowest accuracy.

Heun's method is basically a more precise version of Euler's. It uses the other point to estimate the average slope of them, and take this slope to estimate the next point. The midpoint method is similar but using the slope of the midpoint between the current point and the next. Both of them provide more accuracy than Euler's.

| Methods  | Local Truncation Error | Global Error |
|:--------:|:----------------------:|:------------:|
| Euler's  |       ${O(h^2)}$       |   ${O(h)}$   |
|  Heun's  |       ${O(h^3)}$       |  ${O(h^2)}$  |
| Midpoint |       ${O(h^3)}$       |  ${O(h^2)}$  |

Truncation errors is caused by the nature of the techniques employed.

The global truncation error consist of the following two compositions:
* Local truncation error:
    Results from an application method in question over a single step.
* Propagated truncation error:
    Results from the approximations produced during previous steps.

---

## Q6. Euler method

Given:

$${\frac{dy}{dt} = -100000\:y+99999\:e^t}$$

### A. Estimate the step size required to maintain stability using the explicit Euler method.

The explicit Euler method:
$${y_{i+1} = y_i+f(t_i, y_i) \times h}$$

#### Code:
* `HW8_Q6_a.m`
    ```javascript=
    clear;
    close all;
    format long;

    y = @(t) exp(-t);
    dydt = @(t, y) - 100000 * y + 99999 * exp(-t); % dy/dt
    t_range = [0 2];
    h = 2e-5; % Steps, bigger step yields bigger error

    y0 = y(t_range(1));
    [t_aprox, y_aprox] = explicit_EulerODE(dydt, t_range, y0, h);

    hold on;
    plot(t_aprox, y(t_aprox));
    plot(t_aprox, y_aprox);
    legend("True function", "Approximated", 'location', 'best');
    ```

* `explicit_EulerODE.m`
    ```javascript=
    function [t,y] = explicit_EulerODE(dydt, tspan, y0, h)
    % eulode: Euler ODE solver
    %   [t, y] = eulode(dydt, tspan, y0, h, pl, p2, ...):
    %            uses Euler's method to integrate an ODE
    % input:
    %   dydt = name of the M-file that evaluates the ODE
    %   tspan = [ti, tf] where ti and tf = initial and
    %           final values of independent variable
    %   yo = initial value of dependent variable
    %   h = step size
    %   p1, p2, ... = additional parameters used by dydt
    % output:
    %   t = vector of independent variable
    %   y = vector of solution for dependent variable

        if nargin < 4, error('at least 4 input arguments required'), end
        ti = tspan(1);
        tf = tspan(2);

        if ~ (tf > ti), error('upper limit must be greater than lower limit'), end
        t = (ti: h: tf)'; 
        n = length(t);

        % if necessary, add an additional value of t 
        % so that range goes from t=ti to tf
        if t(n) < tf
            t(n + 1) = tf;
            n = n + 1;
            t(n) = tf;
        end

        y = y0 * ones(n, 1); %preallocate y to improve efficiency

        for i = 1: n - 1 %implement Euler's Method
            y(i + 1) = y(i) + dydt(t(i), y(i)) * (t(i + 1) - t(i));
        end
    ```

#### Result:
![](https://i.imgur.com/DFYJ2gP.png)

#### Discussion:
The step size required to maintain stability while using the explicit Euler method is ${h=2e-5}$. To find it, we can derive the function as:

$${\begin{equation}
\begin{split}
y_{i+1} & = y_i+f(t_i, y_i) \times h \\
& = y_i-ay_i \times h
\end{split}
\end{equation}}$$

In my opinion, it's similar to the form of gradient descent. ${a\times h}$ can be seen as learning rate when looking for loss function. 



### B. If y(0)=0, use the implicit Euler to obtain a solution from t=0 to t=2 using step size of 0.1.

The implicit Euler method:
$${y_{i+1}=y_i+f(t_{i+1}, y_{i+1}) \times h}$$

#### Code:
* `HW8_Q6_b.m`
    ```javascript=
    clear;
    close all;
    format long;

    y = @(t) exp(-t);
    dydt = @(t, y) - 100000 * y + 99999 * exp(-t); % dy/dt
    tspan = [0 2];
    h = 0.1; % Steps, bigger step yields bigger error

    y0 = 0;
    [t_aprox, y_aprox] = implicit_EulerODE(dydt, tspan, y0, h);

    hold on;
    t_actual = tspan(1): 0.005: tspan(end);
    plot(t_actual, y(t_actual));
    plot(t_aprox, y_aprox);
    legend("True function", "Approximated", 'location', 'best');
    ```

* `implicit_EulerODE.m`
    ```javascript=
    function [t,y] = implicit_EulerODE(dydt, tspan, y0, h)
    % eulode: Euler ODE solver
    %   [t, y] = eulode(dydt, tspan, y0, h, pl, p2, ...):
    %            uses Euler's method to integrate an ODE
    % input:
    %   dydt = name of the M-file that evaluates the ODE
    %   tspan = [ti, tf] where ti and tf = initial and
    %           final values of independent variable
    %   yo = initial value of dependent variable
    %   h = step size
    %   p1, p2, ... = additional parameters used by dydt
    % output:
    %   t = vector of independent variable
    %   y = vector of solution for dependent variable

        if nargin < 4, error('at least 4 input arguments required'), end
        ti = tspan(1);
        tf = tspan(2);

        if ~ (tf > ti), error('upper limit must be greater than lower limit'), end
        t = (ti: h: tf)'; 
        n = length(t);

        % if necessary, add an additional value of t 
        % so that range goes from t=ti to tf
        if t(n) < tf
            t(n + 1) = tf;
            n = n + 1;
            t(n) = tf;
        end

        y = y0 * ones(n, 1); %preallocate y to improve efficiency

        % implement Euler's Method
        for i = 1: n - 1
            % find y_temp to get the slope of y at t=t+1
            % it's actually the forward euler
            y_temp = y(i) + dydt(t(i), y(i)) * h;
            % Backward Euler method(or implicit Euler)
            y(i + 1) = y(i) + dydt(t(i + 1), y_temp) * h;
        end

    end
    ```

#### Result:
![](https://i.imgur.com/emJD3Dn.png)


#### Discussion:
The implicit Euler method(or backward Euler method). the new approximation ${y_{k+1}}$ appears on both sides of the equation, and thus the method needs to solve an algebraic equation for the unknown ${y_{k+1}}$.

While I can't find a proper approximation with the given constraints. But if I set ${h=1e-5}$, the approximation is almost the same as actual function. That means it requires a smaller step size than explicit Euler.
![](https://i.imgur.com/Kk9PwZR.png)