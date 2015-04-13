Scriptname SpiritWolfScript extends Actor


Idle Property pa_ExtractWereWolfSpirit auto
VisualEffect Property WerewolfExtractVFX auto
EffectShader Property GhostShader auto
Sound Property QSTWolfChest auto

bool Property DoneWithExtraction = false auto

Function Extract(Actor extractionPartner)
; 	Debug.Trace("WOLF SPIRIT: Extraction requested from " + extractionPartner)
	Enable()
	SetAlpha(0)

	Utility.Wait(1)

	WerewolfExtractVFX.Play(extractionPartner, akFacingObject = self)
	int WolfExtractSoundID = QSTWolfChest.play(extractionPartner)

	if (extractionPartner.PlayIdleWithTarget(pa_ExtractWereWolfSpirit, self))
; 		Debug.Trace("C06: Played synced anim.")
	else
; 		Debug.Trace("C06: Failed anim.")
	endif

	SetAlpha(0.3)
	GhostShader.Play(self)

	EvaluatePackage()
EndFunction

Event OnDying(Actor akKiller)
	GhostShader.Stop(self)
EndEvent
