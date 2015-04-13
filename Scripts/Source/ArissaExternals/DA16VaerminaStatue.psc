scriptName DA16VaerminaStatue extends objectReference
;
;
;====================================================

effectShader property myEffectShader auto
float property AlphaValue = 0.4 auto
float property FadeToAlpha auto

auto state waiting
	event onActivate(objectReference akActivator)
; 		debug.Trace(self + " has been acticated by " + akActivator)
		; if myEffectShader
			; myEffectShader.play(self as objectReference)
		; Else
; 			; debug.Trace(self + " does not have an effectShader: " + myEffectShader)
		; endif
		
		;self.SetAlpha (AlphaValue, True)

		playAnimationAndWait ("playAnim02", "End")
		goToState("Done")
	endEvent
endState

state Done
	event onActivate(objectReference akActivator)
; 		debug.Trace(self + " has been acticated by " + akActivator)
		; if myEffectShader
			; myEffectShader.play(self as objectReference)
		; Else
; 			; debug.Trace(self + " does not have an effectShader: " + myEffectShader)
		; endif
		
		;self.SetAlpha (AlphaValue, True)

		playAnimationAndWait ("playAnim01", "End")
		goToState("Waiting")
	endEvent
endState

;In case reset is needed these are the events
;playAnimationAndWait ("playAnim01", "End")
