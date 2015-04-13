Scriptname MG06VisionTriggerScript extends ObjectReference  

Scene Property MG06VisionScene  Auto  
Quest Property MG06 Auto

ReferenceAlias Property MG06NerienAlias  Auto  

int Property VisionEnd auto Conditional


Spell Property TeleportInSpell  Auto  

Spell Property TeleportOutSpell  Auto  

VisualEffect Property MGTeleportInEffect  Auto  

float Property fdelay  Auto  

ImageSpaceModifier Property IntroFX  Auto  

ImageSpaceModifier Property LoopFX  Auto  

ImageSpaceModifier Property OutroFX  Auto  


float Property FadeInTime  Auto  

ShaderParticleGeometry Property PSGD  Auto  



Event OnTriggerEnter(ObjectReference AkActionRef)

	if AkActionRef == Game.GetPlayer()
		MG06QuestScript MG06Script = MG06 as MG06QuestScript


		if MG06.GetStage() == 60 

			if MG06Script.MG06VisionTrigger == 0
				MG06Script.MG06VisionTrigger=1
				MG06NerienAlias.GetReference().Enable()
				MG06NerienAlias.GetActorReference().SetAlpha(0)
				Game.DisablePlayerControls()
				While MG06NerienAlias.GetReference().Is3DLoaded() == False
					Utility.Wait(0.1)
				endwhile
; 				debug.trace(self + " We Are Adding The Effects!")
				introFX.apply()                                  ; apply isMod at full strength
				utility.wait(fDelay)                            ; NOTE - neccessary? 
				introFX.PopTo(LoopFX)                             ; remove initial FX
				PSGD.apply(FadeInTime)
				MGTeleportInEffect.Play(MG06NerienAlias.GetReference(),3.6)
				MG06NerienAlias.GetActorReference().SetAlpha(1, true)
; 				debug.trace(self + " We Done With the effects!")
				;Utility.Wait(0.1)
				Utility.Wait(1.5)
; 				debug.trace(self + " Start the Scene!")
				MG06VisionScene.Start()

			endif	
		endif


	endif




EndEvent