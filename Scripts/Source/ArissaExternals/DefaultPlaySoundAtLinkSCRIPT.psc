Scriptname DefaultPlaySoundAtLinkSCRIPT extends ObjectReference  
{
Plays the sound (property) and this trigger's linked ref.
-This script only fires once then disables itself.
-Probably currently only supports one shot sounds.
-May want to add options later to start and stop looping sounds.
}

Sound Property SelectedSound Auto
{
Pick the Sound that you want to be played.
}

float Property Volume Auto
{
The volume you'd like the sound to play at (Between 0 and 1, (DEFAULT = 1))
}

bool Property PlayerOnly = TRUE auto
{
Does this only trigger for the player? (DEFAULT = TRUE)
}

ObjectReference myLinkedRef

Event onTriggerEnter(ObjectReference triggerRef)

	if (triggerRef == Game.GetPlayer()) || (!PlayerOnly)
		myLinkedRef = GetLinkedRef() as ObjectReference
		
		int soundInstance = SelectedSound.play(myLinkedRef)  
		Sound.SetInstanceVolume(soundInstance, Volume)
		
		self.disable()
	endif
	
endEvent
