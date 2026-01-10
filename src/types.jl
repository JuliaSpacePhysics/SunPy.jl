struct PythonModule{A}
    mod::PythonCall.Py
    autoimports::A
end

PythonModule(mod) = PythonModule(mod, ())
PythonCall.Py(mod::PythonModule) = getfield(mod, :mod)

@inline function Base.getproperty(m::PythonModule, name::Symbol)
    name in fieldnames(PythonModule) && return getfield(m, name)
    py = Py(m)
    name in m.autoimports && return pyimport("$(py.__name__).$name")
    return getproperty(py, name)
end

struct Map{T, N, A <: AbstractArray{T, N}} <: AbstractArray{T, N}
    py::Py
    data::A
end

Base.size(m::Map) = Base.size(m.data)
Base.getindex(m::Map, args...) = Base.getindex(m.data, args...)
Base.show(io::IO, m::MIME"text/plain", map::Map) = Base.show(io, m, map.py)

function Map(path)
    py = sunpy.map.Map(path)
    return Map(py, PyArray(py.data; copy = false))
end
