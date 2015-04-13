Scriptname CWMission07TriggerScript extends ReferenceAlias  

ReferenceAlias Property Friend Auto

ReferenceAlias Property CaravanSoldier1 Auto
ReferenceAlias Property CaravanSoldier2 Auto
ReferenceAlias Property CaravanSoldier3 Auto
ReferenceAlias Property CaravanSoldier4 Auto
ReferenceAlias Property CaravanSoldier5 Auto
ReferenceAlias Property CaravanSoldier6 Auto

Topic Property CWMission07WaitForItTopic Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	ObjectReference Ref1 =  CaravanSoldier1.GetReference()
	ObjectReference Ref2 =  CaravanSoldier2.GetReference()
	ObjectReference Ref3 =  CaravanSoldier3.GetReference()
	ObjectReference Ref4 =  CaravanSoldier4.GetReference()
	ObjectReference Ref5 =  CaravanSoldier5.GetReference()
	ObjectReference Ref6 =  CaravanSoldier6.GetReference()

	if GetOwningQuest().GetStage() == 51	
		if akActionRef == Ref1 || akActionRef == Ref2 || akActionRef == Ref3 || akActionRef == Ref4 || akActionRef == Ref5 || akActionRef == Ref6
			GetOwningQuest().setStage(55)
		
		EndIf
	
	EndIf

EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	ObjectReference Ref1 =  CaravanSoldier1.GetReference()
	ObjectReference Ref2 =  CaravanSoldier2.GetReference()
	ObjectReference Ref3 =  CaravanSoldier3.GetReference()
	ObjectReference Ref4 =  CaravanSoldier4.GetReference()
	ObjectReference Ref5 =  CaravanSoldier5.GetReference()
	ObjectReference Ref6 =  CaravanSoldier6.GetReference()

	if GetOwningQuest().GetStage() == 51	
		if akActionRef == Ref1 || akActionRef == Ref2 || akActionRef == Ref3 || akActionRef == Ref4 || akActionRef == Ref5 || akActionRef == Ref6
			Friend.GetActorReference().Say(CWMission07WaitForItTopic)
		
		EndIf
	
	EndIf

EndEvent
