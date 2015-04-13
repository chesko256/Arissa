Scriptname MGGateTriggerScript extends ObjectReference  


ObjectReference Property GateRef  Auto  


Event OnTriggerEnter(ObjectReference ActionRef)


; If the actor approaching the gate is the player, check whether var in DialogueWinterholdCollege quest has been set to 1
; (For reference: this is currently set in Stage 30 results of MG01)

	DialogueWinterholdCollegeQuestScript DQScript = MGDialogueQuest as DialogueWinterholdCollegeQuestScript



	if ActionRef == Game.GetPlayer()
		if DQScript.GateOpen == 1
			GateRef.SetOpen()
		endif
	endif

EndEvent


;Event OnTriggerLeave(ObjectReference ActionRef)
	
; Close gate again once player leaves trigger volume

;	DialogueWinterholdCollegeQuestScript DQScript = MGDialogueQuest as DialogueWinterholdCollegeQuestScript


;	if ActionRef == Game.GetPlayer()
;		if DQScript.GateOpen == 1
;			GateRef.SetOpen(False)
;		endif
;	endif

;EndEvent
Quest Property MG01  Auto  

Quest Property MGDialogueQuest  Auto  
