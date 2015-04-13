Scriptname DRGWestSouthGuardsScript extends ReferenceAlias  Conditional

Quest Property pDRGQuest Auto Conditional

Event OnDeath(Actor akKiller)

	pDRGQuest.SetStage(10)

endEvent