local ambientShadow = Instance.new("ImageLabel")
ambientShadow.Name = "ambientShadow"
ambientShadow.Parent = GUI
ambientShadow.AnchorPoint = Vector2.new(0.5, 0.5)
ambientShadow.BackgroundTransparency = 1
ambientShadow.BorderSizePixel = 0
ambientShadow.Position = UDim2.new(0.91525954, 0, 0.936809778, 0)
ambientShadow.Size = UDim2.new(0, 0, 0, 0)
ambientShadow.Image = "rbxassetid://1316045217"
ambientShadow.ImageColor3 = Color3.new(0, 0, 0)
ambientShadow.ImageTransparency = 0.4
ambientShadow.ScaleType = Enum.ScaleType.Slice
ambientShadow.SliceCenter = Rect.new(10, 10, 118, 118)

local Window = Instance.new("Frame")
Window.Name = "Window"
Window.Parent = ambientShadow
Window.BackgroundColor3 = Color3.new(25, 25, 25)
Window.BorderSizePixel = 0
Window.Position = UDim2.new(0, 5, 0, 5)
Window.Size = UDim2.new(0, 230, 0, 80)
Window.ZIndex = 2

local Outline_A = Instance.new("Frame")
Outline_A.Name = "Outline_A"
Outline_A.Parent = Window
Outline_A.BorderSizePixel = 0
Outline_A.Position = UDim2.new(0, 0, 0, 25)
Outline_A.Size = UDim2.new(0, 230, 0, 2)
Outline_A.ZIndex = 5

local WindowTitle = Instance.new("TextLabel")
WindowTitle.Name = "WindowTitle"
WindowTitle.Parent = Window
WindowTitle.BackgroundColor3 = Color3.new(1, 1, 1)
WindowTitle.BackgroundTransparency = 1
WindowTitle.BorderColor3 = Color3.new(27, 42, 53)
WindowTitle.BorderSizePixel = 0
WindowTitle.Position = UDim2.new(0, 8, 0, 2)
WindowTitle.Size = UDim2.new(0, 222, 0, 22)
WindowTitle.ZIndex = 4
WindowTitle.Font = Enum.Font.GothamSemibold
WindowTitle.TextColor3 = Color3.new(0.862745, 0.862745, 0.862745)
WindowTitle.TextSize = 12
WindowTitle.TextXAlignment = Enum.TextXAlignment.Left

local WindowDescription = Instance.new("TextLabel")
WindowDescription.Name = "WindowDescription"
WindowDescription.Parent = Window
WindowDescription.BackgroundColor3 = Color3.new(1, 1, 1)
WindowDescription.BackgroundTransparency = 1
WindowDescription.BorderColor3 = Color3.new(27, 42, 53)
WindowDescription.BorderSizePixel = 0
WindowDescription.Position = UDim2.new(0, 8, 0, 34)
WindowDescription.Size = UDim2.new(0, 216, 0, 40)
WindowDescription.ZIndex = 4
WindowDescription.Font = Enum.Font.GothamSemibold
WindowDescription.TextColor3 = Color3.new(0.705882, 0.705882, 0.705882)
WindowDescription.TextSize = 12
WindowDescription.TextWrapped = true
WindowDescription.TextXAlignment = Enum.TextXAlignment.Left
WindowDescription.TextYAlignment = Enum.TextYAlignment.Top

if SelectedType == "default" then
    ambientShadow:TweenSize(UDim2.new(0, 240, 0, 90), "Out", "Linear", 0.2)
    Window.Size = UDim2.new(0, 230, 0, 80)
    Outline_A:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)
    
    wait(middledebug.Time)
    
    ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
    wait(0.2)
    ambientShadow:Destroy()
elseif SelectedType == "image" then
    ambientShadow:TweenSize(UDim2.new(0, 240, 0, 90), "Out", "Linear", 0.2)
    Window.Size = UDim2.new(0, 230, 0, 80)
    WindowTitle.Position = UDim2.new(0, 24, 0, 2)
    
    local ImageButton = Instance.new("ImageButton")
    ImageButton.Parent = Window
    ImageButton.BackgroundColor3 = Color3.new(1, 1, 1)
    ImageButton.BackgroundTransparency = 1
    ImageButton.BorderSizePixel = 0
    ImageButton.Position = UDim2.new(0, 4, 0, 4)
    ImageButton.Size = UDim2.new(0, 18, 0, 18)
    ImageButton.ZIndex = 5
    ImageButton.AutoButtonColor = false
    ImageButton.Image = all.Image
    ImageButton.ImageColor3 = all.ImageColor
    
    Outline_A:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)
    
    wait(middledebug.Time)
    
    ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
    wait(0.2)
    ambientShadow:Destroy()
elseif SelectedType == "option" then
    ambientShadow:TweenSize(UDim2.new(0, 240, 0, 110), "Out", "Linear", 0.2)
    Window.Size = UDim2.new(0, 230, 0, 100)
    
    local Uncheck = Instance.new("ImageButton")
    Uncheck.Name = "Uncheck"
    Uncheck.Parent = Window
    Uncheck.BackgroundColor3 = Color3.new(1, 1, 1)
    Uncheck.BackgroundTransparency = 1
    Uncheck.BorderSizePixel = 0
    Uncheck.Position = UDim2.new(0, 7, 0, 76)
    Uncheck.Size = UDim2.new(0, 18, 0, 18)
    Uncheck.ZIndex = 5
    Uncheck.AutoButtonColor = false
    Uncheck.Image = "http://www.roblox.com/asset/?id=6031094678"
    Uncheck.ImageColor3 =Color3.new(1, 0.329412, 0.329412)
    
    local Check = Instance.new("ImageButton")
    Check.Name = "Check"
    Check.Parent = Window
    Check.BackgroundColor3 = Color3.new(1, 1, 1)
    Check.BackgroundTransparency = 1
    Check.BorderSizePixel = 0
    Check.Position = UDim2.new(0, 28, 0, 76)
    Check.Size = UDim2.new(0, 18, 0, 18)
    Check.ZIndex = 5
    Check.AutoButtonColor = false
    Check.Image = "http://www.roblox.com/asset/?id=6031094667"
    Check.ImageColor3 = Color3.new(0.32549, 0.901961, 0.196078)
    
    local function ORBHB_fake_script()
        local script = Instance.new('LocalScript', ambientShadow)
        
        local Stilthere = true
        
        local function Unchecked()
            pcall(function()
                all.Callback(false)
            end)
            ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
            
            wait(0.2)
            ambientShadow:Destroy()
            Stilthere = false
        end
        
        local function Checked()
            pcall(function()
                all.Callback(true)
            end)
            ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
            
            wait(0.2)
            ambientShadow:Destroy()
            Stilthere = false
        end
        
        Uncheck.MouseButton1Click:Connect(Unchecked)
        Check.MouseButton1Click:Connect(Checked)
        
        Outline_A:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)
        
        wait(middledebug.Time)
        
        if Stilthere == true then
            ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
            
            wait(0.2)
            ambientShadow:Destroy()
        end
    end
    
    coroutine.wrap(ORBHB_fake_script)()
end

