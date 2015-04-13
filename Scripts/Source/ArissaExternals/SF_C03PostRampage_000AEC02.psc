;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_C03PostRampage_000AEC02 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Aela.GetRef().MoveTo(AelaSpot)
Game.GetPlayer().MoveTo(PlayerSpot)
; Game.GetPlayer().GetActorBase().SetInvulnerable(false)
Game.GetPlayer().SetGhost(false)
Aela.GetActorRef().StopCombatAlarm()
Game.GetPlayer().StopCombatAlarm()
C03Rampage.SetStage(100)
(GetOwningQuest() as C03QuestScript).AelaGreetPostTransform = True
HoldBlack.PopTo(FadeFromBlack)
HoldBlack.Remove()
Utility.Wait(3)
FadeFromBlack.Remove()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Aela  Auto  

ObjectReference Property AelaSpot  Auto  

ObjectReference Property PlayerSpot  Auto  

Quest Property C03Rampage  Auto  

ImageSpaceModifier Property HoldBlack  Auto  

ImageSpaceModifier Property FadeFromBlack  Auto  
