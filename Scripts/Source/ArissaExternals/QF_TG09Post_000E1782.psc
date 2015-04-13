;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_TG09Post_000E1782 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TG09PostGallusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG09PostGallusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG09PostBrynjolfAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG09PostBrynjolfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG09PostKarliahAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG09PostKarliahAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Scene Has Completed
pTG09GallusEffectRef.PlayGamebryoAnimation("Playanim01")
Alias_TG09PostGallusAlias.GetActorRef().Disable(true)
pTG09GallusEffectRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Debug Quest Start
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE TG09PostQuestScript
Quest __temp = self as Quest
TG09PostQuestScript kmyQuest = __temp as TG09PostQuestScript
;END AUTOCAST
;BEGIN CODE
;Player exited the Inner Sanctum
Alias_TG09PostKarliahAlias.GetActorRef().Moveto(pTG09PostKarliahMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TG09PostQuestScript
Quest __temp = self as Quest
TG09PostQuestScript kmyQuest = __temp as TG09PostQuestScript
;END AUTOCAST
;BEGIN CODE
;StartUp Scene
utility.wait(5)
Alias_TG09PostGallusAlias.GetActorRef().MoveTo(kmyQuest.pTG09PostStartMarker)
Alias_TG09PostGallusAlias.GetActorRef().Enable()
kmyQuest.pTG09PostScene.Start()
pTGUnlockBrynjolf.Value = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE TG09PostQuestScript
Quest __temp = self as Quest
TG09PostQuestScript kmyQuest = __temp as TG09PostQuestScript
;END AUTOCAST
;BEGIN CODE
;End Questline!
pTGPost.SetStage(110)
pTGRShell.TGLeaderCheck()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pTG09PostKarliahMarker  Auto  

TGRShellScript Property pTGRShell  Auto  

Quest Property pTGPost  Auto  

GlobalVariable Property pTGUnlockBrynjolf  Auto  

ObjectReference Property pTG09GallusEffectRef  Auto  
