Scriptname MS14ThonnirScript extends ReferenceAlias  

Scene Property MS14MobSceneTown  Auto  

Int SceneStarted

;Event OnUpdate()
;     If SceneStarted == 0
;         If GetOwningQuest().GetStage() == 100
;            If GetRef().GetDistance(Game.GetPlayer()) < 768
;                MS14MobSceneTown.Start()
;                SceneStarted = 0
;            EndIf
;        EndIf
;    EndIf
;EndEvent