;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 22
Scriptname SF_MG06DoorScene_0004D8D0 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;MG06DoorBarrierRef.PlayAnimation("TransitionAnim")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
MG08EyeMarker.PlaceAtMe(MGEyeOpenExplosion)
MGEyeWhiteOutImod.Apply()
MG06MirabelleAlias.GetActorReference().DispelAllSpells()
Utility.Wait(1)
GetOwningQuest().SetStage(99)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
MG06Savos.GetActorReference().EquipSpell(SavosSpell,0)
MG06Savos.GetActorReference().EquipSpell(SavosSpell,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;test
;MG06EndSceneMessage.Show()
;MG08EyeMarker.PlaceAtMe(MGEyeOpenExplosion)
;GetOwningQuest().SetStage(99)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;test
MG06DoorBarrierRef.PlayAnimation("TransitionAnim")
MG06DoorBarrierDisableSound.Enable()
Utility.Wait(3.4)

MG06DoorBarrierRef.Disable()
MG06Door.Lock(false)
MG06Door.SetOpen(true)
;MG06DoorMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MG06Door  Auto  

Message Property MG06DoorMessage  Auto  

Message Property MG06EndSceneMessage  Auto  

ObjectReference Property MG06DoorBarrierRef  Auto  

ReferenceAlias Property Mg06Savos  Auto  

Spell Property SavosSpell  Auto  

ObjectReference Property MG08EyeMarker  Auto  

Explosion Property MGEyeOpenExplosion  Auto  

ImageSpaceModifier Property MGEyeWhiteOutIMod  Auto  

ReferenceAlias Property MG06MirabelleAlias  Auto  

ObjectReference Property MG06DoorBarrierDisableSound  Auto  
