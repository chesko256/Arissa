Scriptname DA04HMActivatorShuntScript extends ObjectReference  

ObjectReference Property RealActivator auto

Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		RealActivator.Activate(akActivator)
	endif
EndEvent
