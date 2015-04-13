;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_MS05_BardGhost02_00016E5F Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Bard.GetActorRef() as dunDeadMensBardGhostScript).FadeOut()
Utility.Wait(0.5)
BardScene02MistMarker.GetReference().Activate(Bard.GetReference())
GetOwningQuest().Setstage(39)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Bard  Auto  

ReferenceAlias Property BardScene02MistMarker  Auto  
