Scriptname MQ206Script extends Quest  Conditional


Import Weather

Location Property ThroatoftheWorld  Auto  

Book Property ElderScroll  Auto  

ReferenceAlias Property TimeWound  Auto  

VisualEffect Property FXTimeWarpCamAttachEffect Auto
ImageSpaceModifier Property FadeToWhiteInOutImod Auto

function CleanUpTimeTravelEffects()
	; clean up time travel effects
	FXTimeWarpCamAttachEffect.Play(game.getplayer())
	; play time travel sound
	QSTMQ206TimeTravel2DSound.Play(game.getplayer())
	utility.wait(3.0)
	FadeToWhiteInOutImod.Apply()
	utility.wait(1.0)
	;Turn off  weather
	ReleaseOverride()	
	FXTimeTravelCamAttachEffect.Stop(game.getplayer())
	ImageSpaceModifier.RemoveCrossFade(1)
endFunction

; one-shot update to allow Elder Scroll script to not have to wait
event OnUpdate()
	if !getstagedone(20)
		setstage(20)
	endif
endEvent

; time travel effects:
VisualEffect Property FXTimeTravelCamAttachEffect Auto
{USE AUTO FILL FOR THIS PROPERTY}

Sound Property QSTMQ206TimeTravel2DSound  Auto  
