using Plots
using DifferentialEquations

a = 0.01;
b = 0.02;

N = 12159;
I0 = 169;
R0 = 17;

S0 = N - I0 - R0;

# случай, когда I(0)<=I*, т.е число заболевших не привышает критического значения
    function sys1(du,u,p,t)
        du[1] = 0
        du[2] = -b*u[2]
        du[3] = b*u[2]
    end
 u0 = [S0, I0, R0]
 tspan = (0, 200)
 p = ODEProblem(sys1, u0, tspan)
 sol = solve(p, timeseries_steps = 0.01);

plot(sol, 
    label = ["S(t)-восприимчивые к болезни особей" "I(t) - инифицированные особи" "R(t) - Здоровые люди с иммунитетом"],
    title = "Модель заражания I(0)<=I*",
    titlefontsize = 10)


# случай, когда I(0)>I*, т.е число заболевших привышает критическое значение, 
# т.е. инфицированные способны заражать восприимчивых
    function sys2(du,u,p,t)
        du[1] = -a*u[1]
        du[2] = a*u[1] - b*u[2]
        du[3] = b*u[2]
    end
 u0 = [S0, I0, R0]
 tspan = (0, 1000)
 p2 = ODEProblem(sys2, u0, tspan)
 sol2 = solve(p2, timeseries_steps = 0.01);

plot(sol2, 
    label = ["S(t)-восприимчивые к болезни особей" "I(t) - инифицированные особи" "R(t) - Здоровые люди с иммунитетом"],
    title = "Модель заражания I(0)>I*",
    titlefontsize = 10)



