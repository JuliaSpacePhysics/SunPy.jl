using SunPy
using Documenter

DocMeta.setdocmeta!(SunPy, :DocTestSetup, :(using SunPy); recursive=true)

makedocs(;
    modules=[SunPy],
    authors="Beforerr <zzj956959688@gmail.com> and contributors",
    sitename="SunPy.jl",
    format=Documenter.HTML(;
        canonical="https://JuliaSpacePhysics.github.io/SunPy.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/JuliaSpacePhysics/SunPy.jl",
    devbranch="main",
)
