using Contour

"""
    find_contours_py(m::Map, levels)

Find contours in a Map at specified `levels` and convert them to world coordinates (SkyCoord) using the map's WCS transformation.
"""
function find_contours_py(m::Map, levels)
    x, y = Base.axes(m.data)
    lines = contour(x, y, m.data, levels).lines

    # Extract all coordinates and track contour boundaries
    all_vertices = reduce(vcat, vertices.(lines))
    lengths = length.(vertices.(lines))
    all_xs = getindex.(all_vertices, 1)
    all_ys = getindex.(all_vertices, 2)

    # Single batched Python call for all coordinates
    all_coords_py = m.wcs.array_index_to_world(all_xs, all_ys)

    # Split back into individual contours
    contours = Vector{Py}(undef, length(lines))
    offset = 0
    for (i, len) in enumerate(lengths)
        slice_obj = pyslice(offset, offset + len)
        contours[i] = all_coords_py[slice_obj]
        offset += len
    end

    return contours
end