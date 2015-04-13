Scriptname defaultOwnZombie extends Actor
{Put this script on an actor, and point the properties to the actors you want him to own as zombies.}

ObjectReference Property ZombieRef01 auto
{Point this property to the actor you want this specific reference to own as a zombie}
ObjectReference Property ZombieRef02 auto
{Point this property to the actor you want this specific reference to own as a zombie}
ObjectReference Property ZombieRef03 auto
{Point this property to the actor you want this specific reference to own as a zombie}
ObjectReference Property ZombieRef04 auto
{Point this property to the actor you want this specific reference to own as a zombie}
ObjectReference Property ZombieRef05 auto
{Point this property to the actor you want this specific reference to own as a zombie}
ObjectReference Property ZombieRef06 auto
{Point this property to the actor you want this specific reference to own as a zombie}

EffectShader Property ReanimateFXShader auto
{Should autofill with effect of the same name}

Faction Property AddZombiesToThisFaction auto
{Put the faction in here that you want the zombies to be a part of (so they are friends with their owner)}

Bool Property HasBeenLoaded = FALSE auto hidden


EVENT OnCellLoad()
	if (HasBeenLoaded == FALSE)
	; Put the effects on the owned zombies.  And whatever else happens when something becomes a zombie.
		MakeZombie(ZombieRef01)
		MakeZombie(ZombieRef02)
		MakeZombie(ZombieRef03)
		MakeZombie(ZombieRef04)
		MakeZombie(ZombieRef05)
		MakeZombie(ZombieRef06)
		HasBeenLoaded = TRUE
	else
	; Do nothing, since I've already been loaded
	endif
endEVENT



EVENT OnDeath(Actor akKiller)
; I've died, try to kill the zombies I own
; 	;debug.Trace("DARYL - " + self + " I DIED!!!")
	TryToKill(ZombieRef01)
	TryToKill(ZombieRef02)
	TryToKill(ZombieRef03)
	TryToKill(ZombieRef04)
	TryToKill(ZombieRef05)
	TryToKill(ZombieRef06)
endEVENT



Function MakeZombie(ObjectReference ActorToZombify)
	if (ActorToZombify)
		(ActorToZombify as Actor).RemoveFromAllFactions()
		(ActorToZombify as Actor).AddToFaction(AddZombiesToThisFaction)
		ReanimateFXShader.Play(ActorToZombify)
	endif
endFunction



Function TryToKill(ObjectReference ActorToKill)
	if (ActorToKill)
; 		;debug.Trace("DARYL - " + self + " Attempting to kill " + ActorToKill)
		if ((ActorToKill as Actor).IsDead())
		; We don't need to kill them, since they are dead.
		; We do need to make sure they don't have the effect on them though.
; 			;debug.Trace("DARYL - " + self + ActorToKill + " Is already dead, disable his shader")
			ReanimateFXShader.Stop(ActorToKill)
		else
		; They aren't dead, so kill them and remove the zombie effect.
; 			;debug.Trace("DARYL - " + self + ActorToKill + " isn't dead, kill him and disable his shader")
			(ActorToKill as Actor).Kill()
			ReanimateFXShader.Stop(ActorToKill)
		endif
	endif
endFunction