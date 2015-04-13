Scriptname MGRitual02EffectScript extends ActiveMagicEffect  

{Scripted effect for the Spell Associated with MGRitual02}



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

	MGRitual02QuestScript QuestScript = RitualQuest as MGRitual02QuestScript

	QuestScript.SpellActive =1
	Book01.GetReference().Enable(True)
	Book02.GetReference().Enable(True)
	Book03.GetReference().Enable(True)
	Book04.GetReference().Enable(True)

EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)

	MGRitual02QuestScript QuestScript = RitualQuest as MGRitual02QuestScript

	QuestScript.SpellActive =0
	Book01.GetReference().Disable()
	Book02.GetReference().Disable()
	Book03.GetReference().Disable()
	Book04.GetReference().Disable()


	int instanceID = OutroSoundFX.play((target as objectReference))         ; play OutroSoundFX sound from my self
	introFX.remove()
	mainFX.remove()
	OutroFX.apply()


endEvent

Quest Property RitualQuest  Auto  

ReferenceAlias Property Book01  Auto  

ReferenceAlias Property Book02  Auto  

ReferenceAlias Property Book03  Auto  

ReferenceAlias Property Book04  Auto  
