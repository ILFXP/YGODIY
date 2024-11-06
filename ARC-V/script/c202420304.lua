--CCC 武融化身 音速戟
function c202420304.initial_effect(c)
	c:EnableReviveLimit()
	--material
	aux.AddFusionProcCodeFun(c,202420301,c202420304.mfilter,1,true,true)
	--atkval
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetRange(LOCATION_MZONE)
	e1:SetValue(c202420304.atkval)
	c:RegisterEffect(e1)
	--double attack
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_EXTRA_ATTACK)
	e2:SetValue(1)
	c:RegisterEffect(e2)
end
function c202420304.mfilter(c)
	return c:IsAttribute(ATTRIBUTE_WIND)
end
--fun atkval
function c202420304.atkfilter(c)
	return c:IsFaceup() and c:IsAttribute(ATTRIBUTE_WIND)
end
function c202420304.atkval(e,c)
	return Duel.GetMatchingGroupCount(c202420304.atkfilter,0,LOCATION_MZONE,LOCATION_MZONE,c)*300
end