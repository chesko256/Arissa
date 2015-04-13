;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_WIKill04_00071441 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Victim
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Enemy
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Enemy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Killer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Killer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Letter Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE WIKill04Script
Quest __temp = self as Quest
WIKill04Script kmyQuest = __temp as WIKill04Script
;END AUTOCAST
;BEGIN CODE
;Enemy gives player the reward
Game.GetPlayer().addItem(kmyquest.Gold001, kmyquest.Reward)
	setObjectiveCompleted(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE WIKill04Script
Quest __temp = self as Quest
WIKill04Script kmyQuest = __temp as WIKill04Script
;END AUTOCAST
;BEGIN CODE
;player reads letter
setObjectiveCompleted(1)
if kmyquest.Rank == -2
	setObjectiveDisplayed(10)
else
	Alias_Enemy.GetActorReference().AddToFaction(kmyquest.WIKill04ThankFaction)
	stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIKill04Script
Quest __temp = self as Quest
WIKill04Script kmyQuest = __temp as WIKill04Script
;END AUTOCAST
;BEGIN CODE
;debug.messageBox("WIKill04 Started")
kmyquest.SetNextEventGlobals()			;lives in parent script WorldInteractionsScript

kmyquest.setRewardVariables(Alias_Victim, Alias_Enemy)
; debug.trace("WIKill04: Rank =" + kmyquest.Rank)
if kmyquest.Rank <= -2
	Alias_Letter.ForceRefTo(Alias_Enemy.GetReference().PlaceAtMe(kmyquest.LetterReward, 1))
else
	Alias_Letter.ForceRefTo(Alias_Enemy.GetReference().PlaceAtMe(kmyquest.LetterThanks, 1))
endif

(kmyquest.WICourier as WICourierScript).addItemToContainer(Alias_Letter.GetReference())	;add the letter to the courier so he will deliver it
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
SetObjectiveDisplayed(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
