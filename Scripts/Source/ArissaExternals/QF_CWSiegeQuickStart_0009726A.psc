;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 38
Scriptname QF_CWSiegeQuickStart_0009726A Extends Quest Hidden

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Riften (The Rift)
;Imperials Attacking
;Player is Imperial
;ATTACK QUEST

kmyquest.QuickStartSiege(Hold = 9, Attacker = 1, PlayerAllegiance = 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; STAGE NUMBER CONVENTION:
;ABCD
;A: Hold
;B: Attacking Faction (1 = Imperials, 2 = Sons)
;C: Player's Faction (1 = Imperials, 2 = Sons)
;D = ? expected future use
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;start the siege, set stage 50 and move player to city door to do the CWEscape section

; debug.trace("CWSiegeQuickStart 4215")

setStage(4210)

while kmyquest.CWSiege.IsRunning() == false
utility.wait(1)
; debug.trace("CWSiegeQuickStart WAITING for CWSiege.IsRunning()")
endwhile

Game.GetPlayer().moveto(kmyquest.CWSiegeMainGateExterior.GetReference())

kmyquest.CWSiege.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Whiterun
;Imperials Attacking
;Player is Imperial
;ATTACK QUEST

kmyquest.QuickStartSiege(Hold = 4, Attacker = 1, PlayerAllegiance = 1)

kmyquest.C00GiantAttack.setstage(200)
kmyquest.AelaTheHuntressREF.MoveToMyEditorLocation()
kmyquest.FarkasREF.MoveToMyEditorLocation()
kmyquest.AthisREF.MoveToMyEditorLocation()
kmyquest.RiaREF.MoveToMyEditorLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
setstage(4001)
setstage(4220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Whiterun
;Imperials Attacking
;Player is Sons
;DEFEND QUEST

kmyquest.QuickStartSiege(Hold = 4, Attacker = 1, PlayerAllegiance = 2)

kmyquest.C00GiantAttack.setstage(200)
kmyquest.AelaTheHuntressREF.MoveToMyEditorLocation()
kmyquest.FarkasREF.MoveToMyEditorLocation()
kmyquest.AthisREF.MoveToMyEditorLocation()
kmyquest.RiaREF.MoveToMyEditorLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Winterhold (Winterhold)
;Imperials Attacking
;Player is Imperial
;ATTACK QUEST

kmyquest.QuickStartSiege(Hold = 7, Attacker = 1, PlayerAllegiance = 1, isMinorHold = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Riften (The Rift)
;Imperials Attacking
;Player is Sons
;DEFEND QUEST

kmyquest.QuickStartSiege(Hold = 9, Attacker = 1, PlayerAllegiance = 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;DISABLE ANYTHING WE DON'T WANT WHEN QUICK STARTING WITH  XXX1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;start the siege, set stage 50 and move player to city door to do the CWAttackCity section

; debug.trace("CWSiegeQuickStart 9115")

setStage(9110)

while kmyquest.CWSiege.IsRunning() == false
utility.wait(1)
; debug.trace("CWSiegeQuickStart WAITING for CWSiege.IsRunning()")
endwhile

kmyquest.CWSiege.SetStage(50)

Game.GetPlayer().moveto(kmyquest.CWSiegeMainGateExterior.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Windhelm (Eastmarch)
;Sons Attacking
;Player is Sons
;ATTACK QUEST

kmyquest.QuickStartSiege(Hold = 8, Attacker = 2, PlayerAllegiance = 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;QUICKSTART IMMEDIATELY INTO FINALE

;Windhelm (Eastmarch)
;Imperials Attacking
;Player is Imperial
;ATTACK QUEST

kmyquest.QuickStartSiege(Hold = 8, Attacker =1, PlayerAllegiance = 1, QuickStartFinale = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Whiterun
;Sons Attacking
;Player is Sons
;ATTACK QUEST

kmyquest.QuickStartSiege(Hold = 4, Attacker = 2, PlayerAllegiance = 2)

kmyquest.C00GiantAttack.setstage(200)
kmyquest.AelaTheHuntressREF.Disable()
kmyquest.FarkasREF.Disable()
kmyquest.AthisREF.Disable()
kmyquest.RiaREF.Disable()
kmyquest.MQ103.stop()
kmyquest.C00GiantREF.Disable()
kmyquest.C00GiantREF.Moveto(kmyquest.RunilREF) ;Random movement because he wouldnt' disable
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Soitude (Haafingar)
;Imperials Attacking
;Player is Imperial
;ATTACK QUEST

kmyquest.QuickStartSiege(Hold = 1, Attacker =1, PlayerAllegiance = 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Soitude (Haafingar)
;Sons Attacking
;Player is Imperial
;DEFEND QUEST

kmyquest.QuickStartSiege(Hold = 1, Attacker = 2, PlayerAllegiance = 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;QUICKSTART IMMEDIATELY INTO FINALE

;Soitude (Haafingar)
;Sons Attacking
;Player is Sons
;ATTACK QUEST

kmyquest.QuickStartSiege(Hold = 1, Attacker = 2, PlayerAllegiance = 2, QuickStartFinale = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Markarth (Reach)
;Sons Attacking
;Player is Sons
;ATTACK QUEST

;NEED TO FAKE ATTACK OWNING ADJACENT HOLD
kmyquest.CWs.OwnerWhiterun = 2

kmyquest.QuickStartSiege(Hold = 2, Attacker = 2, PlayerAllegiance = 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Riften (The Rift)
;Sons Attacking
;Player is Imperial
;DEFEND QUEST

kmyquest.QuickStartSiege(Hold = 9, Attacker = 2, PlayerAllegiance = 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Markarth (Reach)
;Imperials Attacking
;Player is Sons
;DEFEND QUEST

kmyquest.QuickStartSiege(Hold = 2, Attacker =1, PlayerAllegiance = 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;start the siege, set stage 50 and move player to city door to do the CWAttackCity section

; debug.trace("CWSiegeQuickStart 4225")

setStage(4220)

while kmyquest.CWSiege.IsRunning() == false
utility.wait(1)
; debug.trace("CWSiegeQuickStart WAITING for CWSiege.IsRunning()")
endwhile

Game.GetPlayer().moveto(kmyquest.CWSiegeMainGateExterior.GetReference())
kmyquest.CWs.CWAlliesS.EnableActiveAllies()
kmyquest.CWSiege.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Halmarch
;Sons Attacking
;Player is Sons
;ATTACK QUEST

kmyquest.QuickStartSiege(Hold = 3, Attacker = 2, PlayerAllegiance = 2, isMinorHold = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Soitude (Haafingar)
;Imperials Attacking
;Player is Sons
;DEFEND QUEST

kmyquest.QuickStartSiege(Hold = 1, Attacker =1, PlayerAllegiance = 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Falkreath
;Sons Attacking
;Player is Sons
;ATTACK QUEST

kmyquest.QuickStartSiege(Hold = 5, Attacker = 2, PlayerAllegiance = 2, isMinorHold = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Windhelm (Eastmarch)
;Imperials Attacking
;Player is Sons
;DEFEND QUEST

kmyquest.QuickStartSiege(Hold = 8, Attacker =1, PlayerAllegiance = 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Windhelm (Eastmarch)
;Imperials Attacking
;Player is Imperial
;ATTACK QUEST

kmyquest.QuickStartSiege(Hold = 8, Attacker =1, PlayerAllegiance = 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Markarth (Reach)
;Imperials Attacking
;Player is Imperial
;ATTACK QUEST

kmyquest.QuickStartSiege(Hold = 2, Attacker =1, PlayerAllegiance = 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;start the siege, set stage 50 and move player to city door to do the CWAttackCity section

; debug.trace("CWSiegeQuickStart 2225")

setStage(2220)

while kmyquest.CWSiege.IsRunning() == false
utility.wait(1)
; debug.trace("CWSiegeQuickStart WAITING for CWSiege.IsRunning()")
endwhile

kmyquest.CWSiege.SetStage(50)

Game.GetPlayer().moveto(kmyquest.CWSiegeMainGateExterior.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Soitude (Haafingar)
;Sons Attacking
;Player is Sons
;ATTACK QUEST

kmyquest.QuickStartSiege(Hold = 1, Attacker = 2, PlayerAllegiance = 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Riften (The Rift)
;Sons Attacking
;Player is Sons
;ATTACK QUEST


kmyquest.QuickStartSiege(Hold = 9, Attacker = 2, PlayerAllegiance = 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Windhelm (Eastmarch)
;Sons Attacking
;Player is Imperial
;DEFEND QUEST

kmyquest.QuickStartSiege(Hold = 8, Attacker = 2, PlayerAllegiance = 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Whiterun
;Sons Attacking
;Player is Imperial
;DEFEND QUEST

kmyquest.QuickStartSiege(Hold = 4, Attacker = 2, PlayerAllegiance = 1)

kmyquest.C00GiantAttack.setstage(200)
kmyquest.AelaTheHuntressREF.MoveToMyEditorLocation()
kmyquest.FarkasREF.MoveToMyEditorLocation()
kmyquest.AthisREF.MoveToMyEditorLocation()
kmyquest.RiaREF.MoveToMyEditorLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Dawnstar (The Pale)
;Imperials Attacking
;Player is Imperial
;ATTACK QUEST

kmyquest.QuickStartSiege(Hold = 6, Attacker = 1, PlayerAllegiance = 1, isMinorHold = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE CWSiegeQuickStartScript
Quest __temp = self as Quest
CWSiegeQuickStartScript kmyQuest = __temp as CWSiegeQuickStartScript
;END AUTOCAST
;BEGIN CODE
;Markarth (Reach)
;Sons Attacking
;Player is Imperial
;DEFEND QUEST

;NEED TO FAKE ATTACK OWNING ADJACENT HOLD
kmyquest.CWs.OwnerWhiterun = 2

kmyquest.QuickStartSiege(Hold = 2, Attacker = 2, PlayerAllegiance = 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
