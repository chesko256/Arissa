Scriptname dunWhiteRiverWatchDisableHeadTracking extends ReferenceAlias
{Disables head tracking on the current actor. Used for Ulfr, the blind bandit watchman.}

Event OnLoad()
	Self.GetActorRef().SetHeadTracking(False)
EndEvent