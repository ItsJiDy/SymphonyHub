local Module = {}
Module.ClassName = "Protect Gui"

local CoreGui = game:GetService("CoreGui")

function Module:Protect(ScreenGui)
    if get_hidden_gui or gethui then
		local hiddenUI = get_hidden_gui or gethui
		ScreenGui.Parent = hiddenUI()
	elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
		syn.protect_gui(ScreenGui)
		ScreenGui.Parent = CoreGui
	else
		ScreenGui.Parent = CoreGui
	end
end

return Module