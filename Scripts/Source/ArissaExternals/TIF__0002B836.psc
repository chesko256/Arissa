;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0002B836 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BlackDoorOpenSound.Play(pSanctuaryDoor2)
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
if DBScript.DoorDoOnce == 0
     Game.GetPlayer().Moveto(pSanctuaryMarker)
     DBScript.DoorDoOnce = 1
endif
Utility.Wait(1)
pSanctuaryDoor1.Enable()
;pSanctuaryDoor1.BlockActivation()
pSanctuaryDoor2.Disable()
DBScript.BlackDoorPass = 2
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DarkBrotherhoodQuest  Auto  

ObjectReference Property pSanctuaryMarker  Auto  

ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  

sound Property BlackDoorOpenSound  Auto  
