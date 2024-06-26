using CairoMakie, DifferentialEquations

include("theme.jl")

const c = 2.1

function phase_portrait_kpp_fisher()
    phase_sol(u, v) = Point2f(v, -c * v - u * (1 - u))

    fig, ax, _ = vlines([0, 1], color=(:red, 0.5))
    streamplot!(ax, phase_sol, -0.3 .. 1.3, -0.3 .. 0.3, gridsize=(50, 50), stepsize=0.005)
    scatter!(ax, [(0, 0), (1, 0)], markersize=10, color=:orange, marker=[:circle, :x])
    limits!(ax, (-0.3, 1.3), (-0.3, 0.3))
    return fig
end


with_theme(create_theme()) do
    fig = phase_portrait_kpp_fisher()
    svg_path = "phase-portrait-kpp-fisher.svg"
    path = "phase-portrait-kpp-fisher.pdf"
    Makie.save(svg_path, fig; CairoMakie, pt_per_unit=1)
    cmd_parts = ["inkscape", svg_path, "--export-type=pdf", "--export-latex", "--export-filename", path]
    inkscape_cmd = Cmd(cmd_parts)
    run(inkscape_cmd)
end