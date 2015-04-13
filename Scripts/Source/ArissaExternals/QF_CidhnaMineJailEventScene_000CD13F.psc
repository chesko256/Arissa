;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_CidhnaMineJailEventScene_000CD13F Extends Quest Hidden

;BEGIN ALIAS PROPERTY CidhnaMine
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_CidhnaMine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LookMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LookMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Urzoga
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Urzoga Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SilverOre
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SilverOre Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;open door scene
CidhnaMineOpenGateScene.Start()

;tell player to mine silver
If MS02.IsRunning() == False
  DialogueCidhnaMine.SetStage(40)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;forcegreet finishes
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;switch the open state of the doors
CidhnaMineDoorB.SetOpen()
CidhnaMineDoorA.SetOpen(False)
CidhnaMineDoorA.Lock()
;enable colission to prevent spells
CidhnaMineGuardAreaCollision.Enable()
CidhnaMinePrisonAreaCollision.Disable()
;make sure urzoga isn't stuck behind any collision
Alias_Urzoga.GetActorRef().MoveTo(CidhnaMineUrzogaInitial)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;move everyone, then Urzoga forcegreets
Alias_Urzoga.GetActorRef().MoveTo(UrzogaMarker)
Alias_Urzoga.GetActorRef().EvaluatePackage()

;disable player fighting controls
Game.DisablePlayerControls(abMovement = false, abmenu = false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Close door
CidhnaMineDoorB.Lock()
CidhnaMineDoorA.SetOpen()

;enable colission to prevent spells
CidhnaMinePrisonAreaCollision.Enable()

;enable player fighting controls
Game.EnablePlayerControls()

Alias_Urzoga.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property UrzogaMarker  Auto  

ObjectReference Property GuardMarker  Auto  

Scene Property CidhnaMineOpenGateScene  Auto  

ObjectReference Property CidhnaMineDoorA  Auto  

ObjectReference Property CidhnaMineDoorB  Auto  

Quest Property DialogueCidhnaMine  Auto  

Quest Property MS02  Auto  

ObjectReference Property CidhnaMinePrisonAreaCollision  Auto  

ObjectReference Property CidhnaMineGuardAreaCollision  Auto  

ObjectReference Property CidhnaMineUrzogaInitial  Auto  
