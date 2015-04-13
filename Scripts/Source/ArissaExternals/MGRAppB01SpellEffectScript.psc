Scriptname MGRAppB01SpellEffectScript extends ActiveMagicEffect  Conditional

 

{Scripted effect for the first Spell Associated with MGRAppBrelyna01}



;======================================================================================;
;               PROPERTIES  /
;=============/

float property fDelay auto
{time to wait before switching to constant Imod}
ImageSpaceModifier property IntroFX auto
{IsMod applied at the start of the spell effect}
ImageSpaceModifier property MainFX auto
{main isMod for spell}
ImageSpaceModifier property OutroFX auto
{IsMod applied at the end of the spell effect}
sound property IntroSoundFX auto ; create a sound property we'll point to in the editor
sound property OutroSoundFX auto ; create a sound property we'll point to in the editor
Quest Property MGRAppBrelyna01 Auto
; Obtain the target of the active fire effect



;======================================================================================;
;               EVENTS                     /
;=============/

Event OnEffectStart(Actor Target, Actor Caster)



	fDelay = 0.83
	int instanceID = IntroSoundFX.play((target as objectReference))          ; play IntroSoundFX sound from my self
	introFX.apply()                                  ; apply isMod at full strength
	utility.wait(fDelay)                            ; NOTE - neccessary? 
	introFX.remove()                             ; remove initial FX
	mainFX.apply()
	fDelay=0



EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)




	int instanceID = OutroSoundFX.play((target as objectReference))         ; play OutroSoundFX sound from my self
	introFX.remove()
	mainFX.remove()
	OutroFX.apply()
	MGRAppBrelyna01.SetStage(30)

endEvent


