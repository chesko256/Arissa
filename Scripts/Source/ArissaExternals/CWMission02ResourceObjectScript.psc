Scriptname CWMission02ResourceObjectScript extends ReferenceAlias  

CWMission02Script property CWMission02S auto Hidden

int Property myType auto Hidden
int Property primaryResourceType auto Hidden
int Property DiscoverDistance = 1000 auto Hidden

;#### Pointers to things in master file

;## Aliases
ReferenceAlias Property ResourceObject1 Auto



Event OnInit()
	CWMission02S = GetOwningQuest() as CWMission02Script
	
; 	CWScript.Log("CWMission02ResourceObjectScript", self + " OnInit()", 0, true, True)
; 	CWScript.Log("CWMission02ResourceObjectScript", self + " REMINDER: Make sure that my properties get cleared out when the quest starts up again when that functionality is implemented in Papyrus.", 1, 0, true)
	

	
EndEvent

;TEMP HACK UNTIL ALL THE RESOURCE OBJECTS COME ONLINE
Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
	
		int RType = (GetReference() as ResourceObjectScript).GetResourceType() 
		
		if RType == 1 || RType == 3		;1 = Wheat Mill(Farm), 2 = Saw Mill, 3 = Smelter(Mine)
			
			;TEMP HACK TO MAKE IT SABOTAGED WHEN YOU ACTIVATE IT
			debug.MessageBox("CWMission02ResourceObjectScript: SABOTAGED!!!")
			(GetReference() as ResourceObjectScript).sabotaged = true
			GetReference().DamageObject(9999)
		
		EndIf
	
	EndIf

EndEvent


Event OnUpdate()
; 	CWScript.Log("CWMission02ResourceObjectScript", self + " OnUpdate()")

;	if myType == 0
;		myType = CWMission02S.CWCampaignS.GetResourceType(self)
;		primaryResourceType = CWMission02S.CWCampaignS.GetResourceType(ResourceObject1)
;	EndIf

	If myType == 0
	
		primaryResourceType = (ResourceObject1.GetReference() as ResourceObjectScript).GetResourceType() 
		myType = (GetReference() as ResourceObjectScript).GetResourceType() 
	
	EndIf
	
	;If the player gets close enought to have "discovered" the primary resource, advance the Quest
	if self == ResourceObject1 	;if I'm the primary resource
	
		if GetOwningQuest().GetStageDone(20) == False && Game.GetPlayer().GetDistance(self.GetReference()) < DiscoverDistance	;if the player is close to me
; 			CWScript.Log("CWMission02ResourceObjectScript", self + " OnUpdate(): PlayerDistance to" + Self + " < DiscoverDistance, advancing quest")
			GetOwningQuest().SetStage(20)
		EndIf
	EndIf
	
	;regardless if i'm the primary resource or not, if I'm the correct type, and i'm destroyed consider the objective completed
	if myType == primaryResourceType
; 		CWScript.Log("CWMission02ResourceObjectScript", self + " OnUpdate(): myType == primaryResourceType, checking IsSabotaged()")
		
		if GetOwningQuest().GetStagedone(100) == False && (GetReference() as ResourceObjectScript).IsSabotaged()
			GetOwningQuest().setStage(100)
		EndIf
	EndIf
	
EndEvent

;Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
;	
;	;if player hits me and i'm the primary object, consider me "discovered"
;	
;	if myType == 0
;		myType = CWMission02S.CWCampaignS.GetResourceType(self)
;		primaryResourceType = CWMission02S.CWCampaignS.GetResourceType(ResourceObject1)
;	EndIf
;	
;	if self == ResourceObject1 	;if I'm the primary resource
;		if akAggressor == Game.GetPlayer()	;and the player has hit me
;			if 	GetOwningQuest().GetStageDone(20) == False
; ; ;				debug.traceConditional(self + " OnHit(): Player hit me (" + Self + ") advancing quest.", CWMission02S.CWs.debugOn.value)
;				GetOwningQuest().SetStage(20)
;			EndIf
;		EndIf
;	EndIf
;
;EndEvent

