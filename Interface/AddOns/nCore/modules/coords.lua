
local f = CreateFrame('Frame')
f:SetParent(WorldMapFrame)

-- f.cursor = f:CreateFontString(nil, 'ARTWORK')
-- f.cursor:SetFontObject('GameFontNormal')
-- f.cursor:SetJustifyH('LEFT')
-- f.cursor:SetPoint('BOTTOMLEFT', WorldMapFrame, 'BOTTOM', -125, -20) -- WorldMapButton
        
f.player = f:CreateFontString(nil, 'ARTWORK')
f.player:SetFontObject('GameFontNormal')
f.player:SetJustifyH('RIGHT')
if ( WORLDMAP_SETTINGS.size == WORLDMAP_WINDOWED_SIZE ) then
	f.player:SetPoint("BOTTOM", WorldMapDetailFrame, "BOTTOM", 0, -20);
else
	f.player:SetPoint("BOTTOM", WorldMapPositioningGuide, "BOTTOM", 0, 10);
end

hooksecurefunc('WorldMapQuestShowObjectives_AdjustPosition', function()
	if ( WORLDMAP_SETTINGS.size == WORLDMAP_WINDOWED_SIZE ) then
		f.player:SetPoint("BOTTOM", WorldMapDetailFrame, "BOTTOM", 0, -20);
	else
		f.player:SetPoint("BOTTOM", WorldMapPositioningGuide, "BOTTOM", 0, 10);
	end
end)

f:SetScript('OnUpdate', function()
    local width = WorldMapButton:GetWidth() 
    local height = WorldMapButton:GetHeight()
    local mx, my = WorldMapFrame:GetCenter()
    local px, py = GetPlayerMapPosition('player')
    local cx, cy = GetCursorPosition()

    --mx = (((cx / WorldMapFrame:GetScale()) - (mx - width / 2)) / width + 22 / 10000)
    --my = ((((my + height / 2) - (cy / WorldMapFrame:GetScale())) / height) - 262 / 10000)

    --f.cursor:SetText(format('Cursor %.2d*%.2d', mx * 100, my * 100))
    f.player:SetText(format('%.2d x %.2d', px * 100, py * 100))
end)