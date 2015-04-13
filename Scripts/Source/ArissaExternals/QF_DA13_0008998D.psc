;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname QF_DA13_0008998D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orchendor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Orchendor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kesh
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Kesh Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KeshRitualMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_KeshRitualMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HallucinatedSkeeverMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_HallucinatedSkeeverMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skeever01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Skeever01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Peryite
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Peryite Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skeever03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Skeever03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skeever02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Skeever02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Inhalant
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Inhalant Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BthardamzBlockingVines
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BthardamzBlockingVines Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; Player has given Kesh the ingredients.
; Commenting this out to avoid an objective gap if Kesh is killed between now and creating the brew.
;setObjectiveCompleted(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; set objective on Orchendor
setObjectiveDisplayed(40)
Alias_BthardamzBlockingVines.getReference().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; quest over
AchievementsQuest.IncDaedricQuests()
Alias_Inhalant.getReference().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE QF_DA13_0008998D
Quest __temp = self as Quest
QF_DA13_0008998D kmyQuest = __temp as QF_DA13_0008998D
;END AUTOCAST
;BEGIN CODE
; stage for dialogue flow during second Peryite convo
; debug.trace("DA13: Stage 81 set, reward Spellbreaker")
if game.getPlayer().getItemCount(spellBreaker) <= 0
game.getPlayer().addItem(spellbreaker, 1)
AchievementsQuest.IncDaedricArtifacts()
endif
setObjectiveCompleted(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Player has tried giving Kesh ingredients but for whatever reason did not give any/all of them
; NOTE - this was an interim stage set aside for the attempt at letting the player give a choice
; of any silver or ruby items.  Leaving in place in case I can re-implement this correctly
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
; empty for now
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; set when player "talks" to Peryite a second time (after killing Orchendor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; player is dumped out of the vision
;whiteout.apply()
;utility.wait(3)
;DA13PeryiteVisionImod.remove()
game.enablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; Kesh has prepared the fumes for the player to inhale - OR - player did it herself.
Alias_Inhalant.getReference().enable()
setObjectiveCompleted(15)
setObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; used for dialogue conditions during the vision w/Peryite.
; setObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; temp? Mini stage to allow blocking topic only once.
;debug.messageBox("DA13 Stage 1 Set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE QF_DA13_0008998D
Quest __temp = self as Quest
QF_DA13_0008998D kmyQuest = __temp as QF_DA13_0008998D
;END AUTOCAST
;BEGIN CODE
; player given the list of ingredients for the brew
;debug.messageBox("DA13 Stage 10 Set")
setObjectiveDisplayed(11)
setObjectiveDisplayed(12)
setObjectiveDisplayed(13)
setObjectiveDisplayed(14)
DA13PlayerSCRIPT playerScript = Alias_player as DA13PlayerSCRIPT
playerScript.DA13itemsCheck()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; kick off Kesh's "ritual"
keshRitualScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Player has heard about the Brew
;debug.messageBox("DA13 Stage 5 Set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; Orchendor is dead.  Long live Orchendor.
setObjectiveCompleted(40)
setObjectiveDisplayed(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; set when the vision begins.
setObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


scene Property KeshRitualScene  Auto  

objectReference Property BthardamzMapMarker  Auto  

imagespacemodifier Property DA13PeryiteVisionImod  Auto  

armor Property SpellBreaker  Auto  

imageSpaceModifier Property whiteOut  Auto  

AchievementsScript Property AchievementsQuest Auto
