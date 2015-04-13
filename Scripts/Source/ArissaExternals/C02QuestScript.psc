Scriptname C02QuestScript extends CompanionsStoryQuest conditional

ReferenceAlias Property PreviousQuestBuddyLocal auto
ReferenceAlias Property Questgiver auto
ReferenceAlias Property Kodlak auto
ReferenceAlias Property Aela auto
ReferenceAlias Property Skjor auto
ReferenceAlias Property Farkas auto
ReferenceAlias Property Vilkas auto

ObjectReference Property AelaStart auto
ObjectReference Property SkjorStart auto
ObjectReference Property FarkasStart auto
ObjectReference Property VilkasStart auto
ObjectReference Property KodlakStart auto

ObjectReference Property ObserverWaitPoint auto
Quest Property C02PostQuest auto

ObjectReference Property C02KickerTrigger auto

; ceremony scene and progression variables
Scene Property Ceremony auto
bool Property PlayerTalkedToQuestgiver auto conditional
bool Property PlayerEnteredCeremonyRoom auto conditional
bool Property KodlakPresentedConflict auto conditional


bool Function OKToMoveQuestionMark(Actor check)
	if (check == Questgiver.GetActorReference() || (check == PreviousQuestBuddyLocal.GetActorReference()) )
		return false
	else
		return true
	endif
EndFunction

Function Init()
	; 1 = Aela
	; 2 = Skjor
	; 3 = Farkas
	; 4 = Vilkas
	
; 	Debug.Trace("CSQ: Calling Init for C02.")

	; make sure this thing doesn't cause any more problems
; 	Debug.Trace("CSQ: Killing C02 kicker trigger.")
	C02KickerTrigger.Delete()
	
	; start this right away so it's good to go when we're done 
	;  (all dialogue in there is conditionalized on C02 proper being completed)
; 	Debug.Trace("CSQ: Starting C02PostQuest")
	C02PostQuest.Start()
	
; 	Debug.Trace("C02: Grabbing previous buddy, setting up questgiver.")
	int prevInd = 0
	ObjectReference previousBuddy = (CentralQuest as CompanionsHousekeepingScript).TrialObserver.GetReference()
	PreviousQuestBuddyLocal.ForceRefTo(previousBuddy)
	
	if     (previousBuddy == Aela.GetReference())
		prevInd = 1
	elseif (previousBuddy == Skjor.GetReference())
		prevInd = 2
	elseif (previousBuddy == Farkas.GetReference())
		prevInd = 3
	elseif (previousBuddy == Vilkas.GetReference())
		prevInd = 4
	endif
	
	; if (prevInd == 0)
; 	; 	Debug.Trace("ERROR: Couldn't find previous buddy from C01. Bailing out. (C02)")
	; 	Stop()
	; 	return
	; endif
		
	; int randInd = 0 
	; while ( (randInd == 0) || (randInd == prevInd) )
	; 	randInd = Utility.RandomInt(1, 4)
	; endwhile
		
	; if     (randInd == 1)
	; 	Questgiver.ForceRefTo(Aela.GetReference())
	; elseif (randInd == 2)
	; 	Questgiver.ForceRefTo(Skjor.GetReference())
	; elseif (randInd == 3)
	; 	Questgiver.ForceRefTo(Farkas.GetReference())
	; elseif (randInd == 4)
	; 	Questgiver.ForceRefTo(Vilkas.GetReference())
	; else
; 	; 	Debug.Trace("ERROR: Couldn't find questgiver. Bailing out. (C02)")
	; 	Stop()
	; 	return
	; endif

	; Forget randomness
	Questgiver.ForceRefTo(Vilkas.GetReference())
	
	; get everyone into position
; 	Debug.Trace("C02: Moving everyone into position.")
	Kodlak.GetReference().MoveTo(KodlakStart)
	if OKToMoveQuestionMark(Aela.GetActorReference())
		Aela.GetReference().MoveTo(AelaStart);
	endif
	if OKToMoveQuestionMark(Skjor.GetActorReference())
		Skjor.GetReference().MoveTo(SkjorStart)
	endif
	if OKToMoveQuestionMark(Farkas.GetActorReference())
		Farkas.GetReference().MoveTo(FarkasStart)
	endif
	if OKToMoveQuestionMark(Vilkas.GetActorReference())
		Vilkas.GetReference().MoveTo(VilkasStart)
	endif
	
	Questgiver.GetReference().MoveTo(ObserverWaitPoint)
	
	Ceremony.Start()	
EndFunction

Function Teardown()
	Ceremony.Stop()
	parent.Teardown()
EndFunction
