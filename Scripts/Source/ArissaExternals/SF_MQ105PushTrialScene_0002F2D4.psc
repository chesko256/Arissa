;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 30
Scriptname SF_MQ105PushTrialScene_0002F2D4 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
; begin shout tutorial when player equips unrelenting force
GetOwningQuest().SetStage(82)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_5 in script SF_MQ105PushTrialScene_0002F2D4
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; what state are vars?
MQ105QuestScript myQuest = GetOwningQuest() as MQ105QuestScript
; debug.trace("MQ105PushTrialScene: pushTrialWaiting=" + myQuest.pushTrialWaiting + ", pushTrialWeakHit=" + myQuest.pushTrialWeakHit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; what state are vars?
MQ105QuestScript myQuest = GetOwningQuest() as MQ105QuestScript
; debug.trace("MQ105PushTrialScene: pushTrialWaiting=" + myQuest.pushTrialWaiting + ", pushTrialWeakHit=" + myQuest.pushTrialWeakHit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_3 in script SF_MQ105PushTrialScene_0002F2D4
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; what state are vars?
MQ105QuestScript myQuest = GetOwningQuest() as MQ105QuestScript
; debug.trace("MQ105PushTrialScene: pushTrialWaiting=" + myQuest.pushTrialWaiting + ", pushTrialWeakHit=" + myQuest.pushTrialWeakHit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
(GetOwningQuest() as MQ105QuestScript).StartNewTarget()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; count how many times the player has waited
MQ105QuestScript myQuest = GetOwningQuest() as MQ105QuestScript
myQuest.sceneCount = myQuest.sceneCount + 1
; TEMP
GetOwningQuest().RegisterForSingleUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
(GetOwningQuest() as MQ105QuestScript).StartNewTarget()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
(GetOwningQuest() as MQ105QuestScript).StartNewTarget()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Shout Property UnrelentingForceShout  Auto  
