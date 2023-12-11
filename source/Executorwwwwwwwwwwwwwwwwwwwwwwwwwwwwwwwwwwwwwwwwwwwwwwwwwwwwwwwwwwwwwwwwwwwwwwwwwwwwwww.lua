repeat task.wait(0.1)
    A = A + 1
    for _, Child in pairs(game.CoreGui:GetChildren()) do
        pcall(
            function()
                if Child.Name:lower():match("delta") then
                    Child:Destroy()
                end
            end
        )
    end
    pcall(
        function()
            game.Players.LocalPlayer.PlayerGui.LOADERLoadingScreen:Destroy()
        end
    )
until A > 2000
