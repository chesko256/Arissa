Scriptname dunHalldirBossBattle2 extends ReferenceAlias 
{Elementalist boss battle in Halldir's Cairn.}

;Boss references
ReferenceAlias property Halldir Auto
ReferenceAlias property HalldirFire Auto
ReferenceAlias property HalldirFrost Auto
ReferenceAlias property HalldirStorm Auto

bool property hasSplit Auto

EffectShader property VFXShader Auto
{Elemental shader.}

float property Alpha Auto
{Alpha value of the form.}

Explosion property ExplosionFX Auto
{VFX for the phase in.}

Keyword property LinkCustom02 Auto
{Keyword for the location Halldir should be moved to after phasing out.}

Weapon property HalldirsStaff Auto
{Staff wielded by Halldir; dropped as a reward.}


ImageSpaceModifier property TrapImod auto
{IsMod applied as part of soul-based effects.}

sound property TrapSoundFX auto ; create a sound property we'll point to in the editor
{Sound played as part of soul-based effects.}

VisualEffect property TargetVFX auto
{Visual Effect on Target aiming at Caster}

VisualEffect property CasterVFX auto
{Visual Effect on Caster aming at Target}

EffectShader property CasterFXS auto
{Effect Shader on Caster during Soul Trap}

EffectShader property TargetFXS auto
{Effect Shader on Target during Soul Trap}

ObjectReference property HalldirMoveToPoint Auto

bool hasBeenActivated = False

Quest property dunHalldirsCairnQST Auto
int property stageToSetOnDeath Auto

Function ReadyHalldir()
	Self.GetActorRef().SetGhost(True)
	Self.GetActorRef().SetAlpha(0)
EndFunction

Event OnActivate(ObjectReference obj)
	if (!hasBeenActivated)
		Self.GetActorRef().SetGhost(False)
		Self.GetActorRef().SetAlpha(0.33, True)
		VFXShader.Play(Self.GetActorRef())
		Self.GetActorRef().Activate(Game.GetPlayer())
		hasBeenActivated = True
	EndIf
EndEvent

Event OnHit(ObjectReference akAggressor, form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (Self.GetActorRef().GetAVPercentage("Health") < 0.65 && Self.GetActorRef().GetAV("Health") > 0 && !hasSplit)
		hasSplit = True
		Self.GetActorRef().SetAV("Variable06", 1)
		Self.GetActorRef().StopCombat()
		Self.GetActorRef().EvaluatePackage()
		Self.GetActorRef().SetGhost(True)
		Self.GetActorRef().PlaceAtMe(ExplosionFX)
		
		(HalldirFire as dunHalldirBossBattleForms).MoveToPosition()
		(HalldirFrost as dunHalldirBossBattleForms).MoveToPosition()
		(HalldirStorm as dunHalldirBossBattleForms).MoveToPosition()
		
		TrapSoundFX.play(Halldir.GetReference())
		TrapImod.apply()
		
		TargetVFX.Play(Halldir.GetReference(),3,HalldirFire.GetReference())
		CasterVFX.Play(HalldirFire.GetReference(),3,Halldir.GetReference())
		TargetFXS.Play(Halldir.GetReference(),3)
		CasterFXS.Play(HalldirFire.GetReference(),3)
		
		TargetVFX.Play(Halldir.GetReference(),3,HalldirFrost.GetReference())
		CasterVFX.Play(HalldirFrost.GetReference(),3,Halldir.GetReference())
		TargetFXS.Play(Halldir.GetReference(),3)
		CasterFXS.Play(HalldirFrost.GetReference(),3)
		
		TargetVFX.Play(Halldir.GetReference(),3,HalldirStorm.GetReference())
		CasterVFX.Play(HalldirStorm.GetReference(),3,Halldir.GetReference())
		TargetFXS.Play(Halldir.GetReference(),3)
		CasterFXS.Play(HalldirStorm.GetReference(),3)

		Self.GetActorRef().SetAlpha(0.01, True)
		Utility.Wait(2.5)
		
		(HalldirFire as dunHalldirBossBattleForms).Manifest()
		(HalldirFrost as dunHalldirBossBattleForms).Manifest()
		(HalldirStorm as dunHalldirBossBattleForms).Manifest()

		Self.GetActorRef().Disable()
		Self.GetActorRef().MoveTo(HalldirMoveToPoint)
	EndIf
EndEvent
	
Function StartFinalBattle()
	Utility.Wait(1)
	Self.GetActorRef().SetGhost(False)
	Self.GetActorRef().MoveTo(HalldirMoveToPoint)
	Self.GetActorRef().PlaceAtMe(ExplosionFX)
	Self.GetActorRef().Enable()
	Self.GetActorRef().SetAV("Variable06", 0)
	Self.GetActorRef().EvaluatePackage()
	Self.GetActorRef().SetAlpha(0.33, True)
EndFunction

Event OnDying(Actor killer)
	Self.GetActorRef().PlaceAtMe(HalldirsStaff)
	dunHalldirsCairnQST.SetStage(stageToSetOnDeath)
EndEvent
