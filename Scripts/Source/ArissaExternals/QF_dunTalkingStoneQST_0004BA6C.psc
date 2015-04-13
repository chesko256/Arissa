;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname QF_dunTalkingStoneQST_0004BA6C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Raider01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Raider01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mammoth01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mammoth01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Talking_Stone_Herder_Giant
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Talking_Stone_Herder_Giant Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OrotheimLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_OrotheimLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Raider04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Raider04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Raider02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Raider02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mammoth02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mammoth02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Raider03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Raider03 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;When the boss in Orotheim has been killed, set this stage to switch over the scene.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; ;Debug.Trace("Scene manager activated.")
; ;Debug.Trace("Is Orotheim Cleared? " + Alias_OrotheimLocation.GetLocation().IsCleared())
if (!DelayActivation)
   if (GetStageDone(20)) ;Has Orotheim been cleared (at least once?)
      DelayActivation = True
;       ;Debug.Trace("Werewolves killed. Activating Herding scene.")
      HerdingScene.Stop()
      HerdingScene.Start()
;       ;Debug.Trace("Herding scene started successfully.")
      Utility.Wait (30)
      DelayActivation = False
   ElseIf(Game.GetPlayer().HasLOS(Alias_Raider01.GetReference()) || \
              Game.GetPlayer().HasLOS(Alias_Raider02.GetReference()) || \
              Game.GetPlayer().HasLOS(Alias_Raider03.GetReference()) || \
              Game.GetPlayer().HasLOS(Alias_Raider04.GetReference()) || \
              Game.GetPlayer().HasLOS(SpawnPoint1) || \
              Game.GetPlayer().HasLOS(SpawnPoint2) || \
              Game.GetPlayer().HasLOS(SpawnPoint3) || \
              Game.GetPlayer().HasLOS(SpawnPoint4))
      ;Do nothing.
;       ;Debug.Trace("Player has LoS, so aborting scene.")
   Else
      DelayActivation = True
;       ;Debug.Trace("Activating attack scene.")
      dunTalkingStoneFaction.SetEnemy(BanditFaction)
      Alias_Raider01.GetActorReference().Disable(True)
      Alias_Raider02.GetActorReference().Disable(True)
      Alias_Raider03.GetActorReference().Disable(True)
      Alias_Raider04.GetActorReference().Disable(True)
      Alias_Raider01.GetActorReference().Delete()
      Alias_Raider02.GetActorReference().Delete()
      Alias_Raider03.GetActorReference().Delete()
      Alias_Raider04.GetActorReference().Delete()
      Alias_Raider01.ForceRefTo(SpawnPoint1.PlaceActorAtMe(RaiderLeader, 1, NoResetZone))
      Alias_Raider02.ForceRefTo(SpawnPoint2.PlaceActorAtMe(Raider, 0, NoResetZone))
      Alias_Raider03.ForceRefTo(SpawnPoint3.PlaceActorAtMe(Raider, 0, NoResetZone))
      Alias_Raider04.ForceRefTo(SpawnPoint4.PlaceActorAtMe(Raider, 0, NoResetZone))
;       ;Debug.Trace("New raiders spawned.")
      AttackScene.Stop()
      AttackScene.Start()
;       ;Debug.Trace("Attack scene started successfully.")
      Utility.Wait(20)
      DelayActivation = False
   EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HerdingScene  Auto  

ObjectReference Property OrotheimRaiderSpawnPoint  Auto  

ActorBase Property WerewolfBase  Auto  

Scene Property AttackScene  Auto  

ObjectReference Property SpawnPoint1  Auto  

ObjectReference Property SpawnPoint2  Auto  

ObjectReference Property SpawnPoint3  Auto  

ObjectReference Property SpawnPoint4  Auto  

bool Property DelayActivation  Auto  

Faction Property dunTalkingStoneFaction  Auto  

Faction Property BanditFaction  Auto  

ActorBase Property Raider  Auto  

ActorBase Property RaiderLeader  Auto  

EncounterZone Property NoResetZone  Auto  
