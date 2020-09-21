'''
蒙地卡羅方法(Monte Carlo Method)基於這樣的想法：
假設你有一袋豆子，把豆子均勻地朝這個圖形上撒，然後數這個圖形之中有多少顆豆子，
這個豆子的數目就是圖形的面積。當你的豆子越小，撒的越多的時候，結果就越精確。
藉助電腦程式可以生成大量均勻分布坐標點，然後統計出圖形內的點數，
通過它們占總點數的比例和坐標點生成範圍的面積就可以求出圖形面積。

工作過程：
1. 用蒙地卡羅方法類比某一過程時，需要產生各種機率分布的"隨機變數"。
2. 用統計方法把模型的數字特徵估計出來，從而得到實際問題的數值解。

估算pi，而非計算出pi
'''

import random


# Q1(a)
def monte_carlo_method(num):
    # num: points to be generated
    # the more points to be generated, the more accurate the result
    circle_points = 0
    square_points = 0

    for i in range(num):
        # randomly generate points (x, y)
        x = random.uniform(-1, 1)
        y = random.uniform(-1, 1)

        # calculate the distance to origin
        distance_to_origin = x**2 + y**2

        # if the distance <= 1, the lies inside the circle
        if(distance_to_origin <= 1):
            circle_points = circle_points + 1

        square_points = square_points + 1

    # the ratio of the area of circle and square is pi/4
    pi = 4 * circle_points / square_points

    print(f"Estimated Pi = {pi}")


# Q1(b)
def leibniz_formula(num):
    # initialize the summation as zero
    summation = 0

    # the final summation is pi/4
    for i in range(num):
        summation = summation + ((-1)**i) / (2 * i + 1)

    pi = 4 * summation

    print(f"Estimated Pi = {pi}")


if __name__ == "__main__":
    print("Monte Carlo Method Estimated Pi:")
    monte_carlo_method(10**7)

    print("\nLeibniz Formula for Pi:")
    leibniz_formula(10**7)
