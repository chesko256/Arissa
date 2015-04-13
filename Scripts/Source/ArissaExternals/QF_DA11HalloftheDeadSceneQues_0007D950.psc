;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_DA11HalloftheDeadSceneQues_0007D950 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LOSMarker02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LOSMarker02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LOSMarker01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LOSMarker01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TalkMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TalkMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShrineofArkay
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ShrineofArkay Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Glooredhel
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Glooredhel Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Move Glooredhel and have her forcegreet the player

Actor EolaRef = Alias_Glooredhel.GetActorRef()

If (Game.GetPlayer().HasLOS(Alias_LOSMarker01.GetRef()))
  EolaRef.MoveTo(Alias_LOSMarker02.GetRef())
Else
  EolaRef.MoveTo(Alias_LOSMarker01.GetRef())
EndIf

EolaRef.Enable()

pDA11.SetStage(5)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDA11  Auto  
