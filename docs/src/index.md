# SunPy

A Julia wrapper around [SunPy](https://www.sunpy.org).

## Motivation

This package brings SunPy's solar physics capabilities to Julia, enabling:

- **Performant Array manipulation**: Leverage Julia's powerful and flexible array manipulation for accelerated numerical computations
- **Ecosystem integration**: Combine solar data analysis with the broader Julia scientific computing stack (e.g., [SciML](https://sciml.ai/), [JuliaAstro](https://juliaastro.org/home/), [JuliaArrays](https://github.com/JuliaArrays))

```@index
```

```@autodocs
Modules = [SunPy]
```

## Acquiring Data

Obtaining solar data using the [`Fido`](https://docs.sunpy.org/en/stable/generated/api/sunpy.net.Fido.html) interface (a unified data search and retrieval tool). 

```@repl sunpy
using SunPy, PythonCall
@py import sunpy.net: Fido, attrs as a
Fido
Fido.search(a.Time("2012/3/4", "2012/3/6"), a.Instrument.lyra, a.Level.two)
```

## Maps

`Map` object in [sunpy](https://docs.sunpy.org/en/stable/tutorial/maps.html).

```@example sunpy
@py import sunpy.data.sample: AIA_171_IMAGE
my_map = sunpy.map.Map(AIA_171_IMAGE)
```
