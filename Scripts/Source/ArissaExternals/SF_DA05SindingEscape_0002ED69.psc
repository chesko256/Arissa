;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname SF_DA05SindingEscape_0002ED69 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
if ((GetOwningQuest() as DA05QuestScript).OriginalSinding.GetRace() != WerewolfBeastRace)
; 	Debug.Trace("DA05: Setting Sinding's race when spell casting failed.")
	(GetOwningQuest() as DA05QuestScript).OriginalSinding.SetRace(WerewolfBeastRace)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
if (!GetOwningQuest().GetStageDone(20))
    GetOwningQuest().SetStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
getowningquest().setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(GetOwningQuest() as DA05QuestScript).OriginalSinding = Sinding.GetActorRef()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
WerewolfChange.Cast(Sinding.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Sinding  Auto  

Spell Property WerewolfChange  Auto  

Actor Property OriginalSinding  Auto

Race Property WerewolfBeastRace  Auto  
