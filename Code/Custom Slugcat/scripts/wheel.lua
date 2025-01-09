local menu = action_wheel:newPage()
local custom = action_wheel:newPage()
local eyes = action_wheel:newPage()
local shape = action_wheel:newPage()
local spear = action_wheel:newPage()
local feature = action_wheel:newPage()
local toggles = action_wheel:newPage()
local colour = action_wheel:newPage()
action_wheel:setPage(menu)
local prevPage

local modelConfig = require("config")
local slugcat = modelConfig.slugcat
local slugcatUpperBody = modelConfig.slugcatUpperBody
local slugcatLowerBody = modelConfig.slugcatLowerBody

local playerSize = false
local eyeHeight = false
local gunHide = false
local rot = false
local picker = nil
local primaryColour = vectors.hexToRGB("#ffffff")
local secondaryColour = vectors.hexToRGB("#ffffff")
local eyeSecondary = false
local markSecondary = false

require('scripts.api.colourPicker.core')

if host:isHost() then
  colourPicker.toggle(false)
end

function events.tick()

	local bootsEnchant = player:getItem(3).tag.Enchantments
	local leggingsEnchant = player:getItem(4).tag.Enchantments
	local chestplateEnchant = player:getItem(5).tag.Enchantments
	local helmetEnchant = player:getItem(6).tag.Enchantments
	
	local boots = player:getItem(3).id
	local leggings = player:getItem(4).id
	local chestplate = player:getItem(5).id
	local helmet = player:getItem(6).id
 	local mask = ((helmet == "minecraft:player_head") or (helmet == "minecraft:creeper_head") or (helmet == "minecraft:skeleton_skull") or (helmet == "minecraft:wither_skeleton_skull") or (helmet == "minecraft:piglin_head") or (helmet == "minecraft:zombie_head") or (helmet == "minecraft:dragon_head"))

	local color = helmet == "minecraft:leather_helmet" and vectors.hexToRGB("#8f6f5e")
		or (helmet == "minecraft:chainmail_helmet" or helmet == "minecraft:iron_helmet") and vectors.hexToRGB("#dcdcdc")
		or helmet == "minecraft:golden_helmet" and vectors.hexToRGB("#ffe26d")
		or helmet == "minecraft:diamond_helmet" and vectors.hexToRGB("#77f1e2")
		or helmet == "minecraft:netherite_helmet" and vectors.hexToRGB("#616161")
		or helmet == "minecraft:turtle_helmet" and vectors.hexToRGB("#3ca444")
		or none

	slugcatUpperBody.head.Helmet:setVisible((color ~= nil))
	slugcatUpperBody.head.Helmet:setColor(color)
	slugcatUpperBody.head.Helmet:setSecondaryRenderType((helmetEnchant == nil) and "NONE" or "GLINT")

	local maskVec = helmet == "minecraft:player_head" and vec(0,0)
		or helmet == "minecraft:creeper_head" and vec(9,0)
		or helmet == "minecraft:skeleton_skull" and vec(18,0)
		or helmet == "minecraft:wither_skeleton_skull" and vec(18,16)
		or helmet == "minecraft:piglin_head" and vec(34,0)
		or none
	
	slugcatUpperBody.head.Masks.NotSadMask:setUVPixels(maskVec)
	
	slugcatUpperBody.head.Masks.NotSadMask.BaseMask:setVisible((mask == true and helmet ~= "minecraft:zombie_head" and helmet ~= "minecraft:dragon_head"))
	slugcatUpperBody.head.Masks.NotSadMask.Horns:setVisible((mask == true and (helmet == "minecraft:skeleton_skull" or helmet == "minecraft:wither_skeleton_skull")))
	slugcatUpperBody.head.Masks.NotSadMask.Spikes:setVisible((mask == true and helmet == "minecraft:piglin_head"))
	slugcatUpperBody.head.Masks.SadMask:setVisible((mask == true and helmet == "minecraft:zombie_head"))
	slugcatUpperBody.head.Masks.ChiefMask:setVisible((mask == true and helmet == "minecraft:dragon_head"))
  
	local color =  chestplate == "minecraft:leather_chestplate" and vectors.hexToRGB("#8f6f5e")
		or (chestplate == "minecraft:chainmail_chestplate" or chestplate == "minecraft:iron_chestplate") and vectors.hexToRGB("#dcdcdc")
		or chestplate == "minecraft:golden_chestplate" and vectors.hexToRGB("#ffe26d")
		or chestplate == "minecraft:diamond_chestplate" and vectors.hexToRGB("#77f1e2")
		or chestplate == "minecraft:netherite_chestplate" and vectors.hexToRGB("#616161")
		or none

	slugcatUpperBody.Body.Chestplate:setVisible((color ~= nil))
	slugcatUpperBody.Body.Tail1.Chestplate:setVisible((color ~= nil))
	slugcatUpperBody.Body.Tail1.Tail2.Chestplate:setVisible((color ~= nil))
	slugcatUpperBody.Body.Chestplate:setColor(color)
	slugcatUpperBody.Body.Tail1.Chestplate:setColor(color)
	slugcatUpperBody.Body.Tail1.Tail2.Chestplate:setColor(color)
	slugcatUpperBody.Body.Chestplate:setSecondaryRenderType((chestplateEnchant == nil) and "NONE" or "GLINT")
	slugcatUpperBody.Body.Tail1.Chestplate:setSecondaryRenderType((chestplateEnchant == nil) and "NONE" or "GLINT")
	slugcatUpperBody.Body.Tail1.Tail2.Chestplate:setSecondaryRenderType((chestplateEnchant == nil) and "NONE" or "GLINT")

	slugcatUpperBody.Body.Main.Rot:setVisible((rot == true and color == nil))
  
	local color =  leggings == "minecraft:leather_leggings" and vectors.hexToRGB("#8f6f5e")
		or (leggings == "minecraft:chainmail_leggings" or leggings == "minecraft:iron_leggings") and vectors.hexToRGB("#dcdcdc")
		or leggings == "minecraft:golden_leggings" and vectors.hexToRGB("#ffe26d")
		or leggings == "minecraft:diamond_leggings" and vectors.hexToRGB("#77f1e2")
		or leggings == "minecraft:netherite_leggings" and vectors.hexToRGB("#616161")
		or none

	slugcatLowerBody.LeftLeg.Leggings:setVisible((color ~= nil))
	slugcatLowerBody.RightLeg.Leggings:setVisible((color ~= nil))
	slugcatLowerBody.LeftLeg.Leggings:setColor(color)
	slugcatLowerBody.RightLeg.Leggings:setColor(color)
	slugcatLowerBody.LeftLeg.Leggings:setSecondaryRenderType((leggingsEnchant == nil) and "NONE" or "GLINT")
	slugcatLowerBody.RightLeg.Leggings:setSecondaryRenderType((leggingsEnchant == nil) and "NONE" or "GLINT")
  
	local color =  boots == "minecraft:leather_boots" and vectors.hexToRGB("#8f6f5e")
		or (boots == "minecraft:chainmail_boots" or boots == "minecraft:iron_boots") and vectors.hexToRGB("#dcdcdc")
        or boots == "minecraft:golden_boots" and vectors.hexToRGB("#ffe26d")
        or boots == "minecraft:diamond_boots" and vectors.hexToRGB("#77f1e2")
        or boots == "minecraft:netherite_boots" and vectors.hexToRGB("#616161")
		or none

	slugcatLowerBody.LeftLeg.Boots:setVisible((color ~= nil))
	slugcatLowerBody.RightLeg.Boots:setVisible((color ~= nil))
	slugcatLowerBody.LeftLeg.Boots:setColor(color)
	slugcatLowerBody.RightLeg.Boots:setColor(color)
	slugcatLowerBody.LeftLeg.Boots:setSecondaryRenderType((bootsEnchant == nil) and "NONE" or "GLINT")
	slugcatLowerBody.RightLeg.Boots:setSecondaryRenderType((bootsEnchant == nil) and "NONE" or "GLINT")
end

function events.item_render(item, mode, pos, rot, scale, lefty)
    if item.id == "minecraft:trident" then
        if lefty then
			return slugcat.Items.ItemSpear:setPos(-0.25,0,0)
		else
			return slugcat.Items.ItemSpear:setPos(0.25,0,0)
		end

    elseif item.id == "minecraft:egg" then
        if lefty then
			return slugcat.Items.ItemRock:setPos(-0.5,0,0)
		else
			return slugcat.Items.ItemRock:setPos(0.5,0,0)
		end

    elseif item.id == "minecraft:snowball" then
        if lefty then
			return slugcat.Items.ItemBrick:setPos(-0.5,0,0)
		else
			return slugcat.Items.ItemBrick:setPos(0.5,0,0)
		end

    elseif item.id == "minecraft:amethyst_shard" then
        if lefty then
			return slugcat.Items.ItemPearl:setPos(-0.5,0,0)
		else
			return slugcat.Items.ItemPearl:setPos(0.5,0,0)
		end

	elseif item.id == "minecraft:crossbow" and not gunHide then
		if lefty then
		  return slugcat.Items.ItemGun:setPos(-0.5,0,0)
		else
		  return slugcat.Items.ItemGun:setPos(0.5,0,0)
		end

    elseif item.id == "minecraft:shield" then
		if lefty then
			return slugcat.Items.ItemShield:setRot(0,90,0):setPos(0.25,0,0)
		else
			return slugcat.Items.ItemShield:setRot(0,-90,0):setPos(0.5,0,0)
		end

    end
end

function events.render()
	local pose = player:getPose()
    local inLiquid = player:isInWater() or player:isInLava()
	if pose == "SWIMMING" and inLiquid == false then
		renderer:offsetCameraPivot(vec(0,0,0))
		renderer:setEyeOffset(vec(0,0,0))
	else
		renderer:offsetCameraPivot((eyeHeight and not playerSize) and vec(0,-0.65,0) or vec(0,0,0))
		renderer:setEyeOffset((eyeHeight and not playerSize) and vec(0,-0.65,0) or vec(0,0,0))
	end
end

function pings.shape(shape)
	slugcat.FullBody:setScale((shape == "gourmand") and ((playerSize and vec(1.73,1.73,1.73) or vec(1.05,1,1.05))) or ((playerSize and vec(1.68,1.68,1.68) or vec(1,1,1))))
	
	slugcatUpperBody.Body.Main.Base:setVisible((shape ~= "spearmaster"))
	slugcatUpperBody.Arms.LeftArm.Main.Base:setVisible((shape ~= "gourmand" and shape ~= "spearmaster"))
	slugcatUpperBody.Arms.RightArm.Main.Base:setVisible((shape ~= "gourmand" and shape ~= "spearmaster"))
	slugcatLowerBody.LeftLeg.Main.Base:setVisible((shape ~= "gourmand" and shape ~= "spearmaster"))
	slugcatLowerBody.RightLeg.Main.Base:setVisible((shape ~= "gourmand" and shape ~= "spearmaster"))
	slugcatUpperBody.Body.Tail1:setScale((shape == "spearmaster") and vec(1.15,1.15,1.15) or vec(1,1,1))
	
	slugcatUpperBody.head.Main.Gourmand:setVisible((shape == "gourmand"))
	slugcatUpperBody.Body.Main.Gourmand:setVisible((shape == "gourmand"))
	slugcatUpperBody.Arms.LeftArm.Main.Gourmand:setVisible((shape == "gourmand"))
	slugcatUpperBody.Arms.RightArm.Main.Gourmand:setVisible((shape == "gourmand"))
	slugcatLowerBody.LeftLeg.Main.Gourmand:setVisible((shape == "gourmand"))
	slugcatLowerBody.RightLeg.Main.Gourmand:setVisible((shape == "gourmand"))

	slugcatUpperBody.Body.Main.Spearmaster:setVisible((shape == "spearmaster"))
	slugcatUpperBody.Arms.LeftArm.Main.Spearmaster:setVisible((shape == "spearmaster"))
	slugcatUpperBody.Arms.RightArm.Main.Spearmaster:setVisible((shape == "spearmaster"))
	slugcatLowerBody.LeftLeg.Main.Spearmaster:setVisible((shape == "spearmaster"))
	slugcatLowerBody.RightLeg.Main.Spearmaster:setVisible((shape == "spearmaster"))

	log("[Shape]", shape)
end

function pings.eyes(eyes)
	slugcatUpperBody.head.Main.Eyes.Artificer:setVisible((eyes == "artificer"))
	slugcatUpperBody.head.Main.Eyes.Saint:setVisible((eyes == "saint"))
	slugcatUpperBody.head.Main.Eyes.Hunter:setVisible((eyes == "hunter"))
	slugcatUpperBody.head.Main.Eyes.Rivulet:setVisible((eyes == "rivulet"))
	slugcatUpperBody.head.Main.Eyes.AscendedSaint:setVisible((eyes =="ascendedSaint"))
	slugcatUpperBody.head.Main.Eyes.Base:setVisible((eyes == "base"))

	log("[Eyes]", eyes)
end

function pings.eyeColour(eyeColour)

	eyeSecondary = eyeColour

	slugcatUpperBody.head.Main.Base.Mouth:setUVPixels(eyeColour and vec(0,-33) or vec(0,0)):setColor(eyeColour and secondaryColour or vectors.hexToRGB("#ffffff"))
	slugcatUpperBody.head.Main.Gourmand.Mouth:setUVPixels(eyeColour and vec(0,-33) or vec(0,0)):setColor(eyeColour and secondaryColour or vectors.hexToRGB("#ffffff"))
	slugcatUpperBody.head.Main.Eyes.Base:setUVPixels(eyeColour and vec(0,-33) or vec(0,0)):setColor(eyeColour and secondaryColour or vectors.hexToRGB("#ffffff"))
	slugcatUpperBody.head.Main.Eyes.Saint:setUVPixels(eyeColour and vec(0,-33) or vec(0,0)):setColor(eyeColour and secondaryColour or vectors.hexToRGB("#ffffff"))
	slugcatUpperBody.head.Main.Eyes.Artificer.ArtificerEyes:setUVPixels(eyeColour and vec(0,-33) or vec(0,0)):setColor(eyeColour and secondaryColour or vectors.hexToRGB("#ffffff"))
	slugcatUpperBody.head.Main.Eyes.Hunter.Eyes:setUVPixels(eyeColour and vec(0,-33) or vec(0,0)):setColor(eyeColour and secondaryColour or vectors.hexToRGB("#ffffff"))
	slugcatUpperBody.head.Main.Eyes.Rivulet.InnerEye:setUVPixels(eyeColour and vec(0,-33) or vec(0,0)):setColor(eyeColour and secondaryColour or vectors.hexToRGB("#ffffff"))

	log(eyeColour and "[EyeNose] Secondary" or "[EyeNose] Black")
end

function pings.markColour(markColour)

	markSecondary = markColour
		
	slugcat.FullBody.AscensionMark:setColor(markColour and secondaryColour or primaryColour)
	slugcat.FullBody.ComMark:setColor(markColour and secondaryColour or primaryColour)

	log(markColour and "[Mark] Secondary" or "[Mark] Primary")
end

function pings.spear(spear)
	slugcat.Items.ItemSpear.Explosive:setVisible((spear == "explosive"))

	slugcat.Items.ItemSpear.Base:setVisible((spear ~= "spearmaster"))
	slugcat.Items.ItemSpear.Spearmaster:setVisible((spear == "spearmaster"))

	log("[Spear]", spear)
end

function pings.size(size)
	playerSize = size
	slugcat.FullBody:setScale(size and vec(1.68,1.68,1.68) or vec(1,1,1))

	log(size and "[Size] Player" or "[Size] Normal")
end

function pings.tongue(tongue)
	slugcatUpperBody.head.Main.Tongue1:setVisible(tongue and true or false)

	log(tongue and "[Tongue] On" or "[Tongue] Off")
end

function pings.ascensionMark(ascensionMark)
	slugcat.FullBody.AscensionMark:setVisible(ascensionMark and true or false)

	log(ascensionMark and "[Ascension] On" or "[Ascension] Off")
end

function pings.featureRot(enabled)
	slugcatUpperBody.Body.Main.Rot:setVisible(enabled)
	rot = enabled

	log("[Feature]", (enabled and "+" or "-").." Rot")
end

function pings.featureBurn(enabled)
	slugcatUpperBody.head.Main.Burn:setVisible(enabled)

	log("[Feature]", (enabled and "+" or "-").." Burn")
end

function pings.featureGills(enabled)
	slugcatUpperBody.head.Main.Gills:setVisible(enabled)

	log("[Feature]", (enabled and "+" or "-").." Gills")
end

function pings.featureSpikes(enabled)
	slugcatUpperBody.Body.Tail1.Main.Spearmaster:setVisible(enabled)
	slugcatUpperBody.Body.Tail1.Tail2.Main.Spearmaster:setVisible(enabled)
	slugcatUpperBody.Body.Tail1.Tail2.Tail3.Spearmaster:setVisible(enabled)
	slugcatUpperBody.Body.Tail1.Tail2.Tail3.Tail4.Spearmaster:setVisible(enabled)

	log("[Feature]", (enabled and "+" or "-").." Tail Spikes")
end

function pings.featureMarks(enabled)
	slugcatUpperBody.head.Main.Marks:setVisible(enabled)

	log("[Feature]", (enabled and "+" or "-").." Marks")
end

--- MENU ---
menu:newAction()
	:title("Custom Slugcat")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 32, 96, 32, 32)
	:onLeftClick(function()
	    prevPage = action_wheel:getCurrentPage()
  	    action_wheel:setPage(custom)
    end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
menu:newAction()
	:title("Toggles")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 0, 96, 32, 32)
	:onLeftClick(function()
		prevPage = action_wheel:getCurrentPage()
		action_wheel:setPage(toggles)
	end)
	:setColor(vectors.hexToRGB("#2c43b7"))
	:setHoverColor(vectors.hexToRGB("#95a1db"))

--- CUSTOM ---
custom:newAction()
	:title("Back")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 64, 64, 32, 32)
    :onLeftClick(function()
		action_wheel:setPage(prevPage)
  	end)
	:setColor(vectors.hexToRGB("#b82934"))
	:setHoverColor(vectors.hexToRGB("#db9499"))
custom:newAction()
	:title("Colours")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 160, 96, 32, 32)
	:onLeftClick(function() action_wheel:setPage(colour) end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
custom:newAction()
	:title("Eyes")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 128, 64, 32, 32)
	:onLeftClick(function() action_wheel:setPage(eyes) end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
custom:newAction()
	:title("Shape")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 128, 96, 32, 32)
	:onLeftClick(function() action_wheel:setPage(shape) end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
custom:newAction()
	:title("Feature")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 160, 32, 32, 32)
	:onLeftClick(function() action_wheel:setPage(feature) end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
custom:newAction()
	:title("Spear")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 160, 0, 32, 32)
	:onLeftClick(function() action_wheel:setPage(spear) end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))

--- COLOUR PICKER ---
colour:newAction()
	:title("Back")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 64, 64, 32, 32)
    :onLeftClick(function()
		action_wheel:setPage(custom)
  	end)
	:setColor(vectors.hexToRGB("#b82934"))
	:setHoverColor(vectors.hexToRGB("#db9499"))

pings.setColor = function (color,picker)
	if picker == "primary" then
		slugcatUpperBody.head.Main.Eyes.Hunter.Scar:setColor(color)
		slugcatUpperBody.head.Main.Burn:setColor(color)
		slugcatUpperBody.head.Main.Ears:setColor(color)
		slugcatUpperBody.head.Main.Base.Main:setColor(color)
		slugcatUpperBody.head.Main.Base.Snout:setColor(color)
		slugcatUpperBody.head.Main.Gourmand.Main:setColor(color)
		slugcatUpperBody.head.Main.Gourmand.Snout:setColor(color)
		
		slugcatUpperBody.Body.Main:setColor(color)
		slugcatUpperBody.Body.Tail1.Main.tail:setColor(color)
		slugcatUpperBody.Body.Tail1.Tail2.Main.tail:setColor(color)
		slugcatUpperBody.Body.Tail1.Tail2.Tail3.tail:setColor(color)
		slugcatUpperBody.Body.Tail1.Tail2.Tail3.Tail4.tail:setColor(color)

		slugcatUpperBody.Arms.LeftArm.Main:setColor(color)
		slugcatUpperBody.Arms.RightArm.Main:setColor(color)

		slugcatLowerBody.LeftLeg.Main:setColor(color)
		slugcatLowerBody.RightLeg.Main:setColor(color)

		primaryColour = color
		if markSecondary == false then
			pings.markColour(false)
		end
	else
		slugcatUpperBody.head.Main.Eyes.AscendedSaint:setColor(color)
		slugcatUpperBody.head.Main.Eyes.Rivulet.OuterEye:setColor(color)
		slugcatUpperBody.head.Main.Gills:setColor(color)
		slugcatUpperBody.head.Main.Marks:setColor(color)
		slugcatUpperBody.head.Main.Tongue1:setColor(color)
		
		slugcatUpperBody.Body.Tail1.Main.Spearmaster:setColor(color)
		slugcatUpperBody.Body.Tail1.Tail2.Main.Spearmaster:setColor(color)
		slugcatUpperBody.Body.Tail1.Tail2.Tail3.Spearmaster:setColor(color)
		slugcatUpperBody.Body.Tail1.Tail2.Tail3.Tail4.Spearmaster:setColor(color)

		secondaryColour = color
		if eyeSecondary == true then
			pings.eyeColour(true)
		end
		if markSecondary == true then
			pings.markColour(true)
		end
	end
end
if host:isHost() then
	function colourPicker.onSubmit(colour)
		pings['setColor'](colour,picker)
	end
end

colour:newAction()
    :title("Mark Colour")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 96, 64, 32, 32)
	:toggled(false)
	:onToggle(pings.markColour)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
	:setToggleColor(vectors.hexToRGB("#722dbd"))
colour:newAction()
	:setTitle('Secondary Colour')
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 160, 32, 32, 32)
	:onLeftClick(function() colourPicker.toggle(true) picker = "secondary" end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
colour:newAction()
	:setTitle('Primary Colour')
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 160, 64, 32, 32)
	:onLeftClick(function() colourPicker.toggle(true) picker = "primary" end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))

--- EYES ---
eyes:newAction()
	:title("Back")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 64, 64, 32, 32)
    :onLeftClick(function()
		action_wheel:setPage(custom)
  	end)
	:setColor(vectors.hexToRGB("#b82934"))
	:setHoverColor(vectors.hexToRGB("#db9499"))
eyes:newAction()
    :title("Colour")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 96, 0, 32, 32)
	:toggled(false)
	:onToggle(pings.eyeColour)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
eyes:newAction()
	:title("Base")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 0, 0, 32, 32)
	:onLeftClick(function() pings.eyes("base") end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
eyes:newAction()
	:title("Hunter")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 64, 0, 32, 32)
	:onLeftClick(function() pings.eyes("hunter") end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
eyes:newAction()
	:title("Artificer")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 0, 32, 32, 32)
	:onLeftClick(function() pings.eyes("artificer") end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
eyes:newAction()
    :title("Rivulet")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 64, 32, 32, 32)
	:onLeftClick(function() pings.eyes("rivulet") end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
eyes:newAction()
    :title("Saint")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 0, 64, 32, 32)
	:onLeftClick(function() pings.eyes("saint") end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))

--- SHAPE ---
shape:newAction()
	:title("Back")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 64, 64, 32, 32)
    :onLeftClick(function()
		action_wheel:setPage(custom)
  	end)
	:setColor(vectors.hexToRGB("#b82934"))
	:setHoverColor(vectors.hexToRGB("#db9499"))
shape:newAction()
	:title("Base")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 0, 0, 32, 32)
	:onLeftClick(function() pings.shape("base") end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
shape:newAction()
    :title("Gourmand")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 32, 32, 32, 32)
	:onLeftClick(function() pings.shape("gourmand") end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
shape:newAction()
    :title("Spearmaster")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 96, 32, 32, 32)
	:onLeftClick(function() pings.shape("spearmaster") end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))

--- SPEAR ---
spear:newAction()
	:title("Back")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 64, 64, 32, 32)
    :onLeftClick(function()
		action_wheel:setPage(custom)
  	end)
	:setColor(vectors.hexToRGB("#b82934"))
	:setHoverColor(vectors.hexToRGB("#db9499"))
spear:newAction()
	:title("Base")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 0, 0, 32, 32)
	:onLeftClick(function() pings.spear("base") end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
spear:newAction()
	:title("Explosive")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 0, 32, 32, 32)
	:onLeftClick(function() pings.spear("explosive") end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
spear:newAction()
    :title("Spearmaster")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 96, 32, 32, 32)
	:onLeftClick(function() pings.spear("spearmaster") end)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))

--- FEATURE ---
feature:newAction()
	:title("Back")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 64, 64, 32, 32)
    :onLeftClick(function()
		action_wheel:setPage(custom)
  	end)
	:setColor(vectors.hexToRGB("#b82934"))
	:setHoverColor(vectors.hexToRGB("#db9499"))
feature:newAction()
    :title("Rot")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 64, 0, 32, 32)
	:toggled(false)
	:onToggle(pings.featureRot)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
	:setToggleColor(vectors.hexToRGB("#722dbd"))
feature:newAction()
    :title("Burn")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 0, 32, 32, 32)
	:toggled(false)
	:onToggle(pings.featureBurn)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
	:setToggleColor(vectors.hexToRGB("#722dbd"))
feature:newAction()
    :title("Gills")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 64, 32, 32, 32)
	:toggled(false)
	:onToggle(pings.featureGills)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
	:setToggleColor(vectors.hexToRGB("#722dbd"))
feature:newAction()
    :title("Tail Spikes")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 96, 32, 32, 32)
	:toggled(false)
	:onToggle(pings.featureSpikes)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
	:setToggleColor(vectors.hexToRGB("#722dbd"))
feature:newAction()
    :title("Face Marks")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 0, 64, 32, 32)
	:toggled(false)
	:onToggle(pings.featureMarks)
	:setColor(vectors.hexToRGB("#f691ff"))
	:setHoverColor(vectors.hexToRGB("#fac8ff"))
	:setToggleColor(vectors.hexToRGB("#722dbd"))

--- TOGGLES ---
toggles:newAction()
	:title("Back")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 64, 64, 32, 32)
    :onLeftClick(function()
		action_wheel:setPage(prevPage)
  	end)
	:setColor(vectors.hexToRGB("#b82934"))
	:setHoverColor(vectors.hexToRGB("#db9499"))
toggles:newAction()
    :title("Size")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 64, 96, 32, 32)
	:toggled(false)
	:onToggle(pings.size)
	:setColor(vectors.hexToRGB("#2c43b7"))
	:setHoverColor(vectors.hexToRGB("#95a1db"))
	:setToggleColor(vectors.hexToRGB("#57cee8"))
toggles:newAction()
	:title("Eye Height")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 128, 0, 32, 32)
	:toggled(false)
	:onToggle(function(eye) eyeHeight = eye log(eye and "[Size] Off-Set (WARNING)" or "[EyeHeight] Vanilla") end)
	:setColor(vectors.hexToRGB("#2c43b7"))
	:setHoverColor(vectors.hexToRGB("#95a1db"))
	:setToggleColor(vectors.hexToRGB("#57cee8"))
toggles:newAction()
	:title("Saint Tongue")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 96, 96, 32, 32)
	:toggled(false)
	:onToggle(pings.tongue)
	:setColor(vectors.hexToRGB("#2c43b7"))
	:setHoverColor(vectors.hexToRGB("#95a1db"))
	:setToggleColor(vectors.hexToRGB("#57cee8"))
toggles:newAction()
	:title("[SPOILER] Mark")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 96, 64, 32, 32)
	:toggled(false)
	:onToggle(pings.ascensionMark)
	:setColor(vectors.hexToRGB("#2c43b7"))
	:setHoverColor(vectors.hexToRGB("#95a1db"))
	:setToggleColor(vectors.hexToRGB("#57cee8"))

toggles:newAction()
    :title("Hide Gun")
	:texture(textures["textures.icons"] or textures["models.slugcat.icons"], 128, 32, 32, 32)
	:toggled(false)
	:onToggle(function(gun) gunHide = gun log(gun and "[Gun] Hidden" or "[Gun] Visible")end)
	:setColor(vectors.hexToRGB("#2c43b7"))
	:setHoverColor(vectors.hexToRGB("#95a1db"))
	:setToggleColor(vectors.hexToRGB("#57cee8"))