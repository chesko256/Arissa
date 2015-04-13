scriptName dunHaltedStreamCampDoorScript extends referenceAlias
;
;
;;
;===========================================================


bool property isCentaur = TRUE auto
bool property isMammoth = FALSE auto
bool property isGhostGiant = FALSE auto
quest property myQuest auto

event onOpen(ObjectReference akActionRef)
; 	debug.Trace("Halted Stream mammoths freed")
	(getOwningQuest() as dunHaltedStreamCampSCRIPT).mammothsFreed = TRUE
endEvent
