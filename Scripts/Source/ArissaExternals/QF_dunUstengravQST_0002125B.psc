;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname QF_dunUstengravQST_0002125B Extends Quest Hidden

;BEGIN ALIAS PROPERTY EntranceWarlockNecromancer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EntranceWarlockNecromancer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EntranceDraugr04
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EntranceDraugr04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EntranceWarlockConjurer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EntranceWarlockConjurer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EntranceCursedBandit03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EntranceCursedBandit03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EntranceCursedBandit04
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EntranceCursedBandit04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EntranceCursedBandit01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EntranceCursedBandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SprintGate02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SprintGate02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EntranceDraugr01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EntranceDraugr01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExteriorCursedBandit01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ExteriorCursedBandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SprintGate01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SprintGate01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EntranceCursedBandit02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EntranceCursedBandit02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExteriorCursedBandit02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ExteriorCursedBandit02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnableDungeonMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EnableDungeonMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SprintCollision02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SprintCollision02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EntranceDraugr02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EntranceDraugr02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EntranceDraugr03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EntranceDraugr03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EntranceDraugr05
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EntranceDraugr05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SprintGate03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SprintGate03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SprintLever01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SprintLever01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SprintLever02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SprintLever02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SprintCollision01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SprintCollision01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Set by trigger after the player passes the Whirlwind Sprint puzzle gates.

(Alias_SprintGate01.GetReference() as dunUstenPuzGateSCRIPT).OpenGate()
(Alias_SprintGate02.GetReference() as dunUstenPuzGateSCRIPT).OpenGate()
(Alias_SprintGate03.GetReference() as dunUstenPuzGateSCRIPT).OpenGate()
Alias_SprintLever01.GetReference().BlockActivation()
Alias_SprintLever02.GetReference().BlockActivation()
Alias_SprintCollision01.GetReference().Disable()
Alias_SprintCollision02.GetReference().Disable()
utility.wait(1)
(Alias_SprintGate01.GetReference() as dunUstenPuzGateSCRIPT).OpenGate()
(Alias_SprintGate02.GetReference() as dunUstenPuzGateSCRIPT).OpenGate()
(Alias_SprintGate03.GetReference() as dunUstenPuzGateSCRIPT).OpenGate()
utility.wait(1)
(Alias_SprintGate01.GetReference() as dunUstenPuzGateSCRIPT).OpenGate()
(Alias_SprintGate02.GetReference() as dunUstenPuzGateSCRIPT).OpenGate()
(Alias_SprintGate03.GetReference() as dunUstenPuzGateSCRIPT).OpenGate()
utility.wait(1)
(Alias_SprintGate01.GetReference() as dunUstenPuzGateSCRIPT).OpenGate()
(Alias_SprintGate02.GetReference() as dunUstenPuzGateSCRIPT).OpenGate()
(Alias_SprintGate03.GetReference() as dunUstenPuzGateSCRIPT).OpenGate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Kill cursed bandit 2
Alias_EntranceCursedBandit02.GetActorReference().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Start Quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Player hit trigger, which starts scene
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

scene Property dunQuestScene  Auto  

objectreference Property dunBrokenOarLootEnableMarker  Auto  

objectreference Property dunBrokenOarRespawnEnableMarker  Auto  

Scene Property dunBrokenOarTalky01  Auto  
