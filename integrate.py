import numpy as np
import time

start = 0
end = 20

interval = 1000000000

h = (end - start) / interval

x_axis = np.arange(start, end, h)

def f(x):

    return x ** 2
    
def integrate():

    y = 0

    for x in x_axis:

        p = h * f(x)
        y += p

    print(y)

start_time = time.time()
integrate()
print("--- %s seconds ---" % (time.time() - start_time))


