;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 40
Scriptname QF_DA03_0001BFC4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY WizardLeader
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WizardLeader Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA03BarbasMeetTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA03BarbasMeetTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BarbasMoveToSpot
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BarbasMoveToSpot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Barbas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Barbas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ClavicusVilewithBarbas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ClavicusVilewithBarbas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ClavicusVilePreQuestStatue
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ClavicusVilePreQuestStatue Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ClavicusVile
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ClavicusVile Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA03BarbasMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA03BarbasMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RimerockBurrowMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RimerockBurrowMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HaemarsShameQuickExit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HaemarsShameQuickExit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HaemarsShameMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HaemarsShameMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RimerockBurrowMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RimerockBurrowMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RuefulAxe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RuefulAxe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HaemarsShameMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HaemarsShameMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RuefulAxeEnabler
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RuefulAxeEnabler Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;Player enters Rimerock Burrow with Barbas.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;Player kills Barbas. Go to 205 for quest ending.

SetObjectiveCompleted(150)
SetObjectiveDisplayed(155)
;Alias_ClavicusVile.GetReference().Say(EndTopic)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;NOT NORMALLY CALLED - 
     ;moves him to a Wilderness Encounter near Haemar's Shame 
Game.GetPlayer().moveto(DA03TEMPMoveMarker)
     ;normally would set level
;Game.GetPlayer().setlevel(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN AUTOCAST TYPE DA03Script
Quest __temp = self as Quest
DA03Script kmyQuest = __temp as DA03Script
;END AUTOCAST
;BEGIN CODE
;End of scene - Player has been told about the Axe and knows where to go. 
;Barbas set to go to shrine. Obj 100.
Alias_WizardLeader.GetRef().enable()
Alias_RuefulAxeEnabler.GetRef().enable()
SetObjectiveCompleted(50)
SetObjectiveDisplayed(100)
kmyQuest.BarbasFollow = 1
Alias_Barbas.GetActorRef().EvaluatePackage()
Alias_RimerockBurrowMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;Barbas has said his piece, and player is not going directly to Shrine. 
;Barbas will wait for player outside Shrine. Obj 25.
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
;Player is not going directly to the shrine, Barbas stops following & says he'll meet him there. Obj 105
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;All but the last of the bandits are dead - spawn Barbas and have him kill the last one (killing the last one goes to stage 10)
;Barbas appears behind the player
;Move DA03BarbasAppearMarker behind player
;Alias_Barbas.GetRef().moveto(BarbasAppearMarker)
;Give Barbas a package to attack the last bandit
;TEMP - just go to stage 10
alias_Barbas.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
;Player has returned to Barbas at Burrow, Barbas starts following again.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;Player has returned to Barbas at Shrine, Barbas starts following again.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
;Barbas's Intro dialogue has played.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Player returns to Vile, Vile presents his deal. Obj 150.


SetObjectiveCompleted(110)
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;The last bandit is dead, and Barbas talks to the player. Obj 10 is called at end of greeting..
DA03Start.Setstage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;Vile Ending.
SetObjectiveCompleted(155)
AchievementsQuest.IncDaedricQuests()
Alias_ClavicusVilePreQuestStatue.GetRef().Enable()
Alias_ClavicusVile.GetRef().Disable()

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN AUTOCAST TYPE DA03Script
Quest __temp = self as Quest
DA03Script kmyQuest = __temp as DA03Script
;END AUTOCAST
;BEGIN CODE
;Player is not going directly to Burrow, Barbas stops following & says he'll meet him there. Obj 75
kmyQuest.BarbasFollow = 1
Alias_Barbas.GetActorRef().EvaluatePackage()
Alias_RimerockBurrowMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
;Player has returned to Barbas at Shrine, Barbas starts following again.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Player has killed the werewolf and taken the axe from his corpse. Obj 110.
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;Alias_Barbas.GetActorRef().evaluatepackage()
Alias_Barbas.GetRef().PlaceAtMe(SummonFX)
Utility.wait(1)
Alias_Barbas.GetRef().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
;Alias_ClavicusVileWithBarbas.GetRef().PlaceAtMe(SummonFX)
;lias_Barbas.GetRef().moveto(Alias_BarbasMovetoSpot.GetRef())
BarbasMovetoMarker.PlaceAtMe(SummonFX)
Utility.wait(1)
Alias_ClavicusVilewithBarbas.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;Barbas Ending.
Alias_ClavicusVile.GetRef().Disable()
Game.GetPlayer().additem(Masque, 1)
AchievementsQuest.IncDaedricArtifacts()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
;Player has reached the shrine and Vile begins talking (scene with Vile, Barbas, and Player)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Player talks to Vile again and gives Axe. Go to 200 for quest ending.
Alias_Barbas.GetActorRef().Stopcombat()
Game.GetPlayer().removeitem(RuefulAxe, 1000)
SetObjectiveCompleted(150)
BarbasVileReunited.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;The player has heard Barbas's request and knows to go with him to the Shrine. Obj 50.
SetObjectiveCompleted(20)
SetObjectiveCompleted(25)
SetObjectiveDisplayed(50)
Alias_Barbas.GetActorRef().EvaluatePackage()
Alias_ClavicusVile.GetRef().Enable()
Alias_ClavicusVilePreQuestStatue.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has been given meat from Lod and is looking for Barbas.
Alias_Barbas.GetActorref().enable()
Alias_Barbas.GetActorref().AllowPCDialogue(true)
Alias_Barbas.GetRef().Moveto(Alias_DA03BarbasMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;Barbas has introduced himself
SetObjectiveDisplayed(25)
alias_HaemarsShameMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DA03TEMPMoveMarker  Auto  

ObjectReference Property BarbasAppearMarker  Auto  

Weapon Property RuefulAxe  Auto  

Scene Property BarbasVileReunited  Auto  

Armor Property Masque  Auto  

Quest Property DA03Start  Auto  

Topic Property EndTopic  Auto  

AchievementsScript Property AchievementsQuest  Auto  

Activator Property SummonFX  Auto  

ObjectReference Property BarbasMovetoMarker  Auto  
