ScriptName dunRobbersGorge_TriggerLeverPull extends objectReference

ObjectReference property Lever01 Auto
ObjectReference property Lever02 Auto

ObjectReference property Trigger01 Auto
ObjectReference property Trigger02 Auto

dunRobbersGorge_TimedLeverPull Trigger1
dunRobbersGorge_TimedLeverPull Trigger2

Event OnCellLoad()
	Trigger1 = Trigger01 As dunRobbersGorge_TimedLeverPull
	Trigger2 = Trigger02 As dunRobbersGorge_TimedLeverPull
EndEvent

Event onTriggerEnter(objectReference triggerRef)
	if (triggerRef == Game.GetPlayer())
		Trigger1.SetLever(Lever01)
		Trigger2.SetLever(Lever02)
	EndIf
EndEvent