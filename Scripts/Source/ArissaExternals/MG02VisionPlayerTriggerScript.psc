Scriptname MG02VisionPlayerTriggerScript extends ObjectReference  

Quest Property MG02  Auto  

Quest Property MG02MonkSceneQuest  Auto  

Scene Property MG02VisionScene  Auto  

ReferenceAlias Property MG02TolfdirAlias  Auto  

ReferenceAlias Property MG02NerienAlias  Auto  

ImageSpaceModifier Property IntroFX  Auto  

float Property FadeInTime  Auto  

float Property fdelay  Auto  

ImageSpaceModifier Property LoopFX  Auto  

VisualEffect Property MGTeleportInEffect  Auto  

ImageSpaceModifier Property OutroFX  Auto  

ShaderParticleGeometry Property PSGD  Auto  

Spell Property TeleportInSpell  Auto  

Spell Property TeleportOutSpell  Auto  

Event OnTriggerEnter(ObjectReference ActionRef)

MG02QuestScript QuestScript = MG02 as MG02QuestScript

	if ActionRef == Game.GetPlayer()
		QuestScript.PlayerVisionReady=1
		if  QuestScript.TolfdirUpdate == 2 
			if MG02TolfdirAlias.GetActorReference().IsInCombat() == false
				if Game.GetPlayer().IsInCombat() == false
					Utility.Wait(2)
					QuestScript.TriggerVision()
					Self.Disable()
				endif
			endif
		else
			Self.Disable()
		endif
	endif

EndEvent


ObjectReference Property MG02VisionCollisionPlane  Auto  
