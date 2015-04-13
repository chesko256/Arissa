;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_MG06VisionScene_00034CCD Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
MG06QuestScript MG06Script = MG06 as MG06QuestScript
MG06Script.MG06VisionTrigger = -1
LoopFX.PopTo(OutroFX,fImodStrength)
PSGD.Remove(1.0)
MGTeleportOutEffect.Play(MG06Psijic.GetReference())
Utility.Wait(1.0)
MG06Psijic.GetActorReference().SetAlpha(0,true)
Utility.Wait(1.0)
MG06Psijic.GetReference().Disable()
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MG06  Auto  

ReferenceAlias Property MG06Psijic  Auto  


ImageSpaceModifier Property LoopFX  Auto

ImageSpaceModifier Property OutroFX  Auto

float Property fImodStrength  Auto  

VisualEffect Property MGTeleportOutEffect  Auto  

ShaderParticleGeometry Property PSGD  Auto  
