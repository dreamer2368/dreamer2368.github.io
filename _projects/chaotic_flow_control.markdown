---
layout: page
title: Optimal control of chaotic turbulent flows
description: A proper algorithm for non-convex optimization with chaotic dynamics
img: #/assets/img/12.jpg
importance: 2
show: true
---

Optimal flow control problem is
to seek an optimal control $$\mathbf{\Theta}^{\ast}$$
that minimizes a control objective $$\mathcal{J}$$ of a flow state $$\mathbf{q}$$.
It is often formulated as an equality-constrained optimization,

<center>$$\mathbf{\Theta}^{\ast} = \mathrm{argmin}\;\mathcal{J}[\mathbf{q}]$$ such that $$\mathcal{N}[\mathbf{q};\mathbf{\Theta}] = 0,$$</center>

where the equation $$\mathcal{N}$$ governs the dynamics of the flow.
This optimization problem provides a mathematical framework
to tackle many of both scientific and engineering goals in fluid dynamics.

Gradient-based methods can accelerate finding an optimal solution,
using the gradient $$\nabla_{\Theta}\mathcal{J}$$ to control.
They are particularly effective with high-dimensional optimization spaces.
However, this is not true for chaotic turbulent flows.
The so-called butterfly effect amplifies the gradient exponentially in time,
with extreme sensitivity to initial condition.
At the same time,
The objective $$\mathcal{J}$$ becomes highly non-convex in the optimization space,
for which any gradient-based method loses its effectiveness.

I analyzed the mathematical mechanism of this challenge
in the context of horseshoe mapping of chaotic dynamical systems,
and proposed a proper optimization framework that can circumvent non-convex optimization.
This framework is demonstrated its effectiveness on various flow control problems,
including three-dimensional turbulent Kolmogorov flow.
