;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_WIDeadBody01SceneA_00038774 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if pGuard1
   pWIDeadbody01SceneB.start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pWIDeadbody01SceneB  Auto  
{pointer to next scene}

ReferenceAlias Property pGuard1  Auto  
{pointer to Guard1 alias}
