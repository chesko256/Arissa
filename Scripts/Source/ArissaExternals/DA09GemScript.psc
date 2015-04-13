Scriptname DA09GemScript extends ReferenceAlias  

Scene Property DA09GemScene Auto
ReferenceAlias Property xMarkerVoice Auto
ReferenceAlias Property KilkreathMapMarker Auto

int HoursUntilNextTalk = 24

int objectiveToDisplay = 10


;STAGE 200 calls UnregisterForUpdateGameTime()
;Event OnUpdateGameTime()
;	
; ;	debug.trace(self + "OnUpdateGameTime() starting scene")
;	
;	PlayScene()
;
;
;EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer()
	
; 		debug.trace(self + "OnContainerChanged() akNewContainer is player, so PlayerHasMe = true, and calling RegisterForUpdateGameTime " + HoursUntilNextTalk)
	
		if GetOwningQuest().GetStage() < 100
			GetOwningQuest().setStage(100)
		EndIf
		
		PlayScene()
		
;		RegisterForUpdateGameTime(HoursUntilNextTalk)   ;STAGE 200 calls UnregisterForUpdateGameTime()
		
	EndIf
	
EndEvent

function PlayScene()
		xMarkerVoice.GetReference().MoveTo(Game.GetPlayer())
		DA09GemScene.start()
		
		While DA09GemScene.IsPlaying()
; 			debug.trace(self + "Waiting for DA09GemScene.IsPlaying() to be false")
			Utility.wait(1)
		EndWhile
		
		KilkreathMapMarker.GetReference().AddToMap()
		GetOwningQuest().SetObjectiveDisplayed(objectiveToDisplay, true, true)
EndFunction
