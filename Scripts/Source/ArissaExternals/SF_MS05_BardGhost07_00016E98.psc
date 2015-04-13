;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_MS05_BardGhost07_00016E98 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(Bard.GetActorRef() as dunDeadMensBardGhostScript).FadeOut()
Utility.Wait(0.5)
BardScene07MistMarker.GetReference().Activate(Bard.GetReference())
GetOwningQuest().SetStage(89)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property BardScene07MistMarker  Auto  

ReferenceAlias Property Bard  Auto  

Quest Property MS05_dunDeadMensRespiteQST  Auto  
