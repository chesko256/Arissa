;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_FreeformRiften03_00053307 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften03KegAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften03KegAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften03IndarynAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften03IndarynAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften03WilhelmAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften03WilhelmAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften03RomlynAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften03RomlynAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player either delivered the keg or gave it to Indaryn
Game.GetPlayer().RemoveItem(pFFR03BBKeg,1)
pThaneCount.Value += 1
if pFFRiften03Arrested.Value == 0
Alias_FFRiften03RomlynAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
elseif pFFRiften03Arrested.Value == 1
Alias_FFRiften03IndarynAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
endif
pFFRTQS.ThaneCheck()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;StartUp Quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Romlyn gives player Mead to deliver
SetObjectiveDisplayed(10,1)
SetObjectiveDisplayed(20,1)
pIvarsteadMapMarker.AddToMap()
Game.GetPlayer().AddItem(pFFR03BBKeg,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property pFFR03Gold  Auto

ObjectReference Property pFFR03BBKeg  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pThaneCount  Auto  

ObjectReference Property pIvarsteadMapMarker  Auto  

GlobalVariable Property pFFRiften03Arrested  Auto  
