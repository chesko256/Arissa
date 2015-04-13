Scriptname WIRemoveItem05ItemScript extends ReferenceAlias  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer()
		GetOwningQuest().stop()

	EndIf

EndEvent