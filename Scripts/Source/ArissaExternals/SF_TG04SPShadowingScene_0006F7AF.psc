;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname SF_TG04SPShadowingScene_0006F7AF Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
if pTG04SceneEndNormal.Value == 1
pTG04Quest.Setstage(45)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
pTG04SceneEndNormal.Value = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTG04Quest  Auto  

ActorBase Property pGulumEi  Auto  

GlobalVariable Property pTG04SceneEndNormal  Auto  
