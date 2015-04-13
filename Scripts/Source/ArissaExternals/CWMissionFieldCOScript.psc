Scriptname CWMissionFieldCOScript extends ReferenceAlias  
{Script attached to CWMissionXX quest's mission generator trigger - used to live on the individual field cos}

Event OnUnload()
	
	If GetOwningQuest().GetStage() < 10		;the player hasn't accepted the quest, so stop it if the player leaves
; 		CWScript.Log("CWMissionFieldCOScript", self + "OnUnload() player hasn't accepted the quest, so stop the quest.")
		GetOwningQuest().Stop()
	
	EndIf	

EndEvent
