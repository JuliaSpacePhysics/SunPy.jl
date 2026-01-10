using SunPy
using Documenter

DocMeta.setdocmeta!(SunPy, :DocTestSetup, :(using SunPy); recursive = true)

makedocs(;
    modules = [SunPy],
    authors = "Beforerr <zzj956959688@gmail.com> and contributors",
    sitename = "SunPy.jl",
    format = Documenter.HTML(;
        canonical = "https://JuliaSpacePhysics.github.io/SunPy.jl",
        size_threshold = nothing
    ),
    pages = [
        "Home" => "index.md",
        "Tutorials" => [
            "Coordinates" => "tutorials/coordinates.md",
        ],
    ],
)

deploydocs(;
    repo = "github.com/JuliaSpacePhysics/SunPy.jl",
    push_preview = true
)
