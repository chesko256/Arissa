;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF_MGRitual04_000CD987 Extends Quest Hidden

;BEGIN ALIAS PROPERTY AugurFlame
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AugurFlame Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Augur
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Augur Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ItemContainer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ItemContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Colette
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Colette Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AugurDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AugurDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ItemTrigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ItemTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ghost02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Ghost02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ghost01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Ghost01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ghost03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Ghost03 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Alias_ItemContainer.GetReference().RemoveAllItems(Game.GetPlayer(), true, true)
SetObjectiveCompleted(10)
Alias_AugurDoor.GetReference().Lock(False)
Alias_AugurDoor.GetReference().SetOpen()
Game.GetPlayer().AddSpell(BaneoftheUndead)
MGRitualAltBook.SetValue(0)
RestorationVendorChest.AddItem(SpellTomeGuardianCircle,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE MGRitual04QuestScript
Quest __temp = self as Quest
MGRitual04QuestScript kmyQuest = __temp as MGRitual04QuestScript
;END AUTOCAST
;BEGIN CODE
RegisterforSingleUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE MGRitual04QuestScript
Quest __temp = self as Quest
MGRitual04QuestScript kmyQuest = __temp as MGRitual04QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_AugurFlame.GetReference().SetAnimationVariableFloat("fmagicburnamount", 0.8)
kmyQuest.RegisterForUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
FXMarker.PlaceAtMe(SummonFXActivator)
MGRitual04GhostFaction.SetAlly(CurrentFollowerFaction)
Game.GetPlayer().RemoveAllItems(Alias_ItemContainer.GetReference(), true, true)
Alias_AugurDoor.GetReference().SetOpen(False)
Alias_AugurDoor.GetReference().Lock()
Alias_Augur.GetReference().Disable()
Alias_AugurFlame.GetReference().SetAnimationVariableFloat("fmagicburnamount", 0)

SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Spell Property Ritual02Spell  Auto  

Activator Property SummonFXActivator  Auto  

ObjectReference Property FXMarker  Auto  

Scene Property MGRitual04AugurEndScene  Auto  

Spell Property BaneoftheUndead  Auto  

GlobalVariable Property MGRitualAltBook  Auto  

ObjectReference Property RestorationVendorChest  Auto  

Book Property SpellTomeGuardianCircle  Auto  

Faction Property CurrentFollowerFaction  Auto  

Faction Property MGRitual04GhostFaction  Auto  
