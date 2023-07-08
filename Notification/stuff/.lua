local Notification = {}

local GUI = game:GetService("CoreGui"):FindFirstChild("STX_Notification")

local function createAmbientShadow()
    local ambientShadow = Instance.new("ImageLabel")
    ambientShadow.Name = "ambientShadow"
    ambientShadow.Parent = game:GetService("Workspace") -- Change parent to workspace
    ambientShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    ambientShadow.BackgroundTransparency = 1
    ambientShadow.BorderSizePixel = 0
    ambientShadow.Position = UDim2.new(0.91525954, 0, 0.936809778, 0)
    ambientShadow.Size = UDim2.new(0, 0, 0, 0)
    ambientShadow.Image = "rbxassetid://1316045217"
    ambientShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    ambientShadow.ImageTransparency = 0.4
    ambientShadow.ScaleType = Enum.ScaleType.Slice
    ambientShadow.SliceCenter = Rect.new(10, 10, 118, 118)
    return ambientShadow
end

local function createWindow(parent, size)
    local window = Instance.new("Frame")
    window.Name = "Window"
    window.Parent = parent
    window.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    window.BorderSizePixel = 0
    window.Position = UDim2.new(0, 5, 0, 5)
    window.Size = size
    window.ZIndex = 2
    return window
end

local function createOutline(parent, size, outlineColor)
    local outline = Instance.new("Frame")
    outline.Name = "Outline"
    outline.Parent = parent
    outline.BackgroundColor3 = outlineColor
    outline.BorderSizePixel = 0
    outline.Position = UDim2.new(0, 0, 0, 25)
    outline.Size = size
    outline.ZIndex = 5
    return outline
end

local function createLabel(parent, position, size, text, textColor, textAlignment)
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Parent = parent
    label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1
    label.BorderColor3 = Color3.fromRGB(27, 42, 53)
    label.BorderSizePixel = 0
    label.Position = position
    label.Size = size
    label.ZIndex = 4
    label.Font = Enum.Font.GothamSemibold
    label.Text = text
    label.TextColor3 = textColor
    label.TextSize = 12
    label.TextXAlignment = textAlignment
    return label
end

local function createImageButton(parent, position, size, image, imageColor)
    local button = Instance.new("ImageButton")
    button.Parent = parent
    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundTransparency = 1
    button.BorderSizePixel = 0
    button.Position = position
    button.Size = size
    button.ZIndex = 5
    button.AutoButtonColor = false
    button.Image = image
    button.ImageColor3 = imageColor
    return button
end

function Notification:Notify(notificationDebug, middleDebug, all)
    local selectedType = string.lower(tostring(middleDebug.Type))
    local ambientShadow = createAmbientShadow()
    local window = createWindow(ambientShadow, UDim2.new(0, 230, 0, 80))
    local outline = createOutline(window, UDim2.new(0, 230, 0, 2), middleDebug.OutlineColor)
    local windowTitle = createLabel(window, UDim2.new(0, 8, 0, 2), UDim2.new(0, 222, 0, 22), notificationDebug.Title, Color3.fromRGB(220, 220, 220), Enum.TextXAlignment.Left)
    local windowDescription = createLabel(window, UDim2.new(0, 8, 0, 34), UDim2.new(0, 216, 0, 40), notificationDebug.Description, Color3.fromRGB(180, 180, 180), Enum.TextXAlignment.Left)
    
    if selectedType == "default" then
        local function animateDefault()
            ambientShadow:TweenSize(UDim2.new(0, 240, 0, 90), "Out", "Linear", 0.2)
            outline:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middleDebug.Time)
    
            wait(middleDebug.Time)
        
            ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
            wait(0.2)
            ambientShadow:Destroy()
        end
        coroutine.wrap(animateDefault)()
    elseif selectedType == "image" then
        ambientShadow:TweenSize(UDim2.new(0, 240, 0, 90), "Out", "Linear", 0.2)
        outline:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middleDebug.Time)
        windowTitle.Position = UDim2.new(0, 24, 0, 2)
        
        local imageButton = createImageButton(window, UDim2.new(0, 4, 0, 4), UDim2.new(0, 18, 0, 18), all.Image, all.ImageColor)
        
        local function animateImage()
            outline:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middleDebug.Time)

            wait(middleDebug.Time)
        
            ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
            wait(0.2)
            ambientShadow:Destroy()
        end
        coroutine.wrap(animateImage)()
    elseif selectedType == "option" then
        ambientShadow:TweenSize(UDim2.new(0, 240, 0, 110), "Out", "Linear", 0.2)
        window.Size = UDim2.new(0, 230, 0, 100)
        
        local uncheckButton = createImageButton(window, UDim2.new(0, 7, 0, 76), UDim2.new(0, 18, 0, 18), "http://www.roblox.com/asset/?id=6031094678", Color3.fromRGB(255, 84, 84))
        local checkButton = createImageButton(window, UDim2.new(0, 28, 0, 76), UDim2.new(0, 18, 0, 18), "http://www.roblox.com/asset/?id=6031094667", Color3.fromRGB(83, 230, 50))
        
        local function animateOption()
            local stillThere = true

            local function unchecked()
                pcall(function()
                    all.Callback(false)
                end)
                ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
                
                wait(0.2)
                ambientShadow:Destroy()
                stillThere = false
            end

            local function checked()
                pcall(function()
                    all.Callback(true)
                end)
                ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
                
                wait(0.2)
                ambientShadow:Destroy()
                stillThere = false
            end

            uncheckButton.MouseButton1Click:Connect(unchecked)
            checkButton.MouseButton1Click:Connect(checked)
            
            outline:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middleDebug.Time)
    
            wait(middleDebug.Time)

            if stillThere then
                ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
                
                wait(0.2)
                ambientShadow:Destroy()
            end
        end
        coroutine.wrap(animateOption)()
    end
end

return Notification
