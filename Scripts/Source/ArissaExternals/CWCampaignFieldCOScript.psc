Scriptname CWCampaignFieldCOScript extends ReferenceAlias  

;The primary purpose of the script is to move the actor to the FieldHQ when the player isn't around if he's not there already. This is to ensure he gets there before the player does.

ObjectReference  DesintationRef 
float  DestinationRadius 

int UpdateTime = 10

bool Property AtDestination	 auto hidden	;used by CWSiegeQuickStartScript.psc to know that the FieldCO arrived before moving the player to him

State traveling

	Event OnBeginState()
; 		CWScript.Log("CWCampaignFieldCOScript", self + "Gone to state 'traveling'")
	EndEvent

	Event OnUpdate()
; 		CWScript.Log("CWCampaignFieldCOScript", self + "OnUpdate in state 'traveling' will check location and move to destination if not in same location as player")

		If GetReference().GetDistance(DesintationRef) <= DestinationRadius
			GoToState("")
; 			CWScript.Log("CWCampaignFieldCOScript", self + "At location, no longer set to traveling.")
			AtDestination = True
			UnRegisterForUpdate()

		
		ElseIf GetReference().GetCurrentLocation() == None || GetReference().GetCurrentLocation().IsSameLocation(Game.GetPlayer().GetCurrentLocation()) == False
			GoToState("")
; 			CWScript.Log("CWCampaignFieldCOScript", self + "Not at location, player not in same location, moving to " + DesintationRef + " and now no longer set to traveling.")
			GetReference().MoveTo(DesintationRef)
			AtDestination = True
			UnRegisterForUpdate()
			
		EndIf

	EndEvent

EndState

function StartTraveling(ObjectReference RefToTravelTo, float Radius = 1000.0)
	DesintationRef = RefToTravelTo
	DestinationRadius = Radius
	AtDestination = False
	
; 	CWScript.Log("CWCampaignFieldCOScript", self + "StartTraveling() RefToTravelTo:" + RefToTravelTo + ", Radius:" + Radius)
	
	GoToState("traveling")
	RegisterForUpdate(UpdateTime)
EndFunction



