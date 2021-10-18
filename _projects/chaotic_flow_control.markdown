---
layout: page
title: Optimal control of chaotic turbulent flows
description: A proper algorithm for non-convex optimization with chaotic dynamics
img: /assets/img/multistep/thumbnail.png
importance: 1
show: true
---

Optimal flow control problem is
to seek an optimal control $$\mathbf{\Theta}^{\ast}$$
that minimizes a control objective $$\mathcal{J}$$ of a flow state $$\mathbf{q}$$.
It is often formulated as an equality-constrained optimization,

<center>$$\mathbf{\Theta}^{\ast} = \mathrm{argmin}\;\mathcal{J}[\mathbf{q}]\qquad \text{such that} \qquad\mathcal{N}[\mathbf{q};\mathbf{\Theta}] = 0,$$</center>

where the equation $$\mathcal{N}$$ governs the dynamics of the flow.
This optimization problem provides a mathematical framework
to tackle many of scientific and engineering goals in fluid dynamics:
* Passive/active flow control design
* Grid adaptation and data-assimilated modeling
* Flow instability analysis.

Gradient-based methods can accelerate finding an optimal solution,
using the gradient $$\nabla_{\Theta}\mathcal{J}$$ to control.
They are particularly effective with high-dimensional optimization spaces.
However, this is not true for chaotic turbulent flows.
The so-called butterfly effect amplifies the gradient exponentially in time,
with extreme sensitivity to initial condition.
At the same time,
The objective $$\mathcal{J}$$ becomes highly non-convex in the optimization space,
for which any gradient-based method loses its effectiveness.

<div class="row">
    <div class="col-sm mt-3 mt-md-0" style="max-width: 95%;">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/multistep/figure47.png' | relative_url }}" alt="" title="example image"/>
    </div>
</div>
<div class="caption" style="max-width: 95%;">
{% katexmm %}
    An example control objective $\mathcal{J}$ in the chaotic Lorenz dynamics:
    its gradient to control amplifies exponentially (left);
    its non-convex features frustrate searching for an effective local optimum (right).
{% endkatexmm %}
</div>

I analyzed the mathematical mechanism of this challenge
in the context of horseshoe mapping of chaotic dynamical systems,
and proposed a proper optimization framework that can circumvent non-convex optimization.
In essence, it temporarily enlarges search scale by introducing intermediate discontinuities in $$\mathbf{q}$$, then increasingly penalizes them.
As an instance of effective control law, such optimized solution provides a pathway to harness the effective control law and analyze the system.
This framework is demonstrated its effectiveness on various flow control problems,
including three-dimensional turbulent Kolmogorov flow.

<div class="row">
  <div class="col-sm mt-3 mt-md-0" style="padding:50% 0 0 0;position:relative;max-width: 50%;">
    <iframe src="https://player.vimeo.com/video/634809587?h=d2d2328539&amp;badge=0&amp;autopause=0&amp;autoplay=1&amp;loop=1&amp;background=1&amp;player_id=0&amp;app_id=58479" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen style="position:absolute;top:-10%;left:5%;width:100%;height:100%;" title="lorenz-optim.mp4"></iframe>
    <div class="caption" style="position:absolute;top:80%;left:5%;width:100%;height:100%;">
      {% katexmm %}
          Multi-step optimization for control of the Lorenz dynamics:
          intermediate discontinuities (red) are temporarily introduced,
          then increasingly penalized.
      {% endkatexmm %}
    </div>
  </div>

  <div class="col-sm mt-3 mt-md-0" style="padding:50% 0 0 0;position:relative;max-width: 37%;">
    <iframe src="https://player.vimeo.com/video/634833504?h=01b4efddf7&amp;badge=0&amp;autopause=0&amp;autoplay=1&amp;loop=1&amp;background=1&amp;player_id=0&amp;app_id=58479" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen style="position:absolute;top:-10%;left:15%;width:100%;height:100%;" title="3DKolmogorov-controlled.mov"></iframe>
    <div class="caption" style="position:absolute;top:80%;left:15%;width:100%;height:100%;">
      {% katexmm %}
          Pressure control of turbulent Kolmogorov flow:
          Q-criterion iso-surfaces colored by pressure perturbation.
      {% endkatexmm %}
    </div>
  </div>
</div>
