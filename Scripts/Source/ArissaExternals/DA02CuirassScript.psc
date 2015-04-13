Scriptname DA02CuirassScript extends ObjectReference  
{Script on the DA02Cuirass base object}

Quest Property DA02 Auto
Spell Property DA02ArmorAbility Auto


;This script assumes that the only way to get the armor is to kill the champion. If this assumption becomes incorrect, we will likely need handling and extra objectives for seperating out the killing and getting of Armor

;Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
;	
; ;	Debug.Trace(self + "OnContainerChanged()")
;	
;	if DA02.GetStageDone(20)	;Boethiah told the player to do this because he slayed his friend and killed all the cultists at the shrine - if not, stage 20 will poll to see if the player has the armor
;		if DA02.GetStageDone(30) == false && akNewContainer == Game.GetPlayer()
; ;			Debug.Trace(self + "OnContainerChanged() now in player's inventory.")
;			DA02.SetStage(30)
;		EndIf
;	EndIf
;endEvent


Event OnEquipped(Actor akActor)

; 	Debug.Trace(self + "OnEquipped()")

	if DA02.GetStageDone(30)	;player's killed everyone at the bandit lair
		if DA02.GetStageDone(40) == false && akActor == Game.GetPlayer()
; 			Debug.Trace(self + "OnEquipped() by player.")
			DA02.setstage(40)
		endIf
	EndIf
	
	;akActor.AddSpell(DA02ArmorAbility) -- handled directly by enchantment on the armor
endEvent


Event OnUnequipped(Actor akActor)
	
; 	Debug.Trace(self + "OnUnequipped()")

	;akActor.RemoveSpell(DA02ArmorAbility) -- handled directly by enchantment on the armor
EndEvent



