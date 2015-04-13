;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname QF_DA10HauntingController_0002BB38 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Item02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestLightParent
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestLightParent Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY witchHunter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_witchHunter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ChairEnableMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ChairEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DoorToSlam
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DoorToSlam Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BedroomItem01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BedroomItem01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BasementItem01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BasementItem01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BasementItem05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BasementItem05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NonQuestLightParent
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NonQuestLightParent Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BasementItem02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BasementItem02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BasementItem04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BasementItem04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LogrolfsHouseLoc
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_LogrolfsHouseLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BasementItem03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BasementItem03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BasementLightParent
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BasementLightParent Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE DA10HauntingControllerScript
Quest __temp = self as Quest
DA10HauntingControllerScript kmyQuest = __temp as DA10HauntingControllerScript
;END AUTOCAST
;BEGIN CODE
;Rumble and flash lights heavy
kmyQuest.hauntingStage = 6
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE DA10HauntingControllerScript
Quest __temp = self as Quest
DA10HauntingControllerScript kmyQuest = __temp as DA10HauntingControllerScript
;END AUTOCAST
;BEGIN CODE
;Trigger Noise in back room
kmyQuest.hauntingStage = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE DA10HauntingControllerScript
Quest __temp = self as Quest
DA10HauntingControllerScript kmyQuest = __temp as DA10HauntingControllerScript
;END AUTOCAST
;BEGIN CODE
;lots of rumble and poltergeist stuff
kmyQuest.hauntingStage = 7
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE DA10HauntingControllerScript
Quest __temp = self as Quest
DA10HauntingControllerScript kmyQuest = __temp as DA10HauntingControllerScript
;END AUTOCAST
;BEGIN CODE
;slam door
kmyQuest.hauntingStage = 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE DA10HauntingControllerScript
Quest __temp = self as Quest
DA10HauntingControllerScript kmyQuest = __temp as DA10HauntingControllerScript
;END AUTOCAST
;BEGIN CODE
;flash lights
kmyQuest.hauntingStage = 5
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE DA10HauntingControllerScript
Quest __temp = self as Quest
DA10HauntingControllerScript kmyQuest = __temp as DA10HauntingControllerScript
;END AUTOCAST
;BEGIN CODE
;clear everything stop - all done in the script
kmyQuest.hauntingStage = 9
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE DA10HauntingControllerScript
Quest __temp = self as Quest
DA10HauntingControllerScript kmyQuest = __temp as DA10HauntingControllerScript
;END AUTOCAST
;BEGIN CODE
;clear everything stop - all done in the script
kmyQuest.hauntingStage = 8
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DA10HauntingControllerScript
Quest __temp = self as Quest
DA10HauntingControllerScript kmyQuest = __temp as DA10HauntingControllerScript
;END AUTOCAST
;BEGIN CODE
if  kmyQuest.hauntedSound
kmyquest.hauntedSoundID = kmyQuest.hauntedSound.play(game.getplayer())
endif
kmyQuest.startRunningHaunt()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE DA10HauntingControllerScript
Quest __temp = self as Quest
DA10HauntingControllerScript kmyQuest = __temp as DA10HauntingControllerScript
;END AUTOCAST
;BEGIN CODE
;drop lights
kmyQuest.hauntingStage = 3
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE DA10HauntingControllerScript
Quest __temp = self as Quest
DA10HauntingControllerScript kmyQuest = __temp as DA10HauntingControllerScript
;END AUTOCAST
;BEGIN CODE
;start flinging stuff in basement
kmyQuest.hauntingStage = 4
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
