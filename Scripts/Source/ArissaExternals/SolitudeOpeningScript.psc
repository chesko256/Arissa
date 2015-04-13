Scriptname SolitudeOpeningScript extends Quest  

Quest Property SolitudeOpening Auto

Event OnUpdateGameTime()

	If (SolitudeOpening.GetStage()) == 30 || (SolitudeOpening.GetStage()) == 31
		SetStage(35)
	ElseIf (SolitudeOpening.GetStage()) == 35
			SetStage(40)
	Elseif (SolitudeOpening.GetStage()) == 40
		SetStage(45)
	Elseif (SolitudeOpening.GetStage()) == 45
		SetStage(190)
	EndIf

EndEvent