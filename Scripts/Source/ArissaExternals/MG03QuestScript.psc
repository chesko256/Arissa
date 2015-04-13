Scriptname MG03QuestScript extends Quest  Conditional

int Property MG03OrthornFree  Auto  Conditional
int Property MG03CallerInit Auto Conditional
int Property MG03OrthornCaller  Auto  Conditional

int Property MG03CallerFactionSwap  Auto  Conditional

int Property MG03CallerPermission  Auto  Conditional

int Property MG03GuardSceneRun Auto Conditional


Function VCount()

	ModObjectiveGlobal(1, MG03BooksFound, 30)
	If MG03BooksFound.value == MG03BooksTotal.Value
		SetStage(60)
	endif

EndFunction


Function BossFight()

	if GetStageDone(60) == 0
		if MG03CallerFactionSwap == 1
			MG03Caller.GetActorReference().SetFactionRank(MG03CallerHostileFaction, 1)
			MG03Caller.GetActorReference().EvaluatePackage()
			MG03CallerFactionSwap=-1
			UnregisterforUpdate()
		endif
	endif

EndFunction


Event OnUpdate()


	if MG03GuardSceneRun == 1
		MG03GuardSceneRun=0
		Utility.Wait(20)
		GuardScene.Start()
	endif		


EndEvent



ReferenceAlias Property MG03Caller  Auto  

Faction Property MG03CallerHostileFaction  Auto  

Scene Property GuardScene  Auto  

GlobalVariable Property MG03BooksFound  Auto  
GlobalVariable Property MG03BooksTotal  Auto

GlobalVariable Property FavorRewardSmall  Auto  

int Property MG03OrthornIntro  Auto  Conditional

int Property EndSceneDone  Auto  Conditional

int Property OrthornFG  Auto  Conditional

int Property OrthornReject  Auto  Conditional

int Property FaraldaGreet  Auto  Conditional

int Property MG03AncanoConvo  Auto  Conditional
