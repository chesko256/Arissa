;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_BardSongsDrinkingSong01_000BE159 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Lurbuk
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Lurbuk Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Karita
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Karita Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;BardSongsKeyword.SendStoryEvent(akref1 = Alias_Bard.GetActorRef())
;BardSongs_Bard.forcerefto(alias_Bard.GetActorRef())

;-----------------------------------------------------------------------------------------------
If Alias_Bard.GetRef() == Alias_Karita.GetRef() && DA16.GetStage() >= 10
     Alias_Karita.GetActorRef().RemoveFromFaction(BardSingerNoAutostart)
Endif

;-----------------------------------------------------------------------------------------------
If Alias_Bard.GetActorRef().IsInFaction(BardSingerNoAutostart)
     stop()
ElseIf Alias_Bard.GetActorRef().IsInFaction(BardSingerInstrumentalOnly)
     (BardSongs as BardSongsScript).PlaySongRequest(alias_Bard.GetActorRef(),"Instrumental")
Else
     (BardSongs as BardSongsScript).PlaySongRequest(alias_Bard.GetActorRef())
EndIf

stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BardSongs  Auto  

Keyword Property BardSongsKeyword  Auto  

ReferenceAlias Property BardSongs_Bard  Auto  

Faction Property BardSingerNoAutostart  Auto  

Quest Property DA16  Auto  

Faction Property BardSingerInstrumentalOnly  Auto  

Package Property MorthalLurbukSleep1x5  Auto  
