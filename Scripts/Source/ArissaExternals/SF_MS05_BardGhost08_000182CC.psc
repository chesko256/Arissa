;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_MS05_BardGhost08_000182CC Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
GetOwningQuest().SetStage(95)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(Bard.GetActorRef() as dunDeadMensBardGhostScript).FadeOut()
Utility.Wait(0.5)
Bard08MistMarker.GetReference().Activate(Bard.GetReference())
GetOwningQuest().SetStage(99)
; Debug.Trace("Mist Marker Activated")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Bard  Auto  

ReferenceAlias Property Bard08MistMarker  Auto  
