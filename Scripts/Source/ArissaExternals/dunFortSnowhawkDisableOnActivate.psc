scriptName dunFortSnowhawkDisableOnActivate extends ObjectReference

ObjectReference property Object1 Auto
ObjectReference property Object2 Auto
ObjectReference property Object3 Auto
ObjectReference property Object4 Auto
ObjectReference property Object5 Auto

bool property fade = False auto

Event OnActivate(ObjectReference obj)
	Object1.Disable(fade)
	Object2.Disable(fade)
	Object3.Disable(fade)
	Object4.Disable(fade)
	Object5.Disable(fade)
EndEvent
