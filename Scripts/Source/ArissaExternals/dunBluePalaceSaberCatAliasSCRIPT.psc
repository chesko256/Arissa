Scriptname dunBluePalaceSaberCatAliasSCRIPT extends ReferenceAlias  

; the skeever's door variables
OBJECTREFERENCE PROPERTY doorOpen AUTO
OBJECTREFERENCE PROPERTY skeeverDoor AUTO

EVENT onDEATH(ACTOR akKiller)
		skeeverDoor.activate(doorOpen)
	
ENDEVENT
