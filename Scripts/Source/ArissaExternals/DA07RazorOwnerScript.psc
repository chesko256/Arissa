scriptName DA07RazorOwnerScript extends ReferenceAlias

Quest property DA07 auto

Event OnDeath(Actor akKiller)
	 ;Increment razor owner death tracker
	 DA07QuestScript MyQuest
	 MyQuest = DA07 as DA07QuestScript
	 MyQuest.IncrementDead()
EndEvent