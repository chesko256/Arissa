;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00022F34 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pDB02.SetStage (40)
pAstridAlias.GetActorReference().GetActorBase().SetEssential (true)
Game.GetPlayer().AddItem(pShackKey,1)
pAstridAlias.GetActorRef().RemoveItem(pShackKey,1)
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.BlackDoorPass = 1
Game.EnablePlayerControls()
DBMapMarker.Enable()
DBMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DarkBrotherhoodQuest  Auto  

Quest Property pDB02  Auto  

ObjectReference Property DBMapMarker  Auto  

ReferenceAlias Property pAstridAlias  Auto  

Key Property pShackKey  Auto  
