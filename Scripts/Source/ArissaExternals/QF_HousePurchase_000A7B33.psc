;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_HousePurchase_000A7B33 Extends Quest Hidden

;BEGIN ALIAS PROPERTY WhiterunSonsJarl
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WhiterunSonsJarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WhiterunJarl
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WhiterunJarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WindhelmEmpireJarl
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WindhelmEmpireJarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudeFrontDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SolitudeFrontDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RiftenJarl
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_RiftenJarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RiftenCityDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_RiftenCityDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudeSideDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SolitudeSideDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WhiterunDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WhiterunDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkarthSonsJarl
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MarkarthSonsJarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkarthJarl
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MarkarthJarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RiftenEmpireJarl
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_RiftenEmpireJarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WindhelmJarl
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WindhelmJarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudeJarl
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SolitudeJarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WindhelmDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WindhelmDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RiftenTamrielDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_RiftenTamrielDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkarthDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MarkarthDoor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE HousePurchaseScript
Quest __temp = self as Quest
HousePurchaseScript kmyQuest = __temp as HousePurchaseScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Purchasehouse(markarthhouse, markarthhousekey, markarthguide, kmyquest.HPMarkarth)
kmyquest.markarthhousevar=1
SetObjectiveDisplayed(40,1)

If Favor250.GetStageDone(10)
  Favor250.SetStage(15)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE HousePurchaseScript
Quest __temp = self as Quest
HousePurchaseScript kmyQuest = __temp as HousePurchaseScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Purchasehouse(riftenhouse, riftenhousekey, riftenguide, kmyquest.HPRiften)
kmyquest.riftenhousevar=1
SetObjectiveDisplayed(30,1)

If Favor251.GetStageDone(10)
  Favor251.SetStage(15)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE HousePurchaseScript
Quest __temp = self as Quest
HousePurchaseScript kmyQuest = __temp as HousePurchaseScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Purchasehouse(whiterunhouse, whiterunhousekey, whiterunguide, kmyquest.HPWhiterun)
kmyquest.whiterunhousevar=1
SetObjectiveDisplayed(10,1)

If Favor253.GetStageDone(10)
  Favor253.SetStage(15)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE HousePurchaseScript
Quest __temp = self as Quest
HousePurchaseScript kmyQuest = __temp as HousePurchaseScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Purchasehouse(windhelmhouse, windhelmhousekey, windhelmguide, kmyquest.HPWindhelm)
kmyquest.windhelmhousevar=1
SetObjectiveDisplayed(50,1)

If Favor254.GetStageDone(10)
  Favor254.SetStage(15)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE HousePurchaseScript
Quest __temp = self as Quest
HousePurchaseScript kmyQuest = __temp as HousePurchaseScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Purchasehouse(solitudehouse, solitudehousekey, solitudeguide, kmyquest.HPSolitude)
kmyquest.solitudehousevar=1
SetObjectiveDisplayed(20,1)

If Favor252.GetStageDone(10)
  Favor252.SetStage(15)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

cell Property WhiterunHouse  Auto  

key Property WhiterunHouseKey  Auto  

cell Property SolitudeHouse  Auto  

key Property SolitudeHouseKey  Auto  

cell Property RiftenHouse  Auto  

key Property RiftenHouseKey  Auto  

cell Property MarkarthHouse  Auto  

key Property MarkarthHouseKey  Auto  

cell Property WindhelmHouse  Auto  

key Property WindhelmHouseKey  Auto  

Quest Property Favor250  Auto  

Quest Property Favor251  Auto  

Quest Property Favor252  Auto  

Quest Property Favor254  Auto  

quest Property Favor253  Auto

Book Property WhiterunGuide  Auto  

Book Property SolitudeGuide  Auto  

Book Property RiftenGuide  Auto  

Book Property MarkarthGuide  Auto  

Book Property WindhelmGuide  Auto
