using Plots
using DifferentialEquations


#максимальное количество людей, которых может заинтересовать товар
N = 852;

# количество людей, знающих о товаре в начальный момент времени
u0 = 5;

# функция, отвечающая за платную рекламу
g(t) = 0.805;

#функция, описывающая сарафанное радио
v(t) = 0.000023;


# Случай №1
# уравнение, описывающее распространение рекламы
fun(u,p,t) = (g(t)+v(t)*u)*(N-u)

tspan = (0,5);
pr = ODEProblem(fun, u0, tspan);
sol = solve(pr, timeseries_steps = 0.1);

plot(sol,
label = false)
# Случай №2
g(t) = 0.000085
v(t)=0.63
fun2(u,p,t) = (g(t)+v(t)*u)*(N-u)

tspan = (0,0.1);
pr2 = ODEProblem(fun2, u0, tspan);
sol2 = solve(pr2, timeseries_steps = 0.1);
plot(sol2,
label = false)



    n = length(sol2.u)
    J = length(sol2.u[1])
    U = zeros(n, J)

    for i in 1:n, j in 1:J
        U[i,j] = sol2.u[i][j]
    end

vv = 0;
kk = -1;

for i in 1:(n-2)
    if U[i+1] - U[i] > kk
        kk = U[i+1] - U[i];
        vv = i;
    end
end

# точки максимального распостронения рекламы
sol2.t[vv]
sol2.u[vv]


# Случай №3
g(t) = 0.8*t
v(t)=0.3*t
fun3(u,p,t) = (g(t)+v(t)*u)*(N-u)

tspan = (0,5);
pr3 = ODEProblem(fun3, u0, tspan);
sol3 = solve(pr3, timeseries_steps = 0.1);
plot(sol3,
label = false)
