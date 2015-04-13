Scriptname MQ305BardScript extends ObjectReference  

BardSongsScript Property BardSongs  Auto  

Event OnLoad()
	Actor meActor = (self as ObjectReference) as Actor
	BardSongs.Bard2PlaySong(meActor, sInstrument )
endEvent

string Property sInstrument = "Lute" Auto  
