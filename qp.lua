local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
Library.BackgroundColor = Color3.fromRGB(36, 36, 36);
Library.AccentColor = Color3.fromRGB(61, 180, 136);
local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'Locer Hub',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('Main'),
}
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Reroll Rollback')
LeftGroupBox:AddDivider()
LeftGroupBox:AddDropdown('Select Type', {
    Values = { 'Weapon Reroll', 'Clan Reroll', 'Element Reroll' },
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Select Type',
    Tooltip = 'Dupes rrs', -- Information shown when you hover over the dropdown

    Callback = function(Value)
        print('[cb] Dropdown got changed. New value:', Value)
    end
})
local MyButton = LeftGroupBox:AddButton({
    Text = 'Dupe',
    Func = function()
        print('You clicked a button!')
    end,
    DoubleClick = false,
    Tooltip = ''
})

local RightGroupbox = Tabs.Main:AddRightGroupbox('Bank Dupe');

RightGroupbox:AddInput('ItemName', {
    Default = 'Item Name',
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = '',
    Tooltip = '', -- Information shown when you hover over the textbox

    Placeholder = '', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text

    Callback = function(Value)
        print('[cb] Text updated. New text:', Value)
    end
})

local MyButton2 = RightGroupbox:AddButton({
    Text = 'Bank Rollback',
    Func = function()
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(game.PlaceId, p)
    end,
    DoubleClick = false,
    Tooltip = ''
})
