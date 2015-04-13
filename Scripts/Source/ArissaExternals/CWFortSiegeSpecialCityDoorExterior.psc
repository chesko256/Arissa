Scriptname CWFortSiegeSpecialCityDoorExterior extends ReferenceAlias  

;this Alias only fills when we are using CWFortSiege to handle the  interior battles of the final siege at Solitude or Windhelm

Quest Property CWSiege Auto

Event onActivate(objectReference triggerRef)
	
	if triggerRef == Game.GetPlayer()
		
		if CWSiege.GetStage() >= 50

; 			CWScript.Log("CWFortSiegeSpecialCityDoorExterior", self + "onActivate() calling StartFinalCityInteriorBattle() on CWFortSiegeScript")
			(GetOwningQuest() as CWFortSiegeScript).StartFinalCityInteriorBattle()

		else

			;do nothing
		endif

	EndIf


EndEvent
