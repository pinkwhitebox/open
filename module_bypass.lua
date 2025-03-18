local loaded, problem = pcall(function()
    for _, func in ipairs(getgc(false)) do
        if type(func) ~= "function" or not islclosure(func) or isexecutorclosure(func) then continue end
        local constants = debug.getconstants(func)
        if constants[14] == "error" then
            hookfunction(func, function(name)
                if tonumber(name) then
                    local sky = Instance.new("Sky")
                    sky.Name = name
                    sky._ = 0
                end
            end)
        end
    end
end)
if not loaded then
    kick("Failed to bypass module anticheat. " .. tostring(problem)) or game:Shutdown()
end
