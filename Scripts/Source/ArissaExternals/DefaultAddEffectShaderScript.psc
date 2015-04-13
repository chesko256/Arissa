scriptName DefaultAddEffectShaderScript extends objectReference
;
;
;===============================================================

effectShader property glowEffect auto

event OnLoad()
	glowEffect.play(self as objectReference)
endEvent

event OnUnload()
	glowEffect.stop(self as objectReference)
endEvent
