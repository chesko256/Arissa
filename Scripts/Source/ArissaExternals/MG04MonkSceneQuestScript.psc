Scriptname MG04MonkSceneQuestScript extends Quest  Conditional

function FreezeAlias(ReferenceAlias AliasToFreeze)

	Actor ActorRef = AliasToFreeze.GetActorReference()
	if ActorRef

		ActorRef.EnableAI(False)
		ActorRef.BlockActivation()
		ActorRef.SetGhost()
	endif

EndFunction


function UnfreezeAlias(ReferenceAlias AliasToUnfreeze)

	Actor ActorRef = AliasToUnfreeze.GetActorReference()

	if ActorRef

		ActorRef.EnableAI(True)
		ActorRef.BlockActivation(False)
		ActorRef.SetGhost(False)
	
	endif

EndFunction