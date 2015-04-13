Scriptname CWMission04PrisonerDoorScript extends ReferenceAlias  

ReferenceAlias Property myPrisonerAlias Auto
{Pointer to the prisoner that this door controls}

Event OnOpen(ObjectReference akActionRef)
	
	CWMission04Script CWMission04S = (GetOwningQuest() as CWMission04Script)
	
	faction CWMission04PrisonerFreedFaction = CWMission04S.CWMission04PrisonerFreedFaction
	actor myActor = myPrisonerAlias.GetActorReference()

; 	CWScript.Log("CWMission04PrisonerDoorScript", self +  "OnOpen() adding my prisoner " + myActor +  " to CWMission04PrisonerFreedFaction")
	myActor.AddToFaction(CWMission04PrisonerFreedFaction)

	myActor.Say(CWMission04S.CWMission04PrisonerThanksTopic)
	
	myActor.EvaluatePackage()
	
	CWMission04S.checkAllPrisonersFreed()
	
EndEvent


;OLD VERSION - when there was only 1 prisoner you were sneaking out
;Event OnUpdate()
; ;	CWScript.Log("CWMission04PrisonerDoorScript", self + "OnUpdate() open state = " + GetReference().GetOpenState())
;	If GetOwningQuest().GetStagedone(20) == False
;		if GetReference().GetOpenState() == 1		; 0: None (object can't be opened or closed), 1: Open, 2: Opening, 3: Closed, 4: Closing 
;			GetOwningQuest().SetStage(20)
;	
;		EndIf
;	EndIf
;
;EndEvent

