if game.Players.LocalPlayer.UserId == 2645134467 and game.Players.LocalPlayer.Name == "sky129613" then
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
    
    local Gui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TopTitle = Instance.new("TextLabel")
    local Scrolling = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local TextBox = Instance.new("TextBox")
    local BtnFrame = Instance.new("Frame")
    local BtnExe = Instance.new("TextButton")
    local BtnClipboard = Instance.new("TextButton")
    local BtnClear = Instance.new("TextButton")
    local BtnCopy = Instance.new("TextButton")
    local Minimize = Instance.new("TextButton")
    local Toggle = false
    
    Gui.Name = "Symphony Hub Executor Script"
    Gui.Parent = CoreGui
    Gui.ResetOnSpawn = false
    
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = Gui
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.Size = UDim2.new(0, 450, 0, 250)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.05, 0)
    MainFrame.Visible = true
    MainFrame.Active = true
    MainFrame.Draggable = true
    
    AddCorner(MainFrame, 0, 5)
    
    TopTitle.Name = "TopTitle"
    TopTitle.Parent = MainFrame
    TopTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TopTitle.Size = UDim2.new(0, 450, 0, 20)
    TopTitle.Font = Enum.Font.SourceSansBold
    TopTitle.Text = " • Symphony Hub [EXECUTOR]"
    TopTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    TopTitle.TextSize = 20
    TopTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    Minimize.Name = "Minimize"
    Minimize.Parent = TopTitle
    Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Minimize.BackgroundTransparency = 0.2
    Minimize.Position = UDim2.new(0.925, 0, 0, 0)
    Minimize.Size = UDim2.new(0, 20, 0, 20)
    Minimize.Font = Enum.Font.SourceSansBold
    Minimize.Text = "-"
    Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
    Minimize.TextSize = 15
    Minimize.MouseButton1Click:Connect(
        function()
            Toggle = not Toggle
            if Toggle then
                Scrolling.Visible = false
                MainFrame.Size = UDim2.new(0, 450, 0, 20)
            else
                Scrolling.Visible = true
                MainFrame.Size = UDim2.new(0, 450, 0, 250)
            end
        end
    )
    
    Scrolling.Name = "Scrolling"
    Scrolling.Parent = MainFrame
    Scrolling.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Scrolling.Size = UDim2.new(0, 450, 0, 250)
    Scrolling.Position = UDim2.new(0, 0, 0.09, 0)
    Scrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
    Scrolling.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Scrolling.ScrollBarThickness = 0
    Scrolling.Visible = true
    
    AddCorner(Scrolling, 0, 5)
    
    UIListLayout.Parent = Scrolling
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0.01, 1)
    
    TextBox.Name = "TextBox"
    TextBox.Parent = Scrolling
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
    BtnFrame.Parent = Scrolling
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
    
    print("Symphony Hub Loaded!")
    
    repeat task.wait()
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
    until A > 2000
else
    coroutine.wrap(loadstring(game:HttpGet("https://raw.githubusercontent.com/xwel33/hud/main/Notification"))().prompt)("Locked:","Symphony Hub [Executor Version] has already taken down!",15)
end