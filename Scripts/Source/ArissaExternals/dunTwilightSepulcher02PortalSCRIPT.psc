Scriptname dunTwilightSepulcher02PortalSCRIPT extends ObjectReference  

OBJECTREFERENCE PROPERTY portalDoor AUTO

EVENT onACTIVATE(OBJECTREFERENCE obj)
	IF(obj == game.getPlayer())
		portalDoor.activate(game.getplayer())
	ENDIF

endEVENT
