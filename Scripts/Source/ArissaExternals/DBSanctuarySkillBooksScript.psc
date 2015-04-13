Scriptname DBSanctuarySkillBooksScript extends ObjectReference  
{Track which DB Sanctuary skill books the player has acquired to prevent duplicates or interferance from the DB10 Fire.}

Quest property dunSkillBooksQST Auto
int property dunSkillBooksQSTStage Auto
Quest property DB10 Auto
Quest property DB11 Auto
Location property DarkBrotherhoodSanctuaryLocation Auto
Location property DawnstarSanctuaryLocation Auto

Event OnCellLoad()
	if (!dunSkillBooksQST.GetStageDone(dunSkillBooksQSTStage))
		if (Self.GetCurrentLocation() == DarkBrotherhoodSanctuaryLocation && !DB10.GetStageDone(1))
			Self.Enable()
		ElseIf (Self.GetCurrentLocation() == DawnstarSanctuaryLocation && DB11.GetStageDone(80))
			Self.Enable()
		Else
			Self.Disable()
		EndIf
	EndIf
EndEvent