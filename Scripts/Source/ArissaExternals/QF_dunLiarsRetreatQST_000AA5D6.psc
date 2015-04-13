;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_dunLiarsRetreatQST_000AA5D6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ExitSpider01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ExitSpider01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExitBandit02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ExitBandit02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossFalmer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BossFalmer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExitSpiderTrigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ExitSpiderTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LiarsRetreatLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_LiarsRetreatLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RoomBandit
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_RoomBandit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LockedDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LockedDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExitBandit03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ExitBandit03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExitBandit01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ExitBandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PeekthroughLockedDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PeekthroughLockedDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PeekthroughBandit02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PeekthroughBandit02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PeekthroughFalmer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PeekthroughFalmer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExitSpider02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ExitSpider02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PeekthroughBandit01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PeekthroughBandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RahdLonghammer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_RahdLonghammer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExitBanditTrigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ExitBanditTrigger Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Has reached end area
alias_ExitSpider01.getReference().enable()
alias_ExitSpider02.getReference().enable()
alias_ExitSpiderTrigger.getReference().enable()
alias_ExitBanditTrigger.getReference().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Peekthrough bandits unlock the door as the player approaches
PeekthroughUnlockScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;ShutdownStage
dunLiarsRetreatLocation.clear()
dunLiarsRetreatBoss.clear()
dunLiarsRetreatQuestClearedMarker.disable()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;exit bandits
alias_exitBandit01.getReference().enable()
alias_exitBandit02.getReference().enable()
alias_exitBandit03.getReference().enable()
utility.wait(0.1)
ExitBanditsScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;last scene has ended time to shut down
setStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Locked Bandit Door opened
LockedRoomScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Peekthrough bandits are escaping
alias_PeekthroughLockedDoor.getReference().lock(false)
utility.wait(0.1)
alias_PeekthroughLockedDoor.getReference().activate(alias_PeekthroughLockedDoor.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Peekthrough scene
PeekthroughScene.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

scene Property PeekthroughScene  Auto  

scene Property PeekthroughUnlockScene  Auto  

scene Property LockedRoomScene  Auto  

scene Property ExitBanditsScene  Auto  

LocationAlias Property dunLiarsRetreatLocation  Auto  

ReferenceAlias Property dunLiarsRetreatBoss  Auto  

ObjectReference Property dunLiarsRetreatQuestClearedMarker  Auto  
