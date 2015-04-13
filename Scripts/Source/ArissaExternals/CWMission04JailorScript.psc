Scriptname CWMission04JailorScript extends ReferenceAlias  



Event OnCellLoad()
	;MAKE SURE THE JAILOR HAS A KEY
; 	CWScript.Log("CWMission04JailorScript", self +  "OnCellLoad() adding key to jailor if needed by calling AddPrisonKey().")

	Actor selfActor = GetActorReference()
	
	(GetOwningQuest() as CWMission04Script).AddPrisonKey(selfActor)
	
EndEvent

