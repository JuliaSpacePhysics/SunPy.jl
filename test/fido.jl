using SunPy
using PythonCall
using Test

@testset "Fido" begin
    @py import sunpy.net: Fido, attrs as a
    result = Fido.search(a.Time("2012/3/4", "2012/3/6"), a.Instrument.lyra, a.Level.two)
    @test length(result[0]) == 3
end
