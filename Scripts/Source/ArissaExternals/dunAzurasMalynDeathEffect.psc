Scriptname dunAzurasMalynDeathEffect extends ObjectReference  

; //the image space fx
IMAGESPACEMODIFIER PROPERTY fadeToBlackIFX AUTO
IMAGESPACEMODIFIER PROPERTY fadeToWhiteIFX AUTO

; //the portal or cloud effects
OBJECTREFERENCE PROPERTY portalBlackFX AUTO
OBJECTREFERENCE PROPERTY portalWhiteFX AUTO

; //the effect shaders for the good and evil
EFFECTSHADER PROPERTY shaderBlackFX AUTO
EFFECTSHADER PROPERTY shaderWhiteFX AUTO

; //the gems
OBJECTREFERENCE PROPERTY gemA AUTO
OBJECTREFERENCE PROPERTY gemB AUTO
OBJECTREFERENCE PROPERTY gemC AUTO
OBJECTREFERENCE PROPERTY gemD AUTO
OBJECTREFERENCE PROPERTY gemE AUTO
OBJECTREFERENCE PROPERTY gemF AUTO
OBJECTREFERENCE PROPERTY gemG AUTO
OBJECTREFERENCE PROPERTY gemH AUTO
OBJECTREFERENCE PROPERTY gemI AUTO
OBJECTREFERENCE PROPERTY gemJ AUTO
OBJECTREFERENCE PROPERTY gemK AUTO

; //the Xmarker to play the explosions
OBJECTREFERENCE PROPERTY marker AUTO

; //the explosions to play for the portals
EXPLOSION PROPERTY blackPortal AUTO
EXPLOSION PROPERTY whitePortal AUTO

; //DA01
Quest Property DA01 Auto

; //Ending Scenes
Scene Property DA01WhiteFXScene Auto
Scene Property DA01BlackFXScene Auto

; //the sound markers for the good and bad crystal effects
OBJECTREFERENCE PROPERTY goodSound AUTO
OBJECTREFERENCE PROPERTY badSound AUTO

EVENT onDEATH(ACTOR killer)

	;Azura's Star Good Ending
	IF(DA01.GetStageDone(70) == 1)
	

		; //play the shader on the body
		shaderWhiteFX.play(SELF)
		
		; //start the portal FX
		goodSound.enable()
		portalWhiteFX.moveTo(marker)
		portalWhiteFX.playAnimation("playAnim01")

		; //Azura speaks to player
; 		debug.Trace(self + "Azura WhiteFX scene starts")
		DA01WhiteFXScene.Start()

		utility.wait(2)
		
		; //start putting the shader on the gems
		shaderWhiteFX.play(gemA)
		
		utility.wait(1.5)
		
		shaderWhiteFX.play(gemB)
		
		utility.wait(0.5)
		
		shaderWhiteFX.play(gemC)
		
		utility.wait(0.5)
		
		shaderWhiteFX.play(gemD)
		
		utility.wait(1)
		
		shaderWhiteFX.play(gemE)
		shaderWhiteFX.play(gemF)
		
		utility.wait(1)
		
		shaderWhiteFX.play(gemG)
		shaderWhiteFX.play(gemH)
		
		utility.wait(1.5)
		
		shaderWhiteFX.play(gemI)
		shaderWhiteFX.play(gemJ)
		
		utility.wait(1)
		
		shaderWhiteFX.play(gemK)
		
		utility.wait(2.5)
		
		; //fade to white
		fadeToWhiteIFX.apply()
	
		utility.wait(2.75)

		DA01.SetStage(90)
	ELSE
	
		; //play the shader on the body
		shaderBlackFX.play(SELF)
		
		; //start the portal FX
		badSound.enable()
		portalBlackFX.moveTo(marker)
		portalBlackFX.playAnimation("playAnim01")
		
		; //Nelacar speaks to player
; 		debug.Trace(self + "Nelacar BlackFX scene starts")
		DA01BlackFXScene.Start()

		utility.wait(2)
		
		; //start putting the shader on the gems
		shaderBlackFX.play(gemA)
		
		utility.wait(1.5)
		
		shaderBlackFX.play(gemB)
		
		utility.wait(0.5)
		
		shaderBlackFX.play(gemC)
		
		utility.wait(0.5)
		
		shaderBlackFX.play(gemD)
		
		utility.wait(1)
		
		shaderBlackFX.play(gemE)
		shaderBlackFX.play(gemF)
		
		utility.wait(1)
		
		shaderBlackFX.play(gemG)
		shaderBlackFX.play(gemH)
		
		utility.wait(1.5)
		
		shaderBlackFX.play(gemI)
		shaderBlackFX.play(gemJ)
		
		utility.wait(1)
		
		shaderBlackFX.play(gemK)
		
		utility.wait(2.5)
		
		; //fade to white
		fadeToBlackIFX.apply()

		utility.wait(2.75)

		DA01.SetStage(95)
	
	ENDIF
	
ENDEVENT
