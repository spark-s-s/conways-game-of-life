import numpy as np
from time import sleep 

h = input('H : ')
w = input('W : ')

field = np.zeros((int(h), int(w)))

while 1:
    for i in range(int(h)):
        for j in range(int(w)):
            if int(field[i][j]) == 0:
                print('-', end='')
            else:
                print('X', end='')
        print('')
    print('')
    sleep(0.5)
