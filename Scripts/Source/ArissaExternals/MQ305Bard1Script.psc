Scriptname MQ305Bard1Script extends ObjectReference  
BardSongsScript Property BardSongs  Auto  

Event OnLoad()
	Actor meActor = (self as ObjectReference) as Actor
	BardSongs.PlaySong(meActor, sInstrument )
endEvent

string Property sInstrument = "Lute" Auto  