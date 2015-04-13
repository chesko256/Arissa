;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_MGRArniel03_0006A097 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Convector7
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Convector7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoulGemStage3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SoulGemStage3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoulGemStage4
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SoulGemStage4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Convector6
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Convector6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoulGemStage2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SoulGemStage2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Arniel
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Arniel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Convector3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Convector3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Convector4
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Convector4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Convector5
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Convector5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoulGemStage1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SoulGemStage1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Convector2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Convector2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MGRArniel03Script
Quest __temp = self as Quest
MGRArniel03Script kmyQuest = __temp as MGRArniel03Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(20,0)
SetObjectiveDisplayed(30,0)
SetObjectiveCompleted(10, abCompleted=False)
SetObjectiveDisplayed(10,1)
if DoOnce == 0
Game.GetPlayer().Additem(Alias_SoulGemStage1.GetReference(), 1)
Game.GetPlayer().AddSpell(ArnielSpell)
MGRArniel03Script QuestScript = kmyQuest as MGRArniel03Script
QuestScript.SoulGemStage=1
DoOnce = 1
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
MGRArniel04.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE MGRArniel03Script
Quest __temp = self as Quest
MGRArniel03Script kmyQuest = __temp as MGRArniel03Script
;END AUTOCAST
;BEGIN CODE
Alias_Arniel.GetActorReference().ModFavorPoints(FavorRewardSmall.GetValueInt())
Game.GetPlayer().RemoveItem(Alias_SoulGemStage4.GetReference(),1)
kmyquest.RegisterforSingleUpdateGameTime(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Spell Property ArnielSpell  Auto  

int Property DoOnce  Auto  

GlobalVariable Property FavorRewardSmall  Auto  

Quest Property MGRArniel04  Auto  
