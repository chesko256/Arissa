Scriptname SwapJobAliasScript extends ReferenceAlias  
{Put this on "job" aliases (Jarl, Innkeeper, etc.) who might change out from under you while your quest is running

if this happens, get again from the MasterJobAlias -- normally an alias from the dialogue quest

NOTE: You need to call RegisterForUpdate on these aliases from somewhere else when you want to start watching
}

ReferenceAlias Property MasterJobAlias Auto  
{master job alias on DialogueXXX quest}

Faction Property JobFaction Auto
{Job faction that we're watching for}

int Property ObjectiveToRedisplay = -1 Auto
{Optional: If we swap, redisplay this objective - useful if the objective displays the name of the actor in the alias}


event OnUpdate()
	if GetActorRef() && GetActorRef().IsInFaction(JobFaction) == 0
		; get the alias again from the master alias
		Actor currentActor = MasterJobAlias.GetActorRef()
; 		debug.trace(self + " switching to " + currentActor)
		ForceRefTo(currentActor)
		
		quest myQuest = GetOwningQuest()
		
		if ObjectiveToRedisplay >= 0 &&  myQuest.IsObjectiveDisplayed(ObjectiveToRedisplay) && myQuest.IsObjectiveCompleted(ObjectiveToRedisplay) == False
			myQuest.SetObjectiveDisplayed(ObjectiveToRedisplay, abForce = True)
		EndIf
		
	endif	
endEvent






