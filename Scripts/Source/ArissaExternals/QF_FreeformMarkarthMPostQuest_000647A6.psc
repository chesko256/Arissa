;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_FreeformMarkarthMPostQuest_000647A6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Ogmund
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ogmund Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Move Ogmund to the stocks, his package will restrain him
Alias_Ogmund.GetActorRef().MoveTo(StocksMarker)
Alias_Ogmund.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property StocksMarker  Auto  
