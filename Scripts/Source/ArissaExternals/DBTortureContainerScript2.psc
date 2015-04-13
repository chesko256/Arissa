Scriptname DBTortureContainerScript2 extends ReferenceAlias  

int GoldCount
MiscObject Property pGold Auto
Quest Property TreasureQuest2  Auto  

Event OnLoad()

GoldCount=GetRef().GetItemCount(pGold)

EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

if GetRef().GetItemCount(pGold) == 0
	TreasureQuest2.SetStage (200)
endif
 
EndEvent
