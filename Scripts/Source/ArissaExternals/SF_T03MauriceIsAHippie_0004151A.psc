;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname SF_T03MauriceIsAHippie_0004151A Extends Scene Hidden

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
(GetOwningQuest() as T03QuestScript).MauriceShouldTalkAtEnd = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Sapling.GetRef().Enable(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
if (!Maurice.GetActorRef().IsDead())
    GetOwningQuest().SetStage(55)
else
   GetOwningQuest().SetObjectiveFailed(50)
   GetOwningQuest().SetObjectiveDisplayed(40, 1, 1)
   Eldergleam.GetRef().Enable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Maurice.GetActorReference().SetPlayerTeammate(false, false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Sapling  Auto  

ReferenceAlias Property Maurice  Auto  

ReferenceAlias Property ElderGleam  Auto  
