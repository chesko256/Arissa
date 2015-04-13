scriptName dunFaldarsToothDogScript extends referenceAlias
;
;
;
;==========================================================

spell property FlameResistanceAbility auto
spell property FlameCloakSpell auto
float timer
magicEffect property DispellEffect auto
objectReference property FaldarDogEnableObject auto
actor mySelf


event onLoad()
	FlameResistanceAbility = (getOwningQuest() as dunFaldarsToothSCRIPT).DogFlameResistanceAbility
	FlameCloakSpell = (getOwningQuest() as dunFaldarsToothSCRIPT).DogFlameCloakSpell
	DispellEffect = (getOwningQuest() as dunFaldarsToothSCRIPT).DogDispellEffect
	mySelf = getActorReference()
endevent

auto state waiting
	event onActivate(objectReference akActivator)
; 		debug.trace("dog activated")
		if akActivator == FaldarDogEnableObject
; 			debug.trace("dog activator is correct")
			mySelf.registerForUpdate(5)
			mySelf.AddSpell(FlameResistanceAbility)
			FlameCloakSpell.cast(mySelf, mySelf)
			goToState("Flaming")
		endif
	endEvent
endState

state Flaming
	event onUpdate()
		;if getTime() >= (timer + 60)
		;	timer = getTime()
		;	FlameCloakSpell.cast(self, self)
		;endif
	endEvent

	event onMagicEffectApply(objectReference akCaster, magicEffect akEffect)
		if akEffect == dispellEffect
			mySelf.removeSpell(FlameResistanceAbility)
			mySelf.removeSpell(FlameCloakSpell)
			mySelf.unRegisterForUpdate()
			;addPackage go to riften
			goToState("Deactive")
		endif
	endEvent
endState

state Deactive
endState

event onDeath(actor akKiller)
		mySelf.unRegisterForUpdate()
		mySelf.removeSpell(FlameResistanceAbility)
		mySelf.removeSpell(FlameCloakSpell)
		goToState("Deactive")
endEvent
	