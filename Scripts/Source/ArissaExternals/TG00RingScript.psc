Scriptname TG00RingScript extends ReferenceAlias  Conditional

Quest Property pTG00Quest Auto Conditional
ReferenceAlias Property pTG00Brandish Auto Conditional
TG00QuestScript Property pTG00QuestScript  Auto  Conditional

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if pTG00Quest.GetStage() >= 10 && pTG00Quest.GetStage() < 20
		if NewContainer == Game.GetPlayer()
			pTG00Quest.SetStage(20)
		endif
	endif

	if pTG00Quest.GetStage() == 20
		if NewContainer == pTG00Brandish.GetActorRef()
			pTG00Quest.SetStage(30)
		endif
	endif

EndEvent