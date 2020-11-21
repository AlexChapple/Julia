#! /bin/bash

/Applications/Julia-1.5.app/Contents/Resources/julia/bin/julia integrate.jl
/Applications/Julia-1.5.app/Contents/Resources/julia/bin/julia ODE_solver.jl
/Applications/Julia-1.5.app/Contents/Resources/julia/bin/julia root_find.jl
/Applications/Julia-1.5.app/Contents/Resources/julia/bin/julia calc_score.jl
