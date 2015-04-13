;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_MS05KingOlafsFestivalDUPLI_0006C0EA Extends Quest Hidden

;BEGIN ALIAS PROPERTY KingOlafsFestivalTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KingOlafsFestivalTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Move1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Move1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JawananMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JawananMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Una
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Una Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rorlund
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rorlund Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aia
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Aia Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EffigyFX
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EffigyFX Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Silana
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Silana Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Taarie
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Taarie Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jawanan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jawanan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sorex
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sorex Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Svari
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Svari Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS05FestivalViarmo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS05FestivalViarmo Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kayd
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kayd Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RorlundMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RorlundMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KaydMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KaydMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Evette
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Evette Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bendt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bendt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Illdi
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Illdi Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pantea
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pantea Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jorn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jorn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Erdi
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Erdi Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Minette
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Minette Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AtAfAlan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AtAfAlan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BurntEffigy
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BurntEffigy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TaarieMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TaarieMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ErdiMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ErdiMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KingOlafsFestivalVendorEnabler
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KingOlafsFestivalVendorEnabler Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Move2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Move2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Effigy
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Effigy Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Alias_Effigy.GetRef().Disable()
Alias_BurntEffigy.GetRef().Enable()
Alias_EffigyFX.GetRef().Disable()
alias_KingOlafsFestivalVendorEnabler.GetRef().Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Stage set to stat MS05KingOlafsFestivalScene
MS05KingOlafsFestival_scene.Start()
(BardSongs as BardSongsScript).PlaySong(alias_Atafalan.GetActorRef(),"Flute")
(BardSongs as BardSongsScript).Bard2PlaySong(alias_Jorn.GetActorRef(),"Drum")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;MPSFireWallBase.Cast(Alias_Effigy.GetRef(),Alias_Effigy.GetRef())
Alias_EffigyFX.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
(FestivalEndObject as FestivalEndScript).goToState("Listening")
MS05.Setstage(290)
Alias_MS05FestivalViarmo.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MS05KingOlafsFestivalScript
Quest __temp = self as Quest
MS05KingOlafsFestivalScript kmyQuest = __temp as MS05KingOlafsFestivalScript
;END AUTOCAST
;BEGIN CODE
alias_Sorex.GetRef().moveto(alias_move1.GetRef())
alias_Evette.GetRef().moveto(alias_move1.GetRef())
alias_Una.GetRef().moveto(alias_move2.GetRef())
alias_Svari.GetRef().moveto(alias_move2.GetRef())
alias_Minette.GetRef().moveto(alias_move2.GetRef())
alias_Silana.GetRef().moveto(alias_move2.GetRef())
alias_Bendt.GetRef().moveto(alias_move2.GetRef())
;---------------------------------------------------------------------------------
alias_Kayd.GetRef().moveto(alias_KaydMarker.GetRef())
alias_Taarie.GetRef().moveto(alias_TaarieMarker.GetRef())
alias_Rorlund.GetRef().moveto(alias_RorlundMarker.GetRef())
alias_Jawanan.GetRef().moveto(alias_JawananMarker.GetRef())
alias_Erdi.GetRef().moveto(alias_ErdiMarker.GetRef())
;---------------------------------------------------------------------------------
alias_KingOlafsFestivalVendorEnabler.GetRef().Enable()
Alias_Effigy.GetRef().Enable()

kmyQuest.Wine = 1
kmyQuest.Pie = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MS05KingOlafsFestival_Scene  Auto  

Quest Property MS05  Auto  

Spell Property MPSFireWallBase  Auto  

Quest Property BardSongs  Auto  

ObjectReference Property FestivalEndObject  Auto  

