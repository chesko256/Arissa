Scriptname TGRadiantBossSlainScript extends ReferenceAlias  Conditional

GlobalVariable Property pTGRFailGlobal Auto Conditional

Event OnDeath(Actor akKiller)

	pTGRFailGlobal.Value = 1

endEvent