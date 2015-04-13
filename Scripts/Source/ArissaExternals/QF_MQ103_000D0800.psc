;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 91
Scriptname QF_MQ103_000D0800 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Delphine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Delphine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dragonStone
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_dragonStone Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farengar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farengar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riverwood
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Riverwood Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RiverwoodGuard02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RiverwoodGuard02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RiverwoodGuard01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RiverwoodGuard01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nelkir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nelkir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BleakFallsLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BleakFallsLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RiverwoodGuard03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RiverwoodGuard03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BleakFallsBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BleakFallsBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Balgruuf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Balgruuf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Frothar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Frothar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Irileth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Irileth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dagny
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dagny Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hrongar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hrongar Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(10)
setObjectiveDisplayed(50)
BleakFallsMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_89
Function Fragment_89()
;BEGIN CODE
; intro scene done, Balgruuf can walk away
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_76
Function Fragment_76()
;BEGIN CODE
; trigger Irileth/guard conversation
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_69
Function Fragment_69()
;BEGIN CODE
SetObjectiveDisplayed(10)
IntroScene.Start()
; enable trigger
FarengarLabTrigger.Enable()
; clear MQ102 reservations
MQReserved.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_74
Function Fragment_74()
;BEGIN CODE
; guards back in Riverwood
; turn back on normal CW processing
(CW as CWScript).AddGarrisonBackToWar(Alias_Riverwood.GetLocation())
; failsafe
IrilethScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_70
Function Fragment_70()
;BEGIN CODE
; Jarl introduces you to Farengar, or you persuade him that you aren't a moron
; he's now willing to talk to you about the book
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; player speaks to Farengar
setstage(185)
IntroScene.Stop()  ; in case player has dragonstone when he arrives
OutroScene.Stop()
Game.GetPlayer().removeitem(Alias_Dragonstone.GetReference(), 1)
SetObjectiveCompleted (80)
; add achievement
Game.AddAchievement(2)
; start transition scene
MQ104.setstage(10)
MQ104.SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; start quest on Imperial side
; debug.trace("MQ Quickstart " + self)
MQ102.setstage(1)
MQ102.setstage(50)
MQ102.setstage(80)
MQ102.setstage(100)
MQ102.setstage(110)
MQ102.setstage(150)
MQ102.setstage(160)
; debug.trace("MQ Quickstart " + self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_80
Function Fragment_80()
;BEGIN CODE
; start Irileth scene
; reenable Riverwood guards
RiverwoodGuardsEnableMarker.Enable()
; move them into position in Whiterun
Alias_RiverwoodGuard01.TryToMoveTo(RiverwoodGuardMarker)
Alias_RiverwoodGuard02.TryToMoveTo(RiverwoodGuardMarker)
Alias_RiverwoodGuard03.TryToMoveTo(RiverwoodGuardMarker)

IrilethScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_87
Function Fragment_87()
;BEGIN CODE
; set up Delphine scene if player gets tablet in Bleak Falls after starting MQ103
; move Delphine to Dragonsreach
Alias_Delphine.TryToMoveTo(DelphineMoveMarker)
Alias_Delphine.GetActorRef().SetOutfit(DelphineSpyOutfit)
; enable Farengar's book
FarengarBook.Enable()
; enable outro trigger
OutroTrigger.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_88
Function Fragment_88()
;BEGIN CODE
; if player has Dragonstone already, kill the intro scene so Balgruuf can start walking to MQ104 position
IntroScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_68
Function Fragment_68()
;BEGIN CODE
; quest starts running so book is in Bleak Falls from game start
; disable Riverwood guards & camp
RiverwoodGuardsEnableMarker.Disable()
RiverwoodGuardCampEnableMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
; debug.trace(self + " stage 200 - stopping quest")
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_78
Function Fragment_78()
;BEGIN CODE
; everyone's in Farengar's room
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; player has gotten the book
SetObjectiveCompleted(50) ; completed - retrieve the book
SetObjectiveDisplayed(80); DISPLAYED Give the book to Farengar
UnregisterForUpdate()
; disable Irileth
Alias_Irileth.GetActorRef().Disable()
; failsafe, for quickstart
IntroScene.Stop()
IrilethScene.Stop()
; open the 1st dragon mound
dunDragonMoundQST.SetStage(10)
; disable Riverwood intro trigger, bane of my existence
SleepingGiantIntroTrigger.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_72
Function Fragment_72()
;BEGIN AUTOCAST TYPE MQ103NewScript
Quest __temp = self as Quest
MQ103NewScript kmyQuest = __temp as MQ103NewScript
;END AUTOCAST
;BEGIN CODE
; Farengar mentions Dragon War
kmyQuest.MQ00.DragonWarFlag = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_77
Function Fragment_77()
;BEGIN CODE
; guards leave for Riverwood
; enable their camp
RiverwoodGuardCampEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_83
Function Fragment_83()
;BEGIN CODE
; Delphine scene ends, Delphine can leave
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_81
Function Fragment_81()
;BEGIN CODE
; player approaches Farengar & Delphine
OutroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CW  Auto  

Quest Property MQ102  Auto  

Scene Property IntroScene  Auto  

ObjectReference Property RiverwoodGuardsEnableMarker  Auto  

ObjectReference Property RiverwoodGuardCampEnableMarker  Auto  


Scene Property IrilethScene  Auto  

ObjectReference Property DelphineMoveMarker  Auto  

Outfit Property DelphineSpyOutfit  Auto  

Quest Property MQ104  Auto  

ObjectReference Property OutroTrigger  Auto  

Scene Property OutroScene  Auto  

ObjectReference Property FarengarLabTrigger  Auto  

ObjectReference Property BleakFallsMapMarker  Auto  

ObjectReference Property FarengarBook  Auto  

Quest Property dunDragonMoundQST  Auto  

ObjectReference Property SleepingGiantIntroTrigger  Auto  

ObjectReference Property RiverwoodGuardMarker  Auto  

Quest Property MQReserved  Auto  
