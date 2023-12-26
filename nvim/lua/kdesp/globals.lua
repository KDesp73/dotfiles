P = function (obj)
    print(vim.inspect(obj))
    return obj
end

RELOAD = function (...)
    return require("plenary.reload").reload_module(...)
end

R = function (name)
    RELOAD(name)
    return require(name)
end
