;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__0004B71F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
IntroScene.stop()
akSpeaker.setFactionRank(dunPlayerAllyFaction, 1)
InteriorScene.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property introScene  Auto  

Scene Property InteriorScene  Auto  

ActorBase Property BeemJaBaseActor  Auto  

Faction Property dunPlayerAllyFaction  Auto  
