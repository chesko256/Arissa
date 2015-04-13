ScriptName LoveInterestFINScript extends ReferenceAlias

LocationAlias Property CurrentMarriageHouse Auto
Spell Property MarriageSleepAbility Auto
Faction Property JobMerchantFaction Auto
MiscObject Property Gold001 Auto
GlobalVariable Property MarriageGoldEarned Auto

;how much gold spouse earns each day
Int GoldEarnedAmount = 100

Event OnSleepStop(bool abInterrupted)
	if (abInterrupted == False) && (CurrentMarriageHouse.GetLocation() == Game.GetPlayer().GetCurrentLocation())
; 	    Debug.Trace(self + "Player has slept in the same location as the spouse. Apply Bonus.")
		MarriageSleepAbility.Cast(Game.GetPlayer(), Game.GetPlayer())
	Else
; 		Debug.Trace(self + "Player is married, but hasn't slept in the same location as the spouse, or was woken up by something.")
	EndIf
endEvent


Event OnUpdateGameTime()

; 	debug.trace(self + "OnUpdate event to calculate spouse store gold")
	If Self.GetActorRef().IsInFaction(JobMerchantFaction)
; 		debug.trace(self + "Adding gold to spouse for store")
		MarriageGoldEarned.SetValue(MarriageGoldEarned.Value + GoldEarnedAmount)
	EndIf

EndEvent

Function GiveGold()

; 	debug.trace(self + "spouse gives gold")
	Game.GetPlayer().AddItem(Gold001, MarriageGoldEarned.GetValueInt())
	MarriageGoldEarned.SetValue(0)

EndFunction