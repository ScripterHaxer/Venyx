
if game:GetService("CoreGui"):FindFirstChild("Library") then
    game:GetService("CoreGui"):FindFirstChild("Library"):Destroy()
end

local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local TweenInfo = TweenInfo.new

local utility = {};
local Objects = {};

local themes = {
    background = Color3.fromRGB(50, 50, 50);
    background_tab = Color3.fromRGB(30, 30, 30);
    background_section = Color3.fromRGB(30, 30, 30);
    text = Color3.fromRGB(255, 255, 255);
    image = Color3.fromRGB(255, 255, 255);
    element = Color3.fromRGB(12, 12, 12);
    innerElement = Color3.fromRGB(45, 45, 45);
    outerElement = Color3.fromRGB(30, 30, 30);
    downElement = Color3.fromRGB(120, 120, 120);
}

local themeStyles = {
    default = {
        background = Color3.fromRGB(50, 50, 50);
        background_tab = Color3.fromRGB(30, 30, 30);
        background_section = Color3.fromRGB(30, 30, 30);
        text = Color3.fromRGB(255, 255, 255);
        image = Color3.fromRGB(255, 255, 255);
        element = Color3.fromRGB(12, 12, 12);
        innerElement = Color3.fromRGB(45, 45, 45);
        outerElement = Color3.fromRGB(30, 30, 30);
        downElement = Color3.fromRGB(120, 120, 120);
    };
    blood = {
        background = Color3.fromRGB(50, 0, 0);
        background_tab = Color3.fromRGB(30, 0, 0);
        background_section = Color3.fromRGB(30, 0, 0);
        text = Color3.fromRGB(255, 255, 255);
        image = Color3.fromRGB(255, 255, 255);
        element = Color3.fromRGB(80, 0, 0);
        innerElement = Color3.fromRGB(45, 0, 0);
        outerElement = Color3.fromRGB(30, 0, 0);
        downElement = Color3.fromRGB(120, 0, 0);
    };
    light = {
        background = Color3.fromRGB(180, 180, 180);
        background_tab = Color3.fromRGB(210, 210, 210);
        background_section = Color3.fromRGB(210, 210, 210);
        text = Color3.fromRGB(0, 0, 0);
        image = Color3.fromRGB(0, 0, 0);
        element = Color3.fromRGB(255, 255, 255);
        innerElement = Color3.fromRGB(230, 230, 230);
        outerElement = Color3.fromRGB(210, 210, 210);
        downElement = Color3.fromRGB(120, 120, 120);
    };
    dark = {
        background = Color3.fromRGB(0, 0, 0);
        background_tab = Color3.fromRGB(12, 12, 12);
        background_section = Color3.fromRGB(12, 12, 12);
        text = Color3.fromRGB(255, 255, 255);
        image = Color3.fromRGB(255, 255, 255);
        element = Color3.fromRGB(0, 0, 0);
        innerElement = Color3.fromRGB(25, 25, 25);
        outerElement = Color3.fromRGB(12, 12, 12);
        downElement = Color3.fromRGB(30, 30, 30);
    };
    darkcontrast = {
        background = Color3.fromRGB(0, 0, 0);
        background_tab = Color3.fromRGB(8, 8, 8);
        background_section = Color3.fromRGB(8, 8, 8);
        text = Color3.fromRGB(150, 255, 255);
        image = Color3.fromRGB(150, 255, 255);
        element = Color3.fromRGB(8, 8, 8);
        innerElement = Color3.fromRGB(0, 0, 0);
        outerElement = Color3.fromRGB(0, 0, 0);
        downElement = Color3.fromRGB(80, 255, 255);
    };
}

function utility:Tween(instance, properties, duration, ...)
    TweenService:Create(instance, TweenInfo(duration, ...), properties):Play()
end;

local Library = {}

function Library:addTheme(themeList)
    themeList = themeList or {}
    if themeList == "Default" then
        themes = themeStyles.default
    elseif themeList == "Blood" then
        themes = themeStyles.blood
    elseif themeList == "Dark" then
        themes = themeStyles.dark
    elseif themeList == "Light" then
        themes = themeStyles.light
    elseif themeList == "Dark Contrast" then
        themes = themeStyles.darkcontrast
    end
end

function Library:Message(mc, ms, duration)
    if not mc then
        mc = Color3.fromRGB(180, 180, 180)
    end
    if mc == 'warn' then
        mc = Color3.fromRGB(255, 255, 0)
    elseif mc == 'info' then
        mc = Color3.fromRGB(150, 255, 255)
    end
    
    local messages = true
    local nMessage = Instance.new("ScreenGui")
    local TextLabel = Instance.new("TextLabel")
    local UICorner = Instance.new("UICorner")
    local Frame = Instance.new("Frame")
    local ImageLabel = Instance.new("ImageLabel")
    local UICorner_2 = Instance.new("UICorner")
    local UIStroke = Instance.new("UIStroke")
    local UIStroke_1 = Instance.new("UIStroke")

    nMessage.Name = "nMessage"
    nMessage.Parent = game.CoreGui

    TextLabel.Parent = nMessage
    TextLabel.AnchorPoint = Vector2.new(0, 1)
    TextLabel.BackgroundColor3 = themes.element
    TextLabel.ClipsDescendants = true
    TextLabel.Position = UDim2.new(0.03744601618, 0, 0.317000002, 0)
    TextLabel.Size = UDim2.new(0, 0, 0, 0)
    TextLabel.Font = Enum.Font.SourceSansBold
    TextLabel.Text = ms
    TextLabel.TextColor3 = mc
    TextLabel.TextSize = 14.000
    
    TextLabel.Visible = false
    utility:Tween(TextLabel, {Size = UDim2.new(0, 10 + TextLabel.TextBounds.X, 0, 15 + TextLabel.TextBounds.Y)}, 0.15)

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = TextLabel

    UIStroke.Parent = TextLabel
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke.Color = themes.image
    UIStroke.LineJoinMode = Enum.LineJoinMode.Round
    UIStroke.Thickness = 1
    UIStroke.Enabled = true
    UIStroke.Archivable = true

    if messages then
        wait(0.15)
        TextLabel.Visible = true
        utility:Tween(TextLabel, {Position = UDim2.new(0.00744601618, 0, 0.317000002, 0)}, 0.30)
        wait(duration)
        utility:Tween(TextLabel, {Position = UDim2.new(0.00744601618, 0, 0.267000002, 0)}, 0.30)
        wait(0.15)
        TextLabel.Visible = false
        wait(0.50)
        if game.CoreGui:FindFirstChild('nMessage') then
            game.CoreGui:FindFirstChild('nMessage'):Destroy()
        end
    end
    coroutine.wrap(function()
        TextLabel.TextColor3 = types.color
        ImageLabel.ImageColor3 = types.color
        UIStroke.Color = themes.image
        UIStroke_1.Color = themes.image
    end)()
end

function Library:CreateWindow(title)

    local FirstTab = false
    local Library = Instance.new("ScreenGui")
    local OpenClose = Instance.new("ImageButton")
    local UICorner = Instance.new("UICorner")
    local Main = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local Logo = Instance.new("ImageLabel")
    local Title = Instance.new("TextLabel")
    local discord = Instance.new("ImageButton")
    local UICorner_3 = Instance.new("UICorner")
    local tab = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local Folder = Instance.new("Folder")

    Library.Name = "Library"
    Library.Parent = game.CoreGui
    Library.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    OpenClose.Name = "OpenClose"
    OpenClose.Parent = Library
    OpenClose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    OpenClose.Position = UDim2.new(0.00744601665, 0, 0.145157933, 0)
    OpenClose.Size = UDim2.new(0, 35, 0, 35)
    OpenClose.Image = "rbxassetid://12021503727"
    OpenClose.ImageColor3 = themes.image

    local openclosetog = false
    OpenClose.MouseButton1Click:Connect(function()
        if openclosetog then
            Main.Visible = true
            wait(0.15)
            utility:Tween(Main, {Size = UDim2.new(0, 550, 0, 300)}, 0.15)
        else
            utility:Tween(Main, {Size = UDim2.new(0, 0, 0, 0)}, 0.15)
            wait(0.15)
            Main.Visible = false
        end
        openclosetog = not openclosetog
    end)

    UICorner.Parent = OpenClose

    Main.Name = "Main"
    Main.Parent = Library
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = themes.background
    Main.ClipsDescendants = true
    Main.Position = UDim2.new(0, 423, 0, 238)
    Main.Size = UDim2.new(0, 0, 0, 0)

    utility:Tween(Main, {Size = UDim2.new(0, 550, 0, 300)}, 0.15)

    UICorner_2.Parent = Main

    Logo.Name = "Logo"
    Logo.Parent = Main
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.BorderSizePixel = 0
    Logo.Position = UDim2.new(0, 3, 0, 3)
    Logo.Size = UDim2.new(0, 20, 0, 20)
    Logo.Image = "rbxassetid://168602211"
    Logo.ImageColor3 = Color3.fromRGB(255, 255, 255)

    Title.Name = "Title"
    Title.Parent = Main
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0, 30, 0, 0)
    Title.Size = UDim2.new(0, 490, 0, 25)
    Title.Font = Enum.Font.Ubuntu
    Title.Text = title
    Title.TextColor3 = themes.text
    Title.TextSize = 13.000
    Title.TextXAlignment = Enum.TextXAlignment.Center

    discord.Name = "discord"
    discord.Parent = Main
    discord.BackgroundColor3 = themes.background
    discord.BorderSizePixel = 0
    discord.BorderColor3 = themes.image
    discord.Position = UDim2.new(0, 527, 0, 3)
    discord.Size = UDim2.new(0, 20, 0, 20)
    discord.Image = "rbxassetid://12058969086"

    discord.MouseLeave:Connect(function()
        utility:Tween(discord, {BorderSizePixel = 0}, 0.15)
        utility:Tween(discord, {BackgroundColor3 = themes.background}, 0.15)
    end)
    
    discord.MouseEnter:Connect(function()
        utility:Tween(discord, {BorderSizePixel = 1}, 0.15)
        utility:Tween(discord, {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}, 0.15)
    end)

    discord.MouseButton1Click:Connect(function()
        setclipboard("")
        wait(.1)
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Discord",
            Text = "Discord copied on your clipboard",
            Button1 = "Okay",
            Duration = 20
        })
    end)

    UICorner_3.CornerRadius = UDim.new(0, 4)
    UICorner_3.Parent = discord

    tab.Name = "tab"
    tab.Parent = Main
    tab.Active = true
    tab.BackgroundColor3 = themes.background_tab
    tab.BorderSizePixel = 0
    tab.Position = UDim2.new(0, 3, 0, 30)
    tab.Size = UDim2.new(0, 544, 0, 18)
    tab.ScrollBarThickness = 0

    UIListLayout.Parent = tab
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    UIListLayout.Padding = UDim.new(0, 3)

    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        tab.CanvasSize = UDim2.new(0, 0 + UIListLayout.Padding.Offset + UIListLayout.AbsoluteContentSize.X, 0, 0)
    end)

    tab.ChildAdded:Connect(function()
        tab.CanvasSize = UDim2.new(0, 0 + UIListLayout.Padding.Offset + UIListLayout.AbsoluteContentSize.X, 0, 0)
    end)

    Folder.Parent = Main

    local gui = Main
    local dragging = false
    local dragInput, dragStart, startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    coroutine.wrap(function()
        while wait() do
            OpenClose.BackgroundColor3 = themes.background
            Main.BackgroundColor3 = themes.background
            Title.TextColor3 = themes.text
            discord.BackgroundColor3 = themes.background
            discord.BorderColor3 = themes.image
            tab.BackgroundColor3 = themes.background_tab
        end
    end)()

    local Tabs = {}
    function Tabs:addTab(title)
        local ContainerRIght = Instance.new("ScrollingFrame")
        local UIListLayout = Instance.new("UIListLayout")
        local ContainerLeft = Instance.new("ScrollingFrame")
        local UIListLayout_2 = Instance.new("UIListLayout")

        ContainerRIght.Name = "ContainerRIght"
        ContainerRIght.Parent = Folder
        ContainerRIght.Active = true
        ContainerRIght.BackgroundColor3 = themes.background_section
        ContainerRIght.BorderSizePixel = 0
        ContainerRIght.Position = UDim2.new(0, 277, 0, 50)
        ContainerRIght.Size = UDim2.new(0, 270, 0, 247)
        ContainerRIght.ZIndex = 3
        ContainerRIght.ScrollBarThickness = 0
        ContainerRIght.Visible = false

        UIListLayout.Parent = ContainerRIght
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 5)

        ContainerLeft.Name = "ContainerLeft"
        ContainerLeft.Parent = Folder
        ContainerLeft.Active = true
        ContainerLeft.BackgroundColor3 = themes.background_section
        ContainerLeft.BorderSizePixel = 0
        ContainerLeft.Position = UDim2.new(0, 3, 0, 50)
        ContainerLeft.Size = UDim2.new(0, 270, 0, 247)
        ContainerLeft.ZIndex = 3
        ContainerLeft.ScrollBarThickness = 0
        ContainerLeft.Visible = false

        UIListLayout_2.Parent = ContainerLeft
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0, 5)

        UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            ContainerLeft.CanvasSize = UDim2.new(0, 0, 0, 5 + UIListLayout_2.Padding.Offset + UIListLayout_2.AbsoluteContentSize.Y)
        end)
        
        ContainerLeft.ChildAdded:Connect(function()
            ContainerLeft.CanvasSize = UDim2.new(0, 0, 0, 5 + UIListLayout_2.Padding.Offset + UIListLayout_2.AbsoluteContentSize.Y)
        end)
        
        UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            ContainerRIght.CanvasSize = UDim2.new(0, 0, 0, 5 + UIListLayout.Padding.Offset + UIListLayout.AbsoluteContentSize.Y)
        end)
        
        ContainerRIght.ChildAdded:Connect(function()
            ContainerRIght.CanvasSize = UDim2.new(0, 0, 0, 5 + UIListLayout.Padding.Offset + UIListLayout.AbsoluteContentSize.Y)
        end)

        local Frame1 = Instance.new("TextButton")

        Frame1.Parent = tab
        Frame1.BackgroundColor3 = themes.element
        Frame1.BorderSizePixel = 0
        Frame1.Size = UDim2.new(0, 0, 0, 0)
        Frame1.AutoButtonColor = false
        Frame1.Font = Enum.Font.SourceSans
        Frame1.TextSize = 12.000
        Frame1.Text = "  â€¢  "..title.."  â€¢  "
        Frame1.TextColor3 = themes.text

        utility:Tween(Frame1, {Size = UDim2.new(0, 25 + Frame1.TextBounds.X, 0, 18)}, 0.15)

        if FirstTab == false then
            FirstTab = true
            utility:Tween(Frame1, {BackgroundColor3 = themes.downElement}, 0.30)
            ContainerLeft.Visible = true
            ContainerRIght.Visible = true
         end

        Frame1.MouseButton1Click:Connect(function()
            for _, co in pairs(Folder:GetChildren()) do
                if co:IsA("ScrollingFrame") then
                    co.Visible = false
                end
            end
            for _, tb in pairs(tab:GetChildren()) do
                if tb:IsA('TextButton') then
                    utility:Tween(tb, {BackgroundColor3 = themes.element}, 0.30)
                end
            end
            wait(0.15)
            utility:Tween(Frame1, {BackgroundColor3 = themes.downElement}, 0.30)
            ContainerLeft.Visible = true
            ContainerRIght.Visible = true
        end)

        coroutine.wrap(function()
            while wait() do
                ContainerRIght.BackgroundColor3 = themes.background_section
                ContainerLeft.BackgroundColor3 = themes.background_section
                Frame1.TextColor3 = themes.text
            end
        end)()

        local Sections = {}
        function Sections:leftSection(title)
            local Section = Instance.new("Frame")
            local SectionLeft = Instance.new("Frame")
            local SectionLeftUICorner = Instance.new("UICorner")
            local SectionLeftList = Instance.new("UIListLayout")
            local label = Instance.new("TextLabel")

            Section.Name = "Section"
            Section.Parent = ContainerLeft
            Section.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Section.BackgroundTransparency = 1.000
            Section.BorderSizePixel = 0
            Section.Size = UDim2.new(1, 0, 0, 25)
            
            SectionLeft.Name = "SectionLeft"
            SectionLeft.Parent = Section
            SectionLeft.BackgroundColor3 = themes.element
            
            SectionLeft.BorderSizePixel = 0
            SectionLeft.Position = UDim2.new(0, 5, 0, 5)
            SectionLeft.Size = UDim2.new(1, -10, 0, 25)
            
            SectionLeftUICorner.CornerRadius = UDim.new(0, 4)
            SectionLeftUICorner.Name = "SectionLeftUICorner"
            SectionLeftUICorner.Parent = SectionLeft
            
            SectionLeftList.Name = "SectionLeftList"
            SectionLeftList.Parent = SectionLeft
            SectionLeftList.HorizontalAlignment = Enum.HorizontalAlignment.Center
            SectionLeftList.SortOrder = Enum.SortOrder.LayoutOrder
            SectionLeftList.Padding = UDim.new(0, 3)

            label.Parent = SectionLeft
            label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            label.BackgroundTransparency = 1.000
            label.BorderSizePixel = 0
            label.Size = UDim2.new(1, 0, 0, 15)
            label.Font = Enum.Font.SourceSansBold
            label.TextSize = 12.000
            label.Text = '||-- '..title..' --||'
            label.TextXAlignment = Enum.TextXAlignment.Center
            label.TextColor3 = themes.text
            
            SectionLeft.Size = UDim2.new(1, -10, 0, SectionLeftList.AbsoluteContentSize.Y + SectionLeftList.Padding.Offset + 5)
            SectionLeftList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                SectionLeft.Size = UDim2.new(1, -10, 0, SectionLeftList.AbsoluteContentSize.Y + SectionLeftList.Padding.Offset + 5)
                
            end)
            
            local function ContainerLeftSizeChange()
                local largestLeftListSize = 0
				largestLeftListSize = SectionLeftList.AbsoluteContentSize.Y
				
				ContainerLeft.CanvasSize = UDim2.new(0, 0, 0, largestLeftListSize + SectionLeftList.Padding.Offset + 5)
			end
            local function sectionleftsizechange()
				SectionLeft.Size = UDim2.new(1, -10, 0, SectionLeftList.AbsoluteContentSize.Y + SectionLeftList.Padding.Offset + 5)
			end
            ContainerLeftSizeChange()
            sectionleftsizechange()

            SectionLeftList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                ContainerLeftSizeChange()
                sectionleftsizechange()
            end)

            coroutine.wrap(function()
                while wait() do
                    SectionLeft.BackgroundColor3 = themes.element
                    label.TextColor3 = themes.text
                end
            end)()

            local Elements = {}
            function Elements:addButton(title, callback)
                callback = callback or function() end

                local TextButton = Instance.new('TextButton')
                local Title = Instance.new('TextLabel')
                local UICorner = Instance.new('UICorner')
                local ToolInf = Instance.new('TextLabel')
                
                TextButton.Parent = SectionLeft
                TextButton.BackgroundColor3 = themes.innerElement
                TextButton.BackgroundTransparency = 1.000
                TextButton.BorderSizePixel = 0
                TextButton.Size = UDim2.new(1, 0, 0, 20)
                TextButton.Font = Enum.Font.SourceSans
                TextButton.TextSize = 12.000
                TextButton.Text = ""
                TextButton.AutoButtonColor = false
                
                Title.Parent = TextButton
                Title.BackgroundColor3 = themes.innerElement
                Title.BorderSizePixel = 0
                Title.Size = UDim2.new(1, -10, 1, 0)
                Title.Position = UDim2.new(0, 5, 0, 0)
                Title.Font = Enum.Font.SourceSans
                Title.Text = title
                Title.TextSize = 12.000
                Title.TextXAlignment = Enum.TextXAlignment.Center
                Title.TextColor3 = themes.text

                UICorner.Parent = Title
                UICorner.CornerRadius = UDim.new(0, 4)

                local btn = TextButton

                btn.MouseEnter:Connect(function()
                    utility:Tween(Title, {TextTransparency = 0.6}, 0.15)
                    utility:Tween(Title, {BackgroundColor3 = themes.outerElement}, 0.15)
                end)

                btn.MouseLeave:Connect(function()
                    utility:Tween(Title, {TextTransparency = 0}, 0.15)
                    utility:Tween(Title, {BackgroundColor3 = themes.innerElement}, 0.15)
                end)

                btn.MouseButton1Down:Connect(function()
                    utility:Tween(Title, {BackgroundColor3 = themes.downElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0}, 0.15)
                    utility:Tween(Title, {Size = UDim2.new(1, -60, 1, 0)}, 0.15)
                    utility:Tween(Title, {Position = UDim2.new(0, 30, 0, 0)}, 0.15)
                end)

                btn.MouseButton1Up:Connect(function()
                    utility:Tween(Title, {BackgroundColor3 = themes.outerElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0.6}, 0.15)
                    utility:Tween(Title, {Size = UDim2.new(1, -10, 1, 0)}, 0.15)
                    utility:Tween(Title, {Position = UDim2.new(0, 5, 0, 0)}, 0.15)
                end)
                
                btn.MouseButton1Click:Connect(function()
                    pcall(function()
                        callback()
                    end)
                end)

                coroutine.wrap(function()
                    while wait() do
                        TextButton.BackgroundColor3 = themes.innerElement
                        Title.BackgroundColor3 = themes.innerElement
                        Title.TextColor3 = themes.text
                    end
                end)()

            end

            function Elements:addToggle(title, default, callback)
                callback = callback or function() end
                default = default or false

                local TextButton = Instance.new('TextButton')
                local Frame = Instance.new('Frame')
                local UICorner = Instance.new('UICorner')
                local ImageLabel = Instance.new('ImageLabel')
                local Title = Instance.new('TextLabel')

                TextButton.Parent = SectionLeft
                TextButton.BackgroundColor3 = themes.innerElement
                TextButton.BackgroundTransparency = 1.000
                TextButton.BorderSizePixel = 0
                TextButton.Size = UDim2.new(1, 0, 0, 20)
                TextButton.Font = Enum.Font.SourceSans
                TextButton.TextSize = 12.000
                TextButton.Text = ""
                TextButton.AutoButtonColor = false

                Frame.Parent = TextButton
                Frame.BackgroundColor3 = themes.innerElement
                Frame.BorderSizePixel = 0
                Frame.Size = UDim2.new(1, -10, 1, 0)
                Frame.Position = UDim2.new(0, 5, 0, 0)

                UICorner.Parent = Frame
                UICorner.CornerRadius = UDim.new(0, 4)

                ImageLabel.Parent = Frame
                ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel.BackgroundTransparency = 1.000
                ImageLabel.BorderSizePixel = 0
                ImageLabel.Size = UDim2.new(0, 16, 0, 16)
                ImageLabel.Position = UDim2.new(0, 3, 0, 2)
                ImageLabel.Image = 'rbxassetid://3926311105'
                ImageLabel.ImageColor3 = themes.image
                ImageLabel.ImageRectOffset = Vector2.new(940, 784)
                ImageLabel.ImageRectSize = Vector2.new(48, 48)
                
                Title.Parent = Frame
                Title.BackgroundColor3 = themes.innerElement
                Title.BackgroundTransparency = 1.000
                Title.BorderSizePixel = 0
                Title.Size = UDim2.new(0, Title.TextBounds.X, 1, 0)
                Title.Position = UDim2.new(0, 23, 0, 0)
                Title.Font = Enum.Font.SourceSans
                Title.Text = title
                Title.TextSize = 12.000
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.TextColor3 = themes.text

                local btn = TextButton
                local img = ImageLabel
                local toggled = false

                if default then
                    img.ImageRectOffset = Vector2.new(4, 836)
                    toggled = not toggled
                    callback(toggled)
                end

                btn.MouseEnter:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.outerElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0.6}, 0.15)
                end)

                btn.MouseLeave:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.innerElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0}, 0.15)
                end)

                btn.MouseButton1Down:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.downElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0}, 0.15)
                    utility:Tween(Frame, {Size = UDim2.new(1, -30, 1, 0)}, 0.15)
                    utility:Tween(Frame, {Position = UDim2.new(0, 15, 0, 0)}, 0.15)
                end)

                btn.MouseButton1Up:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.outerElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0.6}, 0.15)
                    utility:Tween(Frame, {Size = UDim2.new(1, -10, 1, 0)}, 0.15)
                    utility:Tween(Frame, {Position = UDim2.new(0, 5, 0, 0)}, 0.15)
                end)

                btn.MouseButton1Click:Connect(function()
                    if not toggled then
                        img.ImageRectOffset = Vector2.new(4, 836)
                    else
                        img.ImageRectOffset = Vector2.new(940, 784)
                    end
                    toggled = not toggled
                    callback(toggled)
                end)

                coroutine.wrap(function()
                    while wait() do
                        TextButton.BackgroundColor3 = themes.innerElement
                        Frame.BackgroundColor3 = themes.innerElement
                        ImageLabel.ImageColor3 = themes.image
                        Title.BackgroundColor3 = themes.innerElement
                        Title.TextColor3 = themes.text
                    end
                end)()

            end

            function Elements:addDropdown(title, default, list, callback)
                default = default or ""
                list = list or {}
                callback = callback or function() end

                local Frame = Instance.new('Frame')
                local TextButton = Instance.new('TextButton')
                local UICorner = Instance.new('UICorner')
                local ImageLabel = Instance.new('ImageLabel')
                local Title = Instance.new('TextLabel')
                
                TextButton.Parent = SectionLeft
                TextButton.BackgroundColor3 = themes.innerElement
                TextButton.BackgroundTransparency = 1.000
                TextButton.BorderSizePixel = 0
                TextButton.Size = UDim2.new(1, 0, 0, 20)
                TextButton.Font = Enum.Font.SourceSans
                TextButton.TextSize = 12.000
                TextButton.Text = ""
                TextButton.AutoButtonColor = false

                Frame.Parent = TextButton
                Frame.BackgroundColor3 = themes.innerElement
                Frame.BorderSizePixel = 0
                Frame.Size = UDim2.new(1, -10, 1, 0)
                Frame.Position = UDim2.new(0, 5, 0, 0)

                UICorner.Parent = Frame
                UICorner.CornerRadius = UDim.new(0, 4)

                ImageLabel.Parent = Frame
                ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel.BackgroundTransparency = 1.000
                ImageLabel.BorderSizePixel = 0
                ImageLabel.Size = UDim2.new(0, 16, 0, 16)
                ImageLabel.Position = UDim2.new(0, 3, 0, 2)
                ImageLabel.Image = 'rbxassetid://3926305904'
                ImageLabel.ImageColor3 = themes.image
                ImageLabel.ImageRectOffset = Vector2.new(644, 364)
                ImageLabel.ImageRectSize = Vector2.new(36, 36)
                
                Title.Parent = Frame
                Title.BackgroundColor3 = themes.innerElement
                Title.BackgroundTransparency = 1.000
                Title.BorderSizePixel = 0
                Title.Size = UDim2.new(0, Title.TextBounds.X, 1, 0)
                Title.Position = UDim2.new(0, 23, 0, 0)
                Title.Font = Enum.Font.SourceSans
                Title.Text = title
                Title.TextSize = 12.000
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.TextColor3 = themes.text

                local btn = TextButton

                if default then
                    for i,v in pairs(list) do
                        if v == default then
                            Title.Text = title..' - '..v
                            callback(v)
                        end
                    end
                end

                btn.MouseEnter:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.outerElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0.6}, 0.15)
                end)

                btn.MouseLeave:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.innerElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0}, 0.15)
                end)

                btn.MouseButton1Down:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.downElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0}, 0.15)
                    utility:Tween(Frame, {Size = UDim2.new(1, -30, 1, 0)}, 0.15)
                    utility:Tween(Frame, {Position = UDim2.new(0, 15, 0, 0)}, 0.15)
                end)

                btn.MouseButton1Up:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.outerElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0.6}, 0.15)
                    utility:Tween(Frame, {Size = UDim2.new(1, -10, 1, 0)}, 0.15)
                    utility:Tween(Frame, {Position = UDim2.new(0, 5, 0, 0)}, 0.15)
                end)

                local dropdownFrame = Instance.new('Frame')
                local UIListLayout = Instance.new('UIListLayout')

                dropdownFrame.Parent = SectionLeft
                dropdownFrame.BackgroundColor3 = themes.background
                dropdownFrame.BackgroundTransparency = 1.000
                dropdownFrame.BorderSizePixel = 0
                dropdownFrame.Size = UDim2.new(1, 0, 0, 0)
                dropdownFrame.ClipsDescendants = true

                UIListLayout.Parent = dropdownFrame
                UIListLayout.Padding = UDim.new(0, 4)
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

                local toggled = false

                btn.MouseButton1Click:Connect(function()
                    if toggled then
                        utility:Tween(dropdownFrame, {Size = UDim2.new(1, 0, 0, 0)}, 0.15)
                    else
                        utility:Tween(dropdownFrame, {Size = UDim2.new(1, 0, 0, 0 + UIListLayout.AbsoluteContentSize.Y)}, 0.15)
                    end
                    toggled = not toggled
                end)

                coroutine.wrap(function()
                    while wait() do
                        TextButton.BackgroundColor3 = themes.innerElement
                        Frame.BackgroundColor3 = themes.innerElement
                        ImageLabel.ImageColor3 = themes.image
                        Title.BackgroundColor3 = themes.innerElement
                        Title.TextColor3 = themes.text
                        dropdownFrame.BackgroundColor3 = themes.background
                    end
                end)()

                for i,v in pairs(list) do
                    local Frame11 = Instance.new('Frame')
                    local UICorner = Instance.new('UICorner')
                    local TextButton = Instance.new('TextButton')

                    Frame11.Parent = dropdownFrame
                    Frame11.BackgroundColor3 = themes.innerElement
                    Frame11.BackgroundTransparency = 1.000
                    Frame11.BorderSizePixel = 0
                    Frame11.Size = UDim2.new(1, 0, 0, 20)

                    UICorner.Parent = Frame11
                    UICorner.CornerRadius = UDim.new(0, 5)

                    TextButton.Parent = Frame11
                    TextButton.BackgroundColor3 = themes.innerElement
                    TextButton.BorderSizePixel = 0
                    TextButton.Size = UDim2.new(1, -10, 1, 0)
                    TextButton.Position = UDim2.new(0, 5, 0, 0)
                    TextButton.Font = Enum.Font.SourceSans
                    TextButton.AutoButtonColor = false
                    TextButton.TextSize = 12.000
                    TextButton.Text = '  â€¢ '..v
                    TextButton.TextXAlignment = Enum.TextXAlignment.Left
                    TextButton.TextColor3 = themes.text

                    TextButton.MouseEnter:Connect(function()
                        utility:Tween(TextButton, {BackgroundColor3 = themes.outerElement}, 0.15)
                        utility:Tween(TextButton, {TextTransparency = 0.6}, 0.15)
                    end)

                    TextButton.MouseLeave:Connect(function()
                        utility:Tween(TextButton, {BackgroundColor3 = themes.innerElement}, 0.15)
                        utility:Tween(TextButton, {TextTransparency = 0}, 0.15)
                    end)

                    TextButton.MouseButton1Click:Connect(function()
                        toggled = false
                        Title.Text = title..' - '..v
                        callback(v)
                        utility:Tween(dropdownFrame, {Size = UDim2.new(1, 0, 0, 0)}, 0.15)
                    end)

                    coroutine.wrap(function()
                        while wait() do
                            Frame11.BackgroundColor3 = themes.innerElement
                            TextButton.BackgroundColor3 = themes.innerElement
                            TextButton.TextColor3 = themes.text
                        end
                    end)()
                end

                local updatedropfunc = {}

                function updatedropfunc:Refresh(newlist)
                    newlist = newlist or {}
                    for i,v in pairs(dropdownFrame:GetChildren()) do
                        if v:IsA('Frame') then
                            v:Destroy()
                        end
                    end
                    Title.Text = title..' - Refresh Index'
                    wait(0.5)
                    Title.Text = title

                    for i,v in pairs(newlist) do
                        local Frame11 = Instance.new('Frame')
                        local UICorner = Instance.new('UICorner')
                        local TextButton = Instance.new('TextButton')

                        Frame11.Parent = dropdownFrame
                        Frame11.BackgroundColor3 = themes.innerElement
                        Frame11.BackgroundTransparency = 1.000
                        Frame11.BorderSizePixel = 0
                        Frame11.Size = UDim2.new(1, 0, 0, 20)

                        UICorner.Parent = Frame11
                        UICorner.CornerRadius = UDim.new(0, 5)

                        TextButton.Parent = Frame11
                        TextButton.BackgroundColor3 = themes.innerElement
                        TextButton.BorderSizePixel = 0
                        TextButton.Size = UDim2.new(1, -10, 1, 0)
                        TextButton.Position = UDim2.new(0, 5, 0, 0)
                        TextButton.Font = Enum.Font.SourceSans
                        TextButton.AutoButtonColor = false
                        TextButton.TextSize = 12.000
                        TextButton.Text = '  â€¢ '..v
                        TextButton.TextXAlignment = Enum.TextXAlignment.Left
                        TextButton.TextColor3 = themes.text

                        TextButton.MouseEnter:Connect(function()
                            utility:Tween(TextButton, {BackgroundColor3 = themes.outerElement}, 0.15)
                            utility:Tween(TextButton, {TextTransparency = 0.6}, 0.15)
                        end)

                        TextButton.MouseLeave:Connect(function()
                            utility:Tween(TextButton, {BackgroundColor3 = themes.innerElement}, 0.15)
                            utility:Tween(TextButton, {TextTransparency = 0}, 0.15)
                        end)

                        TextButton.MouseButton1Click:Connect(function()
                            toggled = false
                            Title.Text = title..' - '..v
                            callback(v)
                            utility:Tween(dropdownFrame, {Size = UDim2.new(1, 0, 0, 0)}, 0.15)
                        end)

                        coroutine.wrap(function()
                            while wait() do
                                Frame11.BackgroundColor3 = themes.innerElement
                                TextButton.BackgroundColor3 = themes.innerElement
                                TextButton.TextColor3 = themes.text
                            end
                        end)()
                    end
                end
                return updatedropfunc
            end

            function Elements:addSlider(title, min, max, default, callback)
                callback = callback or function() end
                default = default or (math.clamp(default, min, max))
                min = min or 0 or num
                max = max or 100 or num

                local FrameOut = Instance.new('TextButton')
                local Frame = Instance.new('Frame')
                local UICorner = Instance.new('UICorner')
                local ImageLabel = Instance.new('ImageLabel')
                local Title = Instance.new('TextLabel')
                
                FrameOut.Parent = SectionLeft
                FrameOut.BackgroundColor3 = themes.innerElement
                FrameOut.BackgroundTransparency = 1.000
                FrameOut.BorderSizePixel = 0
                FrameOut.Size = UDim2.new(1, 0, 0, 40)
                FrameOut.Font = Enum.Font.SourceSans
                FrameOut.Text = ""
                FrameOut.TextSize = 12.000
                FrameOut.AutoButtonColor = false

                Frame.Parent = FrameOut
                Frame.BackgroundColor3 = themes.innerElement
                Frame.BorderSizePixel = 0
                Frame.Size = UDim2.new(1, -10, 0, 40)
                Frame.Position = UDim2.new(0, 5, 0, 0)

                UICorner.Parent = Frame
                UICorner.CornerRadius = UDim.new(0, 4)

                ImageLabel.Parent = Frame
                ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel.BackgroundTransparency = 1.000
                ImageLabel.BorderSizePixel = 0
                ImageLabel.Size = UDim2.new(0, 16, 0, 16)
                ImageLabel.Position = UDim2.new(0, 3, 0, 2)
                ImageLabel.Image = 'rbxassetid://3926307971'
                ImageLabel.ImageColor3 = themes.image
                ImageLabel.ImageRectOffset = Vector2.new(404, 164)
                ImageLabel.ImageRectSize = Vector2.new(36, 36)
                
                Title.Parent = Frame
                Title.BackgroundColor3 = themes.innerElement
                Title.BackgroundTransparency = 1.000
                Title.BorderSizePixel = 0
                Title.Size = UDim2.new(0, Title.TextBounds.X, 0, 20)
                Title.Position = UDim2.new(0, 23, 0, 0)
                Title.Font = Enum.Font.SourceSans
                Title.Text = title.." - "..tostring(default and math.floor((default / max) * (max - min) + min) or 0)
                Title.TextSize = 12.000
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.TextColor3 = themes.text

                local Button = Instance.new('TextButton')
                local UICorner_2 = Instance.new('UICorner')
                
                Button.Parent = Frame
                Button.BackgroundColor3 = themes.element
                Button.BorderSizePixel = 0
                Button.Position = UDim2.new(0, 10, 0, 25)
                Button.Size = UDim2.new(0, 230, 0, 12)
                Button.Font = Enum.Font.SourceSans
                Button.TextSize = 12.000
                Button.Text = ""
                Button.AutoButtonColor = false
                
                UICorner_2.Parent = Button
                UICorner_2.CornerRadius = UDim.new(0, 4)

                local ButtonIn = Instance.new('Frame')
                local UICorner_3 = Instance.new('UICorner')
                local Fire = Instance.new('BoolValue')

                ButtonIn.Parent = Button
                ButtonIn.BackgroundColor3 = Color3.fromRGB(120, 255, 255)
                ButtonIn.BorderSizePixel = 0
                ButtonIn.Size = UDim2.new(default/max - min, 0, 0, 12)

                UICorner_3.Parent = ButtonIn
                UICorner_3.CornerRadius = UDim.new(0, 4)

                local Value;
                if Value == nil then
                    Value = default
                end
                local btn = Button
                local player = game.Players.LocalPlayer
                local mouse = player:GetMouse()
                local uis = game:GetService("UserInputService")
                local down = false --if MouseButton1 is down or not

                btn.MouseEnter:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.outerElement}, 0.15)
                end)

                btn.MouseLeave:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.innerElement}, 0.15)
                end)

                btn.MouseButton1Down:Connect(function()
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 230) * ButtonIn.AbsoluteSize.X) + tonumber(min)) or 0
                    callback(Value)
                    utility:Tween(ButtonIn, {Size = UDim2.new(0, math.clamp(mouse.X - ButtonIn.AbsolutePosition.X, 0, 230), 0, 12)}, 0.15)

                    moveconnection = mouse.Move:Connect(function(Mouse)
                        Title.Text = title.." - "..Value
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 230) * ButtonIn.AbsoluteSize.X) + tonumber(min)) or 0
                        callback(Value)
                        utility:Tween(ButtonIn, {Size = UDim2.new(0, math.clamp(mouse.X - ButtonIn.AbsolutePosition.X, 0, 230), 0, 12)}, 0.15)
                    end)

                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(max) - tonumber(min)) / 230) * ButtonIn.AbsoluteSize.X) + tonumber(min)) or 0
                            callback(Value)
                            Title.Text = title.." - "..Value
                            utility:Tween(ButtonIn, {Size = UDim2.new(0, math.clamp(mouse.X - ButtonIn.AbsolutePosition.X, 0, 230), 0, 12)}, 0.15)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)

                coroutine.wrap(function()
                    while wait() do
                        FrameOut.BackgroundColor3 = themes.innerElement
                        Frame.BackgroundColor3 = themes.innerElement
                        ImageLabel.ImageColor3 = themes.image
                        Title.BackgroundColor3 = themes.innerElement
                        Title.TextColor3 = themes.text
                        Button.BackgroundColor3 = themes.element
                    end
                end)()
            end

            function Elements:addTextbox(title, default, callback)
                callback = callback or function() end

                local TextButton = Instance.new('TextButton')
                local Frame = Instance.new('Frame')
                local UICorner = Instance.new('UICorner')
                local ImageLabel = Instance.new('ImageLabel')
                local Title = Instance.new('TextLabel')
                local TextBox = Instance.new('TextBox')

                TextButton.Parent = SectionLeft
                TextButton.BackgroundColor3 = themes.innerElement
                TextButton.BackgroundTransparency = 1.000
                TextButton.BorderSizePixel = 0
                TextButton.Size = UDim2.new(1, 0, 0, 25)
                TextButton.Font = Enum.Font.SourceSans
                TextButton.TextSize = 12.000
                TextButton.Text = ""
                TextButton.AutoButtonColor = false

                Frame.Parent = TextButton
                Frame.BackgroundColor3 = themes.innerElement
                Frame.BorderSizePixel = 0
                Frame.Size = UDim2.new(1, -10, 1, 0)
                Frame.Position = UDim2.new(0, 5, 0, 0)

                UICorner.Parent = Frame
                UICorner.CornerRadius = UDim.new(0, 4)

                ImageLabel.Parent = Frame
                ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel.BackgroundTransparency = 1.000
                ImageLabel.BorderSizePixel = 0
                ImageLabel.Size = UDim2.new(0, 16, 0, 16)
                ImageLabel.Position = UDim2.new(0, 3, 0, 5)
                ImageLabel.Image = 'rbxassetid://3926305904'
                ImageLabel.ImageColor3 = themes.image
                ImageLabel.ImageRectOffset = Vector2.new(324, 604)
                ImageLabel.ImageRectSize = Vector2.new(42, 42)
                
                Title.Parent = Frame
                Title.BackgroundColor3 = themes.innerElement
                Title.BackgroundTransparency = 1.000
                Title.BorderSizePixel = 0
                Title.Size = UDim2.new(0, Title.TextBounds.X, 1, 0)
                Title.Position = UDim2.new(0, 23, 0, 0)
                Title.Font = Enum.Font.SourceSans
                Title.Text = title
                Title.TextSize = 12.000
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.TextColor3 = themes.text

                TextBox.Parent = Frame
                TextBox.BackgroundColor3 = themes.element
                TextBox.BorderColor3 = themes.downElement
                TextBox.BorderSizePixel = 1
                TextBox.Size = UDim2.new(0, 80, 0, 20)
                TextBox.Position = UDim2.new(0, 160, 0, 3)
                TextBox.Font = Enum.Font.SourceSans
                TextBox.TextSize = 12.000
                TextBox.Text = default
                TextBox.TextColor3 = themes.text
                TextBox.TextXAlignment = Enum.TextXAlignment.Center
                
                default = default or TextBox.Text
                btn = TextButton

                btn.MouseEnter:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.outerElement}, 0.15)
                end)

                btn.MouseLeave:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.innerElement}, 0.15)
                end)

                TextBox.FocusLost:Connect(function()
                    pcall(function()
                        callback(TextBox.Text)
                    end)
                end)

                coroutine.wrap(function()
                    while wait() do
                        TextButton.BackgroundColor3 = themes.innerElement
                        Frame.BackgroundColor3 = themes.innerElement
                        ImageLabel.ImageColor3 = themes.image
                        Title.BackgroundColor3 = themes.innerElement
                        Title.TextColor3 = themes.text
                        TextBox.BackgroundColor3 = themes.element
                        TextBox.BorderColor3 = themes.downElement
                        TextBox.TextColor3 = themes.text
                        TextBox.PlaceholderColor3 = themes.downElement
                    end
                end)()
            end

            function Elements:addLabel(text)
                local labelFunctions = {}
                local label = Instance.new("TextLabel")
                
                label.Parent = SectionLeft
                label.BackgroundColor3 = themes.background
	    		label.BackgroundTransparency = 1.000
                label.BorderSizePixel = 0
                label.ClipsDescendants = true
                label.Text = title
                label.Size = UDim2.new(1, 0, 0, 15)
                label.Font = Enum.Font.SourceSans
                label.Text = "  "..text
                label.RichText = true
                label.TextColor3 = themes.text
                label.TextSize = 12.000
                label.TextXAlignment = Enum.TextXAlignment.Left

                coroutine.wrap(function()
                    while wait() do
                        label.BackgroundColor3 = themes.background
                        label.TextColor3 = themes.text
                    end
                end)()

                function labelFunctions:UpdateLabel(newText)
                    if label.Text ~= "  "..newText then
                        label.Text = "  "..newText
                    end
                end	
                return labelFunctions
            end
            
            function Elements:addSeparator(title)
                local Frame = Instance.new("Frame")
                local Separator = Instance.new("Frame")
                local Label = Instance.new("TextLabel")
                
                Frame.Parent = SectionLeft
                Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Frame.BackgroundTransparency = 1.000
                Frame.BorderSizePixel = 0
                Frame.Size = UDim2.new(1, 0, 0, 30)
                
                Separator.Parent = Frame
                Separator.BackgroundColor3 = themes.image
                Separator.BorderSizePixel = 0
                Separator.Size = UDim2.new(1, -20, 0, 1)
                Separator.Position = UDim2.new(0, 10, 0, 12)
                
                Label.Parent = Frame
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.BorderSizePixel = 0
                Label.Size = UDim2.new(1, -10, 0, 15)
                Label.Position = UDim2.new(0, 5, 0, 16)
                Label.Font = Enum.Font.SourceSansBold
                Label.Text = "||-- "..title.." --||"
                Label.TextSize = 12.000
                Label.TextColor3 = themes.text
                Label.TextXAlignment = Enum.TextXAlignment.Center
                
                coroutine.wrap(function()
                    Separator.BackgroundColor3 = themes.image
                    Label.TextColor3 = themes.text
                end)()
            end
            return Elements
        end

        function Sections:rightSection(title)
            local Section = Instance.new("Frame")
            local SectionRight = Instance.new("Frame")
            local SectionRightUICorner = Instance.new("UICorner")
            local SectionRightList = Instance.new("UIListLayout")
            local label = Instance.new("TextLabel")

            Section.Name = "Section"
            Section.Parent = ContainerRIght
            Section.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Section.BackgroundTransparency = 1.000
            Section.BorderSizePixel = 0
            Section.Size = UDim2.new(1, 0, 0, 25)
            
            SectionRight.Name = "SectionRight"
            SectionRight.Parent = Section
            SectionRight.BackgroundColor3 = themes.element
            
            SectionRight.BorderSizePixel = 0
            SectionRight.Position = UDim2.new(0, 5, 0, 5)
            SectionRight.Size = UDim2.new(1, -10, 0, 25)
            
            SectionRightUICorner.CornerRadius = UDim.new(0, 4)
            SectionRightUICorner.Name = "SectionRight"
            SectionRightUICorner.Parent = SectionRight
            
            SectionRightList.Name = "SectionRightList"
            SectionRightList.Parent = SectionRight
            SectionRightList.HorizontalAlignment = Enum.HorizontalAlignment.Center
            SectionRightList.SortOrder = Enum.SortOrder.LayoutOrder
            SectionRightList.Padding = UDim.new(0, 3)

            label.Parent = SectionRight
            label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            label.BackgroundTransparency = 1.000
            label.BorderSizePixel = 0
            label.Size = UDim2.new(1, 0, 0, 15)
            label.Font = Enum.Font.SourceSansBold
            label.TextSize = 12.000
            label.Text = '||-- '..title..' --||'
            label.TextXAlignment = Enum.TextXAlignment.Center
            label.TextColor3 = themes.text
            
            SectionRight.Size = UDim2.new(1, -10, 0, SectionRightList.AbsoluteContentSize.Y + SectionRightList.Padding.Offset + 5)
            SectionRightList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                SectionRight.Size = UDim2.new(1, -10, 0, SectionRightList.AbsoluteContentSize.Y + SectionRightList.Padding.Offset + 5)
                
            end)
            
            local function ContainerRIghtSizeChange()
                local largestRightListSize = 0
                largestRightListSize = SectionRightList.AbsoluteContentSize.Y
                
                ContainerRIght.CanvasSize = UDim2.new(0, 0, 0, largestRightListSize + SectionRightList.Padding.Offset + 5)
            end
            local function sectionrightsizechange()
                SectionRight.Size = UDim2.new(1, -10, 0, SectionRightList.AbsoluteContentSize.Y + SectionRightList.Padding.Offset + 5)
            end
            ContainerRIghtSizeChange()
            sectionrightsizechange()

            SectionRightList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                ContainerRIghtSizeChange()
                sectionrightsizechange()
            end)

            coroutine.wrap(function()
                while wait() do
                    SectionRight.BackgroundColor3 = themes.element
                    label.TextColor3 = themes.text
                end
            end)()

            local Elements = {}
            function Elements:addButton(title, callback)
                callback = callback or function() end

                local TextButton = Instance.new('TextButton')
                local Title = Instance.new('TextLabel')
                local UICorner = Instance.new('UICorner')
                local ToolInf = Instance.new('TextLabel')
                
                TextButton.Parent = SectionRight
                TextButton.BackgroundColor3 = themes.innerElement
                TextButton.BackgroundTransparency = 1.000
                TextButton.BorderSizePixel = 0
                TextButton.Size = UDim2.new(1, 0, 0, 20)
                TextButton.Font = Enum.Font.SourceSans
                TextButton.TextSize = 12.000
                TextButton.Text = ""
                TextButton.AutoButtonColor = false
                
                Title.Parent = TextButton
                Title.BackgroundColor3 = themes.innerElement
                Title.BorderSizePixel = 0
                Title.Size = UDim2.new(1, -10, 1, 0)
                Title.Position = UDim2.new(0, 5, 0, 0)
                Title.Font = Enum.Font.SourceSans
                Title.Text = title
                Title.TextSize = 12.000
                Title.TextXAlignment = Enum.TextXAlignment.Center
                Title.TextColor3 = themes.text

                UICorner.Parent = Title
                UICorner.CornerRadius = UDim.new(0, 4)

                local btn = TextButton

                btn.MouseEnter:Connect(function()
                    utility:Tween(Title, {TextTransparency = 0.6}, 0.15)
                    utility:Tween(Title, {BackgroundColor3 = themes.outerElement}, 0.15)
                end)

                btn.MouseLeave:Connect(function()
                    utility:Tween(Title, {TextTransparency = 0}, 0.15)
                    utility:Tween(Title, {BackgroundColor3 = themes.innerElement}, 0.15)
                end)

                btn.MouseButton1Down:Connect(function()
                    utility:Tween(Title, {BackgroundColor3 = themes.downElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0}, 0.15)
                    utility:Tween(Title, {Size = UDim2.new(1, -60, 1, 0)}, 0.15)
                    utility:Tween(Title, {Position = UDim2.new(0, 30, 0, 0)}, 0.15)
                end)

                btn.MouseButton1Up:Connect(function()
                    utility:Tween(Title, {BackgroundColor3 = themes.outerElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0.6}, 0.15)
                    utility:Tween(Title, {Size = UDim2.new(1, -10, 1, 0)}, 0.15)
                    utility:Tween(Title, {Position = UDim2.new(0, 5, 0, 0)}, 0.15)
                end)
                
                btn.MouseButton1Click:Connect(function()
                    pcall(function()
                        callback()
                    end)
                end)

                coroutine.wrap(function()
                    while wait() do
                        TextButton.BackgroundColor3 = themes.innerElement
                        Title.BackgroundColor3 = themes.innerElement
                        Title.TextColor3 = themes.text
                    end
                end)()
            end

            function Elements:addToggle(title, default, callback)
                callback = callback or function() end
                default = default or false

                local TextButton = Instance.new('TextButton')
                local Frame = Instance.new('Frame')
                local UICorner = Instance.new('UICorner')
                local ImageLabel = Instance.new('ImageLabel')
                local Title = Instance.new('TextLabel')

                TextButton.Parent = SectionRight
                TextButton.BackgroundColor3 = themes.innerElement
                TextButton.BackgroundTransparency = 1.000
                TextButton.BorderSizePixel = 0
                TextButton.Size = UDim2.new(1, 0, 0, 20)
                TextButton.Font = Enum.Font.SourceSans
                TextButton.TextSize = 12.000
                TextButton.Text = ""
                TextButton.AutoButtonColor = false

                Frame.Parent = TextButton
                Frame.BackgroundColor3 = themes.innerElement
                Frame.BorderSizePixel = 0
                Frame.Size = UDim2.new(1, -10, 1, 0)
                Frame.Position = UDim2.new(0, 5, 0, 0)

                UICorner.Parent = Frame
                UICorner.CornerRadius = UDim.new(0, 4)

                ImageLabel.Parent = Frame
                ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel.BackgroundTransparency = 1.000
                ImageLabel.BorderSizePixel = 0
                ImageLabel.Size = UDim2.new(0, 16, 0, 16)
                ImageLabel.Position = UDim2.new(0, 3, 0, 2)
                ImageLabel.Image = 'rbxassetid://3926311105'
                ImageLabel.ImageColor3 = themes.image
                ImageLabel.ImageRectOffset = Vector2.new(940, 784)
                ImageLabel.ImageRectSize = Vector2.new(48, 48)
                
                Title.Parent = Frame
                Title.BackgroundColor3 = themes.innerElement
                Title.BackgroundTransparency = 1.000
                Title.BorderSizePixel = 0
                Title.Size = UDim2.new(0, Title.TextBounds.X, 1, 0)
                Title.Position = UDim2.new(0, 23, 0, 0)
                Title.Font = Enum.Font.SourceSans
                Title.Text = title
                Title.TextSize = 12.000
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.TextColor3 = themes.text

                local btn = TextButton
                local img = ImageLabel
                local toggled = false

                if default then
                    img.ImageRectOffset = Vector2.new(4, 836)
                    toggled = not toggled
                    callback(toggled)
                end

                btn.MouseEnter:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.outerElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0.6}, 0.15)
                end)

                btn.MouseLeave:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.innerElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0}, 0.15)
                end)

                btn.MouseButton1Down:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.downElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0}, 0.15)
                    utility:Tween(Frame, {Size = UDim2.new(1, -30, 1, 0)}, 0.15)
                    utility:Tween(Frame, {Position = UDim2.new(0, 15, 0, 0)}, 0.15)
                end)

                btn.MouseButton1Up:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.outerElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0.6}, 0.15)
                    utility:Tween(Frame, {Size = UDim2.new(1, -10, 1, 0)}, 0.15)
                    utility:Tween(Frame, {Position = UDim2.new(0, 5, 0, 0)}, 0.15)
                end)

                btn.MouseButton1Click:Connect(function()
                    if not toggled then
                        img.ImageRectOffset = Vector2.new(4, 836)
                    else
                        img.ImageRectOffset = Vector2.new(940, 784)
                    end
                    toggled = not toggled
                    callback(toggled)
                end)

                coroutine.wrap(function()
                    while wait() do
                        TextButton.BackgroundColor3 = themes.innerElement
                        Frame.BackgroundColor3 = themes.innerElement
                        ImageLabel.ImageColor3 = themes.image
                        Title.BackgroundColor3 = themes.innerElement
                        Title.TextColor3 = themes.text
                    end
                end)()
            end

            function Elements:addDropdown(title, default, list, callback)
                default = default or ""
                list = list or {}
                callback = callback or function() end

                local Frame = Instance.new('Frame')
                local TextButton = Instance.new('TextButton')
                local UICorner = Instance.new('UICorner')
                local ImageLabel = Instance.new('ImageLabel')
                local Title = Instance.new('TextLabel')
                
                TextButton.Parent = SectionRight
                TextButton.BackgroundColor3 = themes.innerElement
                TextButton.BackgroundTransparency = 1.000
                TextButton.BorderSizePixel = 0
                TextButton.Size = UDim2.new(1, 0, 0, 20)
                TextButton.Font = Enum.Font.SourceSans
                TextButton.TextSize = 12.000
                TextButton.Text = ""
                TextButton.AutoButtonColor = false

                Frame.Parent = TextButton
                Frame.BackgroundColor3 = themes.innerElement
                Frame.BorderSizePixel = 0
                Frame.Size = UDim2.new(1, -10, 1, 0)
                Frame.Position = UDim2.new(0, 5, 0, 0)

                UICorner.Parent = Frame
                UICorner.CornerRadius = UDim.new(0, 4)

                ImageLabel.Parent = Frame
                ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel.BackgroundTransparency = 1.000
                ImageLabel.BorderSizePixel = 0
                ImageLabel.Size = UDim2.new(0, 16, 0, 16)
                ImageLabel.Position = UDim2.new(0, 3, 0, 2)
                ImageLabel.Image = 'rbxassetid://3926305904'
                ImageLabel.ImageColor3 = themes.image
                ImageLabel.ImageRectOffset = Vector2.new(644, 364)
                ImageLabel.ImageRectSize = Vector2.new(36, 36)
                
                Title.Parent = Frame
                Title.BackgroundColor3 = themes.innerElement
                Title.BackgroundTransparency = 1.000
                Title.BorderSizePixel = 0
                Title.Size = UDim2.new(0, Title.TextBounds.X, 1, 0)
                Title.Position = UDim2.new(0, 23, 0, 0)
                Title.Font = Enum.Font.SourceSans
                Title.Text = title
                Title.TextSize = 12.000
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.TextColor3 = themes.text
                
                local btn = TextButton

                if default then
                    for i,v in pairs(list) do
                        if v == default then
                            Title.Text = title..' - '..v
                            callback(v)
                        end
                    end
                end

                btn.MouseEnter:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.outerElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0.6}, 0.15)
                end)

                btn.MouseLeave:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.innerElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0}, 0.15)
                end)

                btn.MouseButton1Down:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.downElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0}, 0.15)
                    utility:Tween(Frame, {Size = UDim2.new(1, -30, 1, 0)}, 0.15)
                    utility:Tween(Frame, {Position = UDim2.new(0, 15, 0, 0)}, 0.15)
                end)

                btn.MouseButton1Up:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.outerElement}, 0.15)
                    utility:Tween(Title, {TextTransparency = 0.6}, 0.15)
                    utility:Tween(Frame, {Size = UDim2.new(1, -10, 1, 0)}, 0.15)
                    utility:Tween(Frame, {Position = UDim2.new(0, 5, 0, 0)}, 0.15)
                end)

                local dropdownFrame = Instance.new('Frame')
                local UIListLayout = Instance.new('UIListLayout')

                dropdownFrame.Parent = SectionRight
                dropdownFrame.BackgroundColor3 = themes.background
                dropdownFrame.BackgroundTransparency = 1.000
                dropdownFrame.BorderSizePixel = 0
                dropdownFrame.Size = UDim2.new(1, 0, 0, 0)
                dropdownFrame.ClipsDescendants = true

                UIListLayout.Parent = dropdownFrame
                UIListLayout.Padding = UDim.new(0, 4)
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

                local toggled = false

                btn.MouseButton1Click:Connect(function()
                    if toggled then
                        utility:Tween(dropdownFrame, {Size = UDim2.new(1, 0, 0, 0)}, 0.15)
                    else
                        utility:Tween(dropdownFrame, {Size = UDim2.new(1, 0, 0, 0 + UIListLayout.AbsoluteContentSize.Y)}, 0.15)
                    end
                    toggled = not toggled
                end)

                coroutine.wrap(function()
                    while wait() do
                        TextButton.BackgroundColor3 = themes.innerElement
                        Frame.BackgroundColor3 = themes.innerElement
                        ImageLabel.ImageColor3 = themes.image
                        Title.BackgroundColor3 = themes.innerElement
                        Title.TextColor3 = themes.text
                        dropdownFrame.BackgroundColor3 = themes.background
                    end
                end)()

                for i,v in pairs(list) do
                    local Frame11 = Instance.new('Frame')
                    local UICorner = Instance.new('UICorner')
                    local TextButton = Instance.new('TextButton')

                    Frame11.Parent = dropdownFrame
                    Frame11.BackgroundColor3 = themes.innerElement
                    Frame11.BackgroundTransparency = 1.000
                    Frame11.BorderSizePixel = 0
                    Frame11.Size = UDim2.new(1, 0, 0, 20)

                    UICorner.Parent = Frame11
                    UICorner.CornerRadius = UDim.new(0, 5)

                    TextButton.Parent = Frame11
                    TextButton.BackgroundColor3 = themes.innerElement
                    TextButton.BorderSizePixel = 0
                    TextButton.Size = UDim2.new(1, -10, 1, 0)
                    TextButton.Position = UDim2.new(0, 5, 0, 0)
                    TextButton.Font = Enum.Font.SourceSans
                    TextButton.AutoButtonColor = false
                    TextButton.TextSize = 12.000
                    TextButton.Text = '  â€¢ '..v
                    TextButton.TextXAlignment = Enum.TextXAlignment.Left
                    TextButton.TextColor3 = themes.text

                    TextButton.MouseEnter:Connect(function()
                        utility:Tween(TextButton, {BackgroundColor3 = themes.outerElement}, 0.15)
                        utility:Tween(TextButton, {TextTransparency = 0.6}, 0.15)
                    end)

                    TextButton.MouseLeave:Connect(function()
                        utility:Tween(TextButton, {BackgroundColor3 = themes.innerElement}, 0.15)
                        utility:Tween(TextButton, {TextTransparency = 0}, 0.15)
                    end)

                    TextButton.MouseButton1Click:Connect(function()
                        toggled = false
                        Title.Text = title..' - '..v
                        callback(v)
                        utility:Tween(dropdownFrame, {Size = UDim2.new(1, 0, 0, 0)}, 0.15)
                    end)

                    coroutine.wrap(function()
                        while wait() do
                            Frame11.BackgroundColor3 = themes.innerElement
                            TextButton.BackgroundColor3 = themes.innerElement
                            TextButton.TextColor3 = themes.text
                        end
                    end)()
                end

                local updatedropfunc = {}

                function updatedropfunc:Refresh(newlist)
                    newlist = newlist or {}
                    for i,v in pairs(dropdownFrame:GetChildren()) do
                        if v:IsA('Frame') then
                            v:Destroy()
                        end
                    end
                    Title.Text = title..' - Refresh Index'
                    wait(0.5)
                    Title.Text = title

                    for i,v in pairs(newlist) do
                        local Frame11 = Instance.new('Frame')
                        local UICorner = Instance.new('UICorner')
                        local TextButton = Instance.new('TextButton')

                        Frame11.Parent = dropdownFrame
                        Frame11.BackgroundColor3 = themes.innerElement
                        Frame11.BackgroundTransparency = 1.000
                        Frame11.BorderSizePixel = 0
                        Frame11.Size = UDim2.new(1, 0, 0, 20)

                        UICorner.Parent = Frame11
                        UICorner.CornerRadius = UDim.new(0, 5)

                        TextButton.Parent = Frame11
                        TextButton.BackgroundColor3 = themes.innerElement
                        TextButton.BorderSizePixel = 0
                        TextButton.Size = UDim2.new(1, -10, 1, 0)
                        TextButton.Position = UDim2.new(0, 5, 0, 0)
                        TextButton.Font = Enum.Font.SourceSans
                        TextButton.AutoButtonColor = false
                        TextButton.TextSize = 12.000
                        TextButton.Text = '  â€¢ '..v
                        TextButton.TextXAlignment = Enum.TextXAlignment.Left
                        TextButton.TextColor3 = themes.text

                        TextButton.MouseEnter:Connect(function()
                            utility:Tween(TextButton, {BackgroundColor3 = themes.outerElement}, 0.15)
                            utility:Tween(TextButton, {TextTransparency = 0.6}, 0.15)
                        end)

                        TextButton.MouseLeave:Connect(function()
                            utility:Tween(TextButton, {BackgroundColor3 = themes.innerElement}, 0.15)
                            utility:Tween(TextButton, {TextTransparency = 0}, 0.15)
                        end)

                        TextButton.MouseButton1Click:Connect(function()
                            toggled = false
                            Title.Text = title..' - '..v
                            callback(v)
                            utility:Tween(dropdownFrame, {Size = UDim2.new(1, 0, 0, 0)}, 0.15)
                        end)

                        coroutine.wrap(function()
                            while wait() do
                                Frame11.BackgroundColor3 = themes.innerElement
                                TextButton.BackgroundColor3 = themes.innerElement
                                TextButton.TextColor3 = themes.text
                            end
                        end)()
                    end
                end
                return updatedropfunc
            end

            function Elements:addSlider(title, min, max, default, callback)
                callback = callback or function() end
                default = default or (math.clamp(default, min, max))
                min = min or 0 or num
                max = max or 100 or num

                local FrameOut = Instance.new('TextButton')
                local Frame = Instance.new('Frame')
                local UICorner = Instance.new('UICorner')
                local ImageLabel = Instance.new('ImageLabel')
                local Title = Instance.new('TextLabel')
                
                FrameOut.Parent = SectionRight
                FrameOut.BackgroundColor3 = themes.innerElement
                FrameOut.BackgroundTransparency = 1.000
                FrameOut.BorderSizePixel = 0
                FrameOut.Size = UDim2.new(1, 0, 0, 40)
                FrameOut.Font = Enum.Font.SourceSans
                FrameOut.Text = ""
                FrameOut.TextSize = 12.000
                FrameOut.AutoButtonColor = false

                Frame.Parent = FrameOut
                Frame.BackgroundColor3 = themes.innerElement
                Frame.BorderSizePixel = 0
                Frame.Size = UDim2.new(1, -10, 0, 40)
                Frame.Position = UDim2.new(0, 5, 0, 0)

                UICorner.Parent = Frame
                UICorner.CornerRadius = UDim.new(0, 4)

                ImageLabel.Parent = Frame
                ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel.BackgroundTransparency = 1.000
                ImageLabel.BorderSizePixel = 0
                ImageLabel.Size = UDim2.new(0, 16, 0, 16)
                ImageLabel.Position = UDim2.new(0, 3, 0, 2)
                ImageLabel.Image = 'rbxassetid://3926307971'
                ImageLabel.ImageColor3 = themes.image
                ImageLabel.ImageRectOffset = Vector2.new(404, 164)
                ImageLabel.ImageRectSize = Vector2.new(36, 36)
                
                Title.Parent = Frame
                Title.BackgroundColor3 = themes.innerElement
                Title.BackgroundTransparency = 1.000
                Title.BorderSizePixel = 0
                Title.Size = UDim2.new(0, Title.TextBounds.X, 0, 20)
                Title.Position = UDim2.new(0, 23, 0, 0)
                Title.Font = Enum.Font.SourceSans
                Title.Text = title.." - "..tostring(default and math.floor((default / max) * (max - min) + min) or 0)
                Title.TextSize = 12.000
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.TextColor3 = themes.text

                local Button = Instance.new('TextButton')
                local UICorner_2 = Instance.new('UICorner')
                
                Button.Parent = Frame
                Button.BackgroundColor3 = themes.element
                Button.BorderSizePixel = 0
                Button.Position = UDim2.new(0, 10, 0, 25)
                Button.Size = UDim2.new(0, 230, 0, 12)
                Button.Font = Enum.Font.SourceSans
                Button.TextSize = 12.000
                Button.Text = ""
                Button.AutoButtonColor = false
                
                UICorner_2.Parent = Button
                UICorner_2.CornerRadius = UDim.new(0, 4)

                local ButtonIn = Instance.new('Frame')
                local UICorner_3 = Instance.new('UICorner')
                local Fire = Instance.new('BoolValue')

                ButtonIn.Parent = Button
                ButtonIn.BackgroundColor3 = Color3.fromRGB(120, 255, 255)
                ButtonIn.BorderSizePixel = 0
                ButtonIn.Size = UDim2.new(default/max - min, 0, 0, 12)

                UICorner_3.Parent = ButtonIn
                UICorner_3.CornerRadius = UDim.new(0, 4)

                local Value;
                if Value == nil then
                    Value = default
                end
                local btn = Button
                local player = game.Players.LocalPlayer
                local mouse = player:GetMouse()
                local uis = game:GetService("UserInputService")
                local down = false --if MouseButton1 is down or not

                btn.MouseEnter:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.outerElement}, 0.15)
                end)

                btn.MouseLeave:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.innerElement}, 0.15)
                end)

                btn.MouseButton1Down:Connect(function()
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 230) * ButtonIn.AbsoluteSize.X) + tonumber(min)) or 0
                    callback(Value)
                    utility:Tween(ButtonIn, {Size = UDim2.new(0, math.clamp(mouse.X - ButtonIn.AbsolutePosition.X, 0, 230), 0, 12)}, 0.15)

                    moveconnection = mouse.Move:Connect(function(Mouse)
                        Title.Text = title.." - "..Value
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 230) * ButtonIn.AbsoluteSize.X) + tonumber(min)) or 0
                        callback(Value)
                        utility:Tween(ButtonIn, {Size = UDim2.new(0, math.clamp(mouse.X - ButtonIn.AbsolutePosition.X, 0, 230), 0, 12)}, 0.15)
                    end)

                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(max) - tonumber(min)) / 230) * ButtonIn.AbsoluteSize.X) + tonumber(min)) or 0
                            callback(Value)
                            Title.Text = title.." - "..Value
                            utility:Tween(ButtonIn, {Size = UDim2.new(0, math.clamp(mouse.X - ButtonIn.AbsolutePosition.X, 0, 230), 0, 12)}, 0.15)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)

                coroutine.wrap(function()
                    while wait() do
                        FrameOut.BackgroundColor3 = themes.innerElement
                        Frame.BackgroundColor3 = themes.innerElement
                        ImageLabel.ImageColor3 = themes.image
                        Title.BackgroundColor3 = themes.innerElement
                        Title.TextColor3 = themes.text
                        Button.BackgroundColor3 = themes.element
                    end
                end)()
            end

            function Elements:addTextbox(title, default, callback)
                callback = callback or function() end

                local TextButton = Instance.new('TextButton')
                local Frame = Instance.new('Frame')
                local UICorner = Instance.new('UICorner')
                local ImageLabel = Instance.new('ImageLabel')
                local Title = Instance.new('TextLabel')
                local TextBox = Instance.new('TextBox')

                TextButton.Parent = SectionRight
                TextButton.BackgroundColor3 = themes.innerElement
                TextButton.BackgroundTransparency = 1.000
                TextButton.BorderSizePixel = 0
                TextButton.Size = UDim2.new(1, 0, 0, 25)
                TextButton.Font = Enum.Font.SourceSans
                TextButton.TextSize = 12.000
                TextButton.Text = ""
                TextButton.AutoButtonColor = false

                Frame.Parent = TextButton
                Frame.BackgroundColor3 = themes.innerElement
                Frame.BorderSizePixel = 0
                Frame.Size = UDim2.new(1, -10, 1, 0)
                Frame.Position = UDim2.new(0, 5, 0, 0)

                UICorner.Parent = Frame
                UICorner.CornerRadius = UDim.new(0, 4)

                ImageLabel.Parent = Frame
                ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel.BackgroundTransparency = 1.000
                ImageLabel.BorderSizePixel = 0
                ImageLabel.Size = UDim2.new(0, 16, 0, 16)
                ImageLabel.Position = UDim2.new(0, 3, 0, 5)
                ImageLabel.Image = 'rbxassetid://3926305904'
                ImageLabel.ImageColor3 = themes.image
                ImageLabel.ImageRectOffset = Vector2.new(324, 604)
                ImageLabel.ImageRectSize = Vector2.new(42, 42)
                
                Title.Parent = Frame
                Title.BackgroundColor3 = themes.innerElement
                Title.BackgroundTransparency = 1.000
                Title.BorderSizePixel = 0
                Title.Size = UDim2.new(0, Title.TextBounds.X, 1, 0)
                Title.Position = UDim2.new(0, 23, 0, 0)
                Title.Font = Enum.Font.SourceSans
                Title.Text = title
                Title.TextSize = 12.000
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.TextColor3 = themes.text

                TextBox.Parent = Frame
                TextBox.BackgroundColor3 = themes.element
                TextBox.BorderColor3 = themes.downElement
                TextBox.BorderSizePixel = 1
                TextBox.Size = UDim2.new(0, 80, 0, 20)
                TextBox.Position = UDim2.new(0, 160, 0, 3)
                TextBox.Font = Enum.Font.SourceSans
                TextBox.TextSize = 12.000
                TextBox.Text = default
                TextBox.TextColor3 = themes.text
                TextBox.TextXAlignment = Enum.TextXAlignment.Center
                
                default = default or TextBox.Text
                btn = TextButton

                btn.MouseEnter:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.outerElement}, 0.15)
                end)

                btn.MouseLeave:Connect(function()
                    utility:Tween(Frame, {BackgroundColor3 = themes.innerElement}, 0.15)
                end)

                TextBox.FocusLost:Connect(function()
                    pcall(function()
                        callback(TextBox.Text)
                    end)
                end)

                coroutine.wrap(function()
                    while wait() do
                        TextButton.BackgroundColor3 = themes.innerElement
                        Frame.BackgroundColor3 = themes.innerElement
                        ImageLabel.ImageColor3 = themes.image
                        Title.BackgroundColor3 = themes.innerElement
                        Title.TextColor3 = themes.text
                        TextBox.BackgroundColor3 = themes.element
                        TextBox.BorderColor3 = themes.downElement
                        TextBox.TextColor3 = themes.text
                        TextBox.PlaceholderColor3 = themes.downElement
                    end
                end)()
            end

            function Elements:addLabel(text)
                local labelFunctions = {}
                local label = Instance.new("TextLabel")
                
                label.Parent = SectionRight
                label.BackgroundColor3 = themes.background
	    		label.BackgroundTransparency = 1.000
                label.BorderSizePixel = 0
                label.ClipsDescendants = true
                label.Text = title
                label.Size = UDim2.new(1, 0, 0, 15)
                label.Font = Enum.Font.SourceSans
                label.Text = "  "..text
                label.RichText = true
                label.TextColor3 = themes.text
                label.TextSize = 12.000
                label.TextXAlignment = Enum.TextXAlignment.Left

                coroutine.wrap(function()
                    while wait() do
                        label.BackgroundColor3 = themes.background
                        label.TextColor3 = themes.text
                    end
                end)()

                function labelFunctions:UpdateLabel(newText)
                    if label.Text ~= "  "..newText then
                        label.Text = "  "..newText
                    end
                end	
                return labelFunctions
            end
            
            function Elements:addSeparator(title)
                local Frame = Instance.new("Frame")
                local Separator = Instance.new("Frame")
                local Label = Instance.new("TextLabel")
                
                Frame.Parent = SectionRight
                Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Frame.BackgroundTransparency = 1.000
                Frame.BorderSizePixel = 0
                Frame.Size = UDim2.new(1, 0, 0, 30)
                
                Separator.Parent = Frame
                Separator.BackgroundColor3 = themes.image
                Separator.BorderSizePixel = 0
                Separator.Size = UDim2.new(1, -20, 0, 1)
                Separator.Position = UDim2.new(0, 10, 0, 12)
                
                Label.Parent = Frame
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.BorderSizePixel = 0
                Label.Size = UDim2.new(1, -10, 0, 15)
                Label.Position = UDim2.new(0, 5, 0, 16)
                Label.Font = Enum.Font.SourceSansBold
                Label.Text = "||-- "..title.." --||"
                Label.TextSize = 12.000
                Label.TextColor3 = themes.text
                Label.TextXAlignment = Enum.TextXAlignment.Center
                
                coroutine.wrap(function()
                    Separator.BackgroundColor3 = themes.image
                    Label.TextColor3 = themes.text
                end)()
            end
            return Elements
        end
        return Sections
    end
    return Tabs
end
return Library
