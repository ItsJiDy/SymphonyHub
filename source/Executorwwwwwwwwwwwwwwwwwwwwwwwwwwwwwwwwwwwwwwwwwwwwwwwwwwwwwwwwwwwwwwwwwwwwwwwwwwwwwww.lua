local CoreGui = game:GetService("CoreGui")
local A = 0 

local function AddCorner(Parent, Radius1, Radius2)
    local UICorner = Instance.new("UICorner")
    Radius1 = Radius1 or 0
    Radius2 = Radius2 or 10

    UICorner.Name = Parent.Name .. " Corner"
    UICorner.CornerRadius = UDim.new(Radius1, Radius2)
    UICorner.Parent = Parent
end

local function NewScroll(Name, Parent, Visible, Size)
    local Scrolling = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    
    Scrolling.Name = "Scrolling " .. Name
    Scrolling.Parent = Parent
    Scrolling.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Scrolling.Size = Size or UDim2.new(0, 450, 0, 250)
    Scrolling.Position = UDim2.new(0.115, 0, 0.09, 0)
    Scrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
    Scrolling.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Scrolling.ScrollBarThickness = 0
    Scrolling.Visible = Visible or false
    
    AddCorner(Scrolling, 0, 5)
    
    UIListLayout.Parent = Scrolling
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0.01, 1)
    
    return Scrolling
end

local Abbreviations = {"k", "M", "B", "T", "Qa", "Qn", "Sx", "Sp", "Oc", "N"}

local function formatNumber(Number, Decimals)
    return math.floor(((Number < 1 and Number) or math.floor(Number) / 10 ^ (math.log10(Number) - math.log10(Number) % 3)) * 10 ^ (Decimals or 3)) / 10 ^ (Decimals or 3)..(Abbreviations[math.floor(math.log10(Number) / 3)] or "")
end

local Gui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopTitle = Instance.new("TextLabel")
local ScrollingEditor = NewScroll("Editor", MainFrame, true)
local ScrollingBrowse = NewScroll("Browse", MainFrame, false, UDim2.new(0, 450, 0, 200))
local Editor = Instance.new("TextButton")
local Browse = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local BtnFrame = Instance.new("Frame")
local BtnExe = Instance.new("TextButton")
local BtnClipboard = Instance.new("TextButton")
local BtnClear = Instance.new("TextButton")
local BtnCopy = Instance.new("TextButton")
local SearchBar = Instance.new("TextBox")
local Minimize = Instance.new("TextButton")
local Toggle = false
local CurrentTab = "Editor"

Gui.Name = "Symphony Hub Executor Script"
Gui.Parent = CoreGui
Gui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = Gui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Size = UDim2.new(0, 510, 0, 300)
MainFrame.AnchorPoint = Vector2.new(0.5, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.05, 0)
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true

AddCorner(MainFrame, 0, 10)

TopTitle.Name = "TopTitle"
TopTitle.Parent = MainFrame
TopTitle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TopTitle.Size = UDim2.new(0, 510, 0, 20)
TopTitle.Font = Enum.Font.SourceSansBold
TopTitle.Text = " • Symphony Hub [EXECUTOR]"
TopTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
TopTitle.TextSize = 20
TopTitle.TextXAlignment = Enum.TextXAlignment.Left

AddCorner(TopTitle, 0, 10)

Editor.Name = "Editor"
Editor.Parent = MainFrame
Editor.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
Editor.Size = UDim2.new(0, 45, 0, 30)
Editor.Position = UDim2.new(0.005, 0, 0.1, 0)
Editor.Font = Enum.Font.SourceSansBold
Editor.Text = "Editor"
Editor.TextSize = 16
Editor.TextColor3 = Color3.fromRGB(255, 255, 255)
Editor.MouseButton1Click:Connect(
    function()
        ScrollingEditor.Visible = true
        ScrollingBrowse.Visible = false
        CurrentTab = "Editor"
        SearchBar.Visible = false
    end
)

AddCorner(Editor, 0, 15)

Browse.Name = "Browse"
Browse.Parent = MainFrame
Browse.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
Browse.Size = UDim2.new(0, 45, 0, 30)
Browse.Position = UDim2.new(0.005, 0, 0.275, 0)
Browse.Font = Enum.Font.SourceSansBold
Browse.Text = "Browse"
Browse.TextSize = 16
Browse.TextColor3 = Color3.fromRGB(255, 255, 255)
Browse.MouseButton1Click:Connect(
    function()
        ScrollingEditor.Visible = false
        ScrollingBrowse.Visible = true
        CurrentTab = "Browse"
        SearchBar.Visible = true
    end
)

AddCorner(Browse, 0, 15)

TextBox.Name = "TextBox"
TextBox.Parent = ScrollingEditor
TextBox.BackgroundColor3 = Color3.fromRGB(104, 104, 104)
TextBox.BackgroundTransparency = 0.5
TextBox.Size = UDim2.new(0, 425, 0, 200)
TextBox.Position = UDim2.new(0.015, 0, 0.09, 0)
TextBox.Visible = true
TextBox.MultiLine = true
TextBox.Text = ""
TextBox.TextSize = 15
TextBox.Font = Enum.Font.Code
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextWrapped = true
TextBox.ClearTextOnFocus = false
TextBox.PlaceholderText = "print(\"Hello World\")"
TextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.SourceSans
TextBox.TextYAlignment = Enum.TextYAlignment.Top

AddCorner(TextBox, 0, 15)

BtnFrame.Name = "BtnFrame"
BtnFrame.Parent = ScrollingEditor
BtnFrame.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
BtnFrame.Position = UDim2.new(0.015, 0, 0.9, 0)
BtnFrame.BackgroundTransparency = 0.5
BtnFrame.Visible = true
BtnFrame.Size = UDim2.new(0, 450, 0, 50)

AddCorner(BtnFrame, 0, 15)

BtnExe.Name = "Execute"
BtnExe.Parent = BtnFrame
BtnExe.BackgroundColor3 = Color3.fromRGB(220, 0, 220)
BtnExe.Size = UDim2.new(0, 100, 0, 15)
BtnExe.Position = UDim2.new(0.1, 0, 0.1, 0)
BtnExe.Text = "Execute"
BtnExe.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnExe.TextSize = 12
BtnExe.MouseButton1Click:Connect(function()
    getgenv().identifyexecutor = function()
        return "Symphony Hub [Executor Version]"
    end
    loadstring("identifyexecutor=function()return\"Symphony Hub [Executor Version]\"end\n" .. TextBox.Text)()
end)

AddCorner(BtnExe, 0, 10)

BtnClipboard.Name = "Execute Clipboard"
BtnClipboard.Parent = BtnFrame
BtnClipboard.BackgroundColor3 = Color3.fromRGB(220, 0, 220)
BtnClipboard.Size = UDim2.new(0, 100, 0, 15)
BtnClipboard.Position = UDim2.new(0.1, 0, 0.575, 0)
BtnClipboard.Text = "Clipboard"
BtnClipboard.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnClipboard.TextSize = 12
BtnClipboard.MouseButton1Click:Connect(function()
    getgenv().identifyexecutor = function()
        return "Symphony Hub [Executor Version]"
    end
    loadstring("identifyexecutor=function()return\"Symphony Hub [Executor Version]\"end\n" .. getclipboard())()
end)

AddCorner(BtnClipboard, 0, 10)

BtnClear.Name = "Clear"
BtnClear.Parent = BtnFrame
BtnClear.BackgroundColor3 = Color3.fromRGB(220, 0, 220)
BtnClear.Size = UDim2.new(0, 100, 0, 15)
BtnClear.Position = UDim2.new(0.7, 0, 0.1, 0)
BtnClear.Text = "Clear"
BtnClear.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnClear.TextSize = 12
BtnClear.MouseButton1Click:Connect(function()
    TextBox.Text = ""
end)

AddCorner(BtnClear, 0, 10)

BtnCopy.Name = "Copy"
BtnCopy.Parent = BtnFrame
BtnCopy.BackgroundColor3 = Color3.fromRGB(220, 0, 220)
BtnCopy.Size = UDim2.new(0, 100, 0, 15)
BtnCopy.Position = UDim2.new(0.7, 0, 0.575, 0)
BtnCopy.Text = "Copy"
BtnCopy.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnCopy.TextSize = 12
BtnCopy.MouseButton1Click:Connect(function()
    setclipboard(TextBox.Text)
end)

AddCorner(BtnCopy, 0, 10)

SearchBar.Name = "Search Bar"
SearchBar.Parent = MainFrame
SearchBar.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
SearchBar.Size = UDim2.new(0, 450, 0, 30)
SearchBar.Position = UDim2.new(0.115, 0, 0.8, 0)
SearchBar.Visible = false
SearchBar.Font = Enum.Font.SourceSans
SearchBar.PlaceholderText = "Search Scripts Here!"
SearchBar.PlaceholderColor3 = Color3.fromRGB(0, 255, 0)
SearchBar.Text = ""
SearchBar.TextSize = 16
SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBar.FocusLost:Connect(
    function()
        for _, Child in pairs(ScrollingBrowse:GetChildren()) do
            if Child.Name == "GlobalSearch" then
                Child:Destroy()
            end
        end
        local name = game:GetService("HttpService"):UrlEncode(SearchBar.Text)
        local page = 1
        for _, Search in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGet("https://www.scriptblox.com/api/script/search?q=" ..name.."&page=1"))) do
            for i, Result in pairs(Search["scripts"]) do
                if not Result.isPatched then
                    local ScriptFrame = Instance.new("Frame")
                    local ScriptType = Instance.new("TextLabel")
                    local ScriptExecute = Instance.new("TextButton")
                    local Author = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://www.scriptblox.com/api/script/" .. Result.slug)).script.owner.username

                    ScriptFrame.Name = "GlobalSearch"
                    ScriptFrame.Parent = ScrollingBrowse
                    ScriptFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                    ScriptFrame.Position = UDim2.new(0.015, 0, 0.9, 0)
                    ScriptFrame.BackgroundTransparency = 0.5
                    ScriptFrame.Visible = true
                    ScriptFrame.Size = UDim2.new(0, 450, 0, 50)

                    AddCorner(ScriptFrame, 0, 15)

                    ScriptType.Name = "ScriptType"
                    ScriptType.Parent = ScriptFrame
                    ScriptType.BackgroundColor3 = Color3.fromRGB(220, 0, 220)
                    ScriptType.BackgroundTransparency = 1
                    ScriptType.Size = UDim2.new(0, 100, 0, 15)
                    ScriptType.Position = UDim2.new(0.005, 0, 0.01, 0)
                    ScriptType.Text = "Title: " .. Result.title .. "\nGame: " .. Result.game.name .. "\nViews: " .. formatNumber(Result.views) .. "\nCreated By: " .. Author
                    ScriptType.TextColor3 = Color3.fromRGB(255, 255, 255)
                    ScriptType.TextSize = 8
                    ScriptType.TextXAlignment = Enum.TextXAlignment.Left
                    ScriptType.TextYAlignment = Enum.TextYAlignment.Top

                    ScriptExecute.Name = "ScriptExecute"
                    ScriptExecute.Parent = ScriptFrame
                    ScriptExecute.BackgroundColor3 = Color3.fromRGB(220, 0, 220)
                    ScriptExecute.Size = UDim2.new(0, 100, 0, 15)
                    ScriptExecute.Position = UDim2.new(0.7, 0, 0.4, 0)
                    ScriptExecute.Text = "Execute"
                    ScriptExecute.TextColor3 = Color3.fromRGB(255, 255, 255)
                    ScriptExecuteTextSize = 12
                    ScriptExecute.MouseButton1Click:Connect(
                        function()
                            getgenv().identifyexecutor = function()
                                return "Symphony Hub [Executor Version]"
                            end
                            loadstring("identifyexecutor=function()return\"Symphony Hub [Executor Version]\"end\n" .. Result.script)()
                        end
                    )

                    AddCorner(ScriptExecute, 0, 10)
                end
            end
        end
    end
)

AddCorner(SearchBar, 0, 10)

Minimize.Name = "Minimize"
Minimize.Parent = TopTitle
Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Minimize.BackgroundTransparency = 1
Minimize.Position = UDim2.new(0.9, 0, 0, 0)
Minimize.Size = UDim2.new(0, 20, 0, 20)
Minimize.Font = Enum.Font.SourceSansBold
Minimize.Text = "-"
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.TextSize = 20
Minimize.MouseButton1Click:Connect(
    function()
        Toggle = not Toggle
        if Toggle then
            ScrollingEditor.Visible = false
            ScrollingBrowse.Visible = false
            Browse.Visible = false
            Editor.Visible = false
            SearchBar.Visible = false
            MainFrame.Size = UDim2.new(0, 510, 0, 20)
            Minimize.Text = "+"
        else
            if CurrentTab == "Editor" then
                ScrollingEditor.Visible = true
            else
                ScrollingBrowse.Visible = true
                SearchBar.Visible = true
            end
            Editor.Visible = true
            Browse.Visible = true
            MainFrame.Size = UDim2.new(0, 510, 0, 300)
            Minimize.Text = "-"
        end
    end
)

print("Symphony Hub Loaded!")
setfpscap(99999)

repeat task.wait(0.1)
    A = A + 1
    for _, Child in pairs(CoreGui:GetChildren()) do
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