# SunPy

Documentation for [SunPy](https://github.com/JuliaSpacePhysics/SunPy.jl).

```@index
```

```@autodocs
Modules = [SunPy]
```

## Acquiring Data

Obtaining solar data using the [`Fido`](https://docs.sunpy.org/en/stable/generated/api/sunpy.net.Fido.html) interface (a unified data search and retrieval tool). 

```@example sunpy
using SunPy, PythonCall
@py import sunpy.net: Fido, attrs as a
Fido
Fido.search(a.Time("2012/3/4", "2012/3/6"), a.Instrument.lyra, a.Level.two)
```

## Maps

`Map` object in [sunpy](https://docs.sunpy.org/en/stable/tutorial/maps.html).

```@example sunpy
pyimport("sunpy.data.sample")
sunpy.data.sample.AIA_171_IMAGE
my_map = sunpy.map.Map(sunpy.data.sample.AIA_171_IMAGE)
```
