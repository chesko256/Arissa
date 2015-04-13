Scriptname TG09CircleTriggerScript extends ObjectReference  Conditional

Quest Property pTG09Quest  Auto  Conditional
TGNQuestScript Property pTGNQuestScript Auto Conditional
Spell Property pTG09Spell  Auto  Conditional
Message Property pTGNMessage Auto Conditional

event onTriggerEnter (objectReference activateRef)

	if pTG09Quest.GetStage()>= 70
		if activateRef == Game.GetPlayer()
			if pTGNQuestScript.CanIAward()
				pTGNQuestScript.CleanUpSpells()
				Game.GetPlayer().AddSpell(pTG09Spell)
				pTGNQuestScript.AwardDone()
			else
				pTGNMessage.Show()
			endif
		endif
	endif

	if pTG09Quest.GetStage() == 70
		pTG09Quest.setstage(200)
	endif

endevent