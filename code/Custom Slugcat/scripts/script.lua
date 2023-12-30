local modelConfig = require("config")
local slugcat = modelConfig.slugcat
local slugcatUpperBody = modelConfig.slugcatUpperBody
local slugcatLowerBody = modelConfig.slugcatLowerBody

vanilla_model.PLAYER:setVisible(false)
vanilla_model.ARMOR:setVisible(false)

require("scripts.api.GSAnimBlend")
local anims = require("scripts.api.JimmyAnims")
anims.blendTime = 1
anims.itemBlendTime = 2
anims.autoBlend = true
anims(animations["models.slugcat"])

local squapi = require("scripts.api.SquAPI")
squapi.smoothHead(slugcatUpperBody.head, 0.25, true)
local tail_array = {slugcatUpperBody.Body.Tail1, slugcatUpperBody.Body.Tail1.Tail2, slugcatUpperBody.Body.Tail1.Tail2.Tail3, slugcatUpperBody.Body.Tail1.Tail2.Tail3.Tail4}
squapi.tails(tail_array, 3, 15, 5, 2, 1.2, 0, 0, 1, .0005, .06, nil, nil)
squapi.eye(slugcatUpperBody.head.Main.Eyes, 0.5, 0.5, nil, nil, false)
squapi.blink(animations["models.slugcat"].blink, nil)
squapi.ear(slugcatUpperBody.head.Main.Ears.LeftEar, slugcatUpperBody.head.Main.Ears.RightEar, true, nil, nil, nil, nil, nil, nil)
squapi.ear(slugcatUpperBody.head.Main.Gills.Left, slugcatUpperBody.head.Main.Gills.Right, true, 1000, 0.5, nil, nil, nil, nil)
squapi.bouncewalk(slugcat, 0.4)

local SwingingPhysics = require("scripts.api.swinging_physics")
--- Adds swinging physics to a part that is attached to the head
---@param part ModelPart The model part that should swing
---@param dir number Angle in degree, where the part is located relative to the center of the head. Imagine a stick pointing out in that direction with the model part hanging from its end. 0 means forward, 45 means diagonally forward and left, 90 means straight left and so on
---@param limits table|nil Limits the rotation of the part to make it appear like its colliding with something. Format: {xLow, xHigh, yLow, yHigh, zLow, zHigh} (optional)
---@param root ModelPart|nil Required if it is part of a chain. Note that the first chain element does not need this root parameter, and does also not need the depth parameter. Only following chain links need it.
---@paramt depth number|nil An integer that should increase by 1 for each consecutive chain link after the root. The root itself doesnt need this parameter. This increases the friction which makes it look more realistic.
SwingingPhysics.swingOnHead(slugcatUpperBody.head.Main.Tongue1, 0, {-45,-35, 0,20, -25,25}, nil, nil)
SwingingPhysics.swingOnHead(slugcatUpperBody.head.Main.Tongue1.Tongue2, 0, {-35,-25, 0,30, -25,25}, slugcatUpperBody.head.Main.Tongue1, 1)
SwingingPhysics.swingOnHead(slugcatUpperBody.head.Main.Tongue1.Tongue2.Tongue3, 0, {-25,-15, 0,40, -25,25}, slugcatUpperBody.head.Main.Tongue1, 2)
SwingingPhysics.swingOnHead(slugcatUpperBody.head.Main.Tongue1.Tongue2.Tongue3.Tongue4, 0, {-15,-5, 0,50, -25,25}, slugcatUpperBody.head.Main.Tongue1, 3)

slugcatUpperBody.head.Masks.ChiefMask.LeftAntler.LeftAntlerChunk1.physBoneLeftAntlerPearl1.Pearl:setSecondaryRenderType("GLINT")
slugcatUpperBody.head.Masks.ChiefMask.LeftAntler.LeftAntlerChunk2.physBoneLeftAntlerPearl2.Pearl:setSecondaryRenderType("GLINT")
slugcatUpperBody.head.Masks.ChiefMask.LeftAntler.LeftAntlerUpper1.LeftAntlerChunk3.physBoneLeftAntlerPearl3.Pearl:setSecondaryRenderType("GLINT")
slugcatUpperBody.head.Masks.ChiefMask.LeftAntler.LeftAntlerUpper1.LeftAntlerUpper2.LeftAntlerChunk4.physBoneLeftAntlerPearl4.Pearl:setSecondaryRenderType("GLINT")
slugcatUpperBody.head.Masks.ChiefMask.LeftAntler.LeftAntlerUpper1.LeftAntlerUpper2.LeftAntlerChunk5.physBoneLeftAntlerPearl5.Pearl:setSecondaryRenderType("GLINT")
slugcatUpperBody.head.Masks.ChiefMask.RightAntler.RightAntlerChunk1.physBoneRightAntlerPearl1.Pearl:setSecondaryRenderType("GLINT")
slugcatUpperBody.head.Masks.ChiefMask.RightAntler.RightAntlerChunk2.physBoneRightAntlerPearl2.Pearl:setSecondaryRenderType("GLINT")
slugcatUpperBody.head.Masks.ChiefMask.RightAntler.RightAntlerUpper1.RightAntlerChunk3.physBoneRightAntlerPearl3.Pearl:setSecondaryRenderType("GLINT")
slugcatUpperBody.head.Masks.ChiefMask.RightAntler.RightAntlerUpper1.RightAntlerUpper2.RightAntlerChunk4.physBoneRightAntlerPearl4.Pearl:setSecondaryRenderType("GLINT")
slugcatUpperBody.head.Masks.ChiefMask.RightAntler.RightAntlerUpper1.RightAntlerUpper2.RightAntlerChunk5.physBoneRightAntlerPearl5.Pearl:setSecondaryRenderType("GLINT")

SwingingPhysics.swingOnBody(slugcat.Items.ItemSpear.Explosive.Explosive1, 0, {-80,80, -80,80, -25,25}, nil, nil)
SwingingPhysics.swingOnBody(slugcat.Items.ItemSpear.Explosive.Explosive1.Explosive2, 0, {-85,85, -85,85, -25,25}, slugcat.Items.ItemSpear.Explosive.Explosive1, 1)
SwingingPhysics.swingOnBody(slugcat.Items.ItemSpear.Explosive.Explosive1.Explosive2.Explosive3, 0, {-90,90, -90,90, -25,25}, slugcat.Items.ItemSpear.Explosive.Explosive1, 2)
SwingingPhysics.swingOnBody(slugcat.Items.ItemSpear.Explosive.Explosive1.Explosive2.Explosive3.Explosive4, 0, {-95,95, -95,95, -25,25}, slugcat.Items.ItemSpear.Explosive.Explosive1, 3)

slugcatUpperBody.Arms.LeftArm.Main.Gourmand.Down.LeftItemPivot:setScale(0.68,0.68,0.68)
slugcatUpperBody.Arms.RightArm.Main.Gourmand.Down.RightItemPivot:setScale(0.68,0.68,0.68)
slugcatUpperBody.Arms.LeftArm.Main.Spearmaster.Down.LeftItemPivot:setScale(0.68,0.68,0.68)
slugcatUpperBody.Arms.RightArm.Main.Spearmaster.Down.RightItemPivot:setScale(0.68,0.68,0.68)
slugcatUpperBody.Arms.LeftArm.Main.Base.Down.LeftItemPivot:setScale(0.68,0.68,0.68)
slugcatUpperBody.Arms.RightArm.Main.Base.Down.RightItemPivot:setScale(0.68,0.68,0.68)
slugcatUpperBody.Body.ElytraPivot:setScale(0.5,0.5,0.5)
renderer:setShadowRadius(0.33)
slugcat.Items.ItemPearl:setSecondaryRenderType("GLINT")

function pings.setChat(bool)
    slugcat.FullBody.ComMark:setVisible(bool)
end
    
local wasChatOpen=false
function events.tick()
    local isChatOpen=host:isChatOpen()
    if isChatOpen ~= wasChatOpen then
        pings.setChat(isChatOpen)
    end
    wasChatOpen=isChatOpen
end


local shakeAnim = false
function events.tick()
	if world:getRainGradient() > 0 then
		if shakeAnim == false then
			shakeAnim = true
			animations["models.slugcat"].shake:play()
		end
	elseif player:getFood() < 6 then
		if shakeAnim == false then
			shakeAnim = true
			animations["models.slugcat"].shake:play()
		end
	else
		shakeAnim = false
		animations["models.slugcat"].shake:stop()
	end

	if player:getFood() < 6 then
		slugcat.FullBody:setColor(vectors.hexToRGB("#aaaaaa"))
	elseif player:getFood() < 12 then
		slugcat.FullBody:setColor(vectors.hexToRGB("#cccccc"))
	else
		slugcat.FullBody:setColor(vectors.hexToRGB("#ffffff"))
	end

	if client.hasResource("textures/block/skins/custom/base.png") == true then
        slugcatUpperBody.head.Main:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.head.Main.Eyes.Hunter.Scar:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.head.Main.Eyes.Artificer.Scar:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.head.Main.Burn:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.head.Main.Ears:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.head.Main.Base.Main:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.head.Main.Base.Snout:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.head.Main.Gourmand.Main:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.head.Main.Gourmand.Snout:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.Body.Main:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.Body.Tail1.Main.tail:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.Body.Tail1.Tail2.Main.tail:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.Body.Tail1.Tail2.Tail3.tail:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.Body.Tail1.Tail2.Tail3.Tail4.tail:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.Arms.LeftArm.Main:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.Arms.RightArm.Main:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatLowerBody.LeftLeg.Main:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatLowerBody.RightLeg.Main:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.head.Main.Eyes.AscendedSaint:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.head.Main.Eyes.Rivulet.OuterEye:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.head.Main.Gills:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.head.Main.Marks:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.head.Main.Tongue1:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.Body.Tail1.Main.Spearmaster:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.Body.Tail1.Tail2.Main.Spearmaster:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.Body.Tail1.Tail2.Tail3.Spearmaster:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		slugcatUpperBody.Body.Tail1.Tail2.Tail3.Tail4.Spearmaster:setPrimaryTexture("RESOURCE","textures/block/skins/custom/base.png")
		
		slugcat.Items:setPrimaryTexture("RESOURCE","textures/block/skins/custom/items.png")
		slugcatUpperBody.head.Helmet:setPrimaryTexture("RESOURCE","textures/block/skins/custom/items.png")
		slugcatUpperBody.head.Masks.NotSadMask.BaseMask:setPrimaryTexture("RESOURCE","textures/block/skins/custom/items.png")
		slugcatUpperBody.head.Masks.NotSadMask.Horns:setPrimaryTexture("RESOURCE","textures/block/skins/custom/items.png")
		slugcatUpperBody.head.Masks.NotSadMask.Spikes:setPrimaryTexture("RESOURCE","textures/block/skins/custom/items.png")
		slugcatUpperBody.head.Masks.SadMask:setPrimaryTexture("RESOURCE","textures/block/skins/custom/items.png")
		slugcatUpperBody.head.Masks.ChiefMask:setPrimaryTexture("RESOURCE","textures/block/skins/custom/items.png")
		slugcatUpperBody.Body.Chestplate:setPrimaryTexture("RESOURCE","textures/block/skins/custom/items.png")
		slugcatUpperBody.Body.Tail1.Chestplate:setPrimaryTexture("RESOURCE","textures/block/skins/custom/items.png")
		slugcatUpperBody.Body.Tail1.Tail2.Chestplate:setPrimaryTexture("RESOURCE","textures/block/skins/custom/items.png")
		slugcatLowerBody.LeftLeg.Leggings:setPrimaryTexture("RESOURCE","textures/block/skins/custom/items.png")
		slugcatLowerBody.RightLeg.Leggings:setPrimaryTexture("RESOURCE","textures/block/skins/custom/items.png")
		slugcatLowerBody.LeftLeg.Boots:setPrimaryTexture("RESOURCE","textures/block/skins/custom/items.png")
		slugcatLowerBody.RightLeg.Boots:setPrimaryTexture("RESOURCE","textures/block/skins/custom/items.png")
    else
        slugcatUpperBody.head.Main:setPrimaryTexture("CUSTOM",textures["textures.base"])
        slugcatUpperBody.head.Main:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.head.Main.Eyes.Hunter.Scar:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.head.Main.Eyes.Artificer.Scar:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.head.Main.Burn:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.head.Main.Ears:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.head.Main.Base.Main:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.head.Main.Base.Snout:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.head.Main.Gourmand.Main:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.head.Main.Gourmand.Snout:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.Body.Main:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.Body.Tail1.Main.tail:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.Body.Tail1.Tail2.Main.tail:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.Body.Tail1.Tail2.Tail3.tail:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.Body.Tail1.Tail2.Tail3.Tail4.tail:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.Arms.LeftArm.Main:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.Arms.RightArm.Main:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatLowerBody.LeftLeg.Main:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatLowerBody.RightLeg.Main:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.head.Main.Eyes.AscendedSaint:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.head.Main.Eyes.Rivulet.OuterEye:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.head.Main.Gills:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.head.Main.Marks:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.head.Main.Tongue1:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.Body.Tail1.Main.Spearmaster:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.Body.Tail1.Tail2.Main.Spearmaster:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.Body.Tail1.Tail2.Tail3.Spearmaster:setPrimaryTexture("CUSTOM",textures["textures.base"])
		slugcatUpperBody.Body.Tail1.Tail2.Tail3.Tail4.Spearmaster:setPrimaryTexture("CUSTOM",textures["textures.base"])
		
		slugcat.Items:setPrimaryTexture("CUSTOM",textures["textures.items"])
		slugcatUpperBody.head.Helmet:setPrimaryTexture("CUSTOM",textures["textures.items"])
		slugcatUpperBody.head.Masks.NotSadMask.BaseMask:setPrimaryTexture("CUSTOM",textures["textures.items"])
		slugcatUpperBody.head.Masks.NotSadMask.Horns:setPrimaryTexture("CUSTOM",textures["textures.items"])
		slugcatUpperBody.head.Masks.NotSadMask.Spikes:setPrimaryTexture("CUSTOM",textures["textures.items"])
		slugcatUpperBody.head.Masks.SadMask:setPrimaryTexture("CUSTOM",textures["textures.items"])
		slugcatUpperBody.head.Masks.ChiefMask:setPrimaryTexture("CUSTOM",textures["textures.items"])
		slugcatUpperBody.Body.Chestplate:setPrimaryTexture("CUSTOM",textures["textures.items"])
		slugcatUpperBody.Body.Tail1.Chestplate:setPrimaryTexture("CUSTOM",textures["textures.items"])
		slugcatUpperBody.Body.Tail1.Tail2.Chestplate:setPrimaryTexture("CUSTOM",textures["textures.items"])
		slugcatLowerBody.LeftLeg.Leggings:setPrimaryTexture("CUSTOM",textures["textures.items"])
		slugcatLowerBody.RightLeg.Leggings:setPrimaryTexture("CUSTOM",textures["textures.items"])
		slugcatLowerBody.LeftLeg.Boots:setPrimaryTexture("CUSTOM",textures["textures.items"])
		slugcatLowerBody.RightLeg.Boots:setPrimaryTexture("CUSTOM",textures["textures.items"])
	
	end
end