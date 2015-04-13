;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_WIAssault02_00039792 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Settlement
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Settlement Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Victim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Enemy
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Enemy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Letter Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE WIAssault02Script
Quest __temp = self as Quest
WIAssault02Script kmyQuest = __temp as WIAssault02Script
;END AUTOCAST
;BEGIN CODE
debug.messagebox("WIAssault02: When books are implemented, quest objective should come after reading the letter.")
setObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE WIAssault02Script
Quest __temp = self as Quest
WIAssault02Script kmyQuest = __temp as WIAssault02Script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetNextEventGlobals()		;lives in parent script WorldInteractionsScript
WICourierScript vWICourierScript = kmyquest.pWICourier as WICourierScript
vWICourierScript.addAliasToContainer(Alias_Letter)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE WIAssault02Script
Quest __temp = self as Quest
WIAssault02Script kmyQuest = __temp as WIAssault02Script
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(20)
setObjectiveCompleted(25)
setObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE WIAssault02Script
Quest __temp = self as Quest
WIAssault02Script kmyQuest = __temp as WIAssault02Script
;END AUTOCAST
;BEGIN CODE
; Quest ends

Game.GetPlayer().Additem(kMyQuest.Gold001, 50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE WIAssault02Script
Quest __temp = self as Quest
WIAssault02Script kmyQuest = __temp as WIAssault02Script
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(10)
setObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
setObjectiveCompleted(10)
setObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
