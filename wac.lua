-- Main Frame
local addonName = "CombatLock"
CombatLockDB = CombatLockDB or { enabled = true }
local addonEnabled = CombatLockDB.enabled
local frame = CreateFrame("Frame")

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")

frame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local name = ...
        if name == addonName then
            CombatLockDB = CombatLockDB or { enabled = true }
            addonEnabled = CombatLockDB.enabled
        end
        return
    end

    if addonEnabled then
        if event == "PLAYER_REGEN_DISABLED" then
            MouselookStart()
            print("|cFF66BBFF[CombatLock]:|r Mouse Locked.")
        elseif event == "PLAYER_REGEN_ENABLED" then
            MouselookStop()
            print("|cFF66BBFF[CombatLock]:|r Mouse Released.")
        end
    end
end)

-- Slash Command
SLASH_COMBATLOCK1 = "/mlock"
SlashCmdList["COMBATLOCK"] = function(msg)
    local old = addonEnabled
    addonEnabled = not addonEnabled
    CombatLockDB.enabled = addonEnabled
    
    if old ~= addonEnabled then
        local status = addonEnabled and "|cFF00FF00Enabled|r" or "|cFFFF0000Disabled|r"
        print("|cFF66BBFF[CombatLock]:|r Combat mouse-lock is now " .. status)
    end
    
    if not addonEnabled then
        MouselookStop()
    end
end