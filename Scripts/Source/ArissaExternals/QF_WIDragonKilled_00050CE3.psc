;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_WIDragonKilled_00050CE3 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Spectator3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorHabitation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SpectatorHabitation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorPackageOnlyNoScene7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorPackageOnlyNoScene7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorPackageOnlyNoScene10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorPackageOnlyNoScene10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorPackageOnlyNoScene2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorPackageOnlyNoScene2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorPackageOnlyNoScene6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorPackageOnlyNoScene6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorPackageOnlyNoScene5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorPackageOnlyNoScene5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorPackageOnlyNoScene1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorPackageOnlyNoScene1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorPackageOnlyNoScene8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorPackageOnlyNoScene8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorPackageOnlyNoScene3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorPackageOnlyNoScene3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorPackageOnlyNoScene4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorPackageOnlyNoScene4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorPackageOnlyNoScene9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorPackageOnlyNoScene9 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;the scene has completed once through, so set a timer to shut down quest
RegisterForSingleUpdate(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; debug.trace("WIDragonKilled stage 255, shut down stage")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIDragonKilled
Quest __temp = self as Quest
WIDragonKilled kmyQuest = __temp as WIDragonKilled
;END AUTOCAST
;BEGIN CODE
; debug.trace("WIDragonKilled stage 0, start up stage")

;reminder: scene starts when quest starts

;See also:
;WIFunctionsScript:
;  startWIDragonKillQuest()
;  PlayerIsCurrentlyAbsorbingPower()
;  PlayerIsDoneAbsorbingPower()

;DragonActorScript
;  onDeath() in which calls to the above functions are made

;MQKillDragonScript:
;  DeathSequence() in which calls to the above functions are made

; debug.trace("WIDragonKilled stage 0, start up stage, EVPing alias")
Alias_Spectator1.TryToEvaluatePackage()
Alias_Spectator2.TryToEvaluatePackage()
Alias_Spectator3.TryToEvaluatePackage()
Alias_Spectator4.TryToEvaluatePackage()
Alias_Spectator5.TryToEvaluatePackage()
Alias_Spectator6.TryToEvaluatePackage()
Alias_Spectator7.TryToEvaluatePackage()
Alias_Spectator8.TryToEvaluatePackage()
Alias_Spectator9.TryToEvaluatePackage()
Alias_Spectator10.TryToEvaluatePackage()

Alias_SpectatorPackageOnlyNoScene1.TryToEvaluatePackage()
Alias_SpectatorPackageOnlyNoScene2.TryToEvaluatePackage()
Alias_SpectatorPackageOnlyNoScene3.TryToEvaluatePackage()
Alias_SpectatorPackageOnlyNoScene4.TryToEvaluatePackage()
Alias_SpectatorPackageOnlyNoScene5.TryToEvaluatePackage()
Alias_SpectatorPackageOnlyNoScene6.TryToEvaluatePackage()
Alias_SpectatorPackageOnlyNoScene7.TryToEvaluatePackage()
Alias_SpectatorPackageOnlyNoScene8.TryToEvaluatePackage()
Alias_SpectatorPackageOnlyNoScene9.TryToEvaluatePackage()
Alias_SpectatorPackageOnlyNoScene10.TryToEvaluatePackage()

; debug.trace("WIDragonKilled stage 0, calling RegisterDragonAttack()")
kmyquest.WI.RegisterDragonAttack(Alias_SpectatorHabitation.GetLocation(), Alias_Dragon.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
