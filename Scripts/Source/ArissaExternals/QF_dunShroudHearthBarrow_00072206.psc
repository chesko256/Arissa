;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_dunShroudHearthBarrow_00072206 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Wyndelius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Wyndelius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SapphireDragonClaw
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SapphireDragonClaw Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Phantom scene completed.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Advance phantom scene-- move into position.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Alias_Wyndelius.GetReference().MoveTo(Alias_Wyndelius.GetReference().GetLinkedRef(Link01))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Player has used the claw. Stop this quest to release the claw for sale.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Player is interacting with levers. Abort Wynd's scene.
PhantomScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property PhantomScene  Auto  

Keyword Property Link01  Auto  
