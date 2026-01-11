# Coordinates

This section of the guide introduces how coordinates are represented in sunpy.

Reference: corresponding [sunpy webpage](https://docs.sunpy.org/en/stable/generated/gallery/coordinates/coordinates.html).

```@example sunpy
using SunPy
using SunPy: SkyCoord
using PythonCall
@py import astropy.units as u
@py import sunpy.coordinates.frames as frames
```

```@example sunpy
coord = SkyCoord(70*u.deg, -30*u.deg, obstime="2017-08-01",
                 frame=frames.HeliographicStonyhurst)
```

```@example sunpy
coord.transform_to(frames.Helioprojective(observer="earth"))
```

```@example sunpy
@py import sunpy.data.sample: AIA_171_IMAGE 
@py import matplotlib.pyplot as plt

amap = sunpy.map.Map(AIA_171_IMAGE)
coord = SkyCoord(100 * u.arcsec, 10*u.arcsec, frame=amap.coordinate_frame)
pixels = amap.wcs.world_to_pixel(coord)
```

```@example sunpy
fig = plt.figure()
ax = plt.subplot(projection=amap)
amap.plot()
ax.plot_coord(coord, 'o')
fig
```


