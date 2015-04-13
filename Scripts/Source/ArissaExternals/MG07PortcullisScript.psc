Scriptname MG07PortcullisScript   extends ReferenceAlias

int DoOnce


Event OnLoad()

	if DoOnce == 0
		Gate.Activate(Gate)
		DoOnce=1
	endif

EndEvent
ObjectReference Property Gate  Auto  
