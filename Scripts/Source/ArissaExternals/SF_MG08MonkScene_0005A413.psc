;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_MG08MonkScene_0005A413 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;MG08EndMessage.Show()
Eye.PlaceAtMe(MGEyeRemoveExplosion)
Utility.Wait(0.5)
MGTeleportOutEffect.Play(Quaranir.GetReference())
MGTeleportOutEffect.Play(Tandil.GetReference())
MGTeleportOutEffect.Play(Gelebros.GetReference())
Utility.Wait(1.0)
Quaranir.GetActorReference().SetAlpha(0.1,true)
Tandil.GetActorReference().SetAlpha(0.1,true)
Gelebros.GetActorReference().SetAlpha(0.1,true)
Eye.Disable(1)
Utility.Wait(3.0)
Quaranir.GetReference().Disable()
Tandil.GetReference().Disable()
Gelebros.GetReference().Disable()
GetOwningQuest().SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property MG08EndMessage  Auto  

ReferenceAlias Property Gelebros  Auto  

ReferenceAlias Property Tandil  Auto  

ReferenceAlias Property Quaranir  Auto  

ObjectReference Property Eye  Auto  

visualeffect Property MGTeleportOutEffect  Auto  

Explosion Property MGEyeRemoveExplosion  Auto  
