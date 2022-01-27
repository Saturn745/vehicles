local LOG_LEVEL = GetConvarInt('logLevel', 1)
local LEVEL = {
    NONE = 0,
    ERROR = 1,
    WARNING = 2,
    DEBUG = 3,
}

local function listArgs(...)
    local args = table.pack(...)
    for i, v in ipairs(args) do args[i] = tostring(v) end
    return table.concat(args, ", ")
end

local function showTime()
    if IsDuplicityVersion() then
        return os.date('%H:%M:%S')
    else
        local year, month, day, hour, minute, second = GetLocalTime()
        return hour ..":".. minute ..":".. second
    end
end

log = {
    error = function(...)
        if LOG_LEVEL >= LEVEL.ERROR then
            print("[ERROR]".. showTime() .." ".. listArgs(...))
        end
    end,
    warning = function(...)
        local args = ...
        if LOG_LEVEL >= LEVEL.WARNING then
            print("[WARNING]".. showTime() .." ".. listArgs(...))
        end
    end,
    debug = function(...)
        local args = ...
        if LOG_LEVEL >= LEVEL.DEBUG then
            print("[DEBUG]".. showTime() .." ".. listArgs(...))
        end
    end
}
