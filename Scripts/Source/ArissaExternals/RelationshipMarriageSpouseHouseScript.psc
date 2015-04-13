ScriptName RelationshipMarriageSpouseHouseScript extends Quest

ReferenceAlias Property SolitudeHouse  Auto  
ReferenceAlias Property WindhelmHouse  Auto  
ReferenceAlias Property MarkarthHouse  Auto  
ReferenceAlias Property RiftenHouse  Auto  
ReferenceAlias Property WhiterunHouse  Auto  
ReferenceAlias Property SpouseHouse Auto

Faction Property JobBlacksmithFaction Auto
Faction Property JobSpellFaction Auto
Faction Property JobApothecaryFaction Auto
Faction Property JobInnkeeperFaction Auto
Faction Property JobMiscFaction Auto

Function MoveSpouse (Actor Spouse, ReferenceAlias NewHouse)
	;Function puts the player spouse in the correct alias to sandbox in the appropriate house
	;Clear all the other house aliases before setting the new one
	
	If SolitudeHouse
		SolitudeHouse.Clear()
	EndIf

	If WindhelmHouse
		WindhelmHouse.Clear()
	EndIf

	If MarkarthHouse
		MarkarthHouse.Clear()
	EndIf

	If RiftenHouse	
		RiftenHouse.Clear()
	EndIf

	If WhiterunHouse
		WhiterunHouse.Clear()
	EndIf

	If SpouseHouse
		SpouseHouse.Clear()
	EndIf

	NewHouse.ForceRefTo(Spouse)
	
EndFunction

Function SpouseShop (Actor Spouse)

	;Function checks to see if the player was a vendor before, if not, make them a MiscVendor
	If (Spouse.IsInFaction(JobBlacksmithFaction) == 0) && (Spouse.IsInFaction(JobSpellFaction) == 0) && (Spouse.IsInFaction(JobInnkeeperFaction) ==0) && (Spouse.IsInFaction(JobApothecaryFaction) == 0) && (Spouse.IsInFaction(JobMiscFaction) == 0)
		Spouse.AddtoFaction(JobMiscFaction)
		Spouse.AddtoFaction(JobMerchantFaction)
	EndIf

EndFunction

Faction Property JobMerchantFaction  Auto  
