;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_dunPOITundraMarshDogQST_000D980B Extends Quest Hidden

;BEGIN ALIAS PROPERTY Dog
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Dog Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Actor Dog = alias_Dog.GetReference() as Actor
Dog.evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;test
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Actor Dog = alias_Dog.getreference() as Actor
MeekoResetMarker.Enable()

(DialogueFollower as DialogueFollowerScript).SetAnimal(alias_dog.getactorreference())

;Dog.SetActorOwner(game.GetPlayer().GetActorBase())
;Dog.AddToFaction(PlayerFollowerFaction)
Dog.evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PlayerFollowerFaction  Auto  

DialogueFollowerScript Property DialogueFollower Auto

ObjectReference Property MeekoResetMarker  Auto  
