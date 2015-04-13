Scriptname DA16TorporEffectScript extends ActiveMagicEffect  Conditional

Quest Property pDA16Quest  Auto  Conditional
Cell Property pNightCaller Auto Conditional
Message Property pDA16Message Auto
Potion Property pDA16Torpor Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	if akTarget == Game.GetPlayer()
		if Game.GetPlayer().GetParentCell() == pNightcaller
			utility.wait(0.1)
			pDA16Quest.SetStage(145)
		else
			pDA16Message.Show()
			Game.GetPlayer().AddItem(pDA16Torpor,1)
		endif
	endif

endEvent