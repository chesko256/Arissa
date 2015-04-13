;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_FreeformRiften04_00053308 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFR04IngunAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFR04IngunAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFR04PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFR04PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Ingun assigned herb quest to Player
SetObjectiveDisplayed(10,1)
SetObjectiveDisplayed(20,1)
SetObjectiveDisplayed(30,1)
pFFR04QS.Nirncount()
pFFR04QS.Deathbellcount()
pFFR04QS.Nightshadecount()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Deathbell Done
SetObjectiveCompleted(35,1)
Game.GetPlayer().RemoveItem(pFFR04DeathBell,20)
Game.GetPlayer().AddItem(pFF04Gold)
if pFFR04Done < 3
pFFR04Done += 1
endif

if pFFR04Done == 3
setstage(60)
pFFR04Done = 4
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Nightshade Done
SetObjectiveCompleted(25,1)
Game.GetPlayer().RemoveItem(pFFR04Nightshade,20)
Game.GetPlayer().AddItem(pFF04Gold)
if pFFR04Done < 3
pFFR04Done += 1
endif

if pFFR04Done == 3
setstage(60)
pFFR04Done = 4
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;All Herbs given to Ingun
Game.GetPlayer().AddItem(pKey,1)
pThaneCount.Value += 1
pFFRTQS.ThaneCheck()
Alias_FFR04IngunAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Nirnroot Done
SetObjectiveCompleted(15,1)
Game.GetPlayer().RemoveItem(pFFR04Nirnroot,20)
Game.GetPlayer().AddItem(pFF04Gold)
if pFFR04Done < 3
pFFR04Done += 1
endif

if pFFR04Done == 3
setstage(60)
pFFR04Done = 4
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Everything found - final reward topic opens
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;StartUp
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Ingredient Property pFFR04Nirnroot  Auto  

Ingredient Property pFFR04Nightshade  Auto  

Ingredient Property pFFR04DeathBell Auto  

LeveledItem Property pFF04Gold  Auto  

int Property pFFR04Done  Auto  

Key Property pKey  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pThaneCount  Auto  

FFR04QuestScript Property pFFR04QS  Auto  
