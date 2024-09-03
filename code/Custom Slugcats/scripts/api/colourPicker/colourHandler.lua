if not host:isHost() then return end
require('scripts.api.colourPicker.tables')
colourPicker.textFields = {}

local highlightsPath = models.scripts.api.colourPicker.GUI.HUD.colourPicker.highlights
colourPicker.textFields.red = highlightsPath.red:newText('red'):setAlignment("RIGHT"):pos(-13,0,-10)
colourPicker.textFields.green = highlightsPath.green:newText('green'):setAlignment("RIGHT"):pos(-13,0,-10)
colourPicker.textFields.blue = highlightsPath.blue:newText('blue'):setAlignment("RIGHT"):pos(-13,0,-10)

colourPicker.textFields.hue = highlightsPath.hue:newText('hue'):setAlignment("RIGHT"):pos(-13,0,-10)
colourPicker.textFields.saturation = highlightsPath.saturation:newText('saturation'):setAlignment("RIGHT"):pos(-13,0,-10)
colourPicker.textFields.vibrance = highlightsPath.vibrance:newText('vibrance'):setAlignment("RIGHT"):pos(-13,0,-10)

colourPicker.textFields.hex = highlightsPath.hex:newText('hex'):setAlignment("CENTER"):pos(0,0,-10)
colourPicker.textFields.save = highlightsPath.save:newText('save'):setAlignment("CENTER"):pos(0,0,-10):setText('OK')

notification = models.scripts.api.colourPicker.GUI.HUD.colourPicker.textures.notification:newText('notification'):setAlignment("CENTER")

function colourPicker.updateColours()
	local selectedColourRGB = vectors.hsvToRGB(selectedColour)
	for k = 0, 31 do
		textures['scripts.api.colourPicker.textures.redSliderColour']:setPixel(k,0,k/31,selectedColourRGB.y,selectedColourRGB.z)
		textures['scripts.api.colourPicker.textures.greenSliderColour']:setPixel(k,0,selectedColourRGB.x,k/31,selectedColourRGB.z)
		textures['scripts.api.colourPicker.textures.blueSliderColour']:setPixel(k,0,selectedColourRGB.x,selectedColourRGB.y,k/31)

		textures['scripts.api.colourPicker.textures.hueSliderColour']:setPixel(k,0,vectors.hsvToRGB(k/31,selectedColour.y,selectedColour.z))
		textures['scripts.api.colourPicker.textures.saturationSliderColour']:setPixel(k,0,vectors.hsvToRGB(selectedColour.x,k/31,selectedColour.z))
		textures['scripts.api.colourPicker.textures.vibranceSliderColour']:setPixel(k,0,vectors.hsvToRGB(selectedColour.x,selectedColour.y,k/31))
	end

	for x = 0, 23 do
		for y = 0, 54 do
			textures['scripts.api.colourPicker.textures.selectorSliderColour']:setPixel(x,y,vectors.hsvToRGB(selectedColour.x,x/23,1-y/54))
		end
	end
	
	textures['scripts.api.colourPicker.textures.currentColourPreview']:setPixel(0,0,selectedColourRGB)
	textures['scripts.api.colourPicker.textures.lastColourPreview']:setPixel(0,0,vectors.hsvToRGB(lastColour))

	textures['scripts.api.colourPicker.textures.redSliderColour']:update()
	textures['scripts.api.colourPicker.textures.greenSliderColour']:update()
	textures['scripts.api.colourPicker.textures.blueSliderColour']:update()

	textures['scripts.api.colourPicker.textures.hueSliderColour']:update()
	textures['scripts.api.colourPicker.textures.saturationSliderColour']:update()
	textures['scripts.api.colourPicker.textures.vibranceSliderColour']:update()

	textures['scripts.api.colourPicker.textures.selectorSliderColour']:update()

	textures['scripts.api.colourPicker.textures.currentColourPreview']:update()
	textures['scripts.api.colourPicker.textures.lastColourPreview']:update()

	for k,v in pairs(colourPicker.colorFeildMetadata) do
		if v.type == 'rgb' then
			colourPicker.textFields[k]:setText(math.floor(selectedColourRGB[v.axis]*v.max*10)/10)
		elseif v.type == 'hsv' then
			colourPicker.textFields[k]:setText(math.floor(selectedColour[v.axis]*v.max*10)/10)
		else
			colourPicker.textFields[k]:setText('#'..vectors.rgbToHex(selectedColourRGB))
		end
	end
	local sliderPath = models.scripts.api.colourPicker.GUI.HUD.colourPicker.sliders
	sliderPath.redSliderX:setPos((-selectedColourRGB.x*66),0,0)
	sliderPath.greenSliderX:setPos((-selectedColourRGB.y*66),0,0)
	sliderPath.blueSliderX:setPos((-selectedColourRGB.z*66),0,0)

	sliderPath.hueSliderX:setPos((-selectedColour.x*66),0,0)
	sliderPath.saturationSliderX:setPos((-selectedColour.y*66),0,0)
	sliderPath.vibranceSliderX:setPos((-selectedColour.z*66),0,0)

	sliderPath.hueSideSliderY:setPos(0,(selectedColour.x*218-218),0)

	sliderPath.selectorSliderX:setPos((-selectedColour.y*95),0,0)
	sliderPath.selectorSliderY:setPos(0,(selectedColour.z*218-218),0)
end

function events.chat_send_message(message)
	if not colourPicker.colourSelectionData then return message end
	host:setChatColor(1,1,1)
	local value = tonumber(host:getChatText())
	if type(value) == "number" then
		if colourPicker.colorFeildMetadata[colourPicker.colourSelectionData].type == 'rgb' then
			local rgb = vectors.hsvToRGB(selectedColour)
			rgb[colourPicker.colorFeildMetadata[colourPicker.colourSelectionData].axis] = math.clamp(tonumber(host:getChatText()),0,colourPicker.colorFeildMetadata[colourPicker.colourSelectionData].max)/colourPicker.colorFeildMetadata[colourPicker.colourSelectionData].max
			selectedColour = vectors.rgbToHSV(rgb)
			colourPicker.updateColours()
		else
			selectedColour[colourPicker.colorFeildMetadata[colourPicker.colourSelectionData].axis] = math.clamp(tonumber(host:getChatText()),0,colourPicker.colorFeildMetadata[colourPicker.colourSelectionData].max)/colourPicker.colorFeildMetadata[colourPicker.colourSelectionData].max
			colourPicker.updateColours()
		end
	elseif colourPicker.colorFeildMetadata[colourPicker.colourSelectionData].type == 'hex' then
		selectedColour = vectors.rgbToHSV(vectors.hexToRGB(host:getChatText())) 
		colourPicker.updateColours() 
	else
		notification:setText('Please enter a number.')
		animations['scripts.api.colourPicker.GUI'].notification:play() 
	end
	host:appendChatHistory(message)
	colourPicker.colourSelectionData = nil
	sounds:playSound("block.stone_button.click_on",player:getPos())
	return
end

function colourPicker.updateColourField(field,value)
	if not host:isChatOpen() then
		notification:setText('Please open chat!\n"Chat Messages" must be enabled in figura settings.')
		animations['scripts.api.colourPicker.GUI'].notification:play()
		return
	end
	colourPicker.colourSelectionData = field
	host:setChatText(value)
	host:setChatColor(0.651,0.447,0.937)
end