-- LinoriaLib CS-style example usage
-- Demonstrates the public API and the redesigned compact interface.

local repo = 'https://raw.githubusercontent.com/itsmigeira-tech/LinoriaLib/main/'
local CacheBuster = '?v=' .. tostring(os.time())

local Library = loadstring(game:HttpGet(repo .. 'Library.lua' .. CacheBuster))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua' .. CacheBuster))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua' .. CacheBuster))()

local Toggles = Library.Toggles
local Options = Library.Options

local Window = Library:CreateWindow({
    Title = 'LINORIA // CS STYLE',
    Center = true,
    AutoShow = true,
    TabPadding = 2,
    MenuFadeTime = 0.15
})

local Tabs = {
    Combat = Window:AddTab('Combat'),
    Visuals = Window:AddTab('Visuals'),
    Misc = Window:AddTab('Misc'),
    Settings = Window:AddTab('Settings')
}

-- Combat
local AimAssist = Tabs.Combat:AddLeftGroupbox('Aim Assistance')

AimAssist:AddToggle('AimEnabled', {
    Text = 'Enabled',
    Default = true,
    Tooltip = 'Example toggle'
})

AimAssist:AddLabel('Activation'):AddKeyPicker('AimKey', {
    Default = 'MB2',
    SyncToggleState = false,
    Mode = 'Hold',
    Text = 'Activation key',
    NoUI = false
})

AimAssist:AddDropdown('AimType', {
    Values = { 'Camera', 'Cursor', 'Silent' },
    Default = 1,
    Multi = false,
    Text = 'Type'
})

AimAssist:AddDropdown('Hitbox', {
    Values = { 'Head', 'Torso', 'Closest' },
    Default = 1,
    Multi = false,
    Text = 'Hitbox'
})

AimAssist:AddSlider('Smoothness', {
    Text = 'Smoothness',
    Default = 15,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Suffix = '%'
})

AimAssist:AddToggle('Prediction', {
    Text = 'Prediction',
    Default = false
})

AimAssist:AddToggle('VisibleCheck', {
    Text = 'Visible check',
    Default = true
})

local Fov = Tabs.Combat:AddRightGroupbox('FOV Circle')

Fov:AddToggle('FovEnabled', {
    Text = 'Enabled',
    Default = true
})

Fov:AddToggle('FovOutline', {
    Text = 'Outline',
    Default = true
})

Fov:AddToggle('FovFilled', {
    Text = 'Filled',
    Default = false
})

Fov:AddSlider('FovRadius', {
    Text = 'Radius',
    Default = 90,
    Min = 10,
    Max = 360,
    Rounding = 0,
    Suffix = '°'
})

Fov:AddSlider('FovThickness', {
    Text = 'Thickness',
    Default = 1,
    Min = 1,
    Max = 5,
    Rounding = 0,
    Suffix = 'px'
})

Fov:AddLabel('Color'):AddColorPicker('FovColor', {
    Default = Color3.fromRGB(225, 104, 127),
    Title = 'FOV color'
})

local CombatOptions = Tabs.Combat:AddRightGroupbox('Options')

CombatOptions:AddDropdown('TargetMode', {
    Values = { 'Closest', 'Distance', 'FOV' },
    Default = 1,
    Multi = false,
    Text = 'Target mode'
})

CombatOptions:AddToggle('IgnoreTeam', {
    Text = 'Ignore team',
    Default = true
})

CombatOptions:AddToggle('AutoSwitch', {
    Text = 'Auto switch',
    Default = false
})

-- Visuals
local PlayerVisuals = Tabs.Visuals:AddLeftGroupbox('Player Visuals')

PlayerVisuals:AddToggle('EspEnabled', {
    Text = 'Enabled',
    Default = true
})

PlayerVisuals:AddToggle('Boxes', {
    Text = 'Boxes',
    Default = true
})

PlayerVisuals:AddToggle('Names', {
    Text = 'Names',
    Default = true
})

PlayerVisuals:AddToggle('Health', {
    Text = 'Health bar',
    Default = true
})

PlayerVisuals:AddToggle('Distance', {
    Text = 'Distance',
    Default = false
})

PlayerVisuals:AddDropdown('BoxStyle', {
    Values = { 'Full', 'Corner', 'Outline' },
    Default = 1,
    Multi = false,
    Text = 'Box style'
})

PlayerVisuals:AddLabel('Accent'):AddColorPicker('EspColor', {
    Default = Color3.fromRGB(225, 104, 127),
    Title = 'ESP accent'
})

local WorldVisuals = Tabs.Visuals:AddRightGroupbox('World')

WorldVisuals:AddToggle('Crosshair', {
    Text = 'Crosshair',
    Default = false
})

WorldVisuals:AddToggle('RemoveFog', {
    Text = 'Remove fog',
    Default = false
})

WorldVisuals:AddSlider('Brightness', {
    Text = 'Brightness',
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Suffix = '%'
})

WorldVisuals:AddDropdown('LightingPreset', {
    Values = { 'Default', 'Night', 'Bright' },
    Default = 1,
    Multi = false,
    Text = 'Lighting'
})

-- Misc
local General = Tabs.Misc:AddLeftGroupbox('General')

General:AddButton({
    Text = 'Primary action',
    Func = function()
        print('Primary action clicked')
    end,
    Tooltip = 'Button example'
}):AddButton({
    Text = 'Secondary',
    Func = function()
        print('Secondary action clicked')
    end
})

General:AddInput('ProfileName', {
    Default = 'default',
    Numeric = false,
    Finished = true,
    Text = 'Profile name',
    Placeholder = 'profile'
})

General:AddDropdown('MultiSelect', {
    Values = { 'Option A', 'Option B', 'Option C', 'Option D' },
    Default = 1,
    Multi = true,
    Text = 'Multi select'
})

General:AddDivider()
General:AddLabel('Compact CS-style layout\nusing the same Linoria API.', true)

local Dependencies = Tabs.Misc:AddRightGroupbox('Dependencies')

Dependencies:AddToggle('AdvancedEnabled', {
    Text = 'Advanced options',
    Default = false
})

local Depbox = Dependencies:AddDependencyBox()
Depbox:AddToggle('AdvancedToggle', {
    Text = 'Nested toggle',
    Default = true
})

Depbox:AddSlider('AdvancedValue', {
    Text = 'Nested value',
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 0
})

Depbox:SetupDependencies({
    { Toggles.AdvancedEnabled, true }
})

local RightTabbox = Tabs.Misc:AddRightTabbox()
local PresetA = RightTabbox:AddTab('Preset A')
local PresetB = RightTabbox:AddTab('Preset B')

PresetA:AddToggle('PresetAToggle', {
    Text = 'Preset option',
    Default = true
})

PresetB:AddDropdown('PresetBMode', {
    Values = { 'Low', 'Medium', 'High' },
    Default = 2,
    Multi = false,
    Text = 'Mode'
})

-- Watermark / keybind list
Library:SetWatermarkVisibility(true)

local FrameTimer = tick()
local FrameCounter = 0
local FPS = 60

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter
        FrameTimer = tick()
        FrameCounter = 0
    end

    local Ping = math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())

    Library:SetWatermark(
        'LINORIA | ' .. tostring(math.floor(FPS)) .. ' FPS | ' .. tostring(Ping) .. ' MS'
    )
end)

Library.KeybindFrame.Visible = true

Library:OnUnload(function()
    WatermarkConnection:Disconnect()
    Library.Unloaded = true
    print('Linoria unloaded')
end)

-- Settings
local MenuGroup = Tabs.Settings:AddLeftGroupbox('Menu')

MenuGroup:AddLabel('Menu key'):AddKeyPicker('MenuKeybind', {
    Default = 'End',
    NoUI = true,
    Text = 'Menu key'
})

MenuGroup:AddButton({
    Text = 'Unload',
    Func = function()
        Library:Unload()
    end
})

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('LinoriaCS')
SaveManager:SetFolder('LinoriaCS/configs')

SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

SaveManager:LoadAutoloadConfig()
