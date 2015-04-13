Scriptname DA05QuestingBeastScript extends ReferenceAlias  

ReferenceAlias Property QuestingBeastGhost auto
ReferenceAlias Property QuestingBeastTA auto

Event OnDeath(Actor akKiller)
	ObjectReference pGhost = QuestingBeastGhost.GetReference()
	ObjectReference pTalkingActivator = QuestingBeastTA.GetReference()
	Utility.Wait(3)
	GetReference().SetMotionType(3) ; Motion_Keyframed
	pGhost.MoveTo(GetReference())
	pGhost.Enable(true)
	pGhost.SetNoFavorAllowed(true)
	(QuestingBeastGhost as DA05QuestingBeastGhostScript).Setup()
	pTalkingActivator.MoveTo(QuestingBeastGhost.GetReference())
EndEvent
