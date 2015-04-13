Scriptname SolitudeOpeningOnCellDetach extends ReferenceAlias  





Event OnCellDetach ()

	If GetOwningQuest().GetStage() > 1 && GetOwningQuest().GetStage() <30
		GetOwningQuest().Setstage(31)
	EndIf

EndEvent