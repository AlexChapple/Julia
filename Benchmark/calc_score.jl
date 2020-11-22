include("input.jl")

### Calculates score

output = []
score_lst = []

lines = readlines("output.txt")

open("output.txt", "w+") do file

    for line in lines

        if startswith(line, "Integration score")

            p = split(line, " ")
            append!(score_lst, parse(Float64, p[4]))

            println(file, line)
            # print("\n" * string(p[4]) * " \n")

        elseif startswith(line, "ODE Solver score")

            p = split(line, " ")
            append!(score_lst, parse(Float64, p[5]))

            println(file, line)
            # print(string(p[5]) * " \n")

        elseif startswith(line, "Root finding score")

            p = split(line, " ")
            append!(score_lst, parse(Float64, p[5]))

            println(file, line)
            # print(string(p[5]) * " \n")

        else

            println(file, line)

        end

    end

end

open("output.txt", "w+") do file

    for line in lines

        if startswith(line, "Total Score")

            final_score = 0

            for score in score_lst

                final_score += score
                # print(string(score) * " \n")

            end

            println(file, "Total Score = " * string(final_score * 1000))
            print("\nThe final score is " * string(final_score * 1000))

        else

            println(file, line)

        end

    end

end
