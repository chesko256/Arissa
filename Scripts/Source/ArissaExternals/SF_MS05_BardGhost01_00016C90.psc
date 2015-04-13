;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname SF_MS05_BardGhost01_00016C90 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(Bard.GetActorRef() as dunDeadMensBardGhostScript).FadeOut()
Utility.Wait(0.5)
BardScene01MistMarker.GetReference().Activate(Bard.GetReference())
GetOwningQuest().SetStage(29)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Bard  Auto  

ReferenceAlias Property BardScene01MistMarker  Auto  

EffectShader Property GhostShader  Auto  

EffectShader Property EtherialShader  Auto  
