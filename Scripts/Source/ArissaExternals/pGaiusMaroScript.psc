Scriptname pGaiusMaroScript extends ReferenceAlias  

Quest Property pDB06  Auto  
 

Event OnDeath(Actor aThisGuyKilledMe)

if pGaiusMaroAlias.GetReference().IsInLocation (pWindhelmLocation) == 1
	DB06Script pScript = pDB06 as DB06Script
	pScript.pBonus = 1
endif

if pGaiusMaroAlias.GetReference().IsInLocation (pWhiterunLocation) == 1
	DB06Script pScript = pDB06 as DB06Script
	pScript.pBonus = 1
endif

if pGaiusMaroAlias.GetReference().IsInLocation (pRiftenLocation) == 1
	DB06Script pScript = pDB06 as DB06Script
	pScript.pBonus = 1
endif

if pGaiusMaroAlias.GetReference().IsInLocation (pSolitudeLocation) == 1
	DB06Script pScript = pDB06 as DB06Script
	pScript.pBonus = 1
endif

if pGaiusMaroAlias.GetReference().IsInLocation (pMarkarthLocation) == 1
	DB06Script pScript = pDB06 as DB06Script
	pScript.pBonus = 1
endif



if pDB06.GetStage () >= 10
	DB06Script pScript = pDB06 as DB06Script
	pDB06.SetObjectiveCompleted(10)
	pDB06.SetObjectiveDisplayed(20)
	pScript.pGaiusDead = 1
	

DB06Script Script = pDB06 as DB06Script	
	If GetRef().GetItemCount(DB06IncriminatingLetter) >= 1
		Script.pPlantedLetter=1
		pDB06.SetObjectiveCompleted(20)
		pDB06.SetObjectiveDisplayed(30)
	Endif

endif



EndEvent

 

int Property pBonus  Auto  

Location Property pDragonBridgeLocation  Auto  

ReferenceAlias Property pGaiusMaroAlias  Auto  

Location Property pWhiterunLocation  Auto  

Location Property pRiftenLocation  Auto  

Location Property pSolitudeLocation  Auto  

Location Property pWindhelmLocation  Auto  

Location Property pMarkarthLocation  Auto  

Book Property DB06IncriminatingLetter  Auto  
