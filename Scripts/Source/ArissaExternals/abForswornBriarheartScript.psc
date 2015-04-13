Scriptname abForswornBriarheartScript extends ActiveMagicEffect

ingredient property BriarHeart auto
{The briarheart object.}
armor property ArmorBriarHeart auto
armor property ArmorBriarHeartEmpty auto

actor property mySelf auto hidden

	EVENT OnEffectStart(Actor Target, Actor Caster)
		mySelf = caster
		Caster.AddInventoryEventFilter(briarHeart)
	endEVENT
	
	EVENT OnItemRemoved(Form objectTaken, int aiItemCount, ObjectReference refTaken, ObjectReference akDestContainer)
		if objectTaken == briarHeart
; 			debug.trace("Briarheart warrior "+mySelf+" has had his heart removed!")

			; kill the warrior, blame it on whoever took the heart
			if myself.isDead() == FALSE
				mySelf.kill(akDestContainer as actor)
			endif

			; dead or alive, switch to "empty" cavity when the briarheart is taken
			myself.addItem(ArmorBriarHeartEmpty,1)
			utility.wait(0.25)
			mySelf.removeItem(armorBriarHeart,(mySelf.getItemCount(armorBriarHeart)))
			myself.equipItem(ArmorBriarHeartEmpty,TRUE,TRUE)
		endif
	endEVENT
	