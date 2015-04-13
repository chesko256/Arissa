scriptName dunHaltedStreamCampDeathScript extends referenceAlias
;
;
;;
;===========================================================

bool property isCentaur = TRUE auto
bool property isMammoth = FALSE auto
bool property isGhostGiant = FALSE auto
quest property myQuest auto

event onDeath(actor akKiller)
	if isCentaur
; 		debug.Trace("Halted Stream centaur killed")
		(getOwningQuest() as dunHaltedStreamCampSCRIPT).centaursKilled += 1
	endif
	if isMammoth
; 		debug.Trace("Halted Stream Mammoth killed")
		(getOwningQuest() as dunHaltedStreamCampSCRIPT).mammothsKilled += 1
	endif
	if isGhostGiant
; 		debug.Trace("Halted Stream Ghost Giant killed")
		(getOwningQuest() as dunHaltedStreamCampSCRIPT).ghostGiantKilled += 1
	endif
endEvent

