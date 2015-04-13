;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 39
Scriptname QF_MS05_dunDeadMensRespiteQST_00016C8D Extends Quest Hidden

;BEGIN ALIAS PROPERTY BardScene04MistMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene04MistMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene06Position
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene06Position Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene07Position
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene07Position Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene05Position
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene05Position Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene09aMistMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene09aMistMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BattleManager02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BattleManager02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene04Position
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene04Position Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene02MistMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene02MistMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene10MistOffMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene10MistOffMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene03MistMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene03MistMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene05MistMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene05MistMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoSDoorWhenOpened
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_HoSDoorWhenOpened Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene09bMistMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene09bMistMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene03Position
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene03Position Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonClawRuby
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DragonClawRuby Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene09Position
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene09Position Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene10MistOnMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene10MistOnMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Book Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene08Position
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene08Position Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene08MistMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene08MistMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossPortcullisCollision
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BossPortcullisCollision Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene07MistMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene07MistMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene02Position
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene02Position Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene10BeamOnMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene10BeamOnMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoSDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_HoSDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene10BeamOffMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene10BeamOffMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Olaf
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Olaf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BattleManager01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BattleManager01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene01MistMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene01MistMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardScene06MistMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BardScene06MistMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompletionMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CompletionMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;Abort this scene if the player pulls the chain early.
SetStage(79)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Trigger Bard Scene 7 (Prison Chamber)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;Advance to upper level combat.
; ;Debug.Trace("Stage 110 Set. Starting Scene.")
BardGhost09b.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;Start Bard Scene 5.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Trigger Bard Scene 3.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Start Bard Scene 08 (HoS Run)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Start Bard Scene 7 (Bard's Cell)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Start Bard Scene 09 (Olaf Call 1)
Alias_BossPortcullisCollision.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
;Start upper level combat.
Utility.Wait(0.25)
Game.GetPlayer().RampRumble(0.5, 3, 1600)
RumbleSFX.Play(Game.GetPlayer())
Alias_BattleManager02.GetReference().Activate(Alias_Bard.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Trigger Bard Scene 1. (Lg Catacomb)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
BardGhost09c.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
;Safety check.
BardGhost01.Stop()
BardGhost02.Stop()
BardGhost03.Stop()
BardGhost04.Stop()
BardGhost05.Stop()
BardGhost06.Stop()
BardGhost07.Stop()
BardGhost08.Stop()
BardGhost09.Stop()
BardGhost10.Stop()
Utility.Wait(1)

;Complete Bard Scene 08 (HoS Run)
Alias_Bard.GetReference().Moveto(Alias_BardScene09Position.GetReference())
Alias_Bard.GetReference().Enable()
(Alias_Bard.GetActorRef() as dunDeadMensBardGhostScript).PopIn()
BardGhost09.Start()
Alias_Bard.GetActorRef().EvaluatePackage()

;Set up the Bard for battle.
Alias_Bard.GetActorRef().SetGhost(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;Start battle.
Utility.Wait(0.5)
Game.GetPlayer().RampRumble(0.25, 3, 1600)
RumbleSFX.Play(Game.GetPlayer())
Utility.Wait(0.25)
BardFaction.SetEnemy(DraugrFaction, True, True)
Alias_BattleManager01.GetReference().Activate(Alias_Bard.GetActorRef())
Utility.Wait(1)
Alias_BossPortcullisCollision.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
;Set by MS07 (or the Reseal Door script if the dungeon resets first)
Alias_CompletionMarker.GetReference().Enable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Safety check.
BardGhost01.Stop()
BardGhost02.Stop()
BardGhost03.Stop()
BardGhost04.Stop()
BardGhost05.Stop()
BardGhost06.Stop()
BardGhost07.Stop()
BardGhost08.Stop()
BardGhost09.Stop()
BardGhost10.Stop()
Utility.Wait(1)

;Bard Scene 7 Complete
Alias_Bard.GetReference().Moveto(Alias_BardScene08Position.GetReference())
Alias_Bard.GetReference().Enable()
(Alias_Bard.GetActorRef() as dunDeadMensBardGhostScript).PopIn()
BardGhost08.Start()
Alias_Bard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;Startup Stage
Alias_Bard.GetActorRef().AllowPCDialogue(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Safety check.
BardGhost01.Stop()
BardGhost02.Stop()
BardGhost03.Stop()
BardGhost04.Stop()
BardGhost05.Stop()
BardGhost06.Stop()
BardGhost07.Stop()
BardGhost08.Stop()
BardGhost09.Stop()
BardGhost10.Stop()
Utility.Wait(1)


;Bard Scene 1 complete. Set up Scene 2.
if (GetStageDone(30))
   ;Skip Scene 2 (Stage 30)
   Setstage(39)
Else
   Alias_Bard.GetReference().Moveto(Alias_BardScene02Position.GetReference())
   Alias_Bard.GetReference().Enable()
   (Alias_Bard.GetActorRef() as dunDeadMensBardGhostScript).PopIn()
   BardGhost02.Start()
   Alias_Bard.GetActorRef().EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;Safety check.
BardGhost01.Stop()
BardGhost02.Stop()
BardGhost03.Stop()
BardGhost04.Stop()
BardGhost05.Stop()
BardGhost06.Stop()
BardGhost07.Stop()
BardGhost08.Stop()
BardGhost09.Stop()
BardGhost10.Stop()
Utility.Wait(1)

;Bard Scene 3 complete. Set up Scene 4.
Alias_Bard.GetReference().Moveto(Alias_BardScene04Position.GetReference())
Alias_Bard.GetReference().Enable()
(Alias_Bard.GetActorRef() as dunDeadMensBardGhostScript).PopIn()
BardGhost04.Start()
Alias_Bard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
;Change the name on the HoS door after the bard opens it.
(Alias_HoSDoor as dunDeadMensRespiteSealedDoor).UnsealDoor()
Alias_HoSDoorWhenOpened.ForceRefTo(Alias_HoSDoor.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Trigger Bard Scene 4 (Flooded Catacomb)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;Safety check.
BardGhost01.Stop()
BardGhost02.Stop()
BardGhost03.Stop()
BardGhost04.Stop()
BardGhost05.Stop()
BardGhost06.Stop()
BardGhost07.Stop()
BardGhost08.Stop()
BardGhost09.Stop()
BardGhost10.Stop()
Utility.Wait(1)

;Bard Scene 4 complete. Set up Scene 5.
Alias_Bard.GetReference().Moveto(Alias_BardScene05Position.GetReference())
Alias_Bard.GetReference().Enable()
(Alias_Bard.GetActorRef() as dunDeadMensBardGhostScript).PopIn()
BardGhost05.Start()
Alias_Bard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;Olaf Attacks
Game.GetPlayer().RampRumble(0.75, 3, 1600)
RumbleSFX.Play(Game.GetPlayer())
Alias_Olaf.GetReference().Activate(Alias_Bard.GetActorRef())
Alias_Olaf.GetReference().KnockAreaEffect(0.5, 500)
Alias_Olaf.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
;Olaf dead. Start Bard Scene 10 (Finale)
;Safety check.
BardGhost01.Stop()
BardGhost02.Stop()
BardGhost03.Stop()
BardGhost04.Stop()
BardGhost05.Stop()
BardGhost06.Stop()
BardGhost07.Stop()
BardGhost08.Stop()
BardGhost09.Stop()
;BardGhost10.Stop()
Utility.Wait(1)
   
Alias_BardScene09bMistMarker.GetReference().Activate(Game.GetPlayer())
BardGhost10.Start()
Alias_Bard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Trigger Bard Scene 2 (Statue Hall), if applicable. Or just disable the mist.
if (!GetStageDone(29))
   Alias_BardScene02MistMarker.GetReference().Activate(Game.GetPlayer())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Safety check.
BardGhost01.Stop()
BardGhost02.Stop()
BardGhost03.Stop()
BardGhost04.Stop()
BardGhost05.Stop()
BardGhost06.Stop()
BardGhost07.Stop()
BardGhost08.Stop()
BardGhost09.Stop()
BardGhost10.Stop()
Utility.Wait(1)

;Bard Scene 2 complete OR omitted. Set up scene 03.
Alias_Bard.GetReference().Moveto(Alias_BardScene03Position.GetReference())
Alias_Bard.GetReference().Enable()
(Alias_Bard.GetActorRef() as dunDeadMensBardGhostScript).PopIn()
BardGhost03.Start()
Alias_Bard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;Safety check.
BardGhost01.Stop()
BardGhost02.Stop()
BardGhost03.Stop()
BardGhost04.Stop()
BardGhost05.Stop()
BardGhost06.Stop()
BardGhost07.Stop()
BardGhost08.Stop()
BardGhost09.Stop()
BardGhost10.Stop()
Utility.Wait(1)

;Bard Scene 5 complete. Set up Scene 6.
Alias_Bard.GetReference().Moveto(Alias_BardScene06Position.GetReference())
Alias_Bard.GetReference().Enable()
(Alias_Bard.GetActorRef() as dunDeadMensBardGhostScript).PopIn()
BardGhost06.Start()
Alias_Bard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;Safety check.
BardGhost01.Stop()
BardGhost02.Stop()
BardGhost03.Stop()
BardGhost04.Stop()
BardGhost05.Stop()
BardGhost06.Stop()
BardGhost07.Stop()
BardGhost08.Stop()
BardGhost09.Stop()
BardGhost10.Stop()
Utility.Wait(1)

;Bard Scene 6 complete. Set up Scene 7.
Alias_Bard.GetReference().Moveto(Alias_BardScene07Position.GetReference())
Alias_Bard.GetReference().Enable()
(Alias_Bard.GetActorRef() as dunDeadMensBardGhostScript).PopIn()
BardGhost07.Start()
Alias_Bard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Advance Bard Scene 07 (Bard's Cell)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BardGhost02  Auto  

Scene Property BardGhost03  Auto  

Scene Property BardGhost04  Auto  

Scene Property BardGhost05  Auto  

Scene Property BardGhost06  Auto  

Scene Property BardGhost07  Auto  

Scene Property BardGhost08  Auto  

Scene Property BardGhost09  Auto  

Scene Property BardGhost10  Auto  

Scene Property BardGhost01  Auto  

Faction Property OlafFaction  Auto  

Faction Property PlayerFaction  Auto  

Faction Property DraugrFaction  Auto  

Faction Property BardFaction  Auto  

Scene Property BardGhost09b  Auto  

Scene Property BardGhost09c  Auto  

Sound Property RumbleSFX  Auto  
