Scriptname MG05QuestScript extends Quest  Conditional


int Property MG05InitialScene auto Conditional
int Property MG05DremoraSceneVar auto Conditional
int Property MG05RubbleCleared auto Conditional
int Property MG05CreatureCount auto Conditional

Function VCount()
; 	debug.trace("VCount" + Self)
	ModObjectiveGlobal(1, MG05CreaturesKilled, 40)
	if MG05CreaturesKilled.value == MG05CreaturesTotal.value	
		SetStage(50)
	endif

EndFunction



int Property MG05Aid = 0 Auto  Conditional

GlobalVariable Property MG05CreaturesKilled  Auto  Conditional
GlobalVariable Property MG05CreaturesTotal  Auto  Conditional
GlobalVariable Property FavorRewardMedium  Auto  
