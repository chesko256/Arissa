;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname _Arissa_Frag_Debug_AvoidPlayerPackage Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
debug.trace("[Arissa] Started avoid package.")
;Fast Exit
;utility.wait(3)
;iNPCSystem.iNPC.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
;debug.trace("[Arissa] Ended avoid package.")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_Arissa_iNPC_Behavior Property iNPCSystem  Auto  
