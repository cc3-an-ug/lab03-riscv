#!/usr/bin/env python3

import math
from subprocess import Popen, PIPE

# Test cases
tests = [-1, 1, 5, 10, 0, 3, 4, 2, 9, 8]


# Runs jupiter with factorial.s and returns the output (java should be in the PATH)
def run(x: int) -> str:
    p = Popen(['java', '-jar', './bin/jupiter.jar', 'factorial.s'], stdout=PIPE, stdin=PIPE, stderr=PIPE, text=True)
    stdout_data = p.communicate(input=str(x))[0]
    return stdout_data


# Tests the factorial program
def test_fact():
    grade = 0
    print(' Factorial Test Cases '.center(25, '='), end='\n\n')
    for i, x in enumerate(tests):
        print(f'Test fact {x}'.ljust(20), end=' ')
        output = run(x)
        expected = f'Enter a number: \nresult = {math.factorial(abs(x))}\n\nJupiter: exit(0)'
        match = output.strip() == expected.strip()
        grade += 10 if match else 0
        print('Pass' if match else 'Fail')


    print(f'\nGrade: {grade}/100')


if __name__ == '__main__':
    test_fact()
