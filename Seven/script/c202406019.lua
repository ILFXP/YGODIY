function c202406019.initial_effect(c)
	c:EnableCounterPermit(0x1)
	c:SetCounterLimit(0x1,7)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCountLimit(1,202406019)
	c:RegisterEffect(e1)
	--add counter
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e2:SetRange(LOCATION_SZONE)
	e2:SetCode(EVENT_SPSUMMON_SUCCESS)
	e2:SetOperation(c202406019.acop)
	c:RegisterEffect(e2)
	--negate
	local e3=Effect.CreateEffect(c)
	e3:SetCategory(CATEGORY_NEGATE)
	e3:SetType(EFFECT_TYPE_QUICK_O)
	e3:SetCode(EVENT_CHAINING)
	e3:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DAMAGE_CAL)
	e3:SetRange(LOCATION_SZONE)
	e3:SetCondition(c202406019.discon)
	e3:SetCost(c202406019.discost)
	e3:SetTarget(c202406019.distg)
	e3:SetOperation(c202406019.disop)
	c:RegisterEffect(e3)
end
function c202406019.acfilter(c)
	return c:IsSetCard(0x5a3)
end
function c202406019.acop(e,tp,eg,ep,ev,re,r,rp)
	if eg:IsExists(c202406019.acfilter,1,nil) then e:GetHandler():AddCounter(0x1,1)
	end
end
function c202406019.discon(e,tp,eg,ep,ev,re,r,rp)
	return rp==1-tp and Duel.IsChainNegatable(ev)
end
function c202406019.discost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():IsCanRemoveCounter(tp,0x1,2,REASON_COST) end
	e:GetHandler():RemoveCounter(tp,0x1,2,REASON_COST)
end
function c202406019.distg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetOperationInfo(0,CATEGORY_NEGATE,eg,1,0,0)
end
function c202406019.disop(e,tp,eg,ep,ev,re,r,rp)
	Duel.NegateActivation(ev)
end