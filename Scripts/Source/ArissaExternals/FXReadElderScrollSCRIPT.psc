Scriptname FXReadElderScrollSCRIPT extends ObjectReference  
{This script runs whenever the player attempts to read the elderscroll playing the required fx. Usually makes the player go "blind" for a second but when read near the time rift it takes the player back in time.}


EffectShader Property FXAlduinTimeFadeFXS Auto
{USE AUTO FILL FOR THIS PROPERTY}
ImageSpaceModifier Property FXReadScrollImod Auto
{USE AUTO FILL FOR THIS PROPERTY}
ImageSpaceModifier Property FXTimeTravelImodStatic Auto
{USE AUTO FILL FOR THIS PROPERTY}
ImageSpaceModifier Property FXReadScrollsBlindImod Auto
{USE AUTO FILL FOR THIS PROPERTY}
ImageSpaceModifier Property ISMDwhiteout200 Auto
{USE AUTO FILL FOR THIS PROPERTY}
VisualEffect Property FXReadElderScrollEffect Auto
{USE AUTO FILL FOR THIS PROPERTY}
VisualEffect Property FXTimeTravelCamAttachEffect Auto
{USE AUTO FILL FOR THIS PROPERTY}
;VisualEffect Property FXAlduinTimRiftEffect Auto
;{USE AUTO FILL FOR THIS PROPERTY}
Explosion Property FXAlduinTimeWarpExplosion Auto
{USE AUTO FILL FOR THIS PROPERTY}
ObjectReference Property AncientAlduinReference Auto
{Point this to the ancient alduin who will get set forward in time}
Activator Property FXAncientTimeWound Auto
{USE AUTO FILL FOR THIS PROPERTY}
int stepper
objectReference myTimeWound

auto state waiting
	Event OnActivate(ObjectReference akActionRef)
			;do regular scroll read fx. Read scroll and then go blind
			;
			;
			FXReadElderScrollEffect.Play(game.getplayer(), 3.5)	
			FXReadScrollsBlindImod.Apply()
			goToState("wait")
	endEvent
EndState

state timeTravel
	Event OnActivate(ObjectReference akActionRef)
			;do time travel scroll read fx. Read scroll and then have a lasting screen fx that turns off in timeTravelCleanup
			;
			;
			FXReadScrollImod.Apply()
			FXReadElderScrollEffect.Play(game.getplayer(), 4)
			FXTimeTravelImodStatic.ApplyCrossFade(2)
			utility.wait(2.0)
			FXTimeTravelCamAttachEffect.Play(game.getplayer())
			goToState("wait")
	endEvent
EndState

state alduinTimeJump
	Event OnActivate(ObjectReference akActionRef)
			;play time warp fx on alduin and leave time wound.
			;
			;
			;FXAlduinTimRiftEffect.Play(AncientAlduinReference, 6.1)	
			AncientAlduinReference.placeAtMe(FXAlduinTimeWarpExplosion)
			FXAlduinTimeFadeFXS.Play(AncientAlduinReference)
			utility.wait(1.0)	
			(AncientAlduinReference as actor).PlaySubGraphAnimation("SkinFadeOut")
			utility.wait(3.0)
			myTimeWound = AncientAlduinReference.placeAtMe(FXAncientTimeWound) 
			utility.wait(1.0)
			AncientAlduinReference.disable()
			goToState("wait")
	endEvent
EndState

state timeTravelCleanup
	Event OnActivate(ObjectReference akActionRef)
			; Clean up lasting time travel fx.
			;
			;
			ISMDwhiteout200.ApplyCrossFade(0.2)
			utility.wait(0.2)
			FXTimeTravelCamAttachEffect.Stop(game.getplayer())
			ImageSpaceModifier.RemoveCrossFade(3)
			goToState("wait")
	endEvent
EndState

state wait
	Event OnBeginState()
	;wait for seconds and go to proper state. Used for debugging.
	;
	;
		if stepper == 0
			utility.wait(4.0)
			goToState("timeTravel")
			stepper = 1
		elseIf stepper == 1
			utility.wait(4.0)
			goToState("alduinTimeJump")
			stepper = 2
		elseIf stepper == 2
			utility.wait(4.0)
			goToState("timeTravelCleanup")
			stepper = 3
		elseIf stepper == 3
			utility.wait(4.0)
			goToState("waiting")
			stepper = 0
		endIf
		
	ENDEVENT
EndState

state tempLoop
	Event OnBeginState()
		;set up alduin time warp to loop for testing. No longer used.
		;
		;
		utility.wait(8.0)
		AncientAlduinReference.enable()	
		myTimeWound.disable()	
		goToState("alduinTimeJump")
	ENDEVENT
EndState
