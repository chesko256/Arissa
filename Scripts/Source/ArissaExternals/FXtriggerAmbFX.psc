Scriptname FXtriggerAmbFX extends ObjectReference  
{executes when someone walks through the cobweb wall or other similar amb fx with triggers}

activator Property TriggerPlacedFX auto
sound property TriggeredSound auto
 int property oneTimeTrigger auto
int broken = 0
objectReference myFX
 
EVENT ONTRIGGERENTER(ObjectReference akActionRef)
	IF broken == 0
			if oneTimeTrigger > 0
				broken = 1
			endif
				self.SetAnimationVariableFloat("fToggleBlend", 1)
			if (TriggerPlacedFX)
				myFX = self.placeatme(TriggerPlacedFX, 1)
			endif
			if (TriggeredSound)
				int instanceID = TriggeredSound.Play(Self)
			endif
			utility.wait (10.0)
			myFX.disable()
	endif
	
	IF broken == 1
		utility.wait(3.0)
		myFX.disable()
		broken = 2
	endIf
ENDEVENT
