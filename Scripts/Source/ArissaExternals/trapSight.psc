scriptName trapSight extends objectReference
;
;
;===========================================

effectShader Property trapSightFXS02 auto
GlobalVariable property hasTrapSight auto

event onCellLoad()
; 	;debug.Trace(self + " is loading 3d")
; 	;debug.Trace(self + " has found that HasTrapSight == " + hasTrapSight.value)
	if hasTrapSight.value == 1
; 		;debug.Trace(self + " trapsight is set")
		trapSightFXS02.play(self as objectReference, -1.0)
	endif
endEvent
