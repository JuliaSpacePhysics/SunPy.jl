```@meta
CurrentModule = SunPy
```

# SunPy

Documentation for [SunPy](https://github.com/JuliaSpacePhysics/SunPy.jl).

```@index
```

```@autodocs
Modules = [SunPy]
```

## Quickstart

using the `Fido` interface to obtain solar data. 

```@example sunpy
using SunPy, PythonCall
@py import sunpy.net: Fido, attrs as a
Fido
Fido.search(a.Time("2012/3/4", "2012/3/6"), a.Instrument.lyra, a.Level.two)
```

https://docs.sunpy.org/en/stable/tutorial/maps.html

```@example sunpy
pyimport("sunpy.data.sample")
sunpy.data.sample.AIA_171_IMAGE
my_map = sunpy.map.Map(sunpy.data.sample.AIA_171_IMAGE)
# my_map.quicklook()
```
