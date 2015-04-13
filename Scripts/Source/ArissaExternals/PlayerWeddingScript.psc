ScriptName PlayerWeddingScript extends ReferenceAlias

Location Property RiftenTempleofMaraLocation Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

		;If player leaves while wedding is taking place, fail wedding
		If akOldLoc == RiftenTempleofMaraLocation
			If GetOwningQuest().GetStage() >= 20 && GetOwningQuest().GetStage() < 100
				GetOwningQuest().SetStage(150)
			EndIf
		EndIf
			
EndEvent