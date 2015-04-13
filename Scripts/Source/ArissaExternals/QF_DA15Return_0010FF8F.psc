;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_DA15Return_0010FF8F Extends Quest Hidden

;BEGIN ALIAS PROPERTY DA15BluePalaceReturnMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA15BluePalaceReturnMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Game.GetPlayer().removeitem(Wabbajack, abSilent = true)
Game.GetPlayer().additem(RealWabbajack, abSilent = true)
Game.EnablePlayerControls()
Game.GetPlayer().moveto(alias_DA15BluePalaceReturnMarker.GetRef())
DA15Container.removeallitems(Game.GetPlayer(), 1)
setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Utility.Wait(5)
Setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


WEAPON Property Wabbajack  Auto  

WEAPON Property RealWabbajack  Auto  

ObjectReference Property DA15Container  Auto  
