scriptName dunGeirmundDuplicateSpellManager extends ObjectReference
{Since the boss' and duplicates' summon/banish effects need to happen simultaneously despite being latent, this script, placed on an activator triggered by the event system, allows the calls to be forked off.}

Activator property summonFX Auto
Activator property banishFX Auto
EffectShader property GhostFX Auto
ReferenceAlias property target Auto
bool property isSummonActivator Auto
bool property isReachwaterRockBattle Auto

auto State Waiting
	Event OnActivate(ObjectReference or)
		if (isSummonActivator)
			Summon()
		Else
			Banish()
		EndIf
	EndEvent
EndState

Event Summon()
	if (!(target.GetActorRef() as Actor).IsDead())
		ObjectReference summonGate = target.GetActorRef().PlaceAtMe(SummonFX)
; 		;Debug.Trace("Effect is: " + summonGate)
		Utility.Wait(0.5)
		target.GetActorRef().Enable()
		if (isReachwaterRockBattle)
			target.GetActorRef().SetAlpha(0.33, True)
		Else
			target.GetActorRef().SetAlpha(0.9, True)
		EndIf
		target.GetActorRef().EvaluatePackage()
		target.GetActorRef().StartCombat(Game.GetPlayer())
		(target.GetActorRef() as dunGeirmundsBossDuplicates).FinishDuplication()
	EndIf
EndEvent

Event Banish()
	if (!(target.GetActorRef() as Actor).IsDead())
		;If the duplicate is still alive (eg. this function is being called directly by Sigdis, instead of on death), set a variable to stop the duplicate from attacking.
		target.GetActorRef().SetAV("Variable06", 1)
		target.GetActorRef().EvaluatePackage()
		;Dispel the duplicates with the banish vfx.
		target.GetActorRef().PlaceAtMe(BanishFX)
		Utility.Wait(0.5)
		target.GetActorRef().Disable()
		target.GetActorRef().Delete()
	EndIf
EndEvent