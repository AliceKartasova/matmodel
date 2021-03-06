    using DifferentialEquations
    using Gadfly
   using Plots

    y0= 0.8
    x0 = -0.8
    g = 13
    w = sqrt(2)
    f(t) = 0;
#    A = [0 1
#        -w^2 g]

#    syst(u,p,t) = A * u


    function syst(du,u,p,t)
        du[1] = u[2]
        du[2] = -w*w*u[1]-g*u[2]-f(t)
    end


    u0 = [x0, y0]
    tspan = (0.0, 67)

    prob = ODEProblem(syst, u0, tspan)
    sol = solve(prob, RK4(),reltol=1e-6, timeseries_steps = 0.05)


    N = length(sol.u)
    J = length(sol.u[1])
    U = zeros(N, J)

    for i in 1:N, j in 1:J
        U[i,j] = sol.u[i][j]
    end
    set_default_plot_size(20cm, 20cm)
    Gadfly.plot(x = U[:,1], y = U[:,2],
        Theme(  discrete_highlight_color=x->"purple",
                default_color="white",
                key_title_color="black",
                background_color="white",),
        Guide.title("Колебания гармонического осциллятора c затуханием, без действиея внешней силы"))



    using Plots
    Plots.plot(sol, label = false,
   title = "Решение уравнения гармонического осциллятора c затуханием",
   titlefontsize = 10, lw = 2)
    xlims!(0,35)
