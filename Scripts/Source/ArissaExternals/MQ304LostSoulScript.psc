Scriptname MQ304LostSoulScript extends ObjectReference  
{script to detect lost soul being devoured by Alduin}

Faction Property AlduinFaction  Auto  
{used to detect when struck by Alduin}

Quest Property MQ304 Auto
{MQ304}

int Property StageToSet  Auto  
{stage to set when struck by Alduin}

Event OnLoad()
	IgnoreFriendlyHits(true)
endEvent

Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
; 	debug.trace(self + " OnHit()")
	TestForAlduinHit(akAggressor)
endEvent

Event OnDeath(Actor akKiller)
; 	debug.trace(self + " OnDeath()")
	TestForAlduinHit(akKiller)
endEvent

; not sure we need both of these, but for now Alduin can only attack with magic from perch
;Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
;	TestForAlduinHit(akCaster)
;endEvent

function TestForAlduinHit(ObjectReference akAggressor)
	if (akAggressor as Actor).IsInFaction(AlduinFaction)
		; disable myself
		;FadeOutShader.Play(self)
		Actor mySelf = (self as ObjectReference) as Actor
		utility.Wait(2)
		mySelf.SetAlpha(0, true)
		; tell linked activator that I've been killed
		MQSovngardeShoutTrigger myTrigger = (GetLinkedRef() as MQSovngardeShoutTrigger)
		myTrigger.DevourSoulChangeState(2)
		Disable(abFadeOut = true)
	endif
	if StageToSet > 0
		MQ304.SetStage(stageToSet)
	endif
endFunction
