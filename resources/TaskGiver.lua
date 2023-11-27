local Module = {}
Module.ClassName = "Task Giver"

local Connections = {}

function Module:GiveTask(TaskName, TaskConnection)
    if not Connections[TaskName] then
        if typeof(TaskConnection) == "RBXScriptConnection" then
            Connections[TaskName] = TaskConnection
        else
            Module.TracebackSend("'" .. TaskName .. "' is not a type of RBXScriptConnection.")
        end
    else
        Module.TracebackSend("'" .. TaskName .. "' is already taken name.")
    end
end

function Module:WaitTask(TaskName)
    if Connections[TaskName] ~= nil then
        if typeof(Connections[TaskName]) == "RBXScriptConnection" then
            Connections[TaskName]:Wait()
        else
            Module.TracebackSend("'" .. TaskName .. "' is not a type of RBXScriptConnection.")
        end
    else
        Module.TracebackSend("'" .. TaskName .. "' is not a valid member.")
    end
end

function Module:DestroyTask(TaskName)
    if Connections[TaskName] ~= nil then
        if typeof(Connections[TaskName]) == "RBXScriptConnection" then
            Connections[TaskName]:Disconnect()
            Connections[TaskName] = nil
        else
            Module.TracebackSend("'" .. TaskName .. "' is not a type of RBXScriptConnection.")
        end
    else
        Module.TracebackSend("'" .. TaskName .. "' is not a valid member.")
    end
end

return Module