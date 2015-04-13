;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_FreeformRiften02_00053306 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften02LynlyAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften02LynlyAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften02SibbiAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften02SibbiAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player is prompted to tell Sibbi where Lynly is.
SetObjectiveDisplayed (10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player found out Svidi is Lynly in Ivarstead
SetObjectiveCompleted (10,1)
SetObjectiveDisplayed (20,1)
SetObjectiveDisplayed (30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Player made the choice after speaking to Sibbi
Game.GetPlayer().AddItem(pKey,1)
pThaneCount.Value += 1
Alias_FFRiften02SibbiAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
pFFRTQS.ThaneCheck()
if pFFRiften02LynlyFriend.Value == 1
Alias_FFRiften02LynlyAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
endif
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest Startup
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property pKey  Auto  

GlobalVariable Property pThaneCount  Auto

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pFFRiften02LynlyFriend  Auto  
