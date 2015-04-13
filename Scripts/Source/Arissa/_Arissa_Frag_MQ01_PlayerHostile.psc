;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname _Arissa_Frag_MQ01_PlayerHostile Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
_Arissa_DialogueMain.Stop()
while _Arissa_DialogueMain.IsStopping()
    utility.wait(0.1)
endwhile
GetOwningQuest().CompleteAllObjectives()
_ArissaFaction.SetEnemy(PlayerFaction)
GetOwningQuest().SetObjectiveDisplayed(60)
GetOwningQuest().SetStage(120)
akSpeaker.IgnoreFriendlyHits(false)
akSpeaker.EvaluatePackage()
akSpeaker.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PlayerFaction  Auto  

Faction Property _ArissaFaction  Auto  

Quest Property _Arissa_DialogueMain  Auto  
