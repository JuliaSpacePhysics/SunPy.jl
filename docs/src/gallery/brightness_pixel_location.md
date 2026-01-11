# Finding the brightest pixel

Reference: corresponding [sunpy webpage](https://docs.sunpy.org/en/stable/generated/gallery/map/brightness_pixel_location.html).

```@example pixel
using SunPy, PythonCall
using SunPy: Map
@py import sunpy.data.sample: AIA_171_IMAGE
@py import astropy.units as u

aia = Map(AIA_171_IMAGE)
pixel_pos = Tuple(argmax(aia')) .* u.pixel
hpc_max = aia.wcs.pixel_to_world(pixel_pos...)
```

Let’s now plot the results.

```@example pixel
@py import matplotlib.pyplot as plt

fig = plt.figure()
ax = fig.add_subplot(projection=aia)
aia.plot(axes=ax)
ax.plot_coord(hpc_max, "wx", fillstyle="none", markersize=10)
fig
```


## Acceleration

```@repl pixel
using Chairmarks
@py import numpy as np

@b sunpy.map.Map(AIA_171_IMAGE) @py(np.argwhere(_.data == _.data.max()))
@b Map(AIA_171_IMAGE) argmax(_')
```