Scriptname TG07BarScript extends ObjectReference  Conditional

Message Property pMessage Auto

Event OnLoad()

	BlockActivation()

endEvent

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		pMessage.Show()
	endif

endEvent