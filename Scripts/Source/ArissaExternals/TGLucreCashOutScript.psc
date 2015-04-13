Scriptname TGLucreCashOutScript extends ReferenceAlias  Conditional

MiscObject Property pLucre Auto Conditional
int Property pAmount Auto
int Property pCashed Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	
	if pCashed == 0
		if akNewContainer == Game.GetPlayer()
			Game.GetPlayer().RemoveItem(pLucre,pAmount)
			pCashed = 1
		endif
	endif

endEvent