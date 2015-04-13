;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_FreeformMarkarthO_00053804 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Nimhe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nimhe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Calcelmo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Calcelmo Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player returns to Calcelmo

SetObjectiveCompleted(15, 1)
Alias_Calcelmo.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)

;Guard shouldn't stop the player from entering the museum
MarkarthWizardsQuarter01.SetPublic()
DialogueMarkarth.SetStage(120)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Nimhe is dead

SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(15, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

;If Nimhe is dead already, jump ahead
If Alias_Nimhe.GetActorRef().IsDead() == True
  SetStage(15)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DialogueMarkarth  Auto  

Cell Property MarkarthWizardsQuarter01  Auto  
