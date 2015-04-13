;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_dunSleepingTreeCampQST_000E1A9D Extends Quest Hidden

;BEGIN ALIAS PROPERTY BossChest
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BossChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Note
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Note Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SleepingTreeCampLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_SleepingTreeCampLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadThief
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DeadThief Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Buyer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Buyer Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE dunSleepingTreeCampQSTScript
Quest __temp = self as Quest
dunSleepingTreeCampQSTScript kmyQuest = __temp as dunSleepingTreeCampQSTScript
;END AUTOCAST
;BEGIN CODE
;All sleeping tree sap sold
int numSold = game.getPlayer().getItemCount(kmyQuest.SleepingTreeSapBase)
game.getPlayer().removeItem(kmyQuest.SleepingTreeSapBase, numSold)
game.getPlayer().addItem(kmyQuest.gold001, (kmyQuest.goldPerSap * numSold))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Start up stage
if (alias_Buyer.getReference() as actor).isDead()
	setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE dunSleepingTreeCampQSTScript
Quest __temp = self as Quest
dunSleepingTreeCampQSTScript kmyQuest = __temp as dunSleepingTreeCampQSTScript
;END AUTOCAST
;BEGIN CODE
;One sleeping tree sap sold
game.getPlayer().removeItem(kmyQuest.SleepingTreeSapBase, 1)
game.getPlayer().addItem(kmyQuest.gold001, kmyQuest.goldPerSap)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE dunSleepingTreeCampQSTScript
Quest __temp = self as Quest
dunSleepingTreeCampQSTScript kmyQuest = __temp as dunSleepingTreeCampQSTScript
;END AUTOCAST
;BEGIN CODE
;Ysolda has died
kmyQuest.BuyerDead = True
setObjectiveFailed(0)
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE dunSleepingTreeCampQSTScript
Quest __temp = self as Quest
dunSleepingTreeCampQSTScript kmyQuest = __temp as dunSleepingTreeCampQSTScript
;END AUTOCAST
;BEGIN CODE
;Buyer Approached
kmyQuest.BuyerApproached = True
setObjectiveCompleted(0)
alias_DeadThief.getReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE dunSleepingTreeCampQSTScript
Quest __temp = self as Quest
dunSleepingTreeCampQSTScript kmyQuest = __temp as dunSleepingTreeCampQSTScript
;END AUTOCAST
;BEGIN CODE
;player has read note
kmyQuest.NoteObtained = True
setObjectiveDisplayed(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;stop quest, may not be necessary
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
