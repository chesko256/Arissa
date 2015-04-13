;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_MS02EscapeNeposEnding_0006A9A0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY EvidenceChest
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EvidenceChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thonar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Thonar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StolenGoodsChest
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_StolenGoodsChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThonarMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ThonarMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player finishes talking to Thonar
;Thonar is no longer Essential
Alias_Thonar.GetActorRef().GetActorBase().SetEssential(False)

;Player gets his equipment back
Alias_EvidenceChest.GetRef().RemoveAllItems(akTransferTo = Game.GetPlayer())
Alias_StolenGoodsChest.GetRef().RemoveAllItems(akTransferTo = Game.GetPlayer())

;Player gets the Silver-Fish ring
Game.GetPlayer().AddItem(pSilverFishRing, 1)

;MS02 Completes
pMS02.SetStage(250)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
CrimeFactionReach.SetCrimeGold(0)
CrimeFactionReach.SetCrimeGoldViolent(0)

;Move Thonar into position
Alias_Thonar.GetActorRef().MoveTo(Alias_ThonarMarker.GetRef())

;make Thonar Essential
Alias_Thonar.GetActorRef().GetActorBase().SetEssential(True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorBase Property Madanach  Auto  

Quest Property pMS02  Auto  


ObjectReference Property pMadanachMarker  Auto  

Armor Property pSilverFishRing  Auto  

Faction Property CrimeFactionReach  Auto  
