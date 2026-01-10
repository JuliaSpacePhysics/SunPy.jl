module SunPy

using PythonCall

export sunpy

include("types.jl")

const sunpy = PythonModule(PythonCall.pynew(), (:data, :map, :net, :visualization))
const astropy = PythonModule(PythonCall.pynew())

function __init__()
    certifi = pyimport("certifi")
    ENV["SSL_CERT_FILE"] = pyconvert(String, certifi.where())

    PythonCall.pycopy!(sunpy.mod, pyimport("sunpy"))
    PythonCall.pycopy!(astropy.mod, pyimport("astropy"))
    return
end

function SkyCoord(args...; kw...)
    return (@pyconst pyimport("astropy.coordinates").SkyCoord)(args...; kw...)
end
end
