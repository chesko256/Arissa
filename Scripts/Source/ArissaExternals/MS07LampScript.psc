Scriptname MS07LampScript extends ObjectReference  

Message Property LightOutMessage  Auto  

Message Property CannotMessage  Auto  

Message Property LightAlreadyOutMessage  Auto  

Quest Property MS07 Auto

auto state LampOn
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()
			if MS07.GetStageDone(30) && MS07.GetStageDone(60) == 0
				gotoState("LampOff")
				;Turn off light
				LightOutMessage.Show()
				MS07.setStage(60)
			else
				;Show Message about unavailability
				CannotMessage.Show()
			endif
		
		endif
	endEvent

endState

state LampOff
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()
			LightAlreadyOutMessage.Show()
		endif
	endEvent
endState