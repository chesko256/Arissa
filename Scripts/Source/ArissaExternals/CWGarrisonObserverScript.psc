Scriptname CWGarrisonObserverScript extends Quest  
{Script attached to CWGarrisonObserver quest, extends quest}

CWScript Property CWs Auto

LocationAlias Property Garrison Auto

int Property countSoldiers Auto Hidden

int Property maxCountSoldiers Auto Hidden	;holds the max counted... needed to make sure when we have 0 guys it's because they all died, not because there were none.

bool Property DoneSettingInitialCount Auto Hidden



function modCountSoldiers(int ValueToMod)
	CountSoldiers += ValueToMod

	if CountSoldiers > MaxCountSoldiers 
		MaxCountSoldiers = CountSoldiers
	EndIf
	
; 	CWScript.Log("CWGarrisonObserverScript", self + " modCountSoldiers(), new countSoldiers = " + countSoldiers)
	
EndFunction


function CountAliasIfFilledAndAlive(ReferenceAlias AliasToCount)
	
	Actor ActorToCount = AliasToCount.GetActorReference()
	
	if ActorToCount && ActorToCount.IsDead() == False
		modCountSoldiers(1)
	EndIf

EndFunction


function ProcessSoldierDeath(Actor DeadSoldier)
	
		modCountSoldiers(-1)

; 		CWScript.Log("CWGarrisonObserverScript", self + " calling CWScript modObjectiveByEnemySoldierDeath(" + DeadSoldier + ")")
;		CWs.modObjectiveByEnemySoldierDeath(DeadSoldier)
	
EndFunction

function playerLeftLocation()
; 	CWScript.Log("CWGarrisonObserverScript", self + "playerLeftLocation()")

	if maxCountSoldiers == 0
; 		CWScript.Log("CWGarrisonObserverScript", self + "playerLeftLocation() maxCountSoldiers == 0, so we are ignoring it because we never counted any soldiers.")
		return
		
	EndIf
	
	Location GarrisonLocation = Garrison.GetLocation()

	if Game.GetPlayer().IsInLocation(GarrisonLocation) == False
	
		if countSoldiers <= 0 && \
			GarrisonLocation.GetKeywordData(CWs.CWOwner) != CWs.PlayerAllegiance && \
			GarrisonLocation.HasKeyword(CWs.CWCapital) == False && \
			GarrisonLocation.HasKeyword(CWs.CWGarrisonDefenderOnly) == False && \
			GarrisonLocation.HasKeyword(CWs.CWFort) == False
			
; 				CWScript.Log("CWGarrisonObserverScript", self + "playerLeftLocation() and countSoldiers <= 0, calling CWScript setOwner(" + GarrisonLocation + ", [" + CWs.PlayerAllegiance + "])")
				CWs.SetOwner(GarrisonLocation, CWs.PlayerAllegiance, SetKeywordDataImmediately = true)
				
		else

; 			CWScript.Log("CWGarrisonObserverScript", self + "playerLeftLocation() and either Player's Faction owns, it's a Capital, Defender Only Garrison, or Fort, so we aren't giving his faction ownership.")
				
		EndIf

		unRegisterForUpdate()
		
; 		CWScript.Log("CWGarrisonObserverScript", self + "playerLeftLocation() countSoldiers == " + CountSoldiers + "; player has left location, so calling Stop() on quest.")
	
		stop()
		
	EndIf
EndFunction

