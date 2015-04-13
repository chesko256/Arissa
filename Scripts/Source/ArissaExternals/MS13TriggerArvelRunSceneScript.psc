ScriptName MS13TriggerArvelRunSceneScript extends objectReference

import game
import debug
ReferenceAlias Property Arvel auto
MS13QuestScript property pMS13QuestScript auto

Event OnTriggerEnter(ObjectReference akActionRef)
	If (akactionRef == Arvel.GetActorReference()) && (pMS13QuestScript.ArvelCombat == 0)
		pMS13QuestScript.ArvelCombat = 1
	EndIf
EndEvent
		