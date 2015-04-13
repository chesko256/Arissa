;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_BardSongsInstrumentalBard_00109C6B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Bard2.GetActorRef().PlayIdle(IdleStop)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Bard2.GetActorRef().PlayIdle(IdleDrumStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Bard2.GetActorRef().PlayIdle(IdleStop)
; debug.Trace("Bard2SceneScene02 Calling Play Songs")
(BardSongs as BardSongsScript).Bard2PlaySong(Bard2.GetRef(),ChangeSettings = False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; debug.Trace("Starting Bard 2 Scene")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property IdleStop  Auto  

Idle Property IdleDrumStart  Auto  

ReferenceAlias Property Bard2  Auto  

Quest Property BardSongs  Auto  
