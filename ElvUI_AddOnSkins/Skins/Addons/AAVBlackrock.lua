local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")
local AS = E:GetModule("AddOnSkins")

if not AS:IsAddonLODorEnabled("AAVBlackrock") then return end

-- AAVBlackrock 3.3.5
-- http://forum.warmane.com/showthread.php?t=387301
-- https://github.com/jjbreis/AAVBlackrock

S:AddCallbackForAddon("AAVBlackrock", "AAVBlackrock", function()

    -- Main List
    S:SecureHook(AAV_TableGui, "showMatchesFrame", function()

        AAVMatches:StripTextures()
		AAVMatches:SetTemplate("Transparent")
		AAVMatches:SetSize(AAVMatches:GetWidth()+34, AAVMatches:GetHeight()+34)

        AAVMatchesTitle:StripTextures()
		AAVMatchesTitle:SetTemplate("Transparent")
        AAVMatchesTitle:ClearAllPoints()
        AAVMatchesTitle:SetPoint('BOTTOM', AAVMatches, 'TOP', 0, -1)
        AAVMatchesTitle:SetWidth(AAVMatches:GetWidth())
        AAVMatchesTitle:SetMovable(true)
        AAVMatchesTitle:EnableMouse(true)
        AAVMatchesTitle:SetScript("OnMouseDown", function(self, button ) AAVMatches:StartMoving() end)
        AAVMatchesTitle:SetScript("OnMouseUp", function(self, button ) AAVMatches:StopMovingOrSizing() end)
        AAVMatchesTitleName:SetFont(E.LSM:Fetch("font", "PT Sans Narrow"), 16, "NONE")

        ScrollTable1:StripTextures()
		ScrollTable1:SetTemplate("Transparent")
        ScrollTable1ScrollTrough:Hide()
        S:HandleScrollBar(ScrollTable1ScrollFrameScrollBar)

        S:HandleCloseButton(AAVMatchesCloseButton)

		S:Unhook(AAV_TableGui, "showMatchesFrame")
	end)
    --

    -- Detail Element
    S:SecureHook(atroxArenaViewer, "playMatch", function()

        -- MAIN DETAIL PANEL

        AAVRoot:StripTextures()
        AAVRoot:SetTemplate("Transparent")
        --AAVRoot:ClearAllPoints()
        --AAVRoot:SetSize(AAVRoot:GetWidth()+34, AAVRoot:GetHeight()+34)

        AAVRootMapText:StripTextures()
        AAVRootMapText:SetTemplate("Transparent")
        AAVRootMapText:ClearAllPoints()
        AAVRootMapText:SetPoint('BOTTOM', AAVRoot, 'TOP', 0, -1)
        AAVRootMapText:SetWidth(AAVRoot:GetWidth())
        AAVRootMapText:SetMovable(true)
        AAVRootMapText:EnableMouse(true)
        AAVRootMapText:SetScript("OnMouseDown", function(self, button ) AAVRoot:StartMoving() end)
        AAVRootMapText:SetScript("OnMouseUp", function(self, button ) AAVRoot:StopMovingOrSizing() end)
        AAVRootMapTextName:SetFont(E.LSM:Fetch("font", "PT Sans Narrow"), 16, "NONE")

        AAVRootMatchPlayerSeekerBarBack:StripTextures()
        AAVRootMatchPlayerSeekerBarBackSeekerBar:SetTemplate("Transparent")

        S:HandleSliderFrame(AAVRootMatchPlayerSpeed)
        S:HandleButton(PlayerBackButton)
        S:HandleButton(AAVRootMatchPlayerPlayButton)
        S:HandleButton(AAVRootMatchPlayerViewreplay)
        S:HandleButton(AAVRootViewDetail)
        S:HandleCloseButton(PlayerCloseButton)


        -- HACKFRAME

        hackframe:StripTextures()
        hackframe:SetTemplate("Transparent")
        hackframe:ClearAllPoints()
        hackframe:SetPoint('LEFT', AAVRoot, 'RIGHT', -1, 0)
        hackframe:SetSize(hackframe:GetWidth() + 16, AAVRoot:GetHeight())
        hackframe:SetMovable(true)
        hackframe:EnableMouse(true)
        hackframe:SetScript("OnMouseDown", function(self, button ) AAVRoot:StartMoving() end)
        hackframe:SetScript("OnMouseUp", function(self, button ) AAVRoot:StopMovingOrSizing() end)

        hackframeTitle:StripTextures()
        hackframeTitle:SetTemplate("Transparent")
        hackframeTitle:ClearAllPoints()
        hackframeTitle:SetPoint('BOTTOM', hackframe, 'TOP', 0, -1)
        hackframeTitle:SetWidth(hackframe:GetWidth())
        hackframeTitle:SetMovable(true)
        hackframeTitle:EnableMouse(true)
        hackframeTitle:SetScript("OnMouseDown", function(self, button ) AAVRoot:StartMoving() end)
        hackframeTitle:SetScript("OnMouseUp", function(self, button ) AAVRoot:StopMovingOrSizing() end)
        hackframeTitleTitletext:SetFont(E.LSM:Fetch("font", "PT Sans Narrow"), 16, "NONE")

        S:HandleScrollBar(hackframe.scrollbar)
        hackframe.scrollbar:ClearAllPoints()
        hackframe.scrollbar:SetPoint("TOPRIGHT", hackframe, "TOPRIGHT", -2, -21)
        hackframe.scrollbar:SetPoint("BOTTOMRIGHT", hackframe, "BOTTOMRIGHT", -2, 21)

        --

        --S:Unhook(atroxArenaViewer, "playMatch")
    end)
    --

end)