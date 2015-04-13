Scriptname TGTQ03RegistryScript extends ReferenceAlias  Conditional

Quest Property pTGTQ03Quest  Auto
Sound Property NPCHumanWritingTG Auto

Event OnActivate(ObjectReference akActionRef)

	GetRef().GetLinkedRef().SendStealAlarm(Game.GetPlayer())

	if akActionRef == Game.GetPlayer()
		if pTGTQ03Quest.GetStageDone(40) == 0
			NPCHumanWritingTG.Play(Self.GetRef())
			pTGTQ03Quest.SetStage(40)
		endif
	endif

EndEvent