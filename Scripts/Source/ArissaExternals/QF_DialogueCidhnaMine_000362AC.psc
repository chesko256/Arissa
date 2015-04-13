;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_DialogueCidhnaMine_000362AC Extends Quest Hidden

;BEGIN ALIAS PROPERTY Urzoga
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Urzoga Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrisonerBorkul
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PrisonerBorkul Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrisonerDuach
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PrisonerDuach Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrisonerGrisvar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PrisonerGrisvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SilverOre
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SilverOre Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrisonerMadanach
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PrisonerMadanach Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrisonerOdvan
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PrisonerOdvan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrisonerUraccen
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PrisonerUraccen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrisonerBlathloc
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PrisonerBlathloc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pickaxe
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Pickaxe Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Urzoga non-prisoner dialog
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Borkul's initial dialog
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Urzoga is dead, make sure we make Cidhna Mine permanently open
CidhnaMineDoorB.SetOpen()
CidhnaMineDoorA.SetOpen(False)
CidhnaMineDoorA.Lock()
CidhnaMineGuardAreaCollision.Enable()
CidhnaMinePrisonAreaCollision.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Uraccen's Forsworn topic
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player talked to Duach about why he's in prison
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Initial conversation with Uraccen
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;tell player to mine silver
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Player has mined silver
SetObjectiveDisplayed(10, abDisplayed = false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property CidhnaMineDoorB  Auto  

ObjectReference Property CidhnaMineDoorA  Auto  

ObjectReference Property CidhnaMineDoorLeverA  Auto  

ObjectReference Property CidhnaMineDoorLeverB  Auto  

ObjectReference Property CidhnaMineGuardAreaCollision  Auto  

ObjectReference Property CidhnaMinePrisonAreaCollision  Auto  
