scriptName defaultEnableTrigSCRIPT extends TriggerBoxBase
;
;	Trigger Box script used to enable/disable objects linked to this
;
;=============================================================

Function fireTriggerEvent ()
	self.disable()	;enable objects hooked up to this trigger
endFunction
