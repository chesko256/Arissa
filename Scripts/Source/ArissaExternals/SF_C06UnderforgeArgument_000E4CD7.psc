;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname SF_C06UnderforgeArgument_000E4CD7 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
ObjectReference blade = Eorlund.GetRef().PlaceAtMe(YsgramorsBlade)
BladeAlias.ForceRefTo(blade)
Eorlund.GetRef().AddItem(blade)
Eorlund.GetRef().MoveTo(EntranceMarker)
Eorlund.GetActorRef().EquipItem(blade.GetBaseObject())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
GetOwningQuest().setstage(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Weapon Property YsgramorsBlade  Auto  

ReferenceAlias Property BladeAlias  Auto  

ReferenceAlias Property Eorlund  Auto  

ObjectReference Property EntranceMarker  Auto  
