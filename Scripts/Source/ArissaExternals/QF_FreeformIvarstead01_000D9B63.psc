;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_FreeformIvarstead01_000D9B63 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFI01WilhelmAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFI01WilhelmAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFI01JournalAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFI01JournalAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player obtained journal
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player tasked with exploring the barrow
SetObjectiveDisplayed(10,1)
pShroudHearthMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Quest Completed

;Add the claw via its alias on dunShroudHearthBarrowQST so I can hold it as a quest item.
dunShroudHearth_SapphireClawAlias.GetReference().Enable()
Game.GetPlayer().additem(dunShroudHearth_SapphireClawAlias.GetReference())

if IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
Alias_FFI01WilhelmAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
pWilhelm.SetEssential(false)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
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

Quest Property pFFI01Quest  Auto  

MiscObject Property pFFI01Claw  Auto  

ActorBase Property pWilhelm  Auto  

ObjectReference Property pShroudHearthMapMarker  Auto  

Quest Property dunShroudHearthBarrowQST  Auto  

ReferenceAlias Property dunShroudHearth_SapphireClawAlias  Auto  
