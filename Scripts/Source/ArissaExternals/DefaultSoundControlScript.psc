Scriptname DefaultSoundControlScript extends ObjectReference  

;SCRIPT MANAGED BY jduvall
;*** PLEASE DO NOT EDIT, LET ME KNOW IF YOU NEED MORE OR DIFFERENT FUNCTIONALITY ***

;USED BY THESE OBJECTS:
;DA02Pillar


string Property SoundMarker1Name auto
string Property SoundMarker2Name auto
string Property SoundMarker3Name auto

Sound Property SoundMarker1 Auto
Sound Property SoundMarker2 Auto
Sound Property SoundMarker3 Auto

int instance1
int instance2
int instance3

function playSoundByName(string soundName, ObjectReference ObjectToPlayAt = None)
	HandleSoundByName(soundName, true, ObjectToPlayAt)
EndFunction

function stopSoundByName(string soundName, ObjectReference ObjectToPlayAt = None)
	HandleSoundByName(soundName, false, ObjectToPlayAt)
EndFunction


function HandleSoundByName(string soundName, bool PlaySound, ObjectReference ObjectToPlayAt = None)
	
	if ObjectToPlayAt == None
		ObjectToPlayAt = Self
	EndIf
	
	If soundName == SoundMarker1Name
		if PlaySound
			instance1 = SoundMarker1.play(ObjectToPlayAt)
		Else
			Sound.stopInstance(instance1)
		EndIf
		
	ElseIf soundName == SoundMarker2Name
		if PlaySound
			instance2 = SoundMarker2.play(ObjectToPlayAt)
		Else
			Sound.stopInstance(instance2)
		EndIf
		
	ElseIf soundName == SoundMarker3Name
		if PlaySound
			instance3 = SoundMarker3.play(ObjectToPlayAt)
		Else
			Sound.stopInstance(instance3)
		EndIf
		
	Else
; 		debug.trace(self + "DefaultSoundControlScript HandleSoundByName() did not find a recondnized soundName, found: " + soundName, 1)
	
	EndIf

EndFunction
