Scriptname TGTQ04BannerScript extends ReferenceAlias  Conditional

int Property pTGTQ04Destroyed Auto
Quest Property pTGTQ04Quest Auto

Event OnDestructionStageChanged (int aiOldStage, int aiCurrentStage)

	if pTGTQ04Quest.GetStageDone(65) == 0
		if aiCurrentStage == 5
			pTGTQ04Quest.SetStage(65)
			Self.GetRef().DamageObject(9999)
		endif
	endif

endEvent