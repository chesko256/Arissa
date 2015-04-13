;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_dunDragonMoundQST_000FDBA2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DragonMoundReach03Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundReach03Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundSnowy01Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundSnowy01Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundVolcanicTundra02Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundVolcanicTundra02Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundPineForest02Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundPineForest02Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundTundra01Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundTundra01Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundTundra04Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundTundra04Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundTundraMarsh02Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundTundraMarsh02Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundTundraMarsh01Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundTundraMarsh01Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundFallForest03Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundFallForest03Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundReach01Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundReach01Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundPineForest01Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundPineForest01Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundReach02Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundReach02Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundTundra02Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundTundra02Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundTundra03Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundTundra03Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundTundraMarsh03Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundTundraMarsh03Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundVolcanicTundra01Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundVolcanicTundra01Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundSnowy02Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundSnowy02Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundPineForest03Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundPineForest03Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundFallForest02Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundFallForest02Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundFallForest01Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundFallForest01Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonMoundVolcanicTundra03Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonMoundVolcanicTundra03Marker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Batch #3 -- MQ205 Stage 10
Alias_DragonMoundSnowy01Marker.GetReference().Enable()
Alias_DragonMoundTundra02Marker.GetReference().Enable()
Alias_DragonMoundReach01Marker.GetReference().Enable()
Alias_DragonMoundReach03Marker.GetReference().Enable()
Alias_DragonMoundTundraMarsh03Marker.GetReference().Enable()

;Start Alduin Resurrect Scene 3 at DragonMoundSnowy02
MQResurrectDragon.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;MQ105 Stage 70
Alias_DragonMoundVolcanicTundra03Marker.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Batch #2 -- MQ203 Stage 60
Alias_DragonMoundTundra04Marker.GetReference().Enable()
Alias_DragonMoundReach02Marker.GetReference().Enable()
Alias_DragonMoundPineForest01Marker.GetReference().Enable()
Alias_DragonMoundPineForest02Marker.GetReference().Enable()
Alias_DragonMoundPineForest03Marker.GetReference().Enable()

;Start Alduin Resurrect Scene 2 at DragonMoundTundra03
MQResurrectDragon.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;MQ104 Stage 12
Alias_DragonMoundVolcanicTundra01Marker.GetReference().Enable()
Alias_DragonMoundVolcanicTundra02Marker.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;MQ103 Stage 180
Alias_DragonMoundFallForest02Marker.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;MQ206 Stage 200

;Failsafe for cheats.
SetStage(10)
SetStage(20)
SetStage(30)
SetStage(40)
SetStage(50)
SetStage(60)

;Disable Alduin Resurrection Scenes, close down MQResurrectDragon
MQResurrectDragon.SetStage(40)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Batch #1 -- MQ201 Stage 40
Alias_DragonMoundTundraMarsh01Marker.GetReference().Enable()
Alias_DragonMoundTundraMarsh02Marker.GetReference().Enable()
Alias_DragonMoundFallForest01Marker.GetReference().Enable()
Alias_DragonMoundFallForest03Marker.GetReference().Enable()

;Start Alduin Resurrect Scene 1 at DragonMoundTundra01
MQResurrectDragon.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQResurrectDragon  Auto  
