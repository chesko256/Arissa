;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_MS05_BardGhost05_00016E96 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(Bard.GetActorRef() as dunDeadMensBardGhostScript).FadeOut()
Utility.Wait(0.5)
BardScene05MistMarker.GetReference().Activate(Bard.GetReference())
GetOwningQuest().SetStage(69)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Bard  Auto  

ReferenceAlias Property BardScene05MistMarker  Auto  
