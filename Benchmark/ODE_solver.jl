include("input.jl")

x0 = 0.0
y0 = 1.0

start = x0
end_ = 5
num_step = 10^8

# b = LinRange(start, end_, num_step)
# x_axis = collect(b)

h = (end_ - start) / num_step

function f(x, y)

    return y

end

function RK4(xn,yn)

    k1 = f(xn,yn)
    k2 = f(xn + h/2, yn + (h*k1/2))
    k3 = f(xn + h/2, yn + (h*k2/2))
    k4 = f(xn + h, yn + h*k3)

    y_new = yn + (1/6)*h*(k1 + 2k2 + 2k3 + k4)
    x_new = xn + h

    append!(y_list, y_new)
    append!(x_list, x_new)

end

function solve_ODE()

    x_list = [x0]
    y_list = [y0]

    for _ in 1:num_step

        xn = last(x_list)
        yn = last(y_list)

        k1 = f(xn,yn)
        k2 = f(xn + h/2, yn + (h*k1/2))
        k3 = f(xn + h/2, yn + (h*k2/2))
        k4 = f(xn + h, yn + h*k3)

        y_new = yn + (1/6)*h*(k1 + 2k2 + 2k3 + k4)
        x_new = xn + h

        append!(y_list, y_new)
        append!(x_list, x_new)

    end

end



t = @elapsed solve_ODE()

### Calculates score

output = []

lines = readlines("output.txt")

open("output.txt", "w+") do file

    for line in lines

        if startswith(line, "ODE Solver score")

            score = (106.9872198 / t)
            println(file, "ODE Solver score = " * string(score))

        elseif startswith(line, "ODE Solver time")

            println(file, "ODE Solver time = " * string(t))

        else

            println(file, line)

        end

    end

end

print("Integration took " * string(t) * " seconds. \n")

