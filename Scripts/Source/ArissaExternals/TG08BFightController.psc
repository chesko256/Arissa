scriptName TG08BFightController extends objectReference
{This script should be running during the Mercer fight to help make the fight more dynamic}

import utility

objectReference property TG08RisingWaterControllerRef auto
TG08RisingWaterScript property WaterController auto hidden
quest property TG08B auto
Actor property MercerFreyRef auto

bool property fightActive = false auto hidden
float property QuakeTimer auto hidden
float property QuakeTimerMin = 5.0 auto
float property QuakeTimerMax = 20.0 auto
float property updateTimer = 0.5 auto hidden

objectReference property TG08bMercerWithdrawMarker01 auto
objectReference property TG08bMercerWithdrawMarker02 auto
objectReference property TG08bMercerWithdrawMarker03 auto
objectReference property TG08bMercerWithdrawMarker04 auto
objectReference property TG08bMercerWithdrawMarker05 auto
objectReference property TG08bMercerWithdrawMarker06 auto
float property minDistanceFromMarker = 700.0 auto hidden
float property MercerWithdrawTimer auto hidden
float property MercerWithdrawTimerMin = 5.0 auto
float property MercerWithdrawTimerMax = 15.0 auto
float property MercerClearWithdrawTimerLength = 25.0 auto hidden
float property MercerClearWithdrawTimer auto hidden

spell property TGNightingaleStrifeMercer auto

scene property TG08BMercerInvis auto
bool property MercerWithdrawReady = false auto hidden
bool property MercerDrainSpell = false auto hidden

auto State Waiting
	event onActivate(objectReference akActivator)
; 		debug.Trace("TG08FightController: has recieved Activate, should now start fight")
		goToState("Active")
	endEvent
endState


State Active
	event onBeginState()
; 		debug.Trace("TG08FightController: Fight has started")
		fightActive = True
		MercerFreyRef.evaluatePackage()
		WaterController = TG08RisingWaterControllerRef as TG08RisingWaterScript
		QuakeTimer = (GetCurrentRealTime() + randomFloat(QuakeTimerMin, QuakeTimerMax))
		
		
		;Make sure to wait till the quest stage is correct before progressing
		while !(TG08B.getStage() >= 40)
		endWhile
		
		MercerWithdraw()
		StartMercerWithdrawTimer()
; 		debug.Trace("TG08FightController: MercerWithdrawTimer = " + MercerWithdrawTimer)
; 		debug.Trace("TG08FightController: GetCurrentRealTime = " + GetCurrentRealTime())
		
		
		;Fight loop
		while (TG08B.getStage() >= 40) && (TG08B.getStage() < 45)
; 			debug.Trace("TG08FightController: Fight has updated")
			
			
			;Trigger earth quakes
			if GetCurrentRealTime() > QuakeTimer
; 				debug.Trace("TG08FightController: QuakeTriggered")
				QuakeTimer = (GetCurrentRealTime() + randomFloat(QuakeTimerMin, QuakeTimerMax))
				WaterController.TriggerAfterShock(randomFloat(1.5, 4.0))
			endif
			
			
			;Tell Mercer to move to somewhere else in the room
			if MercerFreyRef.getAV("Variable07") == 0
				if GetCurrentRealTime() > MercerWithdrawTimer && MercerWithdrawReady
					MercerWithdraw()
				endif
			endif
			
			;Tell Mercer he's taken too long to go elsewhere and to stop and fight
			if MercerFreyRef.getAV("Variable07") != 0
				if GetCurrentRealTime() > MercerClearWithdrawTimer && !MercerWithdrawReady
					MercerClearWithdraw()
				endif
			endif
			
			;Give Mercer the drain spell, he has a combat override package that should cause him to use it on the player
			if MercerFreyRef.getAV("Health") < 50 && !MercerDrainSpell
				MercerDrainSpell = true
				MercerFreyRef.AddSpell(TGNightingaleStrifeMercer)
				MercerClearWithdraw()
				MercerFreyRef.evaluatePackage()
			endif
			
			wait(updateTimer)
		endWhile
		
		
		goToState("Complete")
		fightActive = False
; 		debug.Trace("TG08FightController: Fight has ended")
	endEvent
endState


State Complete
endState


Function MercerWithdraw()
; 	debug.Trace("TG08FightController: MercerWithdraw triggered")
	bool pickDone = false
	int pick
	MercerClearWithdrawTimer = (utility.GetCurrentRealTime() + MercerClearWithdrawTimerLength)
	MercerWithdrawReady = False
	while !pickDone && FightActive
; 		debug.Trace("TG08FightController: MercerWithdraw pick loop")
		pick = randomInt(1, 6)
; 		debug.Trace("TG08FightController: MercerWithdraw pick = " + pick + "; FightActive = " + FightActive)
		if pick == 1 && (game.getPlayer().getDistance(TG08bMercerWithdrawMarker01) >= minDistanceFromMarker)
			pickDone = True
		elseif pick == 2 && (game.getPlayer().getDistance(TG08bMercerWithdrawMarker02) >= minDistanceFromMarker)
			pickDone = True
		elseif pick == 3 && (game.getPlayer().getDistance(TG08bMercerWithdrawMarker03) >= minDistanceFromMarker)
			pickDone = True
		elseif pick == 4 && (game.getPlayer().getDistance(TG08bMercerWithdrawMarker04) >= minDistanceFromMarker)
			pickDone = True
		elseif pick == 5 && (game.getPlayer().getDistance(TG08bMercerWithdrawMarker05) >= minDistanceFromMarker)
			pickDone = True
		elseif pick == 6 && (game.getPlayer().getDistance(TG08bMercerWithdrawMarker06) >= minDistanceFromMarker)
			pickDone = True
		endif
	endWhile
	TG08BMercerInvis.start()
	MercerFreyRef.setAV("Variable07", pick)
; 	debug.Trace("TG08FightController: MercerWithdraw position should be #" + pick)
	MercerFreyRef.evaluatePackage()
endFunction

Function StartMercerWithdrawTimer()
; 	debug.Trace(self + ": startMercerWithdraTimer")
	MercerWithdrawReady = True
	MercerWithdrawTimer = (GetCurrentRealTime() + randomFloat(MercerWithdrawTimerMin, MercerWithdrawTimerMax))
endFunction

Function MercerClearWithdraw()
; 	debug.Trace(self + ": startMercerWithdraTimer")
	MercerFreyRef.setAV("Variable07", 0)
	StartMercerWithdrawTimer()
endFunction

Function MercerDrainSpellDone()
	utility.wait(60.0)
	MercerDrainSpell = false
endFunction
