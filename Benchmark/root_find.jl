include("input.jl")


x0 = 4 # Initial Guess
Num_step = 10^2 # Number of steps

x_n = [x0, x0+0.6]

function f(x)

    return tan(x)^5 - (1/x) - (cos(x)^10)

end

function der_f(x, x_old)

    y = f(x)
    y_old = f(x_old)

    return (y - y_old) / (x - x_old)

end

function find_root()

    for _ in 1:Num_step

        fx = f(last(x_n))
        fxprime = der_f(last(x_n), x_n[length(x_n) - 1])

        x_new = last(x_n) - fx/fxprime

        if abs(last(x_n) - x_new) <= (10^-14)

            break

        else

            append!(x_n, x_new)

        end

    end

end

t = @elapsed find_root()



### Calculates score

output = []

lines = readlines("output.txt")

open("output.txt", "w+") do file

    for line in lines

        if startswith(line, "Root finding score")

            score = (0.259534311 / t)
            println(file, "Root finding score = " * string(score))

        elseif startswith(line, "Root finding time")

            println(file, "Root finding time = " * string(t))

        else

            println(file, line)

        end

    end

end

print("Root finding took " * string(t) * " seconds.\n")
