# Mathematical Models in Biology: Reaction-Diffusion Equations

This repository contains a LaTeX document and associated Julia scripts for generating figures in a report on
mathematical models in biology. 

The report explores reaction-diffusion partial differential equations, focusing on the Fisher-KPP equation and the Allee
effect model, including analytical derivations of travelling wave solutions and phase portraits.

The compiled PDF document is available in [releases](https://github.com/kunzaatko/ReactiveDiffusion/releases).
This is the latest version of the [document](https://github.com/kunzaatko/ReactiveDiffusion/releases/latest/download/standing_waves.pdf).

## Equations

The document explores several key equations in reaction-diffusion models:

### Basic Diffusion and Reaction-Diffusion
- Diffusion equation: $\frac{\partial u}{\partial t} = D \frac{\partial^2 u}{\partial x^2}$
- Reaction-diffusion equation: $\frac{\partial u}{\partial t} = D \frac{\partial^2 u}{\partial x^2} + F(u)$

### KPP Restrictions on Reaction Term
- $F(0) = F(1) = 0$
- $F'(0) = \alpha > 0$
- $F'(u) < \alpha$ for $u \in (0, 1)$

### Fisher-KPP Equation
- Reaction term: $F(u) = \alpha u (1 - u)$
- Logistic growth form: $F(u) = \alpha u (1 - u/u_\infty)$
- Dimensionless form: $\frac{\partial u}{\partial \tau} = \frac{\partial^2 u}{\partial \chi^2} + u(1-u)$
- Travelling wave ODE: $-c \frac{du}{dz} = \frac{d^2 u}{dz^2} + u(1-u)$

### Allee Effect Equation
- Reaction term: $F(u) = \alpha u \left(1 - \frac{u}{u_\infty}\right)\left(\frac{u - u_-}{u_-}\right)$
- Dimensionless form: $\frac{\partial u}{\partial \tau} = \frac{\partial^2 u}{\partial \chi^2} + u (1 - u ) \left(\frac{u - u_-}{u_-}\right)$

## Figures

<p align="center">Phase portrait of diffusion equation with the Fisher-KPP reactive term<br><img src="src/figs/phase-portrait-kpp-fisher.svg" alt="Phase portrait Fisher-KPP"></p>

<p align="center">Phase portrait of diffusion equation with the Allee effect reactive term<br><img src="src/figs/phase-portrait-kpp-allee.svg" alt="Phase portrait Allee"></p>

## Compilation 

The document can be compiled using [`tectonic`](https://github.com/tectonic-typesetting/tectonic)
```bash
$ tectonic -X build
```
after creating the figures.

The figures may be generated with `Julia` (tested version `1.10`) by running the scripts in `src/figs/`, e.g.
```bash
$ julia --project fisher_wave.jl
```
