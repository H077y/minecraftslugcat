if not host:isHost() then return end
require('scripts.api.colourPicker.tables')
require('scripts.api.colourPicker.UIHandler')
require('scripts.api.colourPicker.colourHandler')
local loadedData = config:load('colourPicker')
if loadedData then
	selectedColour = loadedData
	lastColour = loadedData
else
	selectedColour = vec(0.73583,0.523,0.937)
	lastColour = vec(0.73583,0.523,0.937)
end

function colourPicker.onSubmit(colour)
	-- code here is executed when the colour is choses, and the colour picker is closed
end

function colourPicker.toggle(toggleValue)
	-- this function toggles the colour picker. Run it to choose if its UI should be enabled / disabled
	colourPicker.isEnabled = toggleValue
	models.scripts.api.colourPicker.GUI.HUD.colourPicker:setVisible(toggleValue)
	host:setUnlockCursor(toggleValue)
	client:isHudEnabled(not toggleValue)
	if toggleValue then
		renderer:setCrosshairOffset(9999,0)
	else
		renderer:setCrosshairOffset(0,0)
	end
end

colourPicker.updateColours()





