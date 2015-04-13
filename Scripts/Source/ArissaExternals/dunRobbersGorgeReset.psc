scriptName dunRobbersGorgeReset extends ObjectReference

Quest property dunRobbersGorgeQST Auto
ObjectReference property Sentry Auto
ObjectReference property LeverTriggerWest Auto
ObjectReference property LeverTriggerEast Auto
ObjectReference property LeverTriggerEast2 Auto
MiscObject property Gold001 Auto

Event OnUnload()
	LeverTriggerWest.Disable()
	LeverTriggerEast.Disable()
	LeverTriggerEast2.Disable()
	(Sentry as Actor).SetAV("Variable06", 0)
	(Sentry as Actor).SetAV("Variable07", 0)
	(Sentry as Actor).SetAV("Variable08", 0)
	(Sentry as Actor).RemoveItem(Gold001, 100, True, None)
EndEvent

Event OnReset()
	LeverTriggerWest.Disable()
	LeverTriggerEast.Disable()
	LeverTriggerEast2.Disable()
EndEvent