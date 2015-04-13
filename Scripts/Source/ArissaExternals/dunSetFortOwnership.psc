scriptName dunSetFortOwnership extends ObjectReference
{When this marker is enabled, the monsters are disabled, so set ownership of the Forts to CWFortFaction.}

Cell property FortInteriorCell01 auto
Cell property FortInteriorCell02 auto
Cell property FortInteriorCell03 auto
Cell property FortInteriorCell04 auto
Cell property FortInteriorCell05 auto

Faction property CWFortFaction auto

Event OnLoad()
	if (!Self.IsDisabled())
		if (FortInteriorCell01 != None)
			FortInteriorCell01.SetFactionOwner(CWFortFaction)
			FortInteriorCell01.SetPublic(True)
		EndIf
		if (FortInteriorCell02 != None)
			FortInteriorCell02.SetFactionOwner(CWFortFaction)
			FortInteriorCell02.SetPublic(True)
		EndIf
		if (FortInteriorCell03 != None)
			FortInteriorCell03.SetFactionOwner(CWFortFaction)
			FortInteriorCell03.SetPublic(True)
		EndIf
		if (FortInteriorCell04 != None)
			FortInteriorCell04.SetFactionOwner(CWFortFaction)
			FortInteriorCell04.SetPublic(True)
		EndIf
		if (FortInteriorCell05 != None)
			FortInteriorCell05.SetFactionOwner(CWFortFaction)
			FortInteriorCell05.SetPublic(True)
		EndIf
	EndIf
EndEvent