---
# Front matter
lang: ru-RU
title: "Отчет по лабораторной работе №2: Система контроля версий Git"
subtitle: "*дисциплина: Математическое моделирование*"
author: "Карташова Алиса Семеновна, НФИбд-03-18"

# Formatting
toc-title: "Содержание"
toc: true # Table of contents
toc_depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4paper
documentclass: scrreprt
polyglossia-lang: russian
polyglossia-otherlangs: english
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase
indent: true
pdf-engine: luatex
header-includes:
  - \linepenalty=10 # the penalty added to the badness of each line within a paragraph (no associated penalty node) Increasing the value makes tex try to have fewer lines in the paragraph.
  - \interlinepenalty=0 # value of the penalty (node) added after each line of a paragraph.
  - \hyphenpenalty=50 # the penalty for line breaking at an automatically inserted hyphen
  - \exhyphenpenalty=50 # the penalty for line breaking at an explicit hyphen
  - \binoppenalty=700 # the penalty for breaking a line at a binary operator
  - \relpenalty=500 # the penalty for breaking a line at a relation
  - \clubpenalty=150 # extra penalty for breaking after first line of a paragraph
  - \widowpenalty=150 # extra penalty for breaking before last line of a paragraph
  - \displaywidowpenalty=50 # extra penalty for breaking before last line before a display math
  - \brokenpenalty=100 # extra penalty for page breaking after a hyphenated line
  - \predisplaypenalty=10000 # penalty for breaking before a display
  - \postdisplaypenalty=0 # penalty for breaking after a display
  - \floatingpenalty = 20000 # penalty for splitting an insertion (can only be split footnote in standard LaTeX)
  - \raggedbottom # or \flushbottom
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Введение

## Цель работы

Основная цель лабораторной работы  решение задачи о погоне

## Задачи работы
1. Записать уравнение, описывающее движение катера, с начальными условиями для двух случаев (в зависимости от расположения катера относительно лодки в начальный момент времени).
2. Построить траекторию движения катера и лодки для двух случаев.
3. Найти точку пересечения траектории катера и лодки


# Теоретическая справка

Постановка задачи

1. Принимает за $t_0$, $x_л0$ - место нахождения лодки браконьеров в момент обнаружения,
$x_k0=k$- место нахождения катера береговой охраны
относительно лодки браконьеров в момент обнаружения лодки.

2. Введем полярные координаты. Считаем, что полюс - это точка обнаружения
лодки браконьеров xл0, а полярная ось r проходит через точку нахождения катера береговой охраны

3. Траектория катера должна быть такой, чтобы и катер, и лодка все время были на одном расстоянии от полюса, только в этом случае траектория катера пересечется с траекторией лодки. Поэтому для начала катер береговой охраны должен двигаться некоторое время прямолинейно, пока не окажется на том же расстоянии от полюса, что и лодка браконьеров. После этого катер береговой охраны должен двигаться вокруг полюса удаляясь от него с той же скоростью, что и лодка браконьеров.

4. Чтобы найти расстояние x (расстояние после которого катер начнет
двигаться вокруг полюса), необходимо составить простое уравнение. Пусть через время
t катер и лодка окажутся на одном расстоянии x от полюса. За это время лодка пройдет x, а катер k-x (или k+x, в зависимости от начального положения катера относительно полюса). Время, за которое они
пройдут это расстояние, вычисляется как x-k/v или k+x/v (во втором случае). Так как время одно и то же, то эти величины одинаковы.
Тогда неизвестное расстояние x можно найти из следующего уравнения:
x/v=(k-x)/5v в первом случае или x/v=(k+x)/5v
во втором.
Отсюда мы найдем два значения x1 и x2, задачу будем решать для двух случаев.
x1 = 20.1/4 x2 = 20.1/6

5. После того, как катер береговой охраны окажется на одном расстоянии от
полюса, что и лодка, он должен сменить прямолинейную траекторию и начать двигаться вокруг полюса удаляясь от него со скоростью лодки. Для этого скорость катера раскладываем на две составляющие:
радиальная скорость и тангенциальная скорость. Радиальная скорость - это скорость, с которой катер удаляется от полюса. Нам нужно, чтобы эта скорость была равна скорости лодки.
Тангенциальная скорость – это линейная скорость вращения катера относительно полюса. Она равна произведению угловой скорости на радиус

6. Решение исходной задачи сводится к решению системы из двух дифференциальных уравнений с начальными условиями.
Исключая из полученной системы производную по t, можно перейти к следующему уравнению:$dr/d0=r/sqrt((5)^2*v^2-v^2).
Начальные условия остаются прежними. Решив это уравнение, вы получите
траекторию движения катера в полярных координатах.


# Вариант работы №57
На море в тумане катер береговой охраны преследует лодку браконьеров. Через определенный промежуток времени туман рассеивается, и лодка обнаруживается на расстоянии 20,1 км от катера. Затем лодка снова скрывается в тумане и уходит прямолинейно в неизвестном направлении. Известно, что скорость катера в 5 раза больше скорости браконьерской лодки


# Выполнение лабораторной работы
код в Julia для первого условия:


код в Julia для Второго условия:

```using Pkg
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
```
код в Julia для Второго условия:


```sing Pkg
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
```
# Выводы

3. Графики движения катера для первого условия, где $tetha_0=0$ и r0=x1 (рис. -@fig:003)

![первое условие катер](gr11.png){ #fig:003 width=70% }

Графики движения лодки для первого условия, где $tetha_0 = 0$ и $r_0=x_1$ (рис. -@fig:004)

![первое условие лодка](gr12.png){ #fig:004 width=70% }

Результат работы для первого случая (рис. -@fig:001)

![первый случай](grob.png){ #fig:001 width=70% }

Графики движения лодки и катера для второго условия, где тетта0=-pi и r0=x2 (рис. -@fig:006)

![второе условие лодка](gr2ob.png){ #fig:006 width=70% }

результат работы (рис. -@fig:002)

![второй случай](grob2.png){ #fig:002 width=70% }
точка пересечения катера и лодки r=25, tetha=320 для первого случая, r=40 tetha=320 для второго случая
