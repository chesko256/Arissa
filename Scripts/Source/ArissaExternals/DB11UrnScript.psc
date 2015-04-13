Scriptname DB11UrnScript extends ReferenceAlias  

int GoldCount
MiscObject Property pGold Auto

Event OnLoad()

GoldCount=GetRef().GetItemCount(pGold)

EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

if DB11.GetStage () == 60
	if GetRef().GetItemCount(pGold) == 0
		DB11.SetStage (80)
	endif
endif

; ;Debug.Trace ("Tryin' to get me gold" + GetRef().GetItemCount(pGold))

EndEvent


Quest Property DB11  Auto  
