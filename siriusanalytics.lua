--// analytics from https://developer.sirius.menu/ but no rayfield

cloneref = cloneref or function(obj) return obj end

local UserInputService = cloneref(game:GetService("UserInputService"))
local IsMobile = UserInputService:GetPlatform() == Enum.Platform.Android or UserInputService:GetPlatform() == Enum.Platform.IOS

local Success, Reporter = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/refs/heads/main/reporter.lua"))
end)
if not Success or not Reporter then
    return { Send = function() end }
end

local Analytics = Reporter().new({
    url = "https://rayfield-collect.sirius-software-ltd.workers.dev",
    token = "05de7f9fd320d3b8428cd1c77014a337b85b6c8efee2c5914f5ab5700c354b9a",
    product_name = "Rayfield",
    category = "UILibrary",
})

function Analytics:Send(ID, Name)
    Analytics:windowCreated({
        script_name = Name or tostring(math.random(1000, 9999)),
        script_version = "1.0.0",
        interface_version = "UU2NX",
        is_mobile = IsMobile and true or false,
        script_id = ID,
    })
end

return Analytics
