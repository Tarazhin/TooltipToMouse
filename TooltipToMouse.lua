local frame = CreateFrame("FRAME"); -- Need a frame to respond to events
frame:RegisterEvent("ADDON_LOADED"); -- Fired when saved variables are loaded
frame:RegisterEvent("PLAYER_LOGOUT"); -- Fired when about to log out
frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "TooltipToMouse" then
        print("AddOn geladen...")
        if TtM_IsActive == nil then
            TtM_IsActive = true
        end

        hooksecurefunc("GameTooltip_SetDefaultAnchor", tooltipPos)
    end
end)
SLASH_TTM1 = "/TTM"
SlashCmdList['TTM'] = function(msg)
    print(msg)
    if string.find(msg, "off") then
        TtM_IsActive = false
    end
    if string.find(msg, "on") then
        TtM_IsActive = true
    end
end

function tooltipPos(s, p)
    if TtM_IsActive then
        s:SetOwner(p, "ANCHOR_CURSOR")
    else
        s:SetOwner(p, "ANCHOR_NONE")
    end
end