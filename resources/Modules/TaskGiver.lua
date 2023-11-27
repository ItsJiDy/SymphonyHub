local Module = {}
Module.ClassName = "Task Giver"

local Connections = {}

function Module:GiveTask(TaskName, TaskConnection)
    if not Connections[Name] then
        if typeof(TaskConnection) == "RBXScriptConnection" then
            Connections[Name] = TaskConnection
        else
            Module.TracebackSend("'" .. TaskName .. "' is not a type of RBXScriptConnection.")
        end
    else
        Module.TracebackSend("'" .. TaskName .. "' is already taken name.")
    end
end

function Module:WaitTask(TaskName)
    if Connections[Name] ~= nil then
        if typeof(TaskConnection) == "RBXScriptConnection" then
            Connections[Name]:Wait()
        else
            Module.TracebackSend("'" .. TaskName .. "' is not a type of RBXScriptConnection.")
        end
    else
        Module.TracebackSend("'" .. TaskName .. "' is not a valid member.")
    end
end

function Module:DestroyTask(TaskName)
    if Connections[Name] ~= nil then
        if typeof(TaskConnection) == "RBXScriptConnection" then
            Connections[Name]:Disconnect()
            Connections[Name] = nil
        else
            Module.TracebackSend("'" .. TaskName .. "' is not a type of RBXScriptConnection.")
        end
    else
        Module.TracebackSend("'" .. TaskName .. "' is not a valid member.")
    end
end

return Module