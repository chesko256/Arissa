Scriptname MS09QuestScript extends Quest  Conditional

int Property MS09SceneRun  Auto  Conditional

int Property MS09HomeSceneStart Auto Conditional


int Property MS09HomeSceneDone  Auto  Conditional

int Property MS09AvulMoveToKeep  Auto  Conditional

ReferenceAlias Property MS09AvulsteinAlias  Auto  

ObjectReference Property MS09AvulsteinKeepMarker  Auto  

Location Property Whiterun Auto



Event OnUpdate()






	if GetStage() == 50
		if MS09AvulMoveToKeep == 0 
			if Game.GetPlayer().IsInLocation(Whiterun) == 0

				MS09AvulsteinAlias.GetReference().Moveto(MS09AvulsteinKeepMarker)
				MS09AvulMoveToKeep = 1
				MS09SonsSoldier1.GetReference().Enable()
				MS09SonsSoldier2.GetReference().Enable()
				MS09AvulsteinAlias.GetActorReference().EvaluatePackage()
				UnregisterForUpdate()
			else
				RegisterforSingleUpdate(1.0)
			endif
		endif
	endif

;	if GetStage() == 60
;		if MS09ThoraldAlias.GetReference().IsInLocation(NorthwatchKeep) == 0
;			SetStage(100)
;			UnregisterforUpdate()
;		endif
;	endif



EndEvent
Location Property NorthwatchKeep  Auto  

ReferenceAlias Property MS09ThoraldAlias  Auto  

ReferenceAlias Property MS09FraliaAlias  Auto  

Location Property GrayManeHouse  Auto  

Scene Property MS09GrayManeHouseScene  Auto  

int Property MS09AvulsteinSceneTrigger  Auto  Conditional

ReferenceAlias Property MS09SonsSoldier1  Auto  

ReferenceAlias Property MS09SonsSoldier2  Auto  

int Property MS09NonCombat  Auto  Conditional

GlobalVariable Property FavorRewardLarge  Auto  

int Property ProofDelivered  Auto  Conditional

Int Property MS09ThoraldToSafePoint  Auto  Conditional

int Property AvulsteinWait  Auto  Conditional
