Scriptname RiftenBrynjolfTriggerScript extends ObjectReference  Conditional

ObjectReference Property pToggle Auto
Actor Property pBrynjolf Auto
Package Property pBrynDay Auto
Package Property pBrynNight Auto
Package Property pBrynWaitDay Auto
Package Property pBrynWaitNight Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == pBrynjolf
		if pBrynjolf.GetCurrentPackage() == pBrynDay || pBrynjolf.GetCurrentPackage() == pBrynWaitDay
			pToggle.Enable()
		elseif pBrynjolf.GetCurrentPackage() == pBrynNight || pBrynjolf.GetCurrentPackage() == pBrynWaitNight
			pToggle.Disable()
		endif
	endif

endEvent