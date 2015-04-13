Scriptname DA05QuestingBeastGhostScript extends ReferenceAlias  

Float Property GhostXPos Auto
Float Property GhostYPos Auto
Float Property GhostZPos Auto

ReferenceAlias Property QuestingBeastTA auto

Function Setup()
	GetReference().BlockActivation(true)
	GetActorReference().AllowPCDialogue(true)
EndFunction

Event OnActivate(ObjectReference akActivator)
	ObjectReference pTalkingActivator = QuestingBeastTA.GetReference()
	ObjectReference pGhost = Self.GetRef()
	if (akActivator == Game.GetPlayer())
		;Find out where we moved the ghost, then offset the Talking Activator's position by that much, plus some addition Y offset to get near the head
		GhostXPos = pGhost.GetPositionX()
		GhostYPos = pGhost.GetPositionY() 
		GhostZPos = pGhost.GetPositionZ() + 150
		pTalkingActivator.SetPosition(GhostXPos, GhostYPos , GhostZPos )
		QuestingBeastTA.GetReference().Activate(akActivator)
	endif
EndEvent

