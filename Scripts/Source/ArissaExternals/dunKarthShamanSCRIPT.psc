Scriptname dunKarthShamanSCRIPT extends ObjectReference  
{a script to be put on the shaman who is reviving the dead giant at Karthspire camp.}

; //totems
OBJECTREFERENCE PROPERTY totemA AUTO
OBJECTREFERENCE PROPERTY totemB AUTO

OBJECTREFERENCE PROPERTY giant AUTO
OBJECTREFERENCE PROPERTY caster AUTO

EFFECTSHADER PROPERTY giantEffect  AUTO
EFFECTSHADER PROPERTY rezEffect  AUTO

SPELL PROPERTY rezSpell AUTO

EVENT onDEATH(ACTOR akKiller)
	
	IF( akKiller == game.getPlayer())
		; //play the effect on the totems
		rezEffect.play(totemA)
		rezEffect.play(totemB)
		
		utility.wait(1)
		
		; //cast the spell on the giant
		rezSpell.cast(giant, giant)
		
		utility.wait(2)
		
		(giant as ACTOR).resurrect()
		
		utility.wait(0.025)
		giantEffect.play(giant)	
		
		utility.wait(1)
		(giant as ACTOR).evaluatePackage()
			
		utility.wait(59)
		(giant as ACTOR).kill()
	
	ENDIF
	
ENDEVENT
