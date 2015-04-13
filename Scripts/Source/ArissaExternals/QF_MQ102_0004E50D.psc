;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 131
Scriptname QF_MQ102_0004E50D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Proventus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Proventus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RiverwoodFriend
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RiverwoodFriend Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionFriend
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FactionFriend Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alduin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alduin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Balgruuf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Balgruuf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farengar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farengar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Frothar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Frothar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nelkir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nelkir Auto
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

;BEGIN FRAGMENT Fragment_93
Function Fragment_93()
;BEGIN CODE
; trigger Balgruuf to interrupt Irileth
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_117
Function Fragment_117()
;BEGIN CODE
if GetStage() < 100
	SetObjectiveCompleted(10)
	WhiterunMapMarker.AddToMap()
else
	SetObjectiveDisplayed(10, false)
endif
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_61
Function Fragment_61()
;BEGIN CODE
; Hadvar in Riverwood, player isn't
;SetObjectiveFailed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_75
Function Fragment_75()
;BEGIN CODE
; start quest on Imperial side
; debug.trace("MQ Quickstart " + self)
MQ102A.setstage(1)
MQ102A.setStage(10)
MQ102A.setstage(80)
MQ102A.setstage(100)
MQ102B.setStage(5)
setstage (10)
; debug.trace("MQ Quickstart DONE " + self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_90
Function Fragment_90()
;BEGIN CODE
; player approaches Balgruuf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_73
Function Fragment_73()
;BEGIN CODE
; debug.trace("MQ102 - stage 0")
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_78
Function Fragment_78()
;BEGIN CODE
; start quest on Stormcloak side
; debug.trace("MQ Quickstart 2 " + self)
MQ102B.setstage(1)
MQ102B.setstage(80)
MQ102B.setstage(100)
MQ102A.setStage(5)
setstage (10)
; debug.trace("MQ Quickstart 2 DONE " + self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_87
Function Fragment_87()
;BEGIN CODE
; ready for MQ102B dialogue
MQ102B.SetStage(10)

;WJS -- Moving the last item in this stage to its own stage 14. Make sure Alias is filled before moving friend
SetStage(14)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_88
Function Fragment_88()
;BEGIN CODE
; player enters Dragonsreach - start scene
DragonsreachScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_86
Function Fragment_86()
;BEGIN CODE
; ready for MQ102A dialogue
MQ102A.SetStage(10)

;WJS -- Moving the last item in this stage to its own stage 14. Make sure Alias is filled before moving friend
SetStage(14)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_107
Function Fragment_107()
;BEGIN CODE
; stop quest - when guards reach Riverwood?
; make sure Alduin gets disabled
setstage(50)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_114
Function Fragment_114()
;BEGIN CODE
; player has talked to Irileth - Balgruuf forcegreet
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_81
Function Fragment_81()
;BEGIN CODE
; Imperial race perk
PerksQuest.SetStage(20)
; turn off WI change location stuff in Riverwood
WIFunctions.DisallowComplexInteractions(RiverwoodLocation)
; start "startup" quests
MQ00.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_91
Function Fragment_91()
;BEGIN CODE
; player told Irileth about Riverwood
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_126
Function Fragment_126()
;BEGIN CODE
; Alduin finishes escape patrol
; debug.trace(self + " stage 17: Alduin finishes escape patrol")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_99
Function Fragment_99()
;BEGIN CODE
; complete MQ102B
MQ102B.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_123
Function Fragment_123()
;BEGIN CODE
; get rid of Riverwood objective and dialogue (treat like player already got that objective)
; first, hide objective, then complete it (so player doesn't see completion)
MQ102B.SetStage(55)
;SetStage(30)
; TRY THIS INSTEAD
MQ102B.setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_130
Function Fragment_130()
;BEGIN CODE
; player exits chargen dungeon
SkyrimCloudy.ForceActive()
; move Alduin to chargen exit
Alias_Alduin.GetRef().Moveto(AlduinStartMarker)
Alias_Alduin.GetActorRef().SetActorValue("Aggression", 0)
Alias_Alduin.GetRef().Enable()
; if player doesn't yet have Riverwood objective, make sure friend forcegreets
if GetStageDone(10) == 0
	if Alias_FactionFriend.GetRef().IsInInterior()
		if Alias_FactionFriend.GetRef().Is3DLoaded() == 0
; 			debug.trace(self + " move friend to exterior")
			Alias_FactionFriend.TryToMoveTo(ChargenExitMarker)
		endif
	endif
	Alias_FactionFriend.GetActorRef().EvaluatePackage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
; travel to Riverwood with friend
; make sure
setstage(10)
;SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
; not if we've already failed!
;SetObjectiveCompleted(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_83
Function Fragment_83()
;BEGIN CODE
; main Riverwood objective
MQ101.SetStage(900)
SetObjectiveDisplayed(10)
RiverwoodMapMarker.AddToMap()
; in case of failsafe forcegreet
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_63
Function Fragment_63()
;BEGIN CODE
;SetObjectiveFailed(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_103
Function Fragment_103()
;BEGIN CODE
; player told Irileth about Helgen
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_98
Function Fragment_98()
;BEGIN CODE
; complete MQ102A
MQ102A.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
; end MQ102, transition to MQ103
SetObjectiveCompleted(30)
; transition to MQ103
MQ103.SetStage(10)
; reward player
Alias_Balgruuf.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
; what's highest skill?
actor player = Game.GetPlayer()
if player.GetActorValue("LightArmor") > player.GetActorValue("HeavyArmor") 
	player.AddItem(JarlRewardLightArmor)
else
	player.AddItem(JarlRewardHeavyArmor)
endif
DragonsreachScene2.Stop()
MQ103.SetActive()
; finish quest
setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_119
Function Fragment_119()
;BEGIN CODE
; get rid of Riverwood objective and dialogue (treat like player already got that objective)
; first, hide objective, then complete it (so player doesn't see completion)
MQ102A.SetStage(55)
;SetStage(30)
; TRY THIS INSTEAD
MQ102A.setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_115
Function Fragment_115()
;BEGIN CODE
; Balgruuf ready to talk about Farengar
; send Irileth to guards
MQ103.SetStage(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_124
Function Fragment_124()
;BEGIN CODE
; make sure Riverwood dialogue is correct
MQ102B.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN CODE
;SetObjectiveCompleted(20)
;SetObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_125
Function Fragment_125()
;BEGIN CODE
; make sure Riverwood dialogue is correct
MQ102A.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
;SetObjectiveFailed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_120
Function Fragment_120()
;BEGIN CODE
; get rid of Riverwood objective and dialogue (treat like player already got that objective)
; first, hide objective, then complete it (so player doesn't see completion)
MQ102B.SetStage(55)
;SetStage(30)
; TRY THIS INSTEAD
MQ102B.setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_102
Function Fragment_102()
;BEGIN CODE
; fail Riverwood objective
if IsObjectiveCompleted(10) == 0
	SetObjectiveFailed(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_128
Function Fragment_128()
;BEGIN CODE
; end MQ101
MQ101.SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_122
Function Fragment_122()
;BEGIN CODE
; get rid of Riverwood objective and dialogue (treat like player already got that objective)
; first, hide objective, then complete it (so player doesn't see completion)
MQ102A.SetStage(55)
;SetStage(30)
; TRY THIS INSTEAD
MQ102A.setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_95
Function Fragment_95()
;BEGIN CODE
; player has talked to Balgruuf
DragonsreachScene2.Start()
DragonsreachScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
; let civil war start to run in the background
CW.SetStage(0)
; disable Alduin
Alias_Alduin.TryToDisable()
; turn on WI change location stuff in Riverwood
WIFunctions.AllowComplexInteractions(RiverwoodLocation)
; turn off Hilde intro scene - failsafe
DialogueRiverwoodIntroScene.SetStage(20)
; turn on Falkreath Stormcloak camp
CWGarrisonEnableMarkerSonsCampFalkreath.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Quest Property CW  Auto  

ObjectReference Property RiverwoodMapMarker  Auto  

ObjectReference Property WhiterunMapMarker  Auto  

Quest Property PerksQuest  Auto  

ObjectReference Property AlduinStartMarker  Auto  

Location Property RiverwoodLocation  Auto  

WIFunctionsScript Property WIFunctions  Auto  

Quest Property MQ102A  Auto  

Quest Property MQ102B  Auto  

Quest Property MQ103  Auto  

ObjectReference Property ChargenExitMarker  Auto  

Cell Property HelgenKeep  Auto  

Scene Property DragonsreachScene  Auto  

Scene Property DragonsreachScene2  Auto  

ObjectReference Property RiverwoodGuardsEnableMarker  Auto  

ObjectReference Property RiverwoodGuardCampEnableMarker  Auto  

Weather Property SkyrimCloudy  Auto  

Quest Property MQ101  Auto  

LeveledItem Property JarlRewardLightArmor  Auto  

LeveledItem Property JarlRewardHeavyArmor  Auto  

Quest Property DialogueRiverwoodIntroScene  Auto  

ObjectReference Property CWGarrisonEnableMarkerSonsCampFalkreath  Auto  

Quest Property MQ00  Auto  
