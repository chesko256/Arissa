ScriptName WE21NPCScript extends ReferenceAlias

Event OnLoad()

	;Put Protected NPC in Bleedout
	Self.GetActorRef().DamageAV("Health", 200)
	
EndEvent

MagicEffect property RestoreHealthEffect auto
Keyword Property pMagicRestoreHealth  Auto  
LocationAlias Property pNPCLocation Auto

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
; 	debug.trace("Target has been hit by magic.")
	If (akEffect.HasKeyword(pMagicRestoreHealth) == 1) && (GetOwningQuest().GetStage() < 20)
		GetOwningQuest().SetStage(15)
; 		debug.trace("Target has been healed!")
	EndIf
ENDEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	If akNewLoc == pNPCLocation.GetLocation()
		GetOwningQuest().SetStage(255)
	EndIf

EndEvent
