using SunPy
using Test
using Aqua

@testset "SunPy.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(SunPy)
    end
    # Write your tests here.
end
