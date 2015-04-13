;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname SF_BardSongsInstrumentalFlut_00106007 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Bard.GetActorRef().PlayIdle(IdleStop)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Bard.GetActorRef().PlayIdle(IdleFluteStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; debug.Trace("Starting Scene")
(BardSongs as BardSongsScript).StopInnMusic()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Bard.GetActorRef().PlayIdle(IdleStop)
MUSTavernSilence.Remove()
; debug.Trace("Scene Calling Play Songs")
(BardSongs as BardSongsScript).PlaySong(Bard.GetRef(),ChangeSettings = False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Bard  Auto  

Idle Property IdleStop  Auto  

Quest Property BardSongs  Auto  

MusicType Property MUSTavernSilence  Auto  

Idle Property IdleFluteStart  Auto  
