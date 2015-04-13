Scriptname TGRFOLedgerScript extends ReferenceAlias  Conditional

Quest Property pTGRFOQuest  Auto
Sound Property NPCHumanWritingTG Auto

Event OnLoad()

	Self.GetRef().BlockActivation()

EndEvent

Event OnActivate(ObjectReference akActionRef)

	Self.GetRef().GetLinkedRef().SendStealAlarm(Game.GetPlayer())

	if akActionRef == Game.GetPlayer()
		if pTGRFOQuest.GetStage() < 50
			NPCHumanWritingTG.Play(Self.GetRef())
			pTGRFOQuest.SetStage(50)
		endif
	endif

EndEvent
