Scriptname MQ203DelphineScript extends ReferenceAlias  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
; 	debug.trace(self + "OnLocationChange akNewLoc=" + akNewLoc)

	; watch for player to go the wrong direction
	MQ203QuestScript MQ203 = GetOwningQuest() as MQ203QuestScript
	if akNewLoc && MQ203.GetStage() >= 60 && MQ203.GetStage() < 280 && MQ203.GetStageDone(75) == 0 && MQ203.bMeetAtKarthspire == false
		if GetRef().GetDistance( MQ203.SkyHavenMarker ) > iMaxDistanceToFollow
; 			debug.trace(self + "OnLocationChange: too far from Sky Haven (" +  GetRef().GetDistance( MQ203.SkyHavenMarker ) + ") - stopping follow")
			MQ203.SetStage(75)
			GetActorRef().Say(MQ203MeetAtKarthspireTopic)
		endif
	endif

endEvent


int Property iMaxDistanceToFollow = 180000  Auto  

Topic Property MQ203MeetAtKarthspireTopic  Auto  

