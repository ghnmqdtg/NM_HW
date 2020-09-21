"""
1.任選三條線xyz，0~1之間的長度，任兩邊相加大於第三邊，x+y>z

2.給一段直線，隨意剪兩刀
https://reurl.cc/141GaY
"""

import random


def random_three_segment(num):
    occurrences = 0

    for i in range(num):
        x = random.uniform(0, 1)
        y = random.uniform(0, 1)
        z = random.uniform(0, 1)
        if(x + y > z and y + z > x and z + x > y):
            occurrences = occurrences + 1

    probability = occurrences / num

    print(probability)


def cut_one_line(num):
    total = 0
    occurrences = 0
    for i in range(num):
        x = random.uniform(0, 1)
        y = random.uniform(0, 1)
        if(x + y <= 1):
            total = total + 1
            if(x + y > 1 / 2 and x < 1 / 2 and y < 1 / 2):
                occurrences = occurrences + 1

    probability = occurrences / total

    print(probability)


if __name__ == "__main__":
    random_three_segment(10**7)
    cut_one_line(10**7)
