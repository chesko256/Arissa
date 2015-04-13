;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_dunLostKnifeQST_00034C90 Extends Quest Hidden

;BEGIN ALIAS PROPERTY chattyNPC2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chattyNPC2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chattyNPC1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chattyNPC1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SabreCat
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SabreCat Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY drunkBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_drunkBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chattyNPC4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chattyNPC4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chattyNPC3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chattyNPC3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SabreCatStart
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SabreCatStart Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Alias_SabreCat.GetActorReference().RemoveFromFaction(dunLostKnifeCatFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Alias_SabreCat.GetReference().Moveto(Alias_SabreCatStart.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Alias_SabreCat.GetActorReference().AddToFaction(dunLostKnifeCatFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property dunLostKnifeCatFaction  Auto  
