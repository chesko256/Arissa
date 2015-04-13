;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Arissa_Frag_InitialTheft_Neither Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(Gold001, 98)
iNPCSystem.ArissaTalkedAbout_TownTheft = true
iNPCSystem.ArissaHasStolen = false
iNPCSystem.IncreaseRegardMinor()
self.GetOwningQuest().Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
MiscObject property Gold001 auto
_Arissa_iNPC_Behavior Property iNPCSystem auto
