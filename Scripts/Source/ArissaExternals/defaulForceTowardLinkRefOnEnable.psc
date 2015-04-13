Scriptname defaulForceTowardLinkRefOnEnable extends ObjectReference  
{When this reference is enabled it will apply a force toward it's linked reference.}
import debug
import game
import utility

float transX
float transY
float transZ

objectReference property myTarget auto hidden
float property physForce = 0.1 auto
{The force you want to be applied to this reference toward it's linked ref. - DEFAULT = 0.1}

Event OnLoad()
	myTarget = GetLinkedRef()
	ApplyForce()
EndEvent

Function ApplyForce()
	applyHavokImpulse((myTarget.getPositionX()), (myTarget.getPositionX()), (myTarget.getPositionZ() + 256), physForce)
EndFunction
