local toggles = action_wheel:newPage()
action_wheel:setPage(toggles)
local prevPage

local modelConfig = require("config")
local slugcat = modelConfig.slugcat
local slugcatUpperBody = modelConfig.slugcatUpperBody
local slugcatLowerBody = modelConfig.slugcatLowerBody

local playerSize = false
local eyeHeight = false
local gunHide = false

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

    elseif item.id == "minecraft:crossbow" then
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

function pings.size(size)
	playerSize = size
	slugcat.FullBody:setScale(size and vec(1.68,1.68,1.68) or vec(1,1,1))

	log(size and "[Size] Player" or "[Size] Normal")
end

--- TOGGLES ---
toggles:newAction()
    :title("Size")
	:texture(textures["models.slugcat.icons"], 64, 96, 32, 32)
	:toggled(false)
	:onToggle(pings.size)
	:setColor(vectors.hexToRGB("#2c43b7"))
	:setHoverColor(vectors.hexToRGB("#95a1db"))
	:setToggleColor(vectors.hexToRGB("#57cee8"))
toggles:newAction()
	:title("Eye Height")
	:texture(textures["models.slugcat.icons"], 128, 0, 32, 32)
	:toggled(false)
	:onToggle(function(eye) eyeHeight = eye log(eye and "[Size] Off-Set (WARNING)" or "[EyeHeight] Vanilla") end)
	:setColor(vectors.hexToRGB("#2c43b7"))
	:setHoverColor(vectors.hexToRGB("#95a1db"))
	:setToggleColor(vectors.hexToRGB("#57cee8"))