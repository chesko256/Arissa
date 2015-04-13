;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname SF_TG07SPGuildScene02_00055AAA Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
getowningquest().setstage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
TG07SPQuestScript pTG07SPScript = getowningquest() as TG07SPQuestScript
pTG07LockAudio02.Enable()
pTG07SPScript.pTG07VaultDoor.Lock(false)
pTG07SPScript.pTG07VaultDoor.Activate(pTG07BrynjolfAlias.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
pTG07LockAudio.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

referencealias Property pTG07BrynjolfAlias  Auto  

ObjectReference Property pTG07LockAudio  Auto  

ObjectReference Property pTG07LockAudio02  Auto  
