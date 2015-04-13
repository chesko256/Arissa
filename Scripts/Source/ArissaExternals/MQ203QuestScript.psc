Scriptname MQ203QuestScript extends Quest  Conditional

import Game

function EsbernDelphineWait(bool bWaitingFlag)
	Alias_Esbern.GetActorRef().SetActorValue("WaitingForPlayer", bWaitingFlag as int)
	Alias_Delphine.GetActorRef().SetActorValue("WaitingForPlayer", bWaitingFlag as int)

	; always clear other flags
	bEsbernEscortRatway = false
	bMeetAtKarthspire = false

	Alias_Esbern.GetActorRef().EvaluatePackage()
	Alias_Delphine.GetActorRef().EvaluatePackage()

endFunction

; TEST
Event OnAnimationEventUnregistered(ObjectReference akSource, string asEventName)
; 	debug.trace(self + "OnAnimationEventUnregistered " + akSource + " " + asEventName)
endEvent

; enable book when Esbern's animation finishes
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
; 	debug.trace(self + "OnAnimationEvent: akSource=" + akSource + ", event=" + asEventName)
	if akSource == Alias_Esbern.GetRef() && asEventName == "AnimObjectUnequip"
		UnregisterForAnimationEvent(akSource, asEventName)
		SetStage(48)
	endif
endEvent

Location Property Riverwood  Auto  
{RiverwoodLocation}

Location Property InnLocation  Auto  
{RiverwoodSleepingGiantInnLocation}


Location Property SkyHavenTemple Auto

Location Property KarthspireLocation Auto

ReferenceAlias Property Alias_Esbern Auto
ReferenceAlias Property Alias_Delphine Auto

bool Property bEsbernEscortRatway  Auto  Conditional

bool Property bMeetAtKarthspire  Auto  Conditional
{set to true and Esbern & Delphine will travel separately; false they will follow player}

ObjectReference Property SkyHavenMarker  Auto  
{used for distance calculations for followers
}

Event OnUpdate()
; 	debug.trace(self + "OnUpdate")

	if GetStage() >= 60 && GetStage() < 80 && GetStageDone(75) == 0 && bMeetAtKarthspire == false
		bool stopfollow = false
		; watch for player to go the wrong direction or go into a dungeon
		actor delphine = Alias_Delphine.GetActorRef()
		location currentLoc = delphine.GetCurrentLocation()
		Worldspace currentWorld = delphine.GetWorldspace()

; 		debug.trace(self + "OnUpdate: currentLoc=" + currentLoc + ", currentWorld = " + currentWorld)

		; if we're in a dungeon, leave
		if delphine.IsInInterior()
; 			debug.trace(self + " in interior")
			if currentLoc.HasKeyword(locTypeDungeon)
; 				debug.trace(self + "Delphine inside dungeon - stopping follow")
				stopFollow = true
			endif
		elseif (currentWorld  == Tamriel) && delphine.GetDistance( SkyHavenMarker ) > iMaxDistanceToFollow
; 			debug.trace(self + "Delphine too far from Sky Haven (" + delphine.GetDistance( SkyHavenMarker ) + ") - stopping follow")
			stopFollow = true
		endif

		if stopFollow && delphine.IsInCombat() == 0
			SetStage(75)
			delphine.Say(MQ203MeetAtKarthspireTopic)
		endif
	endif
endEvent


int Property iMaxDistanceToFollow = 180000  Auto  

Topic Property MQ203MeetAtKarthspireTopic  Auto  

Keyword Property LocTypeDungeon  Auto  

Worldspace Property Tamriel  Auto  
