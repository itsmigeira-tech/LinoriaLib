-- Linoria V2 example usage
-- Modern CS-style showcase using the public Linoria API.

local repo = 'https://raw.githubusercontent.com/itsmigeira-tech/LinoriaLib/main/'
local CacheBuster = '?v=' .. tostring(os.time())

local Library = loadstring(game:HttpGet(repo .. 'Library.lua' .. CacheBuster))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua' .. CacheBuster))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua' .. CacheBuster))()

local Toggles = Library.Toggles
local Options = Library.Options

local Window = Library:CreateWindow({
    Title = 'Linoria V2',
    Center = true,
    AutoShow = true,
    Size = UDim2.fromOffset(600, 500),
    TabPadding = 2,
    MenuFadeTime = 0.12
})

local Tabs = {
    Combat = Window:AddTab('Combat'),
    Visuals = Window:AddTab('Visuals'),
    Misc = Window:AddTab('Misc'),
    Settings = Window:AddTab('Settings')
}

-- Combat
local Aim = Tabs.Combat:AddLeftGroupbox('Aim Assistance')

Aim:AddToggle('AimEnabled', {
    Text = 'Enabled',
    Default = true
})

Aim:AddLabel('Activation'):AddKeyPicker('AimKey', {
    Default = 'MB2',
    Mode = 'Hold',
    Text = 'Aim key',
    NoUI = false
})

Aim:AddDropdown('AimType', {
    Values = { 'Camera', 'Cursor', 'Silent' },
    Default = 1,
    Multi = false,
    Text = 'Type'
})

Aim:AddDropdown('Hitbox', {
    Values = { 'Head', 'Torso', 'Closest' },
    Default = 1,
    Multi = false,
    Text = 'Hitbox'
})

Aim:AddSlider('Smoothness', {
    Text = 'Smoothness',
    Default = 15,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Suffix = '%',
    HideMax = true
})

Aim:AddToggle('Prediction', {
    Text = 'Prediction',
    Default = false
})

Aim:AddToggle('VisibleCheck', {
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
    Suffix = '°',
    HideMax = true
})

Fov:AddSlider('FovThickness', {
    Text = 'Thickness',
    Default = 1,
    Min = 1,
    Max = 5,
    Rounding = 0,
    Suffix = 'px',
    HideMax = true
})

Fov:AddLabel('Color'):AddColorPicker('FovColor', {
    Default = Color3.fromRGB(215, 78, 103),
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
local Players = Tabs.Visuals:AddLeftGroupbox('Player Visuals')

Players:AddToggle('EspEnabled', { Text = 'Enabled', Default = true })
Players:AddToggle('Boxes', { Text = 'Boxes', Default = true })
Players:AddToggle('Names', { Text = 'Names', Default = true })
Players:AddToggle('Health', { Text = 'Health bar', Default = true })
Players:AddToggle('Distance', { Text = 'Distance', Default = false })

Players:AddDropdown('BoxStyle', {
    Values = { 'Full', 'Corner', 'Outline' },
    Default = 1,
    Multi = false,
    Text = 'Box style'
})

Players:AddLabel('Accent'):AddColorPicker('EspColor', {
    Default = Color3.fromRGB(215, 78, 103),
    Title = 'ESP accent'
})

local World = Tabs.Visuals:AddRightGroupbox('World')

World:AddToggle('Crosshair', { Text = 'Crosshair', Default = false })
World:AddToggle('RemoveFog', { Text = 'Remove fog', Default = false })

World:AddSlider('Brightness', {
    Text = 'Brightness',
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Suffix = '%'
})

World:AddDropdown('Lighting', {
    Values = { 'Default', 'Night', 'Bright', 'Warm', 'Cold' },
    Default = 1,
    Multi = false,
    Text = 'Lighting'
})

-- Misc
local General = Tabs.Misc:AddLeftGroupbox('General')

General:AddButton({
    Text = 'Primary action',
    Func = function() end
}):AddButton({
    Text = 'Secondary',
    Func = function() end
})

General:AddInput('ProfileName', {
    Default = 'default',
    Numeric = false,
    Finished = true,
    Text = 'Profile name',
    Placeholder = 'profile'
})

General:AddDropdown('MultiSelect', {
    Values = { 'Option A', 'Option B', 'Option C', 'Option D', 'Option E', 'Option F', 'Option G', 'Option H', 'Option I' },
    Default = 1,
    Multi = true,
    Text = 'Multi select'
})

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

local Presets = Tabs.Misc:AddRightTabbox('Presets')
local Legit = Presets:AddTab('Legit')
local Rage = Presets:AddTab('Rage')

Legit:AddToggle('LegitPreset', {
    Text = 'Use legit preset',
    Default = true
})

Rage:AddDropdown('RageMode', {
    Values = { 'Low', 'Medium', 'High' },
    Default = 2,
    Multi = false,
    Text = 'Mode'
})

-- Settings
local Menu = Tabs.Settings:AddLeftGroupbox('Menu')

Menu:AddLabel('Menu key'):AddKeyPicker('MenuKeybind', {
    Default = 'End',
    NoUI = true,
    Text = 'Menu key'
})

Menu:AddButton({
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

ThemeManager.DefaultTheme = 'Jester'
ThemeManager:SetFolder('LinoriaV2')
SaveManager:SetFolder('LinoriaV2/configs')

SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)
SaveManager:LoadAutoloadConfig()
