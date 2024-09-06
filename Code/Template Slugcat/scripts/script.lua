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

squapi.smoothHead:new(
    {
        slugcatUpperBody.head --element(you can have multiple elements in a table)
    },
		0.25,    --(1) strength(you can make this a table too)
    nil,    --(0.1) tilt
    nil,    --(1) speed
    nil     --(true) keepOriginalHeadPos
)

-- squapi.tails(myTail, 3, 15, 5, 2, 1.2, 0, 0, 1, .0005, .06, nil, nil)
local myTail = {
    slugcatUpperBody.Body.Tail1, slugcatUpperBody.Body.Tail1.Tail2, slugcatUpperBody.Body.Tail1.Tail2.Tail3, slugcatUpperBody.Body.Tail1.Tail2.Tail3.Tail4
}

--replace each nil with the value/parmater you want to use, or leave as nil to use default values :)
--parenthesis are default values for reference
squapi.tail:new(myTail,
    nil,    --(15) idleXMovement
    nil,    --(5) idleYMovement
    nil,    --(1.2) idleXSpeed
    nil,    --(2) idleYSpeed
    1,    --(2) bendStrength
    3,    --(0) velocityPush
    nil,    --(0) initialMovementOffset
    nil,    --(1) offsetBetweenSegments
    0.05,    --(.005) stiffness
    nil,    --(.9) bounce
    nil,    --(90) flyingOffset
    -45,    --(-90) downLimit
    90     --(45) upLimit
)
--in Blockbench, each tail segment would go inside the last. first segment would contain the second, second would contain the third, etc.
--this list can be as long as you want based on how many segments your tail is, just add more.

--replace each nil with the value/parmater you want to use, or leave as nil to use default values :)
--parenthesis are default values for reference
squapi.eye:new(
    slugcatUpperBody.head.Main.Eyes,  --the eye element 
    0.2,  --(0.25) left distance
    0.3,  --(1.25) right distance
    0.2,  --(0.5) up distance
    0.2   --(0.5) down distance
)

--replace each nil with the value/parmater you want to use, or leave as nil to use default values :)
--parenthesis are default values for reference
squapi.randimation:new(
    animations["models.slugcat"].blink,    --animation
    100,    --(200) chanceRange
    true     --(false) isBlink
)

--replace each nil with the value/parmater you want to use, or leave as nil to use default values :)
--parenthesis are default values for reference
squapi.ear:new(
    slugcatUpperBody.head.Main.Ears.LeftEar, --leftEar
    slugcatUpperBody.head.Main.Ears.RightEar, --(nil) rightEar
    nil, --(1) rangeMultiplier
    nil, --(false) horizontalEars
    nil, --(2) bendStrength
    nil, --(true) doEarFlick
    nil, --(400) earFlickChance
    0.2, --(0.1) earStiffness
    0.25  --(0.8) earBounce
)

squapi.FPHand:new(
	slugcatUpperBody.Arms.RightArm,
	-1, --x
	1, --y
	5, --z
	nil, --scale
	false) --onlyVisibleInFP

--replace each nil with the value/parmater you want to use, or leave as nil to use default values :)
--parenthesis are default values for reference
squapi.bounceWalk:new(
    slugcat,    --model
    0.4     --(1) bounceMultiplier
)

local SwingingPhysics = require("scripts.api.swinging_physics")
--- Adds swinging physics to a part that is attached to the head
---@param part ModelPart The model part that should swing
---@param dir number Angle in degree, where the part is located relative to the center of the head. Imagine a stick pointing out in that direction with the model part hanging from its end. 0 means forward, 45 means diagonally forward and left, 90 means straight left and so on
---@param limits table|nil Limits the rotation of the part to make it appear like its colliding with something. Format: {xLow, xHigh, yLow, yHigh, zLow, zHigh} (optional)
---@param root ModelPart|nil Required if it is part of a chain. Note that the first chain element does not need this root parameter, and does also not need the depth parameter. Only following chain links need it.
---@paramt depth number|nil An integer that should increase by 1 for each consecutive chain link after the root. The root itself doesnt need this parameter. This increases the friction which makes it look more realistic.

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