;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_BardSongsDrinkingSong02Sce_000D0843 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Bard.GetActorRef().PlayIdle(IdleLuteStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
BardAudienceQuest.Setstage(10)
(GetOwningQuest() as BardSongsScript).StopInnMusic ()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
BardAudienceQuest.Setstage(20)
Bard.GetActorRef().PlayIdle(IdleStop)
MUSTavernSilence.Remove()
; debug.Trace("Scene Calling Play Songs")
(GetOwningQuest() as BardSongsScript).PlaySong(Bard.GetActorRef(),ChangeSettings = False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Bard  Auto  

Idle Property IdleStop  Auto  

Quest Property BardAudienceQuest  Auto  

Idle Property IdleLuteStart  Auto  

MusicType Property MUSTavernSilence  Auto  
