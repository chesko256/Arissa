scriptname DA13DremoraFXWhenEnabledScript extends actor

explosion property myFX auto
spell property FXmainMask auto
effectShader property FXshader auto
visualEffect property FXfeet auto

;************************************

Event onLoad()
	;FXmainMask.cast(self)
	FXshader.play(self)
	FXfeet.play(self)
	;self.placeatme(myFX, 1)
endEvent

;************************************

EVENT onDead(actor akKillah)
	self.setGhost()
	FXmainMask.cast(self)
	utility.wait(1.0)
	FXfeet.stop(self)
	;self.disable()
	FXshader.stop(self)
endEVENT

;************************************