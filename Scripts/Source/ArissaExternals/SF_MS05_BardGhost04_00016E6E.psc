;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname SF_MS05_BardGhost04_00016E6E Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(Bard.GetActorRef() as dunDeadMensBardGhostScript).FadeOut()
Utility.Wait(0.5)
BardScene04MistMarker.GetReference().Activate(Bard.GetReference())
GetOwningQuest().SetStage(59)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Bard  Auto  

ReferenceAlias Property BardScene04Collision  Auto  

ReferenceAlias Property BardScene04Position  Auto  

ReferenceAlias Property BardScene04MistMarker  Auto  
