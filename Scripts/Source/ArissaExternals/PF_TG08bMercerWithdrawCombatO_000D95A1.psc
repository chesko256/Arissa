;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_TG08bMercerWithdrawCombatO_000D95A1 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
AkActor.setAV("Variable07", 0)
AkActor.evaluatePackage()
myScript = (TG08BFightControllerRef as  TG08BFightController)
myScript.StartMercerWithdrawTimer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

TG08BFightController property myScript auto
objectReference property TG08BFightControllerRef auto 
