if not host:isHost() then return end
colourPicker = {}
colourPicker.UI = {
	save = {
		boundries = {min = vectors.vec2(136,215), max = vectors.vec2(239,237)},
		isClicked = 0,
		buttonOutput = function()
			lastColour = vec(selectedColour.x,selectedColour.y,selectedColour.z)
			colourPicker.updateColours()
			config:save("colourPicker",selectedColour)
			colourPicker.colourSelectionData = nil
			host:setChatColor(1,1,1)
			
			colourPicker.onSubmit(vectors.hsvToRGB(selectedColour))
			colourPicker.toggle(false)
		end
	},
	red = {
		boundries = {min = vectors.vec2(210,17), max = vectors.vec2(239,28)},
		isClicked = 0,
		buttonOutput = function() colourPicker.updateColourField('red',math.floor(vectors.hsvToRGB(selectedColour).x*255)) end
	},
	redSlider = {
		boundries = {min = vectors.vec2(144,17), max = vectors.vec2(211,28)},
		isClicked = 0,
		directions = {x = true, y = false},
		sliderOutput = function(output)
			local rgb = vectors.hsvToRGB(selectedColour)
			rgb.x = output.x
			selectedColour = vectors.rgbToHSV(rgb)
			colourPicker.updateColours()
		end
	},
	green = {
		boundries = {min = vectors.vec2(210,27), max = vectors.vec2(239,38)},
		isClicked = 0,
		buttonOutput = function() colourPicker.updateColourField('green',math.floor(vectors.hsvToRGB(selectedColour).y*255)) end
	},
	greenSlider = {
		boundries = {min = vectors.vec2(144,27), max = vectors.vec2(211,38)},
		isClicked = 0,
		directions = {x = true, y = false},
		sliderOutput = function(output)
			local rgb = vectors.hsvToRGB(selectedColour)
			rgb.y = output.x
			selectedColour = vectors.rgbToHSV(rgb)
			colourPicker.updateColours()
		end
	},
	blue = {
		boundries = {min = vectors.vec2(210,37), max = vectors.vec2(239,48)},
		isClicked = 0,
		buttonOutput = function() colourPicker.updateColourField('blue',math.floor(vectors.hsvToRGB(selectedColour).z*255)) end
	},
	blueSlider = {
		boundries = {min = vectors.vec2(144,37), max = vectors.vec2(211,48)},
		isClicked = 0,
		directions = {x = true, y = false},
		sliderOutput = function(output)
			local rgb = vectors.hsvToRGB(selectedColour)
			rgb.z = output.x
			selectedColour = vectors.rgbToHSV(rgb)
			colourPicker.updateColours()
		end
	},
	hue = {
		boundries = {min = vectors.vec2(210,52), max = vectors.vec2(239,63)},
		isClicked = 0,
		buttonOutput = function() colourPicker.updateColourField('hue',math.floor(selectedColour.x*3600)/10) end
	},
	hueSlider = {
		boundries = {min = vectors.vec2(144,52), max = vectors.vec2(211,63)},
		isClicked = 0,
		directions = {x = true, y = false},
		sliderOutput = function(output)
			selectedColour.x =  output.x
			colourPicker.updateColours()
		end
	},
	saturation = {
		boundries = {min = vectors.vec2(210,62), max = vectors.vec2(239,73)},
		isClicked = 0,
		buttonOutput = function() colourPicker.updateColourField('saturation',math.floor(selectedColour.y*1000)/10) end
	},
	saturationSlider = {
		boundries = {min = vectors.vec2(144,62), max = vectors.vec2(211,73)},
		isClicked = 0,
		directions = {x = true, y = false},
		sliderOutput = function(output)
			selectedColour.y =  output.x
			colourPicker.updateColours()
		end
	},
	vibrance = {
		boundries = {min = vectors.vec2(210,72), max = vectors.vec2(239,83)},
		isClicked = 0,
		buttonOutput = function() colourPicker.updateColourField('vibrance',math.floor(selectedColour.z*1000)/10) end
	},
	vibranceSlider = {
		boundries = {min = vectors.vec2(144,72), max = vectors.vec2(211,83)},
		isClicked = 0,
		directions = {x = true, y = false},
		sliderOutput = function(output)
			selectedColour.z =  output.x
			colourPicker.updateColours()
		end
	},
	hex = {
		boundries = {min = vectors.vec2(136,197), max = vectors.vec2(239,208)},
		isClicked = 0,
		buttonOutput = function() colourPicker.updateColourField('hex','#'..vectors.rgbToHex(vectors.hsvToRGB(selectedColour))) end
	},
	hueSideSlider = {
		boundries = {min = vectors.vec2(113,17), max = vectors.vec2(128,237)},
		isClicked = 0,
		directions = {x = false, y = true},
		sliderOutput = function(output)
			selectedColour.x = 1-output.y
			colourPicker.updateColours()
		end
	},
	selectorSlider = {
		boundries = {min = vectors.vec2(17,17), max = vectors.vec2(114,237)},
		isClicked = 0,
		directions = {x = true, y = true},
		sliderOutput = function(output)
			selectedColour.y = output.x
			selectedColour.z = 1-output.y
			colourPicker.updateColours()
		end
	},
}

colourPicker.colorFeildMetadata = {
	red = {type = 'rgb', max = 255, axis = 'x'},
	green = {type = 'rgb', max = 255, axis = 'y'},
	blue = {type = 'rgb', max = 255, axis = 'z'},
	hue = {type = 'hsv', max = 360, axis = 'x'},
	saturation = {type = 'hsv', max = 100, axis = 'y'},
	vibrance = {type = 'hsv', max = 100, axis = 'z'},
	hex = {type = 'hex'}
}