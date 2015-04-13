;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname QF_MS02EscapeScene01_00054880 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Markarth
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Markarth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Odvan
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Odvan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Uraccen
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Uraccen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Duach
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Duach Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Madanach
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Madanach Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EvidenceChest
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EvidenceChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thonar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Thonar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Braig
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Braig Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThonarMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ThonarMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kaie
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Kaie Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StolenGoodsChest
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_StolenGoodsChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RuinsDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_RuinsDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard02Marker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard02Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Borkul
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Borkul Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard01Marker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard01Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard03Marker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard03Marker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Run Kaie Scene
MS02KaieScene.Start()

;move Madanach if he fell behind
If GetStageDone(7) == 0
  Alias_Madanach.GetActorRef().Moveto(MS02MadanachFailsafeMoveMarker)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Madanach forcegreets
Alias_Madanach.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Madanach has reached the end of the tunnel
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Scene outside plays

pMS02.SetStage(100)

;Add prisoners to the Forsworn faction
Alias_Madanach.GetActorRef().AddToFaction(pForswornFaction)
Alias_Odvan.GetActorRef().AddToFaction(pForswornFaction)
Alias_Duach.GetActorRef().AddToFaction(pForswornFaction)
Alias_Borkul.GetActorRef().AddToFaction(pForswornFaction)
Alias_Uraccen.GetActorRef().AddToFaction(pForswornFaction)
Alias_Kaie.GetActorRef().AddToFaction(pForswornFaction)
Alias_Braig.GetActorRef().AddToFaction(pForswornFaction)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
Actor myOdvan = Alias_Odvan.GetActorRef()
Actor myBorkul = Alias_Borkul.GetActorRef()
Actor myDuach = Alias_Duach.GetActorRef()
Actor myUraccen = Alias_Uraccen.GetActorRef()
Actor myBraig = Alias_Braig.GetActorRef()

;Player gets his equipment back
Alias_EvidenceChest.GetRef().RemoveAllItems(akTransferTo = myPlayer)
Alias_StolenGoodsChest.GetRef().RemoveAllItems(akTransferTo = myPlayer)

;Player gets Forsworn armor

myPlayer.AddItem(MS02ForswornArmor, 1)
myPlayer.AddItem(MS02ForswornGauntlets, 1)
myPlayer.AddItem(MS02ForswornHelmet, 1)
myPlayer.AddItem(MS02ForswornBoots, 1)

;Forsworn get their equipment
If myOdvan.IsDead() == False
	myOdvan.SetOutfit(ForswornArmorMeleeOutfit)
	myOdvan.AddItem(LItemForswornWeapon1H, 1)
	myOdvan.AddItem(LItemForswornWeaponMissile, 1)
	myOdvan.AddItem(RestoreHealth02, 2)
EndIf

If myBorkul.IsDead() == False
	myBorkul.SetOutfit(ForswornArmorMeleeOutfit)
	myBorkul.AddItem(LItemForswornWeapon1H, 1)
	myBorkul.AddItem(LItemForswornWeaponMissile, 1)
	myBorkul.AddItem(RestoreHealth02, 2)
EndIf

If myDuach.IsDead() == False
	myDuach.SetOutfit(ForswornArmorMeleeOutfit)
	myDuach.AddItem(LItemForswornWeapon1H, 1)
	myDuach.AddItem(LItemForswornWeaponMissile, 1)
	myDuach.AddItem(RestoreHealth02, 2)
EndIf

If myUraccen.IsDead() == False
	myUraccen.SetOutfit(ForswornArmorMeleeOutfit)
	myUraccen.AddItem(LItemForswornWeapon1H, 1)
	myUraccen.AddItem(LItemForswornWeaponMissile, 1)
	myUraccen.AddItem(RestoreHealth02, 2)
EndIf

If myBraig.IsDead() == False
	myBraig.SetOutfit(ForswornArmorMeleeOutfit)
	myBraig.AddItem(LItemForswornWeapon1H, 1)
	myBraig.AddItem(LItemForswornWeaponMissile, 1)
	myBraig.AddItem(RestoreHealth02, 2)
EndIf

;Run out
Alias_Kaie.GetActorRef().EvaluatePackage()
myOdvan.EvaluatePackage()
myDuach.EvaluatePackage()
myBorkul.EvaluatePackage()
myUraccen.EvaluatePackage()
myBraig.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Scene between Thonar and Madanach
MS02EscapeThonarScene.Start()

;Thonar is no longer Essential
Alias_Thonar.GetActorRef().GetActorBase().SetEssential(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Madanach runs out, open up the door
Alias_Madanach.GetActorRef().EvaluatePackage()
Alias_RuinsDoor.GetRef().Lock(False)

;Clear player's crime gold
CrimeFactionReach.SetCrimeGold(0)
CrimeFactionReach.SetCrimeGoldViolent(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Madanach gets his equipment

Actor myMadanach = Alias_Madanach.GetActorRef()

myMadanach.SetOutFit(ForswornArmorBossMeleeOutfit)
myMadanach.AddItem(LItemForswornBossWarAxe, 1)
myMadanach.AddItem(RestoreHealth02, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Player enters the tunnel

;Enable Kaie and move Thonar and his men into position
Alias_Kaie.GetActorRef().Enable()
Alias_Thonar.GetActorRef().MoveTo(Alias_ThonarMarker.GetRef())
Alias_Guard01.GetActorRef().MoveTo(Alias_Guard01Marker.GetRef())
Alias_Guard02.GetActorRef().MoveTo(Alias_Guard02Marker.GetRef())
Alias_Guard03.GetActorRef().MoveTo(Alias_Guard03Marker.GetRef())

;Madanach and the Forsworn take Half damage
;Alias_Madanach.GetActorRef().AddPerk(MS02ReduceDamage)
;Alias_Borkul.GetActorRef().AddPerk(MS02ReduceDamage)
;Alias_Kaie.GetActorRef().AddPerk(MS02ReduceDamage)
;Alias_Uraccen.GetActorRef().AddPerk(MS02ReduceDamage)
;Alias_Braig.GetActorRef().AddPerk(MS02ReduceDamage)
;Alias_Duach.GetActorRef().AddPerk(MS02ReduceDamage)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorBase Property Madanach  Auto  

Weapon Property pForswornWeapon  Auto  

Armor Property pForswornArmor  Auto  

Quest Property pMS02  Auto  

GlobalVariable Property pGameHour  Auto  

Faction Property pForswornFaction  Auto  

ObjectReference Property pMadanachMarker  Auto  

ObjectReference Property pPlayerMarker  Auto  

Scene Property pSmelterScene  Auto  

Scene Property pTreasuryScene  Auto  

Scene Property pNeposScene  Auto  

Weapon Property pMadanachShiv  Auto  

Scene Property MS02KaieScene  Auto  

Outfit Property ForswornArmorBossMeleeOutfit  Auto  

LeveledItem Property LItemForswornBossWarAxe  Auto  

LeveledItem Property LItemForswornWeapon1H  Auto  

LeveledItem Property LItemForswornBow  Auto  

LeveledItem Property LItemForswornWeaponMissile  Auto  

Outfit Property ForswornArmorMeleeOutfit  Auto  

Scene Property MS02EscapeThonarScene  Auto  

Faction Property CrimeFactionReach  Auto  

Armor Property MS02ForswornArmor  Auto  

Armor Property MS02ForswornGauntlets  Auto  

Armor Property MS02ForswornHelmet  Auto  

Armor Property MS02ForswornBoots  Auto  

Perk Property MS02ReduceDamage  Auto  

Potion Property RestoreHealth02  Auto  

ObjectReference Property MS02MadanachFailsafeMoveMarker  Auto  
