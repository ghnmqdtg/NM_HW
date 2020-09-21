import random


def back_to_origin(limit, attempts):
    directions = ["A", "B", "C", "D"]
    occurrences = 0

    for j in range(attempts):
        steps = []

        # randomly choose a direction
        # up: A, down: B, left: C, right: D
        for i in range(limit):
            steps.append(random.choice(directions))

        # count duplicates
        count_A = steps.count("A")
        count_B = steps.count("B")
        count_C = steps.count("C")
        count_D = steps.count("D")

        if(count_A == 2 and count_B == 2):
            occurrences += 1
        elif(count_C == 2 and count_D == 2):
            occurrences += 1
        elif(count_A == 1 and count_B == 1 and count_C == 1 and count_D == 1):
            occurrences += 1

        steps.clear()

    probability = occurrences / attempts

    print(probability)


if __name__ == "__main__":
    back_to_origin(4, 10000)
