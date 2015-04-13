;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 31
Scriptname QF_dunMossMotherQST_000376EE Extends Quest Hidden

;BEGIN ALIAS PROPERTY Spriggan02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Spriggan02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bear01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bear01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spriggan01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Spriggan01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Valga
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Valga Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Narri
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Narri Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Valdr
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Valdr Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spriggan03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Spriggan03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GraveEnableMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_GraveEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
(Alias_Valdr as dunSetRestrainedWhenSeated).SetRestrained(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Player heals Valdr.
dunMossWoundedScene.Stop()
Alias_Valdr.GetActorReference().EvaluatePackage()
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Valdr dies.
SetObjectiveFailed(5)
SetObjectiveFailed(10)
SetObjectiveFailed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;Tracking stage-- does the player know who Valdr is?
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;Final line from the Steward plays.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;Valdr heads into the cavern to bury their bodies.
(Alias_Valdr as dunSetRestrainedWhenSeated).SetRestrained(False)
SetObjectiveCompleted(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Player asks Valdr to explore Moss Mother Cavern with him.
SetObjectiveDisplayed(30)
(Alias_Valdr as dunSetRestrainedWhenSeated).SetRestrained(False)
Alias_Valdr.GetActorReference().GetActorBase().SetProtected(True)
Alias_Valdr.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Player hasn't yet healed Valdr.
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
dunMossWoundedScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Valdr finishes burying the bodies and returns to Falkreath.
Alias_Valdr.GetActorReference().EvaluatePackage()
Alias_Valdr.GetActorReference().MoveToPackageLocation()
Alias_GraveEnableMarker.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Interim stage-- player hasn't decided what to do next.
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;Cavern has been cleared of Spriggans. So...
if (GetStageDone(15))
   ;Handle edge case: What if the player healed Valdr, but didn't speak to him afterwards?
   if (!GetStageDone(40))
      SetStage(30)
   EndIf
   SetObjectiveCompleted(30)
   ;If Valdr is back by the entrance, trigger an objective to report.
   if (GetStageDone(30))
      SetObjectiveDisplayed(50)
   EndIf
   ;Trigger a forcegreet at the appropriate time.
   Alias_Valdr.GetActorReference().EvaluatePackage()
Else
   ;If player didn't heal Valdr, kill him to avoid edge cases.
   Alias_Valdr.GetActorReference().Kill(Game.GetPlayer())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;Player tells Valdr to wait for him.
SetObjectiveDisplayed(30)
Alias_Valdr.GetActorReference().GetActorBase().SetProtected(True)
Alias_Valdr.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Player gets an objective to look for Valdr by speaking to the innkeeper in Falkreath.
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;Player accepts the quest, then leaves without helping.
Alias_Valdr.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

scene Property dunMossWoundedScene  Auto  

scene Property dunMossAskScene  Auto  

Scene Property dunMossNoScene  Auto  

int Property MaxEnemy  Auto  

int Property MaxEnemyCount  Auto  

Scene Property dunMossHelpingScene  Auto  

Scene Property dunMossReturnScene  Auto  

bool Property PlayerHelped  Auto  Conditional

bool Property GrardDoneWithQuest  Auto  Conditional

GlobalVariable Property FullFavorReward  Auto  
GlobalVariable Property InitialFavorReward  Auto 
