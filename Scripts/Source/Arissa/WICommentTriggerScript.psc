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

_Arissa_iNPC_Behavior property iNPCSystem auto


auto STATE waitingToTrigger
	EVENT onTriggerEnter(objectReference triggerRef)
		Actor triggerActor = triggerRef as Actor
		; TODO -- this doesn't work for package yet, need GetTemplate() on Package
		if triggerActor && ( triggerActor.IsInFaction(FollowerFaction) || triggerActor.GetCurrentPackage() == FollowerPackage )
			myLink = GetLinkedRef()
			;USKP 2.0 added sanity check for NONE here
			if( myLink != None )
				myLink.Disable()
			EndIf
			gotoState("hasBeenTriggered")
			;trace(self + " triggered by " + triggerActor)
			CommentKeyword.SendStoryEvent(akRef1 = triggerRef)

			;Arissa - Fire off our quest
			iNPCSystem.StartCommentQuest(CommentKeyword)
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE
