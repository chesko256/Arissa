Scriptname TG08BMercerScript extends ReferenceAlias  Conditional

Quest Property pTG08BQuest Auto


Event OnDeath(Actor akKiller)

	if akKiller == Game.GetPlayer()
		pTG08BQuest.SetStage(40)
	endif

endEvent