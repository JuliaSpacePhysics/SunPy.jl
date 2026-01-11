using SunPy
using Test
using Aqua

@testset "Code quality (Aqua.jl)" begin
    Aqua.test_all(SunPy)
end

include("fido.jl")

@testset "Maps" begin
    using PythonCall
    pyimport("sunpy.data.sample")
    m = SunPy.Map(sunpy.data.sample.AIA_171_IMAGE)
    @test m isa AbstractArray
    @test size(m) == (1024, 1024)
    @test m[1] == -95.92475f0
end

@testset "find_contours_py" begin
    # Test with AIA_193_IMAGE which has more structure
    aiamap = SunPy.Map(sunpy.data.sample.AIA_193_IMAGE)
    contours = SunPy.find_contours_py(aiamap, 50000.0)
    @test length(contours) == 66
end
