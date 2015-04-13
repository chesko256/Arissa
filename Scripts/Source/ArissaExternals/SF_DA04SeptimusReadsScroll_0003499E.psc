;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_DA04SeptimusReadsScroll_0003499E Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
ElderScroll.GetRef().MoveTo(ElderScrollSpot)
(GetOwningQuest() as DA04QuestScript).SeptimusReadScroll = True
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ElderScroll auto

ObjectReference Property ElderScrollSpot  Auto  
