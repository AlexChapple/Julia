### NOT FINISHED ###

include("input.jl")

A = [
    3.0 2 3
    5 6 1
    2 5 9
]

L = [
    1.0 0 0
    0 1 0
    0 0 1
]

function LU_decomp(A)

    a = (A[3, 1] / A[2, 1])

    for i = 1:3
        A[3, i] = A[3, i] - (a * A[2, i])
        L[3, i] = L[3, i] - (a * L[2, i])

    end

    # print(L)

    b = (A[2, 1] / A[1, 1])

    for i = 1:3
        A[2, i] = A[2, i] - (b * A[1, i])
        L[2, i] = L[2, i] - (b * L[1, i])

    end

    # print(L)

    c = (A[3, 2] / A[2, 2])

    for i = 1:3
        A[3, i] = A[3, i] - (c * A[2, i])
        L[3, i] = L[3, i] - (c * L[2, i])

    end

end


LU_decomp(A)
