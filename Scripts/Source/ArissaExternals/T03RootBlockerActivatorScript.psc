Scriptname T03RootBlockerActivatorScript extends ObjectReference  
{This script checks to see if root is hit by the player using the correct weapon and to play an animation}

import debug
import utility

Quest Property T03 Auto
ReferenceAlias Property Maurice Auto
Weapon Property Nettlebane Auto
Message Property CanCutMessage Auto
Message Property CantCutMessage Auto
ObjectReference Property TempActivator Auto
bool Property MauriceGetMad = false auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Actor actorRef = akAggressor as Actor
	if(actorRef == game.getPlayer() && akSource == Nettlebane)
		;player hit the root with the correct weapon
		playAnimation("Open")
		if (getLinkedRef() != None)
			getLinkedRef().disableNoWait()
		endif
		wait(1.0)
		if (MauriceGetMad)
			(T03 as T03QuestScript).MauriceShouldAdmonish = True
			Maurice.GetActorReference().EvaluatePackage()
			TempActivator.Enable()
		endif
	endif
endEvent
