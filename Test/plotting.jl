### Plotting practice
using Plots

x = collect(-10:10)
y = []

for i in eachindex(x)

    y2 = x[i]^9 + cos(x[i])
    append!(y, y2)

end

# plt.plot(x,y)

@time display(plot(x, y, xlabel="x", ylabel="y(x)", dpi=300))

# savefig("pic.png")
