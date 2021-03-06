
#Подключим неободимые пакеты
# в этот раз для построения фазовых портретов, используем пакед Gadfly
    using DifferentialEquations
   using Gadfly
    using Plots
#Начальные значения
    y0= 0.8
    x0 = -0.8
#Дифференциальное уравнение гармонического осциллятора имет вид
#x"+γx'+ ωx = f(x)
# Зададftv  параметры
    γ = 0
    ω = sqrt(2.8)
# Задаем СДУ
    A = [0 1
        -ω^2 γ]
    syst(u,p,t) = A * u
 #Вектор начальных значений
    u0 = [x0, y0]
#Период дифференцировния
    tspan = (0.0, 67)
#Задаем проблему и решаем СДУ
    prob = ODEProblem(syst, u0, tspan)
    sol = solve(prob, RK4(),reltol=1e-6, timeseries_steps = 0.05)
# Находим колличкство столбцов в массиве решений
        N = length(sol.u)
        J = length(sol.u[1])
# Создаем массив из нулей
        U = zeros(N, J)
#PЗаписываем в массив наши решения
        for i in 1:N, j in 1:J
            U[i,j] = sol.u[i][j]
        end
#Устанавливаем размер графика
#set_default_plot_size(20cm, 20cm)
# Рисуем график

Gadfly.plot(x = U[:,1], y = U[:,2],
Theme(  discrete_highlight_color=x->"green",
       default_color="white",
       key_title_color="black",
       background_color="white",),
Guide.title("Колебания гармонического осциллятора без затухания, без действиея внешней силы"))


Plots.plot(sol, label = false,
 title = "Решение уравнения гармонического осциллятора без затуханий",
 titlefontsize = 10, lw = 2)
