Scriptname CWFortSiegeInteriorDefenderScript Extends ReferenceAlias
{Script attached to InteriorDefenderX aliases in CWFortSiege quest.}

int stageThatMeansDefendersLost = 1000

Event OnDeath(Actor akKiller)
	;Because they aren't part of the spawning system they don't respawn which should keep the majority of the fighting outside.
	;But here we kill someone offscreen and outside so that it still "counts" as a kill
	;Note: in the rare case where all defenders which are still alive chased the player into the interior cell with this interior defender, this interior defender's death won't "count" - no big deal
; 	CWScript.Log("CWFortSiegeInteriorDefenderScript", self + "OnDeath() calling CWReinforcementControllerScript killOffscreenDefender()")

	(GetOwningQuest() as CWReinforcementControllerScript).killOffscreenDefender()
EndEvent

Event OnLoad()
	
	ObjectReference SelfRef = GetReference()

	If GetOwningQuest().GetStageDone(stageThatMeansDefendersLost)
; 		CWScript.Log("CWFortSiegeInteriorDefenderScript", self + "OnLoad() found GetStageDone(" + stageThatMeansDefendersLost + ") is TRUE, meaning the defenders lost, therefore I'm disabling myself.")
		SelfRef.disable()
	EndIf
EndEvent




