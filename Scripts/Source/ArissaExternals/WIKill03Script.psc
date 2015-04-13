Scriptname WIKill03Script extends WorldInteractionsScript  Conditional
{Extends WolrdInteractionsScript which extends Quest}

int property pRank auto
{relationship rank between player and deadFriend}

int property pBaseInheritance auto
{the base gold amount}

int property pInheritance auto
{rank * baseInheritance}

float property pTax = 0.10 auto
{percent the jarl will take}

int property pTaxedAmount auto
{baseInheritance * tax - truncated into int}

int property pAward auto
{inheritance - taxedAmount}

int property pDelivered auto
{0 = unset, 1 = delivered inheritance to player}

Keyword Property pTraitRich  Auto  
{pointer to Keyword TraitRich}

MiscObject Property pGold001  Auto  
{pointer to Gold001 misc object}

Book Property pLetter  Auto  
{pointer to the inheritance letter}

Quest Property pWICourier  Auto  
{pointer to WICourier quest}

GlobalVariable Property WIKill03Inheritance Auto
GlobalVariable Property WIKill03Tax Auto


Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, int aiRelationshipRank)
  
	if akKiller == Game.GetPlayer()
		pRank = aiRelationshipRank

	Else
		pRank = (akVictim as Actor).GetRelationshipRank(Game.GetPlayer())
	
	EndIf
  
  	;set the base inheritance value based on the traits of the dead friend
	if akVictim.hasKeyword(pTraitRich)
		pBaseInheritance = 1000
	else
		pBaseInheritance = 100
	endif
	
	;set rank to be the relationship level
	pInheritance = pBaseInheritance * pRank
	pTaxedAmount = (pInheritance * pTax) as Int
	pAward = pInheritance - pTaxedAmount
	
	WIKill03Inheritance.SetValue(pInheritance)
	WIKill03Tax.SetValue(pTaxedAmount)
	
	UpdateCurrentInstanceGlobal(WIKill03Inheritance)
	UpdateCurrentInstanceGlobal(WIKill03Tax)
  
	SetStage(1)
  
EndEvent
  




