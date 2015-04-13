;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname _Arissa_MQ02_UnlockDoorFrag2 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
myDoor.Lock(false)
myDoor.Activate(Game.GetPlayer())
mySound.Play(myDoor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property myDoor  Auto  

Sound Property mySound  Auto  
