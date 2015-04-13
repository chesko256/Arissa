Scriptname WIRemoveItem02ItemScript extends ReferenceAlias  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer()
		GetOwningQuest().stop()

	endif

EndEvent