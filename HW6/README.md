###### tags: `Assignment`
# Numerical Method Homework Assignment #6
I haven't solved the problem of failed to show Latex on GitHub, you can read this article on my hackmd with the following link:

https://hackmd.io/@tweizh0331/NM_HW6

## Q1. Directional Derivative
Find the directional derivative of: 

${f(x, y) = 2x^2+y^2}$ at ${x = 2}$ and ${y = 4}$ in the direction of $h = 3i + 2 j$.
    
### Code:
```matlab=
clear all
close all
format long
syms x y

func = 2 * x ^ 2 + y ^ 2;
coordinate = [2 4];
direction = [3 2];

% Unit Vector of the direction
direction = direction / norm(direction, 2);

% Partial derivative at [x, y]
partial_diff = subs([diff(func, x) diff(func, y)], [x, y], coordinate);

% Directional derivative (in decimal form)
Ans = vpa(dot(partial_diff, direction));

[X,Y] = meshgrid(-2:.25:5);
Z = 2 * X.^2 + Y.^2;
figure
mesh(X, Y, real(Z));
xlabel('x coordinate');
ylabel('y coordinate');
zlabel('Z');
```


### Result:
![](https://i.imgur.com/ijBcyXP.png)

### Discussion:
Quoted the definition from Wikipedia:
> If the function f is differentiable at x, then the directional derivative exists along any vector v, and one has $${\nabla_{\mathbf{v}}{f}(\mathbf{x}) = \mathrm{D} f_{\mathbf{x}}(\mathbf{v}) = \mathbf{v} \cdot\nabla f(\mathbf{x})}$$where the ${\displaystyle \nabla }$  on the right denotes the gradient and ${\displaystyle \cdot }$ is the dot product.

Now here the direction **h** is the vector **v** and we need to find the gradient of ${f(x, y)}$. The following is the code review and how I solve the problem.

```matlab=11
direction = direction / norm(direction, 2);
```
In line 11, divide the direction vector by its L2 norm to find its unit vector.

```matlab=14
partial_diff = subs([diff(func, x) diff(func, y)], [x, y], coordinate);
```
In line 14, I use `diff()` to find the partial derivative respect to x and y. Substitute the coordinate of the point, then store them into a matrix. And this matrix is the gradient of the function.

```matlab=17
Ans = vpa(dot(partial_diff, direction));
```
In line 17, the end of the code. Now, I know the unit vector of direction and the gradient of ${f(x, y)}$ at point (x, y). The inner product of them is the directional derivative of ${f(x, y)}$ and this is what we want.

---

## Q2. Find Maximum
Given: ${f(x, y) = 2.25xy+1.75y-1.5x^2-2y^2}$

Construct and solve a system of linear algebraic equations that maximizes ${f(x, y)}$. Notice that this is done by setting the partial derivative of f with respect to both x and y to zero.

### Code:
```matlab=
clear;
close all;
format long;
syms x y;

func = 2.25 * x * y + 1.75 * y - 1.5 * x ^ 2 - 2 * y ^ 2;

diff_x = diff(func, x);
diff_y = diff(func, y);

% Solve the system of linear equations in two unknowns
[x, y] = solve(diff_x, diff_y);

extremum = vpa(subs(func));
```
### Result:

### Discussion:
According to the hint, I found that it's very easy to find the extremum by solving the system of linear equations of two unknowns. And the two linear equations are partial derivatives of the function in respect to x and y.

I'm not sure the way I used can cover all the functions of two variables. It works here because the function is unimodal. If the function has multiple extrema, it will be more difficult to solve.

---

## Q3. Eigenvalues, Eigenvectors and Characteristic Polynomial
### Code:
```matlab=
clear;
close all;
format long;
syms w_square;

m = [5 10];
k = [0.1 1 0.2];

A = [((k(1) + k(2)) / m(1)), (- k(2) / m(1));
     (- k(2) / m(2)), ((k(2) + k(3)) / m(2))];

A_L = A - diag([w_square w_square]);
characteristic_poly = det(A_L);
w_square = solve(characteristic_poly);

[v, lambda] = eig(A);

% Get diagonal elements of matrix
lambda = diag(lambda);

T = 1./(sqrt(lambda)/2/pi);

t = 0 : 0.1 : 50;

for i = 1:2
     figure(i);
     hold on;
     title("w_square = " + num2str(lambda(i)));
     plot(t, sin(2 * pi / T(i, :) * t) * v(1, i)/v(i, i));
     plot(t, sin(2 * pi / T(i, :) * t) * v(2, i)/v(i, i));
     legend('mass1', 'mass2', 'location', 'best');
     xlabel('t (time)'); ylabel('x (displacement)');
end
```

### Result:
> lambda at line 19 is the same as w_square at line 14, but the order is reversed.

* Figure 1 : 
    ```
    w_square = 0.320000000000000
    ```
    ![](https://i.imgur.com/tOTPIlw.png)


* Figure 2:
    ```
    w_square = 0.020000000000000
    ```
    ![](https://i.imgur.com/FZBGXEL.png)

    > mass 1 and mass 2 has the same displacement.


```
A =

   0.220000000000000  -0.200000000000000
  -0.100000000000000   0.120000000000000
-----------------------------------------------
A_L =
 
[11/50 - w_square,            -1/5]
[           -1/10, 3/25 - w_square]
-----------------------------------------------
characteristic_poly =
 
w_square^2 - (17*w_square)/50 + 4/625
-----------------------------------------------
w_square =
 
1/50
8/25
-----------------------------------------------
v =

   0.894427190999916   0.707106781186547
  -0.447213595499958   0.707106781186547
-----------------------------------------------
lambda =

   0.320000000000000                   0
                   0   0.020000000000000
```

### Discussion:
The following picture shows how I modeled the system as a the $2\times 2$ matrix:

![](https://i.imgur.com/ftkNdcM.jpg)

A is modeled as:
$$A = \begin{bmatrix}\frac{k_a+k_b}{m_1}&-\frac{k_b}{m_1}\\ -\frac{k_b}{_{m_2}}&\frac{k_a+k_b}{m_2}\end{bmatrix}$$

And I found its eigenvalue and eigenvector by followin the rule ${[[A]-\lambda[I]][x]} = 0$. $\lambda$ is the eigenvalue that represents $\omega^2$, which is the square of $2\pi f$. $[x]$ is a nonzeor vector and it's the eigenvector of the system.

---

## Q4. Linearization of Nonlinear Relationships
An inverse investigator has reported the data tabulated below. It is known that such data can be modeled by the following equation:
$${x = e^{(y-b)/a}}$$
where a and b are parameters. Use a transformation to linearize this equation and then employ linear regression to determine a and b. Based on your analysis predict y at x=2.6.


|  x  |  1  |  2  |  3  |  4  |  5  |
|:---:|:---:|:---:|:---:|:---:|:---:|
|  y  | 0.5 |  2  | 2.9 | 3.5 |  4  |

### Code:
```matlab=
clear;
close all;
format long;

% Initial Setting
x = log(1: 5);
y = [0.5 2 2.9 3.5 4];
n = length(x);

xx = x.*x;
xy = x.*y;

a = (n * sum(xy) - sum(x) * sum(y)) / (n * sum(xx) - sum(x) ^ 2)
b = mean(y) - a * mean(x)

% Plot Points
figure(1);
plot(x, y, 'o');
hold on;

% Plot the Line
xr = log(0: 6);
yr = b + a.*xr;
plot(xr, yr);
xlabel('ln(x)');
ylabel('y');

% Mark the point at x = 2.6, ln(2.6) = 0.955
func = @(x) b + a*log(x);
vpa(subs(func, 2.6))
plot(log(2.6), vpa(subs(func, 2.6)),'r*')
```
### Result:
![](https://i.imgur.com/mKqdGqD.png)
> Note: The labelled X in the picture should be ln(x).
```
a = 2.172916834412650

b = 0.499435719499467

ans = 2.575682623873541410248875044892
```

### Discussion:
${x = e^{(y-b)/a}}$ is nolinear, so I took natural log on both sides and rearrange it. Then, it becomes ${y = a\ln{x} + b}$. Here I transformed x in table into ln(x), so when implementing linear regression, ${y = a\ln{x} + b}$ can be seen as ${y = ax + b}$. After that, it's easy to get a and b by using the formula from PPT.
> Notice that after transforming x into ln(x), the scale of x-axis will also be ln(x).

---

## Q5. Least-squares Regression
The following data are provided:
|  x  |  1  |  2  |  3  |  4  |  5  |
|:---:|:---:|:---:|:---:|:---:|:---:|
|  y  | 2.2 | 2.8 | 3.6 | 4.5 | 5.5 |
You have to use the least-squares regression to fit this data with the following model:
$${y = a + bx + \frac{c}{x}}$$
Determine the coefficients by setting up and solving:
$${(Z^TZ)A = Z^TY}$$
### Code:
```matlab=
clear;
close all;
format long;

% Find transpose of X and Y
X = [1 2 3 4 5]';
Y = [2.2 2.8 3.6 4.5 5.5]';
n = length(X);

Z = [ones(n, 1) X 1./X];
A = inv(Z'*Z)*Z'*Y;

% y = a + bx + c/x
func = @(x) A(1) + A(2).*x + A(3)./x;

% Conpute coefficient of determination
avg_Y = mean(Y);
St = sum((Y - avg_Y).^2);
Sr = sum((Y-func(X)).^2);
r2 = (St - Sr) / St;

% Conpute average error 
avg_error = 1 / n * St;

% Plot the figure
hold on;
% Plot points
plot(X, Y, 'o');
% Plot the estimated line
x = linspace(min(X) - 1, max(X) + 1, 100);
plot(x, func(x));
% Config of figure
title('Regression');
legend('Given Data', 'Estimated line');
```
### Result:
![](https://i.imgur.com/JmPZ0YC.png)

```
A =

    0.374496644295302
    0.986442953020126
    0.845637583892596
   
r2 =

    0.999602029264372

avg_error_ =

    5.530201342281875e-04
```

### Discussion:
We want to find a function like: ${y = a + bx + \frac{c}{x}}$ that satisfies the data,while these coefficient are unknown. So I separated the funtion into 
$$\ 　Y=ZA \Rightarrow \begin{bmatrix}y_1\\ y_2\\ y_3\\ y_4\\ y_5\end{bmatrix} = \begin{bmatrix}1&X_1&\frac{1}{X_1}\\ \:1&X_2&\frac{1}{X_2}\\ \:1&X_3&\frac{1}{X_3}\\ \:1&X_4&\frac{1}{X_4}\\ \:1&X_5&\frac{1}{X_5}
\end{bmatrix} \begin{bmatrix}a\\ b\\ c\end{bmatrix}$$

It's hard to find an exact value $A$ that satisfies ${ZA = Y}$, but we can find an approximate value that satisfies ${ZA \approx Y}$.

The way is to choose a line such that sum of the squares of the vertical distance from the points to the line ${y = a + bx + \frac{c}{x}}$ is minimum.

That is to find coefficients that makes fitting error $(a+bX_1+\frac{c}{X_1}-y_1)^2 + (a+X_2+b\frac{c}{X_2}-y_2)^2 +\ ... + (a+bX_5+\frac{c}{X_5}-y_5)^2$ minimum.

Or, in other word, to find a vaule $A$ that makes ${||ZA-Y||^2}$ minimum.

> Using the Projection Theorem I learned in linear algebra:
>|               Theorem                |               Picture                |
>|:------------------------------------:|:------------------------------------:|
>| ![](https://i.imgur.com/XEAwjWh.png) | ![](https://i.imgur.com/SCaVsiB.png) |



* Conversion Table (Theorem above and here the homework)

    |   Theorem   |  HW6 Q5  |     Annotation      |
    |:-----------:|:--------:|:-------------------:|
    |     $v$     |   $Y$    |                     |
    | $Proj_U(v)$ |   $ZA$   | Projecttion of $Y$  |
    |     $u$     | $col(Z)$ | Column space of $Z$ |

From the theorem,

$\Rightarrow$ $Y - ZA$ is perpendicular to the $col(Z)$, which is $Z^T$.

$\Rightarrow$ $Z^T(Y - ZA)=0$

$\Rightarrow$ $Z^TY = Z^TZA$, this is the formula given by the question.

$\Rightarrow$ $A = inv(Z^TZ)Z^TY$