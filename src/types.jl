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
