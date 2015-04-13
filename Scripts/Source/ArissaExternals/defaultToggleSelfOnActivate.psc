scriptName defaultToggleSelfOnActivate extends objectReference
{This script toggles it's own enable state onActivate
	this is mainly used on objects that are enable parents}

;State containment used in case other states are needed later
auto state waiting
	event onActivate(objectReference triggerRef)
		;if this object is enabled, disable it
		if self.isEnabled()
			self.Disable()
			
		;if it is disabled, enable it	
		else
			self.Enable()
		endif
	endEvent
endState
