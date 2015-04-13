Scriptname DunLabyrinthianWoodenMaskSCRIPT extends ActiveMagicEffect  
{Script that handles the use of the wooden Bromjunaar mask as a key to the sanctuary}

objectReference property areaMarker auto
{This reference is used to determine if the player is within the range to visit the sanctuary}
float property maskRange = 512.0 auto
{How close must I be to the area Marker to visit Sanctuary? DEFAULT=512}
objectReference property SanctuaryMarker auto
{Where to put the player when the mask is used as a key}
location property DragonPriestSanctuaryLocation auto
{The sanctuary Cell}
imageSpaceModifier property AzuraFadeToBlack auto
{Use a basic fade-to-black for the transition}
imageSpaceModifier property FadeToBlackBackImod auto
Sound Property TransitionSFX  Auto 

objectReference property maskActual auto
{Point explicity to the unique, placed reference of the mask in the world}

ObjectReference selfRef


EVENT OnEffectStart(Actor Target, Actor Caster)
	
	selfRef = caster
	
	if caster.getDistance(areaMarker) <= maskRange && caster == game.getPlayer()
		AzuraFadeToBlack.apply()
		TransitionSFX.play(caster)
		utility.wait(2.5)
		caster.moveTo(SanctuaryMarker)
		FadeToBlackBackImod.apply()
		AzuraFadeToBlack.remove()
	endif
	
endEVENT

EVENT onEffectFinish(Actor Target, Actor Caster)
	if Caster == game.getPlayer() && game.getPlayer() .isInLocation(DragonPriestSanctuaryLocation) == TRUE
		;when player removes the mask in sanctuary, return to Skyrim
		AzuraFadeToBlack.apply()
		TransitionSFX.play(caster)
		utility.wait(2.5)
		game.getPlayer().moveTo(areaMarker)
		FadeToBlackBackImod.apply()
		AzuraFadeToBlack.remove()
		if caster.getItemCount(maskActual) < 1
			; safety catch - if the player dropped the mask in the sanctuary, add it to inventory so it doesn't get lost.
			caster.addItem(maskActual)
		endif
	endif
endEVENT
