import numpy as np 

R3 = np.array([0, 13 / 5, 8.6])
R2 = np.array([0, 4.8, -0.8])

a = R3 - (13 / 24) * R2

R2_ = np.array([-2/5, 1, 0])
R3_ = np.array([0, -2/5, 1])

b = R3_ - (13 / 24) * R2_
print(b)

