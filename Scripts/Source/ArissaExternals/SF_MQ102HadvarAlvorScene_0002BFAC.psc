;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 41
Scriptname SF_MQ102HadvarAlvorScene_0002BFAC Extends Scene Hidden

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
MQ102QuestScript mq102 = (GetOwningQuest() as MQ102QuestScript)
MQ00QuestScript mq00 = (mq102.MQ00 as MQ00QuestScript)
mq00.DragonFlag = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
; scene done
GetOwningQuest().SetStage(52)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
RiverwoodIntroSceneQuest.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
GetOwningQuest().setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
GetOwningQuest().setstage (47)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Hadvar  Auto  

ObjectReference Property HadvarRiverwoodMarker  Auto  
{TEMP -- won't be needed when chargen is working}

Quest Property RiverwoodIntroSceneQuest  Auto  
