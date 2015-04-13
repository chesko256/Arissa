Scriptname transmuteMineralScript extends ActiveMagicEffect  
{script for spell to allow transmutation of ores}

import game

MiscObject Property Ore01  Auto  
{Lowest value ore}
MiscObject Property Ore02  Auto  
{Middle value ore}
MiscObject Property Ore03  Auto  
{Highest value ore}
Sound Property FailureSFX  Auto  
float property skillAdvancement = 15.0 auto
{How much to advance the skill?  Only works when spell actually transmutes something}
message property failureMSG auto


EVENT OnEffectStart(Actor akTarget, Actor akCaster)
	objectReference caster = akCaster
	if caster.getItemCount(Ore02) >= 1
		; favor the more valuable ore first
		caster.removeItem(Ore02, 1, TRUE)
		caster.addItem(Ore03, 1, FALSE)
		advanceSkill("alteration",skillAdvancement)
	elseif caster.getItemCount(Ore01) >= 1
		; if none of that, look for the base ore to upgrade
		caster.removeItem(Ore01, 1, TRUE)
		caster.addItem(Ore02, 1, FALSE)
		advanceSkill("alteration",skillAdvancement)
	else
		; caster must have had no valid ore
		FailureSFX.play(caster)
		failureMSG.show()
	endif
endEVENT
