Scriptname MGRArniel03Script extends Quest  Conditional

int Property ArnielStep  Auto  Conditional

int Property SoulGemStage  Auto  Conditional


Event OnUpdateGameTime()

	if GetStage() == 200
		SetStage(255)
	endif

EndEvent