;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_MGRitual03_00099F27 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Phinis
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Phinis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SummonLocationMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SummonLocationMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SigilStoneAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SigilStoneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DremoraAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DremoraAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MGHoldingChest
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MGHoldingChest Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
Game.GetPlayer().AddItem(Alias_SigilStoneAlias.GetReference(),1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE MGRitual03QuestScript
Quest __temp = self as Quest
MGRitual03QuestScript kmyQuest = __temp as MGRitual03QuestScript
;END AUTOCAST
;BEGIN CODE
MGRitualDremoraFaction.SetAlly(PlayerFaction)
kmyQuest.DremoraFlag=8
Alias_DremoraAlias.GetReference().PlaceAtMe(SummonTargetFXActivator,1)
Utility.Wait(0.33)
Alias_DremoraAlias.GetReference().Disable()
kmyQuest.DremoraSummoned=0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().AddItem(SpellTomeFlameThrall,1)
Game.GetPlayer().AddItem(SigilStone, 1)
AtrFrgDaedricRecipeChance.setValueInt(98)
AtrFrgDaedricRecipeChestChance.setValueInt(95)
MGRitualConjBook.SetValue(0)
ConjurationVendorChest.AddItem(SpellTomeDeadThrall,1)
ConjurationVendorChest.AddItem(SpellTomeFrostThrall,1)
ConjurationVendorChest.AddItem(SpellTomeStormThrall,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE MGRitual03QuestScript
Quest __temp = self as Quest
MGRitual03QuestScript kmyQuest = __temp as MGRitual03QuestScript
;END AUTOCAST
;BEGIN CODE
;Dremora goes hostile first time
MGRitualDremoraFaction.SetEnemy(PlayerFaction)
MGRitualDremoraFaction.SetEnemy(CollegeofWinterholdFaction)
kmyQuest.DremoraFlag=2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE MGRitual03QuestScript
Quest __temp = self as Quest
MGRitual03QuestScript kmyQuest = __temp as MGRitual03QuestScript
;END AUTOCAST
;BEGIN CODE
;player kill dremora first time
MGRitualDremoraFaction.SetAlly(PlayerFaction)
MGRitualDremoraFaction.SetAlly(CollegeofWinterholdFaction)
kmyQuest.DremoraFlag=3
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;player has been given spell
SetObjectiveDisplayed(10,1)
Game.GetPlayer().Addspell(Ritual03Spell)
MGRitual03LightRef.Enable()
MGRitualDremoraFaction.SetAlly(PlayerFaction)
MGRitualDremoraFaction.SetAlly(CollegeofWinterholdFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE MGRitual03QuestScript
Quest __temp = self as Quest
MGRitual03QuestScript kmyQuest = __temp as MGRitual03QuestScript
;END AUTOCAST
;BEGIN CODE
;dremora goes hostile 2nd time
MGRitualDremoraFaction.SetEnemy(PlayerFaction)
MGRitualDremoraFaction.SetEnemy(CollegeofWinterholdFaction)
kmyQuest.DremoraFlag=5
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE MGRitual03QuestScript
Quest __temp = self as Quest
MGRitual03QuestScript kmyQuest = __temp as MGRitual03QuestScript
;END AUTOCAST
;BEGIN CODE
;player kills dremora 2nd time
MGRitualDremoraFaction.SetAlly(PlayerFaction)
MGRitualDremoraFaction.SetAlly(CollegeofWinterholdFaction)
kmyQuest.DremoraFlag=6
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Spell Property Ritual03Spell  Auto  

Faction Property MGRitualDremoraFaction  Auto  

faction Property PlayerFaction  Auto  

Book Property SpellTomeFlameThrall  Auto  

GlobalVariable Property MGRitualConjBook  Auto  

ObjectReference Property ConjurationVendorChest  Auto  

Book Property SpellTomeFrostThrall  Auto  

Book Property SpellTomeDeadThrall  Auto  


Book Property SpellTomeStormThrall  Auto  

Activator Property SummonTargetFXActivator  Auto  

miscobject Property SigilStone  Auto  

ObjectReference Property MGRitual03LightRef  Auto  

GlobalVariable Property AtrFrgDaedricRecipeChance  Auto  

GlobalVariable Property AtrFrgDaedricRecipeChestChance  Auto  

Faction Property CollegeofWinterholdFaction  Auto  
