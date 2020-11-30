using Plots

x_point = range(0,10,step=0.01)
y_point = range(0,10,step=0.01)

f(x,y) = sin(x) + cos(y)

z_point = [f(x,y) for x in x_point, y in y_point]

display(surface(x_point, y_point, z_point))