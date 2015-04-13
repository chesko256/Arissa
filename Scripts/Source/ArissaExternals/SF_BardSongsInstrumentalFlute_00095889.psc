;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname SF_BardSongsInstrumentalFlute_00095889 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Bard.GetActorRef().PlayIdle(IdleLuteStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Bard.GetActorRef().PlayIdle(IdleStop)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; debug.Trace("Starting Scene")
(BardSongs as BardSongsScript).StopInnMusic()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Bard.GetActorRef().PlayIdle(IdleStop)
MUSTavernSilence.Remove()
; debug.Trace("Lute Scene is Finished, calling play song")
(BardSongs as BardSongsScript).PlaySong(Bard.GetRef(),ChangeSettings = False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_2 in script SF_BardSongsInstrumentalFlute_00095889
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Bard  Auto  

Idle Property IdleStop  Auto  

Quest Property BardSongs  Auto  

MusicType Property MUSTavernSilence  Auto  

Idle Property IdleLuteStart  Auto  
