Scriptname DA06QuestScript extends Quest  Conditional

int Property OpenSceneDone  Auto  Conditional

int Property Stage30AtubGreet  Auto  Conditional

int Property RitualSceneDone  Auto  Conditional

int Property GiantDead100  Auto  Conditional

int Property GroveGhostAppear  Auto  Conditional

int Property TempYamarzMove  Auto  Conditional

int Property GiantDead  Auto  Conditional

int StartOpenScene


Event OnUpdate()

	if OrcsKilled == 1
		if DA06OrcKilledGreet == 0 
			Da06AtubAlias.GetActorReference().EvaluatePackage()
			DA06OrcKilledGreet = 1
			UnregisterForUpdate()
		endif
	elseif OrcsKilled== 2
		SetStage(255)
		UnregisterForUpdate()
	endif











	if GetStage() == 80


		if DA06YamarzAlias.GetReference().GetDistance(Game.GetPlayer()) < 200
			if DA06YamarzAlias.GetReference().GetDistance(DA06YamarzCaveWaitMarker) < 200
				DA06YamarzOutsideCaveScene.Start()
				UnregisterForUpdate()
			endif
		endif


	endif	







EndEvent
ObjectReference Property DA06YamarzCaveWaitMarker  Auto  

ObjectReference Property DA06UgorSceneMarker Auto


ReferenceAlias Property DA06YamarzAlias  Auto  

ReferenceAlias Property DA06ShagrolAlias  Auto  

ReferenceAlias Property DA06UgorAlias Auto

ReferenceAlias Property DA06AtubAlias Auto

Scene Property DA06OpeningScene Auto
int Property OrcsKilled  Auto  Conditional

int Property DA06OrcKilledGreet  Auto  Conditional

ObjectReference Property DA06GhostShrineMarker  Auto  

int Property ShrineDoOnce  Auto  

ObjectReference Property DA06ShrineRef  Auto  

Scene Property DA06YamarzOutsideCaveScene  Auto  

Ingredient Property DaedraHeart  Auto  

Ingredient Property TrollFat  Auto  

int Property YamarzGroveMarker  Auto  Conditional

int Property AtubReject  Auto  Conditional

int Property OpenSceneStarted  Auto  Conditional
