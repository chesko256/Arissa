;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname SF_BardSongsInstrumentalLute_001069C2 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Bard.GetActorRef().PlayIdle(IdleStop)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_5 in script SF_BardSongsInstrumentalLute_001069C2
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; debug.Trace("Starting Scene")
(BardSongs as BardSongsScript).StopInnMusic()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Bard.GetActorRef().PlayIdle(IdleLuteStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
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

Idle Property IdleLuteStart  Auto  
