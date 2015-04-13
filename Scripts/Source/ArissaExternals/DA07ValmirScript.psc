ScriptName DA07ValmirScript extends ReferenceAlias

Quest Property DA07 Auto

Event OnDeath(Actor akKiller)
	If (DA07.GetStage() == 50) || (DA07.GetStage() == 60)
		DA07.SetStage(65)
	EndIf
EndEvent