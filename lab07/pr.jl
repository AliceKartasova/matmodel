# var 57

using Plots
using DifferentialEquations

N = 852
x0 = 5
g(t) = 0.805
v(t) = 0.0000.23


xd(x,p,t) = (g(t) + v(t))()
