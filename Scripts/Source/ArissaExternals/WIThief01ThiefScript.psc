Scriptname WIThief01ThiefScript extends ReferenceAlias  

Event OnUnload()

; 	debug.trace(self + " OnUnload() mark for delete and stop quest")
	
	GetOwningQuest().stop()
	
	GetReference().deleteWhenAble()

EndEvent

