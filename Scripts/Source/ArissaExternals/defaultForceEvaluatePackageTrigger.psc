Scriptname defaultForceEvaluatePackageTrigger extends ObjectReference  
{Forces the actor and/or alias to evaluate its package after a brief delay.}

ObjectReference property actorToForce Auto
ReferenceAlias property aliasToForce Auto

EVENT OnTriggerEnter(objectReference actronaut)
	Utility.Wait(0.1)
	if (actorToForce != None)
		(actorToForce As Actor).EvaluatePackage()
	EndIf
	if (aliasToForce != None)
		aliasToForce.GetActorReference().EvaluatePackage()
	EndIf
endEVENT
