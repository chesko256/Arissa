;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname SF_MQ105SprintTrialScene_0002F7B7 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; disable/enable sprint trigger to force "entry" event
SprintTrialTrigger.Disable()
SprintTrialTrigger.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; disable trigger
SprintTrialSuccessTrigger.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; close gate
; debug.trace(self + " closing sprint trial gate")
SprintTrialGate.SetOpen(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; reset Shout timer
Game.GetPlayer().SetVoiceRecoveryTime( 0 )
; open gate & enable success trigger
(GetOwningQuest() as MQ105QuestScript).OpenSprintTrialGate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; reset Shout timer
Game.GetPlayer().SetVoiceRecoveryTime( 0 )
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
if GetOwningQuest().GetStageDone(140)
	; open the gate!
	SprintTrialGate.SetOpen(true)
else
	GetOwningQuest().RegisterForSingleUpdate(2)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property SprintTrialGate  Auto  

ObjectReference Property SprintTrialSuccessTrigger  Auto  

ObjectReference Property SprintTrialTrigger  Auto  
{the trigger that says when the player is ready to sprint}
