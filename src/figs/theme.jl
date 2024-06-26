using CairoMakie, Unitful

const TEXT_WIDTH = 18u"cm" |> u"inch" |> ustrip
const HWRATIO = 0.68

const BASE = merge(Theme(
        pt_per_unit=1,
        figure_padding=2,
        Axis=(
            xgridvisible=false,
            ygridvisible=false,
            # spinewidth=1.1,
            # xminorticks=IntervalsBetween(5),
            # yminorticks=IntervalsBetween(5),
            # xlabelpadding=-2,
            # ylabelpadding=2,
            # xminortickwidth=0.75,
            # yminortickwidth=0.75,

            ## DEFAULT ##
            # xminorticksvisible=true,
            # yminorticksvisible=true,
            # xminortickalign=1,
            # yminortickalign=1,
            # xminorticksize=3,
            # yminorticksize=3,
        ),
    ),
    theme_latexfonts())

function figsize(width_in_inch, height_width_ratio=HWRATIO)
    width_in_point = floor(Int, 72width_in_inch)
    height_in_point = floor(Int, width_in_point * height_width_ratio)
    return width_in_point, height_in_point
end

create_theme(; hwratio=HWRATIO, size=TEXT_WIDTH) = merge(Theme(
        size=figsize(size, hwratio),
        figure_padding=15,
        Axis=(
            xticklabelsize=10, yticklabelsize=10,
            xtickwidth=0.7, ytickwidth=0.7,
            xticksize=4, yticksize=4,
        ),
        Legend=(
            labelsize=10,
        ),
        Colorbar=(
            labelsize=10,
            ticklabelsize=10,
            leftspinevisible=false, rightspinevisible=false, topspinevisible=false, bottomspinevisible=false,
            width=5,
            # labelpadding=1.5,
            tickwidth=0.7,
            ticksize=4,
        ),
        StreamPlot=(
            arrow_size=5, linewidth=1
        )
    ), BASE)
