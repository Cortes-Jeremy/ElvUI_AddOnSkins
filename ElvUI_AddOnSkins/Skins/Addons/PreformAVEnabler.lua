local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")
local AS = E:GetModule("AddOnSkins")

if not AS:IsAddonLODorEnabled("PreformAVEnabler") then return end

local _G = _G
local find = string.find

-- PreformAVEnabler 2.5

S:AddCallbackForAddon("PreformAVEnabler", "PreformAVEnabler", function()

    -- PVP Frame button
    S:HandleButton(PreformAVEnablerPVPBGButton)
    PreformAVEnablerPVPBGButton:ClearAllPoints()
    PreformAVEnablerPVPBGButton:SetSize(127, 25)
    PreformAVEnablerPVPBGButton:SetPoint('BOTTOMLEFT', PVPBattlegroundFrame, 'BOTTOMLEFT', 17, 111)
    PreformAVEnablerNumInstancesFrameText:SetTextColor(0.09, 0.5, 0.82)

    -- Main Window
    S:SecureHook(PreformAVEnablerFrame, "Show", function()

        PreformAVEnablerFrame:StripTextures()
        PreformAVEnablerFrame:SetTemplate("Transparent")
        PreformAVEnablerClickToMoveFrame:StripTextures()
        PreformAVEnablerClickToMoveFrame:SetTemplate("Transparent")
        PreformAVEnablerClickToMoveFrame:ClearAllPoints()
        PreformAVEnablerClickToMoveFrame:SetPoint('BOTTOM', PreformAVEnablerFrame, 'TOP', 0, -1)
        PreformAVEnablerClickToMoveFrame:SetWidth(PreformAVEnablerFrame:GetWidth())
        PreformAVEnablerFrameTitle:ClearAllPoints()
        PreformAVEnablerFrameTitle:SetPoint('CENTER', PreformAVEnablerClickToMoveFrame, 'CENTER', 0, 0)
        PreformAVEnablerFrameTitle:SetParent(PreformAVEnablerClickToMoveFrame)

        PreformAVEnablerMembersScrollFrame:StripTextures()
		PreformAVEnablerMembersScrollFrame:SetTemplate("Transparent")
		PreformAVEnablerMembersScrollFrame:SetBackdropColor(0,0,0,0.34)
		PreformAVEnablerMembersScrollFrame:SetBackdropBorderColor(0,0,0,1)
        PreformAVEnablerMembersScrollFrame:ClearAllPoints()
        PreformAVEnablerMembersScrollFrame:SetPoint('TOPLEFT', PreformAVEnablerFrame, 'TOPLEFT', 15, -50)
        PreformAVEnablerMembersScrollFrameChildFrame:StripTextures()
		PreformAVEnablerMembersScrollFrameChildFrame:SetTemplate("Transparent")
		PreformAVEnablerMembersScrollFrameChildFrame:SetBackdropColor(0,0,0,0)
		PreformAVEnablerMembersScrollFrameChildFrame:SetBackdropBorderColor(0,0,0,0)
		PreformAVEnablerRulerTop:Hide()
		PreformAVEnablerRulerBottom:Hide()

        PreformAVEnablerThresholdSlider:ClearAllPoints()
        PreformAVEnablerThresholdSlider:SetPoint('BOTTOMLEFT', PreformAVEnablerFrame, 'BOTTOMLEFT', 20, 55)
        PreformAVEnablerThresholdSlider:SetSize(5, 70)
        PreformAVEnablerThresholdSliderText:ClearAllPoints()
        PreformAVEnablerThresholdSliderText:SetPoint('LEFT', PreformAVEnablerThresholdSlider, 'RIGHT', 25, 10)
        PreformAVEnablerThresholdSliderMinValue:ClearAllPoints()
        PreformAVEnablerThresholdSliderMaxValue:ClearAllPoints()
        PreformAVEnablerThresholdSliderMinValue:SetPoint('BOTTOMLEFT', PreformAVEnablerThresholdSlider, 'BOTTOMRIGHT', 3, 0)
        PreformAVEnablerThresholdSliderMaxValue:SetPoint('TOPLEFT', PreformAVEnablerThresholdSlider, 'TOPRIGHT', 3, 0)

        PreformAVEnablerMembersScrollFrameScrollBar:ClearAllPoints()
        PreformAVEnablerMembersScrollFrameScrollBar:SetPoint('TOPLEFT', PreformAVEnablerMembersScrollFrame, 'TOPRIGHT', 1, -19)
        PreformAVEnablerMembersScrollFrameScrollBar:SetPoint('BOTTOMLEFT', PreformAVEnablerMembersScrollFrame, 'BOTTOMRIGHT', 1, 19)
        --PreformAVEnablerMembersScrollFrameScrollBar:SetSize(13, PreformAVEnablerMembersScrollFrame:GetHeight() - 19*2)

        S:HandleScrollBar(PreformAVEnablerMembersScrollFrameScrollBar)
        S:HandleSliderFrame(PreformAVEnablerThresholdSlider)
        S:HandleButton(PreformAVEnablerFrameStatusButton)
        S:HandleButton(PreformAVEnablerFrameCloseButton)
        S:HandleCheckBox(PreformAVEnablerButtonizeCheckButton)

        local function handleToggleButton(frame)
            frame:SetNormalTexture(E.Media.Textures.Minus)
            frame:SetPushedTexture(nil)
            frame:SetHighlightTexture(nil)
            hooksecurefunc(frame, "SetNormalTexture", function(self, texture)
                if find(texture, "MinusButton") then
                    self:GetNormalTexture():SetTexture(E.Media.Textures.Minus)
                elseif find(texture, "PlusButton") then
                    self:GetNormalTexture():SetTexture(E.Media.Textures.Plus)
                else
                    self:GetNormalTexture():SetTexture(0, 0, 0, 0)
                end
            end)
            hooksecurefunc(frame, "SetPushedTexture", function(self, texture)
                if find(texture, "MinusButton") then
                    self:GetPushedTexture():SetTexture(E.Media.Textures.Minus)
                elseif find(texture, "PlusButton") then
                    self:GetPushedTexture():SetTexture(E.Media.Textures.Plus)
                else
                    self:GetPushedTexture():SetTexture(0, 0, 0, 0)
                end
            end)
            hooksecurefunc(frame, "SetHighlightTexture", function(self, texture)
                if find(texture, "MinusButton") then
                    self:GetHighlightTexture():SetTexture(E.Media.Textures.Plus)
                elseif find(texture, "PlusButton") then
                    self:GetHighlightTexture():SetTexture(E.Media.Textures.Minus)
                else
                    self:GetHighlightTexture():SetTexture(0, 0, 0, 0)
                end
            end)
        end
        local function handleMemberFrame(frame)
            if not frame then return end
            frame:SetTemplate("Transparent")
            frame:SetBackdropColor(0,0,0,0)
            frame:SetBackdropBorderColor(0,0,0,0)
            --frame:SetSize(1028, 21)
        end
        --
        for i=1, 41 do
            handleMemberFrame(_G["PreformAVEnablerMember"..i])
        end
        --
        for i=1, 7 do
            handleToggleButton(_G["PreformAVEnablerHideButton"..i])
            S:HandleCheckBox(_G["PreformAVEnablerAutomateCheckButton"..i])
            S:HandleButton(_G["PreformAVEnablerFrameQueueButton"..i])
            S:HandleButton(_G["PreformAVEnablerFrameLeaveButton"..i])
            S:HandleButton(_G["PreformAVEnablerFrameJoinButton"..i])
        end
        --

		S:Unhook(PreformAVEnablerFrame, "Show")
	end)
    --

end)