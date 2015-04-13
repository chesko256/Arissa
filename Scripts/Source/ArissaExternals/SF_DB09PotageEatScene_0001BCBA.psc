;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_DB09PotageEatScene_0001BCBA Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Noble1Alias.GetActorReference().PlayAnimation(IdleEatSoup)
;Noble2Alias.GetActorReference().PlayAnimation(IdleEatSoup)
;Noble3Alias.GetActorReference().PlayAnimation(IdleEatSoup)
Noble1Alias.GetActorReference().PlayIdle(IdleEatSoup)
Utility.Wait(1)
Noble2Alias.GetActorReference().PlayIdle(IdleEatSoup)
Utility.Wait(1)
Noble3Alias.GetActorReference().PlayIdle(IdleEatSoup)

pDB09Script Script = DB09 as pDB09Script
Script.pGiannaServe = 4
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DB09  Auto  

ReferenceAlias Property Noble1Alias  Auto  

ReferenceAlias Property Noble2Alias  Auto  

ReferenceAlias Property Noble3Alias  Auto  

Idle Property IdleEatSoup  Auto  
