;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_WIRemoveItem03SceneA_0001BE4E Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
pBystander1.getActorReference().StartCombat(pBystander2.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property pBystander1  Auto  
{pointer to alias Bystander1}

ReferenceAlias Property pBystander2  Auto  
{pointer to Alias Bystander2}
