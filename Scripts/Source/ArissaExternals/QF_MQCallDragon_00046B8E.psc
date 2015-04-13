;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_MQCallDragon_00046B8E Extends Quest Hidden

;BEGIN ALIAS PROPERTY Dragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SummonLocation2
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SummonLocation2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY summonMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_summonMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SummonLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SummonLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SummonMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SummonMarker2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE MQCallDragonScript
Quest __temp = self as Quest
MQCallDragonScript kmyQuest = __temp as MQCallDragonScript
;END AUTOCAST
;BEGIN CODE
; call Odahviing, but only if he's not loaded
; debug.trace(self + " call Odahviing as ally")
actor dragon = Alias_Dragon.GetActorRef()
objectReference marker1 = Alias_SummonMarker.GetRef()
objectReference marker2 = Alias_SummonMarker2.GetRef()
kmyQuest.CallDragon(dragon, marker1, marker2)
dragon.SetPlayerTeammate(true, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; debug.trace(self + " stage 10 start")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; signals Odahviing to fly away
; debug.trace(self + " stage 100")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MQCallDragonScript
Quest __temp = self as Quest
MQCallDragonScript kmyQuest = __temp as MQCallDragonScript
;END AUTOCAST
;BEGIN CODE
; player has to be in Dragonsreach for this to work
; debug.trace(self + " call Odahviing if in Dragonsreach")
if !(MQ301 as MQ301Script).CallOdahviingToDragonsreach()
	; player hasn't yet called Odahviing to Dragonsreach, so call him for a flyby
; 	debug.trace(self + "  -- call for flyby")
	actor dragon = Alias_Dragon.GetActorRef()
	objectReference marker1 = Alias_SummonMarker.GetRef()
	objectReference marker2 = Alias_SummonMarker2.GetRef()
	kmyQuest.CallDragon(dragon, marker1, marker2)
else
; 	debug.trace(self + "  -- in Dragonsreach, MQ301 takes over")
	; end quest - MQ301 doesn't need it
	setStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; debug.trace(self + " stage 200")
Alias_Dragon.GetActorRef().SetPlayerTeammate(false)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; Odahviing is near player
; wait, then set the "go away" stage
utility.Wait(60)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ301  Auto  
