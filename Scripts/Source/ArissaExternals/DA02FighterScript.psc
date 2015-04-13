Scriptname DA02FighterScript extends ReferenceAlias  
{Script on DA02 Fighter1 and Fighter2 aliases}

Event OnDeath(Actor akKiller)

	if GetOwningQuest().GetStageDone(7) == False
		GetOwningQuest().SetStage(7)		;we should end DA02FightScene2
	EndIf
	

	(GetOwningQuest() as DA02Script).checkDeadAndSetStage(self)	


EndEvent
