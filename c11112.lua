-- Jank Mode
-- Jinxsei (with thanks to Ejeffers)
function c11112.initial_effect(c)
	-- Temple of the Mind's Eye (1000 LP Battle Damage)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetCode(EFFECT_CHANGE_BATTLE_DAMAGE)
	e2:SetRange(LOCATION_FZONE)
	e2:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e2:SetTargetRange(1,1)
	e2:SetValue(1000)
	-- Banish from deck and enforce custom ruleset
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e:SetRange(0xf7)
	e:SetProperty(EFFECT_FLAG_UNCOPYABLE+EFFECT_FLAG_CANNOT_DISABLE)
	Duel.RegisterEffect(e2,1)
	e:SetOperation(
		function()
			if Duel.Remove(c,POS_FACEDOWN,REASON_RULE)==0 then
				Duel.SendtoDeck(c,nil,-2,REASON_RULE)
			end
			if c:IsPreviousLocation(LOCATION_HAND) then
				Duel.Draw(c:GetPreviousControler(),1,REASON_RULE)
			end
		end)
	c:RegisterEffect(e)
end
Duel.LoadScript("JinxJanx.lua")
