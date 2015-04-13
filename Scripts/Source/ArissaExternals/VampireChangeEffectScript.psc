Scriptname VampireChangeEffectScript extends ActiveMagicEffect  

Perk Property VampireFeed Auto

PlayerVampireQuestScript Property PlayerVampireQuest Auto

Event OnEffectStart(Actor Target, Actor Caster)

	;int instanceID = IntroSoundFX.play((target as objectReference))          ; play IntroSoundFX sound from my self
	;introFX.apply()                                  ; apply isMod at full strength
	;utility.wait(fDelay)                            ; NOTE - neccessary? 
	;introFX.remove()
	
	VampireQuest.VampireChange(Game.GetPlayer())

EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	;int instanceID = OutroSoundFX.play((target as objectReference))         ; play OutroSoundFX sound from my self
endEvent

float Property fDelay  Auto  


ImageSpaceModifier Property IntroFX  Auto  

ImageSpaceModifier Property MainFX  Auto  

ImageSpaceModifier Property OutroFX  Auto  

Sound Property IntroSoundFX  Auto  

Sound Property OutroSoundFX  Auto  

PlayerVampireQuestScript Property VampireQuest  Auto  
