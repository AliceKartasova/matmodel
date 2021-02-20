using Pkg
using Plots
using DifferentialEquation
fun(u,p,t) =  u/sqrt(24);
u0 = 20.1/6;
tspan = (0, 2pi);
prob =  ODEProblem(fun,u0,tspan)
sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8)
#p1 = plot(sol, proj = :polar)
tetha = 0:0.1:2pi
polar(tetha)= 1/cos(tetha-45)
plot(sol, proj = :polar)
plot!(polar, proj = :polar)
ylims!(0,40)
# m = 0:1:100
#fi = 3*pi/4
#function f2(m)
#    return tan(fi)*m
#   end
#p2 = plot(m,f2(m))
#plot(p1,p2)


sing Pkg
using Plots
using DifferentialEquation
fun(u,p,t) =  u/sqrt(24);
u0 = 20.1/4;
tspan = (0.0, 2pi);
prob =  ODEProblem(fun,u0,tspan)
sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8)
p1 = plot(sol, proj = :polar)

 m = 0:1:100
 fi = 3*pi/4
function f2(m)
       return tan(fi)*m
   end
p2 = plot(m,f2(m))
plot(p1,p2)
