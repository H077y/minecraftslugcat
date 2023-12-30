if not host:isHost() then return end
require('scripts.api.colourPicker.tables')
for k = 0,54 do
	textures['scripts.api.colourPicker.textures.hueSideSliderColour']:setPixel(0,k,vectors.hsvToRGB(-k/54,1,1))
end
textures['scripts.api.colourPicker.textures.hueSideSliderColour']:update()

function events.tick()
	if not colourPicker.isEnabled then return end
	models.scripts.api.colourPicker.GUI.HUD.colourPicker:setPos(-client.getScaledWindowSize().x/2,-client.getScaledWindowSize().y/2,0)

	for k,v in pairs(colourPicker.UI) do
		if models.scripts.api.colourPicker.GUI.HUD.colourPicker.highlights[k] ~= nil then
			models.scripts.api.colourPicker.GUI.HUD.colourPicker.highlights[k]:setColor(0.16,0.16,0.16)
		end
	end
	local getMousePos =  client:getMousePos()
	local getWindowSize = client.getScaledWindowSize()
	local getGuiScale = client:getGuiScale()

	local alignedToCorner = getMousePos/getWindowSize/getGuiScale - vectors.vec2(0.5-128/getWindowSize.x,0.5-128/getWindowSize.y)
	local mousePosUnclamped = vectors.vec2(alignedToCorner.x/(256/getWindowSize.x)*256,alignedToCorner.y/(256/getWindowSize.y)*256)
	mousePos = vectors.vec2(math.clamp(mousePosUnclamped.x,0,256),math.clamp(mousePosUnclamped.y,0,256))


	colourPicker.hoveredElement = colourPicker.checkBoundries(mousePos)
	if colourPicker.hoveredElement ~= nil then
		if colourPicker.UI[colourPicker.hoveredElement].isClicked == 1 then 
			if models.scripts.api.colourPicker.GUI.HUD.colourPicker.highlights[colourPicker.hoveredElement] ~= nil then
				models.scripts.api.colourPicker.GUI.HUD.colourPicker.highlights[colourPicker.hoveredElement]:setColor(0.4,0.4,0.4)
			end
		elseif colourPicker.UI[colourPicker.hoveredElement].isClicked == 0 and not colourPicker.selectedElement then
			
			if models.scripts.api.colourPicker.GUI.HUD.colourPicker.highlights[colourPicker.hoveredElement] ~= nil then
				models.scripts.api.colourPicker.GUI.HUD.colourPicker.highlights[colourPicker.hoveredElement]:setColor(0.32,0.32,0.32)
			end
		end
	end
	if colourPicker.selectedElement ~= nil then
		if colourPicker.UI[colourPicker.selectedElement].isClicked == 1 then
			if models.scripts.api.colourPicker.GUI.HUD.colourPicker.sliders[colourPicker.selectedElement..'X'] ~= nil or models.scripts.api.colourPicker.GUI.HUD.colourPicker.sliders[colourPicker.selectedElement..'Y'] ~= nil then
				local sliderOutput = {}
				for dir,dirIsTrue in pairs(colourPicker.UI[colourPicker.selectedElement].directions) do
					if dirIsTrue then
						local boundries = colourPicker.UI[colourPicker.selectedElement].boundries
						local min = boundries.min[dir]
						local max = boundries.max[dir]
						local difference = max - min
						sliderOutput[dir] = -math.clamp(min-mousePos[dir],-difference,0)/difference
					end
				end
				if colourPicker.UI[colourPicker.selectedElement].sliderOutput ~= nil then
					colourPicker.UI[colourPicker.selectedElement].sliderOutput(sliderOutput)
				end
			end
		end
	end
	if colourPicker.colourSelectionData then
		models.scripts.api.colourPicker.GUI.HUD.colourPicker.highlights[colourPicker.colourSelectionData]:setColor(0.4,0.4,0.4)
	end
end

function events.render()
	if action_wheel:isEnabled() then
		models.scripts.api.colourPicker.GUI.HUD.colourPicker:setVisible(false)
	else
		models.scripts.api.colourPicker.GUI.HUD.colourPicker:setVisible(colourPicker.isEnabled)
	end
	
end

function colourPicker.checkBoundries(mousePos)
	for k,v in pairs(colourPicker.UI) do
		if v.boundries.min < mousePos and mousePos < v.boundries.max then
			return k
		end
	end
end

function events.mouse_press(button,action)
	if not colourPicker.isEnabled then return end

	local getMousePos =  client:getMousePos()
	local getWindowSize = client.getScaledWindowSize()
	local getGuiScale = client:getGuiScale()

	local alignedToCorner = getMousePos/getWindowSize/getGuiScale - vectors.vec2(0.5-128/getWindowSize.x,0.5-128/getWindowSize.y)
	local mousePosUnclamped = vectors.vec2(alignedToCorner.x/(256/getWindowSize.x)*256,alignedToCorner.y/(256/getWindowSize.y)*256)
	mousePos = vectors.vec2(math.clamp(mousePosUnclamped.x,0,256),math.clamp(mousePosUnclamped.y,0,256))

	for k,v in pairs(colourPicker.UI) do
		v.isClicked = 0
	end
	
	if action == 1 then colourPicker.selectedElement = colourPicker.checkBoundries(mousePos) end
	
	if colourPicker.selectedElement == nil then return end
	colourPicker.UI[colourPicker.selectedElement].isClicked = action
	if action == 1 then return end
	if colourPicker.UI[colourPicker.selectedElement].buttonOutput ~= nil and colourPicker.selectedElement == colourPicker.hoveredElement then
		sounds:playSound("block.stone_button.click_on",player:getPos())
		colourPicker.UI[colourPicker.selectedElement].buttonOutput()
	end
	colourPicker.selectedElement = nil
end
