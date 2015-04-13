;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_HonorhallChildrenCheerScen_000214D9 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Set DB01.ChildrenCheer to 0
DB01QuestScript DB01Script = pDB01 as DB01QuestScript
DB01Script.ChildrenCheer = 0
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB01  Auto  
