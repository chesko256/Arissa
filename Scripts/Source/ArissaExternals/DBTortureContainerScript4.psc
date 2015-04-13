Scriptname DBTortureContainerScript4 extends ReferenceAlias  


int GoldCount
MiscObject Property pGold Auto
Quest Property TreasureQuest4  Auto  

Event OnLoad()

GoldCount=GetRef().GetItemCount(pGold)

EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

if GetRef().GetItemCount(pGold) == 0
	TreasureQuest4.SetStage (200)
endif
 
EndEvent

