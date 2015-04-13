Scriptname CR09QuestScript extends CompanionsRadiantQuest Conditional

Quest Property ChildQuest auto

LocationAlias Property Camp auto
Keyword Property SilverHandTarget auto
ReferenceAlias Property CampBoss auto

ReferenceAlias Property Aela auto
Quest Property C03PostQuest auto

Function Accepted()
	(ParentQuest as CompanionsHousekeepingScript).IsCurrentSilverHandTarget = True
	Camp.GetLocation().SetKeywordData(SilverHandTarget, 1)
	parent.Accepted()
	CampBoss.GetReference().GetParentCell().Reset()
EndFunction

Function Finished(bool _succeeded = true, bool _finished = true)
	if (!(ParentQuest as CompanionsHousekeepingScript).DoneReconQuestForAela)
		; send Aela back home
		Aela.GetReference().MoveTo((ParentQuest as CompanionsHousekeepingScript).QuestgiverStandMarker)
		; make sure postquest is done
		C03PostQuest.Stop()
	endif
	(ParentQuest as CompanionsHousekeepingScript).DoneReconQuestForAela = True
	parent.Finished(_succeeded, _finished)
EndFunction

Function Cleanup()
	Camp.GetLocation().SetKeywordData(SilverHandTarget, 0)
	(ParentQuest as CompanionsHousekeepingScript).IsCurrentSilverHandTarget = False
	ChildQuest.Stop()
	parent.Cleanup()
EndFunction
