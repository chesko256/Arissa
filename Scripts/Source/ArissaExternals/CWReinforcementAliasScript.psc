Scriptname CWReinforcementAliasScript extends ReferenceAlias 


Event OnDeath(Actor akKiller)
; 	CWScript.Log ("CWReinforcementAliasScript", self + "OnDeath() will call CWReinforcementControllerScript RegisterDeath(" + self + ")")
	(GetOwningQuest() as CWReinforcementControllerScript).registerDeath(self)

EndEvent
