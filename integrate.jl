### Integration file
include("input.jl")


b = LinRange(start, end_, num_step)
x_axis = collect(b)

y = 0
h = (end_ - start) / num_step


function integrate()

    y = 0

    for x in x_axis

        p = h * f(x)
        y += p

    end

    print(y)

end

@time integrate()
