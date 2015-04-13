Scriptname DarkwaterLeavingTriggerScript extends ReferenceAlias  


Event OnTriggerEnter(ObjectReference akActivator)
	if (Game.GetPlayer() == akActivator && GetOwningQuest().GetStage() == 20)
		(GetOwningQuest() as DarkwaterDerkeethusRescueScript).LeftCavern()
		GetReference().Delete()
	endif
EndEvent
