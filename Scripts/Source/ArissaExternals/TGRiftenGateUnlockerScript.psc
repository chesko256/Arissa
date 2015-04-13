Scriptname TGRiftenGateUnlockerScript extends ObjectReference  Conditional

int Property pUnlocked Auto
ObjectReference Property pRiftenAlleyGate01Ref Auto
ObjectReference Property pRiftenAlleyGate02Ref Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pUnlocked == 0
			pRiftenAlleyGate01Ref.Lock(False)
			pRiftenAlleyGate02Ref.Lock(False)
			pUnlocked = 1
			Self.Disable()
		endif
	endif

endEvent