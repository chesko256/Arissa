;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname SF_MS05_BardGhostFinale_000182F6 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
BardScene10MistOnMarker.GetReference().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(Bard.GetActorRef() as dunDeadMensBardGhostScript).FadeOut()
BardScene10MistOffMarker.GetReference().Activate(Game.GetPlayer())
BardScene10BeamOffMarker.GetReference().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
BardScene10BeamOnMarker.GetReference().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
BardScene09bMistMarker.GetReference().Activate(Bard.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Bard  Auto  

ReferenceAlias Property BardScene10MistOnMarker  Auto  

ReferenceAlias Property BardScene10MistOffMarker  Auto  

ReferenceAlias Property BardScene10BeamOnMarker  Auto  

ReferenceAlias Property BardScene10BeamOffMarker  Auto  

ReferenceAlias Property BardScene09bMistMarker  Auto  
