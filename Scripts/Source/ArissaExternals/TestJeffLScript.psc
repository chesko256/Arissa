Scriptname TestJeffLScript extends ObjectReference
import debug

int myVar = 0

Event OnActivate(ObjectReference akActivator)
	; Put test code here
	myVar += 1
	Trace("OnActivate: myVar = " + myVar)
EndEvent
