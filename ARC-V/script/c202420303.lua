--CCC 武融化身 岩剑
function c202420303.initial_effect(c)
	c:EnableReviveLimit()
	--material
	aux.AddFusionProcCodeFun(c,202420301,c202420303.mfilter,1,true,true)
	--atkval
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetRange(LOCATION_MZONE)
	e1:SetValue(c202420303.atkval)
	c:RegisterEffect(e1)
	--limit effect
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetCode(EFFECT_CANNOT_ACTIVATE)
	e2:SetRange(LOCATION_FZONE)
	e2:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e2:SetTargetRange(0,1)
	e2:SetCondition(c202420303.lecon)
	e2:SetValue(aux.TargetBoolFunction(Effect.IsHasType,EFFECT_TYPE_ACTIVATE))
	c:RegisterEffect(e2)
end
function c202420303.mfilter(c)
	return c:IsAttribute(ATTRIBUTE_EARTH)
end
--fun atkval
function c202420303.atkfilter(c)
	return c:IsFaceup() and c:IsAttribute(ATTRIBUTE_EARTH)
end
function c202420303.atkval(e,c)
	return Duel.GetMatchingGroupCount(c202420303.atkfilter,0,LOCATION_MZONE,LOCATION_MZONE,c)*300
end
--fun activate limit
function c202420303.lfilter(c,tp)
	return c:IsControler(tp) and c:IsFaceup() and c:IsSetCard(0x9a3)
end
function c202420303.lecon(e)
	local a=Duel.GetAttacker()
	local d=Duel.GetAttackTarget()
	local tp=e:GetHandlerPlayer()
	return a and c202420303.lfilter(a,tp) or d and c202420303.lfilter(d,tp)
end