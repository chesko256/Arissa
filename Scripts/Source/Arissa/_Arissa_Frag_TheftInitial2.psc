;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Arissa_Frag_TheftInitial2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if iNPCSystem.ArissaGaveInitialGold == false
    Game.GetPlayer().AddItem(Gold001, 98)
    iNPCSystem.ArissaGaveInitialGold = true
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
MiscObject property Gold001 auto
_Arissa_iNPC_Behavior Property iNPCSystem auto
