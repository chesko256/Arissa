;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname _Arissa_Frag_MQ01_GoToJailScene Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;If the player kills the guard before Arissa makes it to jail...
if Alias_Guard2.GetActorReference().IsDead()
   if GetOwningQuest().IsObjectiveDisplayed(101)
      GetOwningQuest().SetObjectiveCompleted(101)
      GetOwningQuest().SetObjectiveDisplayed(100)
   endif
   GetOwningQuest().SetStage(100)
   (GetOwningQuest() as _Arissa_MQ01_Data).JailBroken = true
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_2 in script _Arissa_Frag_MQ01_GoToJailScene
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
if CellDoor.GetOpenState() == 1 || CellDoor.GetOpenState() == 2
   CellDoor.Activate(Alias_Guard2.GetActorReference())
endif
utility.wait(1)
CellDoor.Lock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
CellDoor.Activate(Alias_Guard2.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
CellDoor.Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
Alias_Arissa.GetActorReference().SetCrimeFaction(CrimeFactionFalkreath)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property CellDoor  Auto  

ReferenceAlias Property Alias_Guard2  Auto  

Faction Property CrimeFactionFalkreath  Auto  

ReferenceAlias Property Alias_Arissa  Auto  
