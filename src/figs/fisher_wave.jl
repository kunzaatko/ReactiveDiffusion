using CairoMakie, DifferentialEquations

include("theme.jl")

wave_front(z, c) = 1 / (1 + exp(z / c)) + 1 / c^2 * log(exp(z / c) / (exp(z / c) + 1)^2) * exp(z / c) / (exp(z / c) + 1)^2

function wavefront_kpp_fisher()
    phase_sol(u, v) = Point2f(v, -c * v - u * (1 - u))

    fig = Figure()
    ax = Axis3(fig[1, 1]; xlabel=L"z", ylabel=L"c")
    surface!(ax, -5:0.1:5, 2:0.1:4, [wave_front(z, c) for z in -5:0.1:5, c in 2:0.1:4])
    return fig
end

with_theme(create_theme()) do
    fig = wavefront_kpp_fisher()
    svg_path = "wave_front_kpp_fisher.svg"
    path = "wave_front_kpp_fisher.pdf"
    Makie.save(svg_path, fig; CairoMakie, pt_per_unit=3)
    cmd_parts = ["inkscape", svg_path, "--export-type=pdf", "--export-latex", "--export-filename", path]
    inkscape_cmd = Cmd(cmd_parts)
    run(inkscape_cmd)
end
