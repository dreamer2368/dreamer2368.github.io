---
layout: page
title: Sensitivity analysis in plasma kinetics
description: Regular sensitivity computing algorithm in chaotic particle dynamics simulations
img: /assets/img/pic-sensitivity/thumbnail.png
importance: 2
category: work
related_publications: true
show: true
summary:
  - item: Developed a fortran-based 1D PIC-MCC code to carry out plasma kinetics simulations.
---

Particle-in-cell (PIC) method is an effective simulation tool for plasma kinetics, where velocity distribution of plasma species deviates from equilibrium and often does not remain stationary.
While mesh-based methods suffer from high-dimensional space-velocity phase space, PIC method utilizes coarse-grained Lagrangian particles to represent the plasma distribution with amenable computational costs.
<div class="row">
    <div class="col-sm-8 p-1" style="max-width: 66%;">
      <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/pic-sensitivity/figure14.png' | relative_url }}" alt="" title="sheath configuation"/>
    </div>
    <div class="col-sm-4 p-0" style="max-width: 33%;">
      <div class="row-sm p-0">
        <iframe src="https://player.vimeo.com/video/583737878?autoplay=1&loop=1&autopause=0&background=1" style="position:absolute;top:-5%;width:100%;height:60%;" frameborder="0" allow="autoplay; picture-in-picture"></iframe>
      </div>
      <div class="row-sm p-0">
        <iframe src="https://player.vimeo.com/video/583741200?autoplay=1&loop=1&autopause=0&background=1" style="position:absolute;top:25%;width:100%;height:100%;" frameborder="0" allow="autoplay; picture-in-picture"></iframe>
      </div>
    </div>
</div>
<div class="caption">
    PIC simulation of a sheath edge formation: number densities of electrons and ions (left); space-velocity distribution of electrons (top right) and ions (bottom right).
</div>

PIC simulation can benefit from sensitivity analysis, which provides a gradient of a quantity-of-interest $$\mathcal{J}$$ to parameters-of-interests $$\mathbf{\Theta}$$. Such gradient can be used to:
* design optimization
* uncertainty quantification.

Computing the sensitivity in PIC simulations, however, is challenging.
Simulation particles mimicks the chaotic $$N$$-body dynamics of actual molecules, which are extremely sensitive to their initial conditions.
While there is an 'useful' sensitivity of the plasma distribution as a whole,
exploding sensitivities of individual particles mask it to be computed exactly.
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/pic-sensitivity/figure7.png' | relative_url }}" alt="" title="example image"/>
    </div>
</div>
Debye-shielding length scale $$\mathcal{J}$$ as a function of electron thermal velocity $$v_T$$ (left).
Due to chaotic particle dynamics, $$\mathcal{J}(v_T)$$ becomes extremely non-smooth (right).

I proposed and developed the particle-pdf approach, where the adjoint particles represent the sensitivity of plasma distribution, not individual plasma particles. The proposed approach avoids chaotic sensitivities of particles and computes the useful sensitivity at a computational cost similar to the original plasma simulation.
<div class="row">
    <div class="col-sm-8 p-1" style="max-width: 66%;">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/pic-sensitivity/figure1.png' | relative_url }}" alt="" title="example image"/>
    </div>
    <div class="col-sm-4 p-0" style="max-width: 33%;">
      <div class="row-sm py-1">
        <img class="img-fluid rounded" src="{{ '/assets/img/pic-sensitivity/electron.sensitivity.png' | relative_url }}" alt="" title="sheath configuation"/>
      </div>
      <div class="row-sm pt-1">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/pic-sensitivity/ion.sensitivity.png' | relative_url }}" alt="" title="sheath configuation"/>
      </div>
    </div>
</div>
<div class="caption">
Sensitivity of the potential drop to the temperature ratio (left), in the sheath-edge formation.
Electron sensitivity distribution (top-right) and ion sensitivity distribution (bottom-right).
</div>