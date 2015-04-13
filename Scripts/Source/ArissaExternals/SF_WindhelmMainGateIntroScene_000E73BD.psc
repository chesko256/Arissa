;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_WindhelmMainGateIntroScene_000E73BD Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(GetOwningQuest() as DialogueWindhelmScript).WindhelmMainIntroDone = 1

Malthyr.GetActorRef().EvaluatePackage()
Brunwulf.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Malthyr  Auto  

ReferenceAlias Property StandsInShallows  Auto  

ReferenceAlias Property Brunwulf  Auto  
