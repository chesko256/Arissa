;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_DB09FirstPotageScene_00064360 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
pDB09Script Script = DB09 as pDB09Script
Script.pGiannaServe = 3
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
pDB09Script Script = DB09 as pDB09Script
;Script.pGiannaServe = 3

if Script.pPotagePoisoned == 0
       ; EmperorDecoyAlias.GetActorReference().PlayAnimation(IdleEatSoup)
         EmperorDecoyAlias.GetActorReference().PlayIdle(IdleEatSoup)
        pPotageEatScene.Start()
endif

if Script.pPotagePoisoned == 1
       ;EmperorDecoyAlias.GetActorReference().PlayAnimation(IdleEatSoup)
       EmperorDecoyAlias.GetActorReference().PlayIdle(IdleEatSoup)
      pPotageEatPoisonScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DB09  Auto  

Scene Property pPotageEatScene  Auto  

Scene Property pPotageEatPoisonScene  Auto  

ReferenceAlias Property EmperorDecoyAlias  Auto  

Idle Property IdleEatSoup  Auto  
