;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname SF_C01PostAmbush_000A6F8D Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
ReleaseSwitch.Activate(Observer.GetRef())
(GetOwningQuest() as C01QuestScript).ObserverTurnBack()
C01PostWolfSceneEnableMarker.enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property ReleaseSwitch  Auto  

ReferenceAlias Property Observer  Auto  

ObjectReference Property C01PostWolfSceneEnableMarker  Auto  
