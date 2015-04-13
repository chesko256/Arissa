ScriptName FreeformMorKhazgurAQuestGiverScript extends ReferenceAlias

Location Property MorKhazgurLocation Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	If (akNewLoc == MorKhazgurLocation) && (GetOwningQuest().GetStage() == 20)
		GetOwningQuest().SetStage(100)
	EndIf

EndEvent