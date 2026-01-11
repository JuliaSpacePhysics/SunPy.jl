# Finding contours of a map

This example shows how to find and plot contours on a map.

Reference: corresponding [sunpy webpage](https://docs.sunpy.org/en/stable/generated/gallery/map/map_contouring.html)

```@example contour
using SunPy, PythonCall
using SunPy: Map
@py import sunpy.data.sample: AIA_193_IMAGE
@py import astropy.units as u

aiamap = Map(AIA_193_IMAGE)

contours =  SunPy.find_contours_py(aiamap, 50000.0)
contours_py =  aiamap.find_contours(50000 * u.DN)
```


```@example contour
@py import matplotlib.pyplot as plt

let fig = plt.figure(figsize=(12, 5))
    # First subplot: Julia implementation
    ax = fig.add_subplot(1, 2, 1, projection=aiamap)
    # aiamap.plot(axes=ax)
    ax.plot_coord.(contours)
    ax.set_title("Julia find_contours")

    # Second subplot: Python implementation
    ax2 = fig.add_subplot(1, 2, 2, projection=aiamap)
    # aiamap.plot(axes=ax2)
    ax2.plot_coord.(PyList(contours_py))
    ax2.set_title("Python find_contours")

    fig
end
```

## Acceleration

```@repl contour
using Chairmarks

# Python
@b aiamap.find_contours(50000 * u.DN)

# vs Julia
@b SunPy.find_contours_py(aiamap, 50000.0)
```
