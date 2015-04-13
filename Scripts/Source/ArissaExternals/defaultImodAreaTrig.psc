scriptName defaultImodAreaTrig extends objectReference

ImageSpaceModifier property iMod auto
{the imod to apply.  Default darkens & desaturates}
;ImageSpaceModifier property intro auto
;ImageSpaceModifier property outro auto


EVENT onTriggerEnter(objectReference actronaut)
	if actronaut == game.getPlayer()
		;intro.apply()
		imod.applyCrossFade(2.0)
	endif
endEVENT

EVENT onTriggerLeave(objectReference actronaut)
	if actronaut == game.getPlayer()
		;outro.apply()
		;imod.RemoveCrossFade()
	endif
endEVENT
