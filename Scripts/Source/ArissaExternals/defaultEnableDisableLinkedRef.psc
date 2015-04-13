scriptName defaultEnableDisableLinkedRef extends ObjectReference
{
- This script enables or disables linked ref based on which type user defines in properties.
- Can be done OnTriggerEnter, or OnActivate, whichever happens first
- This script only fires once then disables itself (default), or can be told to go to a done state (usually for activators) with the ShouldDisable bool.
}

int property TriggerType auto
{
0 (default) - enables linked ref
1 - disables linked ref
}

bool Property PlayerOnly = TRUE auto
{
Does this only trigger for the player? (DEFAULT = TRUE)
}

bool Property Fade = FALSE auto
{
Fade in/out when enabled/disabled? (DEFAULT = FALSE)
}

bool Property ShouldDisable = TRUE auto
{
Should I disable once triggered/activated? (DEFAULT = TRUE)
}

float Property Delay = 0.0 auto
{
Delay before Enable/Disable (DEFAULT = 0.0)
}

ObjectReference myLinkedRef

auto State Waiting


	Event onTriggerEnter(ObjectReference triggerRef)

		if (triggerRef == Game.GetPlayer()) || (!PlayerOnly)
			myLinkedRef = GetLinkedRef() as ObjectReference
			
			utility.Wait(Delay)

			if (TriggerType == 0)
				myLinkedRef.enable(Fade)
			elseif (TriggerType == 1)
				myLinkedRef.disable(Fade)
			endif


			if (ShouldDisable == TRUE)
				self.disable()
			else
				GoToState("Done")
			endif

		endif
		
	endEvent


	Event onActivate(ObjectReference triggerRef)

		if (triggerRef == Game.GetPlayer()) || (!PlayerOnly)
			myLinkedRef = GetLinkedRef() as ObjectReference
			
			utility.Wait(Delay)

			if (TriggerType == 0)
				myLinkedRef.enable(Fade)
			elseif (TriggerType == 1)
				myLinkedRef.disable(Fade)
			endif


			if (ShouldDisable == TRUE)
				self.disable()
			else
				GoToState("Done")
			endif

		endif
		
	endEvent


endState


State Done
	;Do Nothing
endState
