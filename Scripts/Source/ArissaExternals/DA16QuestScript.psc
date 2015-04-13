Scriptname DA16QuestScript extends Quest  Conditional

int Property pDA16Rude  Auto  Conditional
int Property pDA16FirstSceneBreak  Auto  Conditional
int Property pDA16VerenToggle  Auto  Conditional
int Property pDA16ThorekToggle  Auto  Conditional
int Property pDA16ErandurToggle  Auto  Conditional
int Property pDA16ErandurGreet01Done  Auto  Conditional
int Property pDA16ErandurGreetFirstDone  Auto  Conditional
int Property pDA16ErandurGreetFirstAfterDone  Auto  Conditional
int Property pDA16ErandurGreetPostRitualDone  Auto  Conditional
int Property pDA16SceneStarter Auto Conditional
int Property pDA16OrdersCounter Auto Conditional
int Property pDA16Moved Auto Conditional
int Property pDADial Auto Conditional
int Property pDADial02 Auto Conditional
int Property pDA16IHaveTorpor Auto Conditional
int Property pDA16IHaveTome Auto Conditional
int Property pDA16LibraryDone Auto Conditional
int Property pDA16LabDone Auto Conditional
Scene Property pDA16InitScene Auto Conditional
Scene Property pDA16ConfrontScene Auto Conditional
ReferenceAlias Property pDA16VerenAlias  Auto  Conditional
ReferenceAlias Property pDA16ThorekAlias  Auto  Conditional
ReferenceAlias Property pDA16ErandurAlias  Auto  Conditional
Quest Property pDA16Quest  Auto  Conditional
ObjectReference Property pDA16DreamSetup  Auto  Conditional
ObjectReference Property pDA16PlayerStartDream Auto Conditional
ObjectReference Property pDA16PlayerEndDream Auto Conditional
Scene Property pDA16RitualScene  Auto  Conditional
ActorBase Property pDA16Erandur  Auto  Conditional
ObjectReference Property pDA16ErandurMarker  Auto  Conditional
objectReference Property DA16DreamActorEnableMarker  Auto  
objectReference Property DA16PresentActorEnableMarker  Auto  
objectReference Property DA16PreQuestActorEnableMarker  Auto  
objectReference Property DA16PresentPostDreamActorEnableMarker  Auto  
ImageSpaceModifier Property DreamISMD  Auto  
ObjectReference Property DA16DreamActorEnableMarker02  Auto
GlobalVariable Property pDA16LibraryVar Auto
GlobalVariable Property pDA16LabVar Auto
GlobalVariable Property pDA16BossVar Auto

Function LibraryTally()

	pDA16LibraryVar.Value += 1

	if pDA16LibraryDone == 0
		if pDA16LibraryVar.Value >= 5
			pDA16LibraryDone = 1
		endif		
	endif

EndFunction


Function LabTally()

	pDA16LabVar.Value += 1

	if pDA16LabDone == 0
		if pDA16LabVar.Value >= 7
			pDA16LabDone = 1
		endif
	endif

EndFunction

Function BossTally()

	if pDA16Quest.GetStage() == 191
		if pDA16BossVar.Value >= 2
			pDA16Quest.SetStage(192)
		endif
	endif

EndFunction

Event OnUpdate()

	bool ContinueUpdating = true

	if pDA16LibraryDone == 1
		if pDA16Quest.GetStageDone(60) == 0
			if Game.GetPlayer().IsInCombat() == 0	
				pDA16Quest.SetStage(60)
				ContinueUpdating = False
			endif
		endif
	endif

	if pDA16LabDone == 1
		if pDA16Quest.GetStageDone(100) == 0
			if Game.GetPlayer().IsInCombat() == 0	
				pDA16Quest.SetStage(100)
				ContinueUpdating = False
			endif
		endif
	endif

	if ContinueUpdating
		RegisterForSingleUpdate(1)
	endif

endEvent