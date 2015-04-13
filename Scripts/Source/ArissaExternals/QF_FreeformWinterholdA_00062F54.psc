;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_FreeformWinterholdA_00062F54 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Birna
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Birna Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;player has placed the jar
Debug.MessageBox("You placed the jar, you get a prize!")
Game.GetPlayer().Additem(Gold, 200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;player has purchased the jar and can do what he wants with it.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;player has been told about jar, now has option to buy it.
DungeonClawRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

ObjectReference Property DungeonClawRef  Auto  
