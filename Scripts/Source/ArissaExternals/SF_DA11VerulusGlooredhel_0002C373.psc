;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_DA11VerulusGlooredhel_0002C373 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
If GetOwningQuest().GetStageDone(225) == 0
  GetOwningQuest().SetStage(50)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Message property MoveHack auto
ObjectReference property PlayerMarker auto
ObjectReference property VerulusMarker auto
ObjectReference property GlooredhelMarker auto
ReferenceAlias property Verulus auto
ReferenceAlias property Glooredhel auto

Quest Property DA11  Auto  
