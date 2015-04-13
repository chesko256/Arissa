Scriptname CWThreatCombatBarksScript extends Quest  Conditional

ReferenceAlias Property ImperialBridge Auto

ReferenceAlias Property ImperialFence Auto
ReferenceAlias Property ImperialFenceArcher Auto
ReferenceAlias Property ImperialFenceMage Auto

ReferenceAlias Property ImperialHouse Auto

ReferenceAlias Property ImperialRock Auto

ReferenceAlias Property ImperialStables Auto

ReferenceAlias Property ImperialTower Auto
ReferenceAlias Property ImperialTowerArcher Auto
ReferenceAlias Property ImperialTowerMage Auto

ReferenceAlias Property ImperialTree Auto

ReferenceAlias Property ImperialWall Auto
ReferenceAlias Property ImperialWallArcher Auto
ReferenceAlias Property ImperialWallMage Auto

ReferenceAlias Property ImperialWindow Auto
ReferenceAlias Property ImperialWindowArcher Auto
ReferenceAlias Property ImperialWindowMage Auto


ReferenceAlias Property SonsBridge Auto

ReferenceAlias Property SonsFence Auto
ReferenceAlias Property SonsFenceArcher Auto
ReferenceAlias Property SonsFenceMage Auto

ReferenceAlias Property SonsHouse Auto

ReferenceAlias Property SonsRock Auto

ReferenceAlias Property SonsStables Auto

ReferenceAlias Property SonsTower Auto
ReferenceAlias Property SonsTowerArcher Auto
ReferenceAlias Property SonsTowerMage Auto

ReferenceAlias Property SonsTree Auto

ReferenceAlias Property SonsWall Auto
ReferenceAlias Property SonsWallArcher Auto
ReferenceAlias Property SonsWallMage Auto

ReferenceAlias Property SonsWindow Auto
ReferenceAlias Property SonsWindowArcher Auto
ReferenceAlias Property SonsWindowMage Auto



keyword Property CW1MeleeClose Auto
keyword Property CW1MeleeWide Auto
keyword Property CW1MissileClose Auto
keyword Property CW1MissileWide Auto

keyword Property CW2MeleeClose Auto
keyword Property CW2MeleeWide Auto
keyword Property CW2MissileClose Auto
keyword Property CW2MissileWide Auto

keyword Property CW3MeleeClose Auto
keyword Property CW3MeleeWide Auto
keyword Property CW3MissileClose Auto
keyword Property CW3MissileWide Auto

keyword Property CW4MeleeClose Auto
keyword Property CW4MeleeWide Auto
keyword Property CW4MissileClose Auto
keyword Property CW4MissileWide Auto

keyword Property CW5MeleeClose Auto
keyword Property CW5MeleeWide Auto
keyword Property CW5MissileClose Auto
keyword Property CW5MissileWide Auto


;CWThreatBridgeImperial
;CWThreatBridgeSons

;CWThreatFenceImperial
;CWThreatFenceImperialArcher
;CWThreatFenceImperialMage
;CWThreatFenceSons
;CWThreatFenceSonsArcher
;CWThreatFenceSonsMage

;CWThreatHouseImperial
;CWThreatHouseSons

;CWThreatRockImperial
;CWThreatRockSons

;CWThreatStablesImperial
;CWThreatStablesSons

;CWThreatTowerImperial
;CWThreatTowerImperialArcher
;CWThreatTowerImperialMage
;CWThreatTowerSons
;CWThreatTowerSonsArcher
;CWThreatTowerSonsMage

;CWThreatTreeImperial
;CWThreatTreeSons

;CWThreatWallImperial
;CWThreatWallImperialArcher
;CWThreatWallImperialMage
;CWThreatWallSons
;CWThreatWallSonsArcher
;CWThreatWallSonsMage

;CWThreatWindowImperial
;CWThreatWindowImperialArcher
;CWThreatWindowImperialMage
;CWThreatWindowSons
;CWThreatWindowSonsArcher
;CWThreatWindowSonsMage





CWScript Property CWs Auto
{BASE OBJECT - pointer to CWScript on CW quest}

int BattlePhaseToStopBarking = 6		;once we are in phase 6, we should stop taunting using the combat barks - stage 6 occurs in stage 50 of CWSiege


Function ProcessTriggerActor(Actor TriggerActor, float BattlePhase, bool Bridge = false, bool Fence = false, bool House = false, bool Rock = false, bool Stables = false, bool Tower = false, bool Tree = false, bool Wall = false, bool Window = false)
{Trigger calls this function, passing in it's reference. We decide what do to with it.}

;***
;debug.StartStackProfiling()

; 	CWScript.Log("CWThreatCombatBarksScript", self + "ProcessTriggerActor(" + TriggerActor + ", BattlePhase:" + BattlePhase + ")")
	
	if BattlePhase >= BattlePhaseToStopBarking
; 		CWScript.Log("CWThreatCombatBarksScript", self + "ProcessTriggerActor() BattlePhase[" + BattlePhase + "] => BattlePhaseToStopBarking[" + BattlePhaseToStopBarking + "], returning without processing trigger actor.")
		return
	EndIf
	
	
	ReferenceAlias FactionTypeAlias
	ReferenceAlias FactionTypeRoleAlias
	GlobalVariable FactionTypeGlobal
	GlobalVariable FactionTypeRoleGlobal
	
	int ActorAllegiance = CWs.GetActorAllgeiance(TriggerActor)
	
	
	
	
	if ActorAllegiance == CWs.iImperials
		if Bridge
			FactionTypeAlias = ImperialBridge
			FactionTypeGlobal = CWs.CWThreatBridgeImperial
		
		ElseIf Fence
			FactionTypeAlias = ImperialFence
			FactionTypeGlobal = CWs.CWThreatFenceImperial
			
			FactionTypeRoleAlias = determineRoleAlias(TriggerActor, BattlePhase,  ImperialFenceArcher, ImperialFenceMage)
			FactionTypeRoleGlobal = determineRoleGlobal(TriggerActor, BattlePhase,  CWs.CWThreatFenceImperialArcher, CWs.CWThreatFenceImperialMage)


		ElseIf House
			FactionTypeAlias = ImperialHouse
			FactionTypeGlobal = CWs.CWThreatHouseImperial
			
		ElseIf Rock
			FactionTypeAlias = ImperialRock
			FactionTypeGlobal = CWs.CWThreatRockImperial
			
		ElseIf Stables
			FactionTypeAlias = ImperialStables
			FactionTypeGlobal = CWs.CWThreatStablesImperial
			
		ElseIf Tower
			FactionTypeAlias = ImperialTower
			FactionTypeGlobal = CWs.CWThreatTowerImperial
			
			FactionTypeRoleAlias = determineRoleAlias(TriggerActor, BattlePhase,  ImperialTowerArcher, ImperialTowerMage)
			FactionTypeRoleGlobal = determineRoleGlobal(TriggerActor, BattlePhase,  CWs.CWThreatTowerImperialArcher, CWs.CWThreatTowerImperialMage)

		
		ElseIf Tree
			FactionTypeAlias = ImperialTree
			FactionTypeGlobal = CWs.CWThreatTreeImperial
		
		ElseIf Wall
			FactionTypeAlias = ImperialWall
			FactionTypeGlobal = CWs.CWThreatWallImperial
			
			FactionTypeRoleAlias = determineRoleAlias(TriggerActor, BattlePhase,  ImperialWallArcher, ImperialWallMage)
			FactionTypeRoleGlobal = determineRoleGlobal(TriggerActor, BattlePhase,  CWs.CWThreatWallImperialArcher, CWs.CWThreatWallImperialMage)


		ElseIf Window
			FactionTypeAlias = ImperialWindow
			FactionTypeGlobal = CWs.CWThreatWindowImperial
			
			FactionTypeRoleAlias = determineRoleAlias(TriggerActor, BattlePhase,  ImperialWindowArcher, ImperialWindowMage)
			FactionTypeRoleGlobal = determineRoleGlobal(TriggerActor, BattlePhase,  CWs.CWThreatWindowImperialArcher, CWs.CWThreatWindowImperialMage)

		
		EndIf

	elseif ActorAllegiance == CWs.iSons
		if Bridge
			FactionTypeAlias = SonsBridge
			FactionTypeGlobal = CWs.CWThreatBridgeSons
		
		ElseIf Fence
			FactionTypeAlias = SonsFence
			FactionTypeGlobal = CWs.CWThreatFenceSons
			
			FactionTypeRoleAlias = determineRoleAlias(TriggerActor, BattlePhase,  SonsFenceArcher, SonsFenceMage)
			FactionTypeRoleGlobal = determineRoleGlobal(TriggerActor, BattlePhase,  CWs.CWThreatFenceSonsArcher, CWs.CWThreatFenceSonsMage)


		ElseIf House
			FactionTypeAlias = SonsHouse
			FactionTypeGlobal = CWs.CWThreatHouseSons
			
		ElseIf Rock
			FactionTypeAlias = SonsRock
			FactionTypeGlobal = CWs.CWThreatRockSons
			
		ElseIf Stables
			FactionTypeAlias = SonsStables
			FactionTypeGlobal = CWs.CWThreatStablesSons
			
		ElseIf Tower
			FactionTypeAlias = SonsTower
			FactionTypeGlobal = CWs.CWThreatTowerSons
			
			FactionTypeRoleAlias = determineRoleAlias(TriggerActor, BattlePhase,  SonsTowerArcher, SonsTowerMage)
			FactionTypeRoleGlobal = determineRoleGlobal(TriggerActor, BattlePhase,  CWs.CWThreatTowerSonsArcher, CWs.CWThreatTowerSonsMage)

		
		ElseIf Tree
			FactionTypeAlias = SonsTree
			FactionTypeGlobal = CWs.CWThreatTreeSons
		
		ElseIf Wall
			FactionTypeAlias = SonsWall
			FactionTypeGlobal = CWs.CWThreatWallSons
			
			FactionTypeRoleAlias = determineRoleAlias(TriggerActor, BattlePhase,  SonsWallArcher, SonsWallMage)
			FactionTypeRoleGlobal = determineRoleGlobal(TriggerActor, BattlePhase,  CWs.CWThreatWallSonsArcher, CWs.CWThreatWallSonsMage)


		ElseIf Window
			FactionTypeAlias = SonsWindow
			FactionTypeGlobal = CWs.CWThreatWindowSons
			
			FactionTypeRoleAlias = determineRoleAlias(TriggerActor, BattlePhase,  SonsWindowArcher, SonsWindowMage)
			FactionTypeRoleGlobal = determineRoleGlobal(TriggerActor, BattlePhase,  CWs.CWThreatWindowSonsArcher, CWs.CWThreatWindowSonsMage)

		
		EndIf
		
	endif
	
	If BattlePhase == CWs.CWBattlePhase.GetValue()
	
		FactionTypeAlias.ForceRefTo(TriggerActor)
		FactionTypeGlobal.setValue(1)
		
		if FactionTypeRoleAlias
			FactionTypeRoleAlias.ForceRefTo(TriggerActor)
			FactionTypeRoleGlobal.setValue(1)
		EndIf
		
; 		CWScript.Log("CWThreatCombatBarksScript", self + "ProcessTriggerActor(" + TriggerActor + ", forced into:" + FactionTypeAlias + ", AND " + FactionTypeRoleAlias + ") and the following globals were set to 1:" + FactionTypeGlobal + " AND " + FactionTypeRoleGlobal)
	
	Else
		;this took too long and we are in the wrong phase, we can't be sure this guy's role hasn't changed, dump the alias.
	
	EndIf

	
;***
;debug.StopStackProfiling()	

EndFunction

ReferenceAlias function determineRoleAlias(Actor ActorToCheck, Float BattlePhase,  ReferenceAlias TypeArcherAlias, ReferenceAlias TypeMageAlias)
	if isArcher(ActorToCheck, BattlePhase)
		return TypeArcherAlias
		
	ElseIf isMage(ActorToCheck, BattlePhase)
		return TypeMageAlias
		
	Else
		return None
	EndIf

EndFunction

GlobalVariable function determineRoleGlobal(Actor ActorToCheck, Float BattlePhase,  GlobalVariable TypeArcherGlobal, GlobalVariable TypeMageGlobal)
	if isArcher(ActorToCheck, BattlePhase)
		return TypeArcherGlobal
		
	ElseIf isMage(ActorToCheck, BattlePhase)
		return TypeMageGlobal
		
	Else
		return None
	EndIf

EndFunction

bool function isArcher(Actor ActorToCheck, float BattlePhase)
	
	bool returnVal
	
	if BattlePhase == 1 && ( ActorToCheck.GetLinkedRef(CW1MissileClose) || ActorToCheck.GetLinkedRef(CW1MissileWide) )
		returnVal = True
	elseif BattlePhase == 2 && ( ActorToCheck.GetLinkedRef(CW2MissileClose) || ActorToCheck.GetLinkedRef(CW2MissileWide) )
		returnVal = True
	elseif BattlePhase == 3 && ( ActorToCheck.GetLinkedRef(CW3MissileClose) || ActorToCheck.GetLinkedRef(CW3MissileWide) )
		returnVal = True
	elseif BattlePhase == 4 && ( ActorToCheck.GetLinkedRef(CW4MissileClose) || ActorToCheck.GetLinkedRef(CW4MissileWide) )
		returnVal = True
	elseif BattlePhase == 5 && ( ActorToCheck.GetLinkedRef(CW5MissileClose) || ActorToCheck.GetLinkedRef(CW5MissileWide) )
		returnVal = True
	Else
; 		CWScript.Log("CWThreatCombatBarksScript", self + "isArcher(" + ActorToCheck + ") didn't find a linkedRef with a CWXMissileClose/Wide keyword where X was the BattlePhase:" + BattlePhase)
	
	EndIf

	return returnVal
	
EndFunction

bool function isMage(Actor ActorToCheck, float BattlePhase)

	;currently there are no mages
	return False

EndFunction

function ClearAliasIfActorIsInIt(ReferenceAlias AliasToCheck, Actor ActorToCheck, GlobalVariable GlobalToClear)
	if AliasToCheck.GetReference() == ActorToCheck
		
		GlobalToClear.SetValue(0)
		AliasToCheck.Clear()
; 		CWScript.Log("CWThreatCombatBarksScript", self + "ClearAliasIfActorIsInIt(" + AliasToCheck + ", " +  ActorToCheck + ") actor is in alias, so cleared alias and set global to 0:" + GlobalToClear)
	EndIf

EndFunction



function ProcessTriggerActorLeaving(Actor TriggerActor)
	
;***
;debug.StartStackProfiling()

	
	int ActorAllegiance = CWs.GetActorAllgeiance(TriggerActor)
	
	if ActorAllegiance == CWs.iImperials
	
		ClearAliasIfActorIsInIt(ImperialBridge, TriggerActor, CWs.CWThreatBridgeImperial)

		ClearAliasIfActorIsInIt(ImperialFence, TriggerActor, CWs.CWThreatFenceImperial)
		ClearAliasIfActorIsInIt(ImperialFenceArcher, TriggerActor, CWs.CWThreatFenceImperialArcher)
		ClearAliasIfActorIsInIt(ImperialFenceMage, TriggerActor, CWs.CWThreatFenceImperialMage)

		ClearAliasIfActorIsInIt(ImperialHouse, TriggerActor, CWs.CWThreatHouseImperial)

		ClearAliasIfActorIsInIt(ImperialRock, TriggerActor, CWs.CWThreatRockImperial)

		ClearAliasIfActorIsInIt(ImperialStables, TriggerActor, CWs.CWThreatStablesImperial)

		ClearAliasIfActorIsInIt(ImperialTower, TriggerActor, CWs.CWThreatTowerImperial)
		ClearAliasIfActorIsInIt(ImperialTowerArcher, TriggerActor, CWs.CWThreatTowerImperialArcher)
		ClearAliasIfActorIsInIt(ImperialTowerMage, TriggerActor, CWs.CWThreatTowerImperialMage)

		ClearAliasIfActorIsInIt(ImperialTree, TriggerActor, CWs.CWThreatTreeImperial)

		ClearAliasIfActorIsInIt(ImperialWall, TriggerActor, CWs.CWThreatWallImperial)
		ClearAliasIfActorIsInIt(ImperialWallArcher, TriggerActor, CWs.CWThreatWallImperialArcher)
		ClearAliasIfActorIsInIt(ImperialWallMage, TriggerActor, CWs.CWThreatWallImperialMage)

		ClearAliasIfActorIsInIt(ImperialWindow, TriggerActor, CWs.CWThreatWindowImperial)
		ClearAliasIfActorIsInIt(ImperialWindowArcher, TriggerActor, CWs.CWThreatWindowImperialArcher)
		ClearAliasIfActorIsInIt(ImperialWindowMage, TriggerActor, CWs.CWThreatWindowImperialMage)
	
	elseif ActorAllegiance == CWs.iSons
		
		ClearAliasIfActorIsInIt(SonsBridge, TriggerActor, CWs.CWThreatBridgeSons)

		ClearAliasIfActorIsInIt(SonsFence, TriggerActor, CWs.CWThreatFenceSons)
		ClearAliasIfActorIsInIt(SonsFenceArcher, TriggerActor, CWs.CWThreatFenceSonsArcher)
		ClearAliasIfActorIsInIt(SonsFenceMage, TriggerActor, CWs.CWThreatFenceSonsMage)

		ClearAliasIfActorIsInIt(SonsHouse, TriggerActor, CWs.CWThreatHouseSons)

		ClearAliasIfActorIsInIt(SonsRock, TriggerActor, CWs.CWThreatRockSons)

		ClearAliasIfActorIsInIt(SonsStables, TriggerActor, CWs.CWThreatStablesSons)

		ClearAliasIfActorIsInIt(SonsTower, TriggerActor, CWs.CWThreatTowerSons)
		ClearAliasIfActorIsInIt(SonsTowerArcher, TriggerActor, CWs.CWThreatTowerSonsArcher)
		ClearAliasIfActorIsInIt(SonsTowerMage, TriggerActor, CWs.CWThreatTowerSonsMage)

		ClearAliasIfActorIsInIt(SonsTree, TriggerActor, CWs.CWThreatTreeSons)

		ClearAliasIfActorIsInIt(SonsWall, TriggerActor, CWs.CWThreatWallSons)
		ClearAliasIfActorIsInIt(SonsWallArcher, TriggerActor, CWs.CWThreatWallSonsArcher)
		ClearAliasIfActorIsInIt(SonsWallMage, TriggerActor, CWs.CWThreatWallSonsMage)

		ClearAliasIfActorIsInIt(SonsWindow, TriggerActor, CWs.CWThreatWindowSons)
		ClearAliasIfActorIsInIt(SonsWindowArcher, TriggerActor, CWs.CWThreatWindowSonsArcher)
		ClearAliasIfActorIsInIt(SonsWindowMage, TriggerActor, CWs.CWThreatWindowSonsMage)

	EndIf

;***
;debug.StopStackProfiling()
	
EndFunction


;Called by sieges when the battle phase changes
function RegisterBattlePhaseChanged()

	CWs.CWThreatBridgeImperial.SetValue(0)
	CWs.CWThreatBridgeSons.SetValue(0)
	CWs.CWThreatFenceImperial.SetValue(0)
	CWs.CWThreatFenceImperialArcher.SetValue(0)
	CWs.CWThreatFenceImperialMage.SetValue(0)
	CWs.CWThreatFenceSons.SetValue(0)
	CWs.CWThreatFenceSonsArcher.SetValue(0)
	CWs.CWThreatFenceSonsMage.SetValue(0)
	CWs.CWThreatHouseImperial.SetValue(0)
	CWs.CWThreatHouseSons.SetValue(0)
	CWs.CWThreatRockImperial.SetValue(0)
	CWs.CWThreatRockSons.SetValue(0)
	CWs.CWThreatStablesImperial.SetValue(0)
	CWs.CWThreatStablesSons.SetValue(0)
	CWs.CWThreatTowerImperial.SetValue(0)
	CWs.CWThreatTowerImperialArcher.SetValue(0)
	CWs.CWThreatTowerImperialMage.SetValue(0)
	CWs.CWThreatTowerSons.SetValue(0)
	CWs.CWThreatTowerSonsArcher.SetValue(0)
	CWs.CWThreatTowerSonsMage.SetValue(0)
	CWs.CWThreatTreeImperial.SetValue(0)
	CWs.CWThreatTreeSons.SetValue(0)
	CWs.CWThreatWallImperial.SetValue(0)
	CWs.CWThreatWallImperialArcher.SetValue(0)
	CWs.CWThreatWallImperialMage.SetValue(0)
	CWs.CWThreatWallSons.SetValue(0)
	CWs.CWThreatWallSonsArcher.SetValue(0)
	CWs.CWThreatWallSonsMage.SetValue(0)
	CWs.CWThreatWindowImperial.SetValue(0)
	CWs.CWThreatWindowImperialArcher.SetValue(0)
	CWs.CWThreatWindowImperialMage.SetValue(0)
	CWs.CWThreatWindowSons.SetValue(0)
	CWs.CWThreatWindowSonsArcher.SetValue(0)
	CWs.CWThreatWindowSonsMage.SetValue(0)

	ImperialBridge.clear()

	ImperialFence.clear()
	ImperialFenceArcher.clear()
	ImperialFenceMage.clear()

	ImperialHouse.clear()

	ImperialRock.clear()

	ImperialStables.clear()

	ImperialTower.clear()
	ImperialTowerArcher.clear()
	ImperialTowerMage.clear()

	ImperialTree.clear()

	ImperialWall.clear()
	ImperialWallArcher.clear()
	ImperialWallMage.clear()

	ImperialWindow.clear()
	ImperialWindowArcher.clear()
	ImperialWindowMage.clear()


	SonsBridge.clear()

	SonsFence.clear()
	SonsFenceArcher.clear()
	SonsFenceMage.clear()

	SonsHouse.clear()

	SonsRock.clear()

	SonsStables.clear()

	SonsTower.clear()
	SonsTowerArcher.clear()
	SonsTowerMage.clear()

	SonsTree.clear()

	SonsWall.clear()
	SonsWallArcher.clear()
	SonsWallMage.clear()

	SonsWindow.clear()
	SonsWindowArcher.clear()
	SonsWindowMage.clear()


EndFunction

