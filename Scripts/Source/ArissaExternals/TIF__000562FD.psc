;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000562FD Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pTG02AringothAlias.GetActorRef().SetAV("Aggression",2)
pTG02AringothAlias.GetActorRef().RemoveFromFaction(pTG02ANP)
pTG02AringothAlias.GetActorRef().AddToFaction(pTG02AEP)
pTG02AringothAlias.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property pTG02AringothAlias  Auto  

Faction Property pTG02ANP  Auto  

Faction Property pTG02AEP  Auto  
