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
slugcatUpperBody.Body.LeftElytraPivot:setScale(0.5,0.5,0.5)
slugcatUpperBody.Body.RightElytraPivot:setScale(0.5,0.5,0.5)
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
end