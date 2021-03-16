using  Gadfly
using Plots
using DifferentialEquations

a= 0.17;
b= 0.69;
c= 0.09;
d= 0.08;
x0 = 3;
y0 =12;

    function syst(du,u,p,t)
        du[1] = -a*u[1]+c*u[1]*u[2]
        du[2] = b*u[2]-d*u[1]*u[2]
    end

u0 = [x0, y0];
tspan = (0, 100);


prob = ODEProblem(syst, u0, tspan);
sol = solve(prob, RK4(),reltol=1e-6, timeseries_steps = 0.05);

N = length(sol.u)
    J = length(sol.u[1])
    U = zeros(N, J)

    for i in 1:N, j in 1:J
        U[i,j] = sol.u[i][j]
    end

set_default_plot_size(30cm, 20cm)
Gadfly.plot(x = U[:,1], y = U[:,2])

Plots.plot(sol)
