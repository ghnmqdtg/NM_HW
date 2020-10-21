function [x4] = parabolic_interpolation(func, iter, x1, x2, x3)
    for i = 1 : iter
        numerator = ((x2 - x1) ^ 2 * (subs(func, x2) - subs(func, x3))) - ((x2 - x3) ^ 2 * (subs(func, x2) - subs(func, x1)));
        denominator = ((x2 - x1) * (subs(func, x2) - subs(func, x3))) - ((x2 - x3) * (subs(func, x2) - subs(func, x1)));
        x4 = vpa(x2 - 1 / 2 * numerator / denominator);
        if x4 > x1 && x4 < x2
            x3 = x2;
            x2 = x4;
        elseif x4 > x2 && x4 < x3
            x1 = x2;
            x2 = x4;
        end
<<<<<<< HEAD
        [x4, x1, x2, x3];
    end
=======
        [x4, x1, x2, x3]
    end

% 剛開始的時候交換變數換錯，用x4取代x3，他就一直接近x2
>>>>>>> origin/master
