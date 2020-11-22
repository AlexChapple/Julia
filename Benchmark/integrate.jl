### Integration file
include("input.jl")


### Boundaries
start = 0
end_ = 5
num_step = 10^8

b = LinRange(start, end_, num_step)
x_axis = collect(b)

### Time step
h = (end_ - start) / num_step


### Function to integrate
function f(x)

    return sin(x) * (cos(x)^2)

end

### Integration
function integrate()

    y = 0

    for x in x_axis

        p = h * f(x)
        y += p

    end

end

t = @elapsed integrate()

### Calculates score

output = []

lines = readlines("output.txt")

open("output.txt", "w+") do file

    for line in lines

        if startswith(line, "Integration score")

            score = (27.653293395 / t)
            println(file, "Integration score = " * string(score))

        elseif startswith(line, "Integration time")

            println(file, "Integration time = " * string(t))

        else

            println(file, line)

        end

    end

end

print("Integration took " * string(t) * " seconds. \n")
