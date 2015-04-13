scriptName dunKagrenzelAnimationActivationScript extends ObjectReference


import debug
import utility

objectReference property animObject auto
{reference the plays the animations}

MusicType property myMusic auto
{Music to play when activated}

ObjectReference property FXTrigger auto
ObjectReference property myFXFinalDest01 auto
ObjectReference property myFXFinalDest02 auto
ObjectReference property myFXTarget01 auto
ObjectReference property myFXTarget02 auto
ObjectReference property myFXTarget03 auto
ObjectReference property myFXTarget04 auto
EffectShader property myFXShader auto



dunShaftTrapScript myFXTrigger
float speedSlow = 200.0
float speedStart = 300.0
float speedMid = 500.0
float speedEnd = 900.0
float speedFinal = 300.0
float tangentMagnitude = 0.0
float waitSlow = 5.0
float waitSlowEnd = 8.0
float waitStart = 2.5
float waitMid = 1.25
float waitEnd = 0.5


;************************************

Event onLoad()
	myFXTrigger = FXTrigger as dunShaftTrapScript
endEvent

;************************************

auto State Listening

	Event onActivate(objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		;if(actorRef == game.getPlayer())
			;player has activated
			;gotoState("done")
			myFXTrigger.inProgress = true
			disable()
			animObject.playAnimation("Trigger01")
			wait(1)
			myMusic.Add()
			myFXTrigger.mySoundDoppler.enable()

			
			myFXTrigger.myFX.SplineTranslateToRef(myFXTarget01, tangentMagnitude, speedSlow)
			myFXTrigger.myFXLight.SplineTranslateToRef(myFXTarget01, tangentMagnitude, speedSlow)
			wait(waitSlow)
			myFXTrigger.mySoundDoppler.disable()
			myFXTrigger.mySoundSpin.enable()
			
			myFXTrigger.myFX.SplineTranslateToRef(myFXTarget02, tangentMagnitude, speedMid)
			myFXTrigger.myFXLight.SplineTranslateToRef(myFXTarget02, tangentMagnitude, speedMid)
			wait(waitMid)
			myFXTrigger.myFX.SplineTranslateToRef(myFXTarget03, tangentMagnitude, speedMid)
			myFXTrigger.myFXLight.SplineTranslateToRef(myFXTarget03, tangentMagnitude, speedMid)
			wait(waitMid)
			myFXTrigger.myFX.SplineTranslateToRef(myFXTarget04, tangentMagnitude, speedMid)
			myFXTrigger.myFXLight.SplineTranslateToRef(myFXTarget04, tangentMagnitude, speedMid)
			wait(waitMid)
			myFXTrigger.myFX.SplineTranslateToRef(myFXTarget01, tangentMagnitude, speedMid)
			myFXTrigger.myFXLight.SplineTranslateToRef(myFXTarget01, tangentMagnitude, speedMid)
			wait(waitMid)
			
			myFXTrigger.myFX.SplineTranslateToRef(myFXTarget02, tangentMagnitude, speedEnd)
			myFXTrigger.myFXLight.SplineTranslateToRef(myFXTarget02, tangentMagnitude, speedEnd)
			wait(waitEnd)
			myFXTrigger.myFX.SplineTranslateToRef(myFXTarget03, tangentMagnitude, speedEnd)
			myFXTrigger.myFXLight.SplineTranslateToRef(myFXTarget03, tangentMagnitude, speedEnd)
			wait(waitEnd)
			myFXTrigger.myFX.SplineTranslateToRef(myFXTarget04, tangentMagnitude, speedEnd)
			myFXTrigger.myFXLight.SplineTranslateToRef(myFXTarget04, tangentMagnitude, speedEnd)
			wait(waitEnd)
			myFXTrigger.myFX.SplineTranslateToRef(myFXTarget01, tangentMagnitude, speedEnd)
			myFXTrigger.myFXLight.SplineTranslateToRef(myFXTarget01, tangentMagnitude, speedEnd)
			wait(waitEnd)
			
			myFXTrigger.myFX.SplineTranslateToRef(myFXTarget02, tangentMagnitude, speedEnd)
			myFXTrigger.myFXLight.SplineTranslateToRef(myFXTarget02, tangentMagnitude, speedEnd)
			wait(waitEnd)
			myFXTrigger.myFX.SplineTranslateToRef(myFXTarget03, tangentMagnitude, speedEnd)
			myFXTrigger.myFXLight.SplineTranslateToRef(myFXTarget03, tangentMagnitude, speedEnd)
			wait(waitEnd)
			myFXTrigger.myFX.SplineTranslateToRef(myFXTarget04, tangentMagnitude, speedEnd)
			myFXTrigger.myFXLight.SplineTranslateToRef(myFXTarget04, tangentMagnitude, speedEnd)
			wait(waitEnd)
			myFXTrigger.myFX.SplineTranslateToRef(myFXTarget01, tangentMagnitude, speedEnd)
			myFXTrigger.myFXLight.SplineTranslateToRef(myFXTarget01, tangentMagnitude, speedEnd)
			
			wait(2)
			myFXTrigger.mySoundDoppler.enable()
			myFXTrigger.mySoundSpin.disable()
			
			myFXTrigger.myFX.SplineTranslateToRef(myFXFinalDest01, tangentMagnitude, speedSlow)
			myFXTrigger.myFXLight.SplineTranslateToRef(myFXFinalDest01, tangentMagnitude, speedSlow)
			wait(waitSlow)
			myFXTrigger.mySoundDoppler.disable()
			myFXTrigger.mySoundLoop.disable()
			
			myFXTrigger.myFX.SplineTranslateToRef(myFXFinalDest02, tangentMagnitude, speedEnd)
			myFXTrigger.myFXLight.SplineTranslateToRef(myFXFinalDest02, tangentMagnitude, speedEnd)
			wait(0.5)
			
			myFXTrigger.myFX.disable(1)
			myFXTrigger.myFXLight.disable()
			myFXTrigger.unregisterForUpdate()
			myFXTrigger.inTrigger = false
			
			myFXShader.play(animObject)
			wait(0.2)
			myFXShader.stop(animObject)
			wait(0.1)
			myFXShader.play(animObject)
			wait(0.1)
			myFXShader.stop(animObject)
			wait(0.5)
			myFXShader.play(animObject)
			wait(5.0)
			myFXShader.stop(animObject)
			wait(3.0)
			animObject.playAnimation("Trigger02")
			wait(4)
			animObject.playAnimation("Reset")
			myFXTrigger.inProgress = false
		;endif
	endEvent
	
endState

;************************************

State done
	;do nothing
endState

;************************************