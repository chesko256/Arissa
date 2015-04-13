Scriptname DA09GemContainerScript extends ReferenceAlias  

GlobalVariable Property DA09ChangeLocChance Auto


auto state waiting
	Event OnActivate(ObjectReference akActionRef)
; 		debug.trace(self + "OnActivate(" + akActionRef + ")")

		if akActionRef == Game.GetPlayer()
			goToState("done")
; 			debug.trace(self + "OnActivate(player) setting DA09ChangeLocChance to 0, gone to state 'done'.")
			DA09ChangeLocChance.SetValue(0)
		
		EndIf
		
	EndEvent
EndState


state done
	Event OnActivate(ObjectReference akActionRef)
	EndEvent
EndState
