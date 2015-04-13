ScriptName DA11GlooredhelScript extends ReferenceAlias

Location Property pReachcliffCaveLocation Auto
Location Property pMarkarthHalloftheDead Auto
ObjectReference Property pReachcliffCaveInsideEntranceMarker Auto
Scene Property pGlooredhelForcegreetReachcliff Auto
ObjectReference Property pReachcliffState1Marker Auto
ObjectReference Property pReachcliffState2Marker Auto

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
  if (akTarget == Game.GetPlayer())
    if (aeCombatState == 1) && (GetOwningQuest().GetStageDone(225) == 0) && (GetOwningQuest().GetStageDone(40) == 1)
      GetOwningQuest().SetStage(225)
    endIf
  endIf
endEvent

Event OnDeath(Actor akKiller)

	;if Glooredhel dies, fail the Quest
	GetOwningQuest().SetStage(250)

EndEvent

Event OnUnload()

	;if the player encountered Glooredhel in the Hall of the Dead, move her to Reachcliff Cave
	If (GetOwningQuest().GetStage() == 10) && (pReachcliffCaveLocation != Self.GetActorRef().GetCurrentLocation())
		Self.GetActorRef().MoveTo(pReachcliffCaveInsideEntranceMarker)
	EndIf

	;If (GetOwningQuest().GetStageDone(17) == 1) && (pMarkarthHalloftheDead == Self.GetActorRef().GetCurrentLocation())
	;	Self.GetActorRef().MoveTo(pGlooredhelTravelMarker)
	;	GetOwningQuest().SetStage(20)
	;EndIf

	;State change for Reachcliff Cave when the player has taken over the cave
	If (GetOwningQuest().GetStageDone(30) == 1) && (pReachcliffState2Marker.IsDisabled())
; 		debug.Trace("Switching states in Reachcliff Cave")
; 		debug.Trace("Disabling Reachcliff Normal Marker")
		pReachcliffState1Marker.Disable()
; 		debug.Trace("Enabling Reachcliff DA11 Marker")
		pReachcliffState2Marker.Enable()
	EndIf

	;Move all the cultists back to Markarth
	If (GetOwningQuest().GetStageDone(100) == 1) && (GetOwningQuest().GetStageDone(600) == 0)
		GetOwningQuest().SetStage(600)
	EndIf

EndEvent

ObjectReference Property pGlooredhelTravelMarker  Auto  
