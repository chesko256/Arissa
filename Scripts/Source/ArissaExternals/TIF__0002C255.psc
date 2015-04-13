;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__0002C255 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(Ingredient1.GetReference(), 1)
Game.GetPlayer().RemoveItem(Ingredient2, 1)
Game.GetPlayer().RemoveItem(Ingredient3, 1)

DeathScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Ingredient1 Auto
MiscObject Property Ingredient2 Auto
MiscObject Property Ingredient3 Auto

Scene Property DeathScene Auto
