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

for f in (:size, :axes)
    @eval Base.$f(m::Map) = Base.$f(m.data)
end

Base.getindex(m::Map, args...) = Base.getindex(m.data, args...)
Base.show(io::IO, m::MIME"text/plain", map::Map) = Base.show(io, m, map.py)

function Map(path)
    py = (@pyconst sunpy.map.Map)(path)
    pyarr = PyArray(@py py.data; copy = false)
    return Map(py, Origin(0)(pyarr))
end

@inline Base.getproperty(m::Map, s::Symbol) =
    s in fieldnames(Map) ? getfield(m, s) : getproperty(m.py, s)
