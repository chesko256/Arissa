;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_T02FenrigRuki_00038295 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Fenrig.GetActorRef().PlayIdle(AscendMale)
;Ruki.GetActorRef().PlayIdle(AscendFemale)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Fenrig.GetActorRef().SetLookAt(Ruki.GetActorRef(), true)
Ruki.GetActorRef().SetLookAt(Fenrig.GetActorRef(), true)
T02QuestScript t02script = GetOwningQuest() as T02QuestScript
t02script.CheckForDeadLoversScene = True
t02script.RegisterForUpdate(100)
(GetOwningQuest() as T02QuestScript).ListenForAnimEvents()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Ruki.GetRef().DisableNoWait(true)
Fenrig.GetRef().DisableNoWait(true)
GhostFXShader.Stop(Ruki.GetRef())
GhostFXShader.Stop(Fenrig.GetRef())
;AscensionMessage.Show()
GetOwningQuest().SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Fenrig  Auto  

ReferenceAlias Property Ruki  Auto  

Message Property AscensionMessage  Auto  


Idle Property AscendMale  Auto  

Idle Property AscendFemale  Auto  

EffectShader Property GhostFXShader  Auto  
