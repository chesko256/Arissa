;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00019513 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BlackDoorOpenSound.Play(pDawnstarDoor2)
Game.GetPlayer().Moveto(pDawnstarMarker)
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.DawnstarDoorPass = 2
pDawnstarDoor1.Enable()
pDawnstarDoor2.Disable()
pDB07.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pDawnstarMarker  Auto  

ObjectReference Property pDawnstarDoor1  Auto  

ObjectReference Property pDawnstarDoor2  Auto  

Quest Property DarkBrotherhoodQuest  Auto  

Quest Property pDB07  Auto  

sound Property BlackDoorOpenSound  Auto  
