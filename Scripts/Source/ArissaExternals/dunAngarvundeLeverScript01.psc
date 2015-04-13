Scriptname dunAngarvundeLeverScript01 extends ReferenceAlias 
;ScriptName dunAngarvundeLeverScript01 extends NorLever01SCRIPT

;import NorLever01SCRIPT
import Debug

dunAngarvundeQSTScript AngScript


Event onActivate(objectReference triggerRef)
	;if Lever02 is flipped first
	if (getOwningQuest().getStageDone(55) == true && getOwningQuest().getStagedone(60) == false)
;		getOwningQuest().alias_Lever02.getReference().disable()
;		AngScript.Lever02Shutdown()
		getOwningQuest().setStage(60)
		getOwningQuest().setStage(61)
	;if Lever03 is flipped first
	elseif (getOwningQuest().getStageDone(56) == true && getOwningQuest().getStageDone(60) == false)
	getOwningQuest().setStage(60)
	getOwningQuest().setStage(62)
	;Lever02 if flipped second
	elseif (getOwningQuest().getStageDone(65) == true && getOwningQuest().getStageDone(60) == true)
	getOwningQuest().setStage(70)
	;Lever03 is flipped second
	elseif (getOwningQuest().getStageDone(66) == true && getOwningQuest().getStageDone(60) == true)
	getOwningQuest().setStage(70)
	endif
endEvent
