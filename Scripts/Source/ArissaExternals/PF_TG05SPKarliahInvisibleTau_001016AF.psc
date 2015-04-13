;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_TG05SPKarliahInvisibleTau_001016AF Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
pKarliah.GetActorRef().AddSpell(pTG05Invisibility)
TG05KarliahVanishAudio.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property pKarliah  Auto  

Spell Property pTG05Invisibility  Auto  

Sound Property pQSTTG05KarliahVanish  Auto  

ObjectReference Property TG05KarliahVanishAudio  Auto  
