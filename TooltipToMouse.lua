local frame = CreateFrame("FRAME"); -- Need a frame to respond to events
frame:RegisterEvent("ADDON_LOADED"); -- Fired when saved variables are loaded
frame:RegisterEvent("PLAYER_LOGOUT"); -- Fired when about to log out

frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "TooltipToMouse" then
        print("AddOn geladen...")
        if TtM_IsActive == nil then
            TtM_IsActive = true
        end
        if TtM_IsActive then
            hooksecurefunc("GameTooltip_SetDefaultAnchor", function(s,p) s:SetOwner(p,"ANCHOR_CURSOR") end)
        else
            hooksecurefunc("GameTooltip_SetDefaultAnchor", function(s,p) s:SetOwner(p,"BOTTOMRIGHT") end)
        end 
    end
end)

SLASH_TTM1 = "/TTM"
SlashCmdList['TTM'] = function()
    if TtM_IsActive then
        TtM_IsActive = false
        hooksecurefunc("GameTooltip_SetDefaultAnchor", function(s,p) s:SetOwner(p,"BOTTOMRIGHT") end)
    end
    if TtM_IsActive == false then
        TtM_IsActive = true
        hooksecurefunc("GameTooltip_SetDefaultAnchor", function(s,p) s:SetOwner(p,"ANCHOR_CURSOR") end)
    end
end

