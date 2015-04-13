;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_MG04MonkSceneQuest_00076F39 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Actor08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor20
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor20 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor17
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor17 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor19
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor19 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerPositionMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerPositionMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor21
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor21 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor22
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor22 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor18
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor18 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor23
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor23 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MG04MonkSceneQuestScript
Quest __temp = self as Quest
MG04MonkSceneQuestScript kmyQuest = __temp as MG04MonkSceneQuestScript
;END AUTOCAST
;BEGIN CODE
CollisionPlane.SetMotionType(4)
CollisionPlane.MoveTo(CollisionPlaneMoveMarker)
kmyQuest.FreezeAlias(Alias_Actor01)
kmyQuest.FreezeAlias(Alias_Actor02)
kmyQuest.FreezeAlias(Alias_Actor03)
kmyQuest.FreezeAlias(Alias_Actor04)
kmyQuest.FreezeAlias(Alias_Actor05)
kmyQuest.FreezeAlias(Alias_Actor06)
kmyQuest.FreezeAlias(Alias_Actor07)
kmyQuest.FreezeAlias(Alias_Actor08)
kmyQuest.FreezeAlias(Alias_Actor09)
kmyQuest.FreezeAlias(Alias_Actor10)
kmyQuest.FreezeAlias(Alias_Actor11)
kmyQuest.FreezeAlias(Alias_Actor12)
kmyQuest.FreezeAlias(Alias_Actor13)
kmyQuest.FreezeAlias(Alias_Actor14)
kmyQuest.FreezeAlias(Alias_Actor15)
kmyQuest.FreezeAlias(Alias_Actor16)
kmyQuest.FreezeAlias(Alias_Actor17)
kmyQuest.FreezeAlias(Alias_Actor18)
kmyQuest.FreezeAlias(Alias_Actor19)
kmyQuest.FreezeAlias(Alias_Actor20)
kmyQuest.FreezeAlias(Alias_Actor21)
kmyQuest.FreezeAlias(Alias_Actor22)
kmyQuest.FreezeAlias(Alias_Actor23)

introFX.Apply()
Utility.Wait(fDelay)
IntroFX.PopTo(LoopFX)
PSGD.apply(FadeInTime)


;Game.GetPlayer().PlaceAtMe(Alias_PlayerClone.GetReference(),1,True)
;Actor Clone = Alias_PlayerClone.GetActorReference() as Actor
;Alias_PlayerClone.GetActorReference().SetPlayerControls(true)
;Clone.SetPlayerControls(True)
;Game.GetPlayer().SetPlayerControls(False)
;Game.GetPlayer().EnableAI(False)
;Game.SetCameraTarget(Clone)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE MG04MonkSceneQuestScript
Quest __temp = self as Quest
MG04MonkSceneQuestScript kmyQuest = __temp as MG04MonkSceneQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UnfreezeAlias(Alias_Actor01)
kmyQuest.UnfreezeAlias(Alias_Actor02)
kmyQuest.UnfreezeAlias(Alias_Actor03)
kmyQuest.UnfreezeAlias(Alias_Actor04)
kmyQuest.UnFreezeAlias(Alias_Actor05)
kmyQuest.UnFreezeAlias(Alias_Actor06)
kmyQuest.UnFreezeAlias(Alias_Actor07)
kmyQuest.UnFreezeAlias(Alias_Actor08)
kmyQuest.UnFreezeAlias(Alias_Actor09)
kmyQuest.UnFreezeAlias(Alias_Actor10)
kmyQuest.UnFreezeAlias(Alias_Actor11)
kmyQuest.UnFreezeAlias(Alias_Actor12)
kmyQuest.UnFreezeAlias(Alias_Actor13)
kmyQuest.UnFreezeAlias(Alias_Actor14)
kmyQuest.UnFreezeAlias(Alias_Actor15)
kmyQuest.UnFreezeAlias(Alias_Actor16)
kmyQuest.UnFreezeAlias(Alias_Actor17)
kmyQuest.UnFreezeAlias(Alias_Actor18)
kmyQuest.UnFreezeAlias(Alias_Actor19)
kmyQuest.UnFreezeAlias(Alias_Actor20)
kmyQuest.UnFreezeAlias(Alias_Actor21)
kmyQuest.UnFreezeAlias(Alias_Actor22)
kmyQuest.UnFreezeAlias(Alias_Actor23)
CollisionPlane.Disable()
LoopFX.PopTo(OutroFX,fImodStrength)
PSGD.Remove(1.0)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property CollisionPlane  Auto  

ObjectReference Property CollisionPlaneMoveMarker  Auto  

float Property fdelay  Auto  

ImageSpaceModifier Property IntroFX  Auto  

ImageSpaceModifier Property LoopFX  Auto  

ImageSpaceModifier Property OutroFX  Auto  


float Property FadeInTime  Auto  

ShaderParticleGeometry Property PSGD  Auto  
float Property fimodstrength  Auto  
