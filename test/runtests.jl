using SunPy
using Test
using Aqua

@testset "Code quality (Aqua.jl)" begin
    Aqua.test_all(SunPy)
end

include("fido.jl")
