Scriptname defaultAddMiscItemSCRIPT extends ObjectReference  

MISCOBJECT PROPERTY itemToAdd AUTO
{the misc item to place}

INT PROPERTY count AUTO
{how many of the above item the char should have}

EVENT onLoad()

	IF (SELF.getItemCount(itemToAdd) < count)
		SELF.addItem(itemToAdd, count - SELF.getItemCount(itemToAdd), TRUE)
	ENDIF

ENDEVENT
