;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 28
Scriptname QF_dunValthumeQST_0003ED82 Extends Quest Hidden

;BEGIN ALIAS PROPERTY dunValthumeGhostWaitMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_dunValthumeGhostWaitMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dunValthumeDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_dunValthumeDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dunValthumeThrone
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_dunValthumeThrone Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dunValthumeGorvaalLurk01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_dunValthumeGorvaalLurk01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dunValthumeHeart
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_dunValthumeHeart Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dunValthumeSconce
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_dunValthumeSconce Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dunValthumeGorvaalBoss
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_dunValthumeGorvaalBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dunValthumeGorvaalLurk03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_dunValthumeGorvaalLurk03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dunValthumeBrain
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_dunValthumeBrain Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dunValthumeGorvaalLurk02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_dunValthumeGorvaalLurk02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dunValthumeLungs
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_dunValthumeLungs Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dunValthumeGhostValdar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_dunValthumeGhostValdar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dunValthumeClaw
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_dunValthumeClaw Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;Quest completed, Valdar is disabled
alias_dunValthumeGhostValdar.getReference().disable(true)


 AchievementsQuest.IncSideQuests()

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Stage set when the player collects the final jar
setObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Stage set when Gorvaal is defeated
setObjectiveCompleted(15,1)
alias_dunValthumeGhostValdar.getActorReference().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_18 in script QF_dunValthumeQST_0003ED82
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Stage set when the player agrees to help Valdar, puts QT on three jars
alias_dunValthumeDoor.getReference().activate(alias_dunValthumeDoor.getReference())
setObjectiveDisplayed(5,1)
;alias_dunValthumeGhostValdar.getActorReference().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;Player completes Ritual. Gorvaal Activates.
setObjectiveCompleted(10,1)
setObjectiveDisplayed(15,1)
Actor Boss =alias_dunValthumeGorvaalBoss.GetReference() as Actor
Boss.setActorValue("Aggression", 1)
Boss.startcombat(game.getplayer())
alias_dunValthumeGhostValdar.getActorReference().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;Player triggers in dungeon, moves Valdar to large temple room
alias_dunValthumeGhostValdar.getActorReference().moveto(alias_dunValthumeGhostWaitMarker.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;Set when Valdar tells player to start the ritual
;alias_dunValthumeGorvaalBoss.getActorReference().enable()
alias_dunValthumeGhostValdar.getActorReference().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

AchievementsScript Property AchievementsQuest Auto
