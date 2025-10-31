# Mathematical Models in Biology: Reaction-Diffusion Equations

This repository contains a LaTeX document and associated Julia scripts for generating figures in a report on
mathematical models in biology. 

The report explores reaction-diffusion partial differential equations, focusing on the Fisher-KPP equation and the Allee
effect model, including analytical derivations of travelling wave solutions and phase portraits.

The compiled PDF document is available in [releases](https://github.com/kunzaatko/ReactiveDiffusion/releases).
This is the latest version of the [document](https://github.com/kunzaatko/ReactiveDiffusion/releases/latest/download/standing_waves.pdf).

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
