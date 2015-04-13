Scriptname CWFortSiegeJarlsHouseDoorScript extends ReferenceAlias  

Message Property barredDoorMSG Auto

int Property StageToBarDoor Auto
{What quest stage should we lock the door and prevent the player from entering?}

int Property StageToUnbarDoor Auto
{What stage should we unlock door and allow the player to enter?}

bool blocked

Event OnLoad()

	if blocked == False
		blocked = True
	
; 	CWScript.Log("CWFortSiegeJarlsHouseDoorScript", "OnLoad() calling BlockActivation()", 1)
	GetReference().BlockActivation()
	
	endif

EndEvent

Event OnActivate(ObjectReference akActionRef)
	
	if GetReference().IsActivationBlocked() == False
		return
	EndIf
	
	Quest OwningQuest = GetOwningQuest()
		
	if akActionRef == Game.GetPlayer() && owningQuest.GetStageDone(StageToBarDoor) 
		if  owningQuest.GetStageDone(StageToUnbarDoor) == False
; 			CWScript.Log("CWFortSiegeJarlsHouseDoorScript", "OnActivate() Activation is blocked.", 1)
			barredDoorMSG.show()
		
		Else
; 			CWScript.Log("CWFortSiegeJarlsHouseDoorScript", "OnActivate() Unblocking Activation.", 1)
			GetReference().BlockActivation(false)
			GetReference().Activate(akActionRef, abDefaultProcessingOnly = true)
		
		EndIf
		
	Else
		GetReference().Activate(akActionRef, abDefaultProcessingOnly = true)

	
	EndIf
	

EndEvent
