Scriptname SolitudeOpeningPrisonerScript extends ReferenceAlias  


idle Property OffsetBoundStandingStart Auto


Event OnLoad()
	GetActorReference().playIdle(OffsetBoundStandingStart)
EndEvent

