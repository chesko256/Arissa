;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_TG00SPArrest_0004EF25 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TG00SPArrestGuardAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG00SPArrestGuardAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG00SPArrestBrandSheiAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG00SPArrestBrandSheiAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG00SPArrestCity
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_TG00SPArrestCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG00SPArrestGuardImpAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG00SPArrestGuardImpAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG00SPArrestGuardSClkAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG00SPArrestGuardSClkAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TG00SPArrestQuestScript
Quest __temp = self as Quest
TG00SPArrestQuestScript kmyQuest = __temp as TG00SPArrestQuestScript
;END AUTOCAST
;BEGIN CODE
;Quest Terminates
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Move back to town
Alias_TG00SPArrestBrandSheiAlias.GetActorRef().MoveTo(pTG00BrandSheiMarker)
Alias_TG00SPArrestBrandSheiAlias.GetActorRef().SetOutfit(pMerchantClothesOutfit01NoHat,false)
Alias_TG00SPArrestBrandSheiAlias.GetActorRef().EvaluatePackage()
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TG00SPArrestQuestScript
Quest __temp = self as Quest
TG00SPArrestQuestScript kmyQuest = __temp as TG00SPArrestQuestScript
;END AUTOCAST
;BEGIN CODE
;Initialize Scene
if Alias_TG00SPArrestCity.GetLocation().GetKeywordData(kmyQuest.pTG00SPArrestCWOwner) == 1
;Imperials
Alias_TG00SPArrestGuardAlias.ForceRefTo(Alias_TG00SPArrestGuardImpAlias.GetRef())
else
;Stormcloaks
Alias_TG00SPArrestGuardAlias.ForceRefTo(Alias_TG00SPArrestGuardSClkAlias.GetRef())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Move to Prison, Maintenance
pTG00BrandSheiJail.Value = 1
Alias_TG00SPArrestGuardAlias.GetActorRef().Disable()
Alias_TG00SPArrestBrandSheiAlias.GetActorRef().MoveTo(pTG00BrandSheiJailMarker)
Alias_TG00SPArrestBrandSheiAlias.GetActorRef().SetOutfit(pPrisonerOutfit,false)
Alias_TG00SPArrestBrandSheiAlias.GetActorRef().EvaluatePackage()
RegisterForSingleUpdateGameTime(130)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pTG00BrandSheiJail  Auto  

ObjectReference Property pTG00BrandSheiJailMarker  Auto  

Outfit Property pPrisonerOutfit  Auto  

Outfit Property pMerchantClothesOutfit01NoHat  Auto  

ObjectReference Property pTG00BrandSheiMarker  Auto  
