;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_FreeformRiften11_00041F91 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften11IndarynAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften11IndarynAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften11MarkAlias01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften11MarkAlias01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften11MarkAlias03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften11MarkAlias03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften11HaelgaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften11HaelgaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften11BolliAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften11BolliAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften11HofgrirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften11HofgrirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften11SvanaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften11SvanaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften11MarkAlias02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften11MarkAlias02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Got the Mark from Indaryn
SetObjectiveCompleted(30,1)
pMarkCount.Value += 1
if pMarkCount.Value >= 3
SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Go talk to Svana
Game.GetPlayer().RemoveItem(Alias_FFRiften11MarkAlias01.GetRef())
Game.GetPlayer().RemoveItem(Alias_FFRiften11MarkAlias02.GetRef())
Game.GetPlayer().RemoveItem(Alias_FFRiften11MarkAlias03.GetRef())
Game.GetPlayer().AddItem(pHReward,1)
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
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

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
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
;Got the Mark from Hofgrir
SetObjectiveCompleted(20,1)
pMarkCount.Value += 1
if pMarkCount.Value >= 3
SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;All Marks Done!
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Got the Mark from Bolli
SetObjectiveCompleted(10,1)
pMarkCount.Value += 1
if pMarkCount.Value >= 3
SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Quest given, obtain the marks
SetObjectiveDisplayed(10,1)
SetObjectiveDisplayed(20,1)
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Quest Completed
Game.GetPlayer().AddItem(pSReward,1)
pThaneCount.Value += 1
pFFRTQS.ThaneCheck()
Alias_FFRiften11SvanaAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pMarkCount  Auto  

LeveledItem Property pHReward  Auto  

LeveledItem Property pSReward  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pThaneCount  Auto  
