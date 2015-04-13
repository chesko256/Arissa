scriptName dunAlftandSteamPuzzleSolved extends objectReference
;
;
;=============================================================

event onActivate(objectReference triggerRef)
; 	debug.Trace(self + " has been activated, steam should be off")
	self.disable()

endEvent
