;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 36
Scriptname QF_DA15_0002AC68 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DA15BluePalaWingStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA15BluePalaWingStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pelagius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pelagius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sheogorath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sheogorath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dervenin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dervenin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PelagiusKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PelagiusKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA15BluePalaceReturnMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA15BluePalaceReturnMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA15BluePalacWorldTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA15BluePalacWorldTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA15ParanoiaQT
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA15ParanoiaQT Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Wabbajack
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Wabbajack Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Erdi
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Erdi Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA15LoathingQT
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA15LoathingQT Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA15TerrorQT
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA15TerrorQT Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Falk
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Falk Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Una
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Una Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HipBone
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HipBone Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Doorway
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Doorway Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
SetStage(45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
SetStage(45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
Alias_Dervenin.GetActorRef().Disable()
;Game.GetPlayer().removeitem(Wabbajack, abSilent = true)
;Game.GetPlayer().additem(RealWabbajack, abSilent = true)
;Game.EnablePlayerControls()
;Game.GetPlayer().moveto(alias_DA15BluePalaceReturnMarker.GetRef())
;DA15Container.removeallitems(Game.GetPlayer(), 1)
setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;DA15ExitDoor.enable()
SetObjectiveCompleted(100)
AchievementsQuest.IncDaedricQuests()
DA15Return.Setstage(0)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
PelagiusEnd.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
Game.GetPlayer().removeallitems(DA15Container, 1)
Game.DisablePlayerControls(false, false, false, false, false, true, false, false, 0)
Game.GetPlayer().UnEquipSpell(Game.GetPlayer().GetEquippedSpell(1),1)
Game.GetPlayer().UnEquipSpell(Game.GetPlayer().GetEquippedSpell(0), 0)
Game.GetPlayer().UnEquipSpell(Game.GetPlayer().GetEquippedSpell(2),2)
Game.GetPlayer().UnEquipShout(Game.GetPlayer().GetEquippedShout())

Game.GetPlayer().moveto(alias_DA15BluePalaWingStartMarker.GetRef())
setstage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
SetObjectiveCompleted(45)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;DA15SheogorathREF.addScriptPackage DA15SheogorathGreetPlayer
Alias_Sheogorath.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;(temp testing stage) Player is moved to Dervenin in Solitude, in front of the Blue Palace.;(temp testing stage) Player is moved to Dervenin in Solitude, in front of the Blue Palace.
Game.GetPlayer().MoveTo(Alias_Dervenin.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Game.GetPlayer().Additem(Alias_Wabbajack.GetRef())
Game.GetPlayer().Equipitem(Wabbajack)

AchievementsQuest.IncDaedricArtifacts()

SetObjectiveCompleted(50)
SetObjectiveDisplayed(100)

DA15Loathing.Setstage(0)
DA15Paranoia.Setstage(0)
DA15Terror.Setstage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Player has heard from Dervenin about his master, and knows he has to get into the Pelagius wing. Start Obj 50.
DA15Rumor.Setstage(20)
SetObjectiveDisplayed(10)
Game.Getplayer().additem(Alias_HipBone.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
Game.GetPlayer().AddItem(alias_PelagiusKey.GetRef())
SetObjectiveCompleted(10)
SetObjectiveDisplayed(45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
PelagiusMeet.Start()
Game.GetPlayer().AddItem(ClothesFineHat02, 1, true)
Game.GetPlayer().AddItem(ClothesFineClothes02Variant, 1, true)
Game.GetPlayer().AddItem(ClothesFineBoots02, 1, true)
Game.GetPlayer().EquipItem(ClothesFineHat02, false, true)
Game.GetPlayer().EquipItem(ClothesFineClothes02Variant, false, true)
Game.GetPlayer().EquipItem(ClothesFineBoots02, false, true)
Setstage(95)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property PelagiusKey  Auto  

Scene Property PelagiusMeet  Auto  

ObjectReference Property DA15Container  Auto  

Weapon Property Wabbajack  Auto  

Message Property TempExitMessage  Auto  

Scene Property PelagiusStart  Auto  

ObjectReference Property DA15PelagiusReappearMarker  Auto  

ObjectReference Property DA15ExitDoor  Auto  

Message Property Temp155Message  Auto  

Scene Property PelagiusEnd  Auto  

Quest Property DA15Loathing  Auto  

Quest Property DA15Paranoia  Auto  

Quest Property DA15Terror  Auto  

Weapon Property RealWabbajack  Auto  

Quest Property DA15Rumor  Auto  

AchievementsScript Property AchievementsQuest  Auto  

Armor Property ClothesFineHat02  Auto  

Armor Property ClothesFineClothes02Variant  Auto  

Armor Property ClothesFineBoots02  Auto  

Quest Property DA15Return  Auto  
