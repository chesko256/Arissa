Scriptname WICommentTriggerScript extends ObjectReference  
{used to fire script events to cause followers to comment on the environment.
This triggers LinkRef will be disabled on trigger (Having multiple triggers act as one).
}

import game
import debug


Keyword Property CommentKeyword  Auto  
{the keyword for the type of comment you
want the follower to make}

Faction Property FollowerFaction  Auto  
{actors in this faction will trigger me}

Package Property FollowerPackage  Auto  
{actors running this package will trigger me}

ObjectReference Property myLink Auto Hidden


auto STATE waitingToTrigger
	EVENT onTriggerEnter(objectReference triggerRef)
		Actor triggerActor = triggerRef as Actor
		; TODO -- this doesn't work for package yet, need GetTemplate() on Package
		if triggerActor && ( triggerActor.IsInFaction(FollowerFaction) || triggerActor.GetCurrentPackage() == FollowerPackage )
			myLink = GetLinkedRef()
			myLink.Disable()
			gotoState("hasBeenTriggered")
			trace(self + " triggered by " + triggerActor)
			CommentKeyword.SendStoryEvent(akRef1 = triggerRef)
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE
