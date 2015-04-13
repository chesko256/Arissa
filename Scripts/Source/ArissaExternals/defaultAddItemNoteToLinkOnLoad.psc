scriptname defaultAddItemNoteToLinkOnLoad extends ObjectReference
{Add this object to its linked reference. NOT INHERANTLY RESET-SAFE-- this object must also be set as a quest alias, usually on dunMasterQST.}

bool doOnce

Event OnCellLoad()
	if (!doOnce)
		doOnce = True
		if ((Self.GetBaseObject() as Book) == None)
; 			Debug.Trace("THIS IS A BUG - " + Self + " is a non-book using AddNoteToLinkOnLoad", 2)
		Else
			GetLinkedRef().AddItem(Self, 1, True)
		EndIf
	EndIf
EndEvent