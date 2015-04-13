ScriptName dunHalldirBossBattleForms extends ReferenceAlias
{Script to manage each of Halldir's elemental forms.}

EffectShader property VFXShader Auto
{Elemental shader.}

EffectShader property GhostShader Auto
{Ghost VFX shader, for dissolve.}

float property Alpha Auto
{Alpha value of the form.}

Explosion property ExplosionFX Auto
{VFX for the phase in.}

Keyword property SummonSpotLink Auto
{Link to the location this form starts at.}

ReferenceAlias property Halldir Auto
{Link to Halldir.}


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
{Effect Shader on Target during Soul `Trap}

Function MoveToPosition()
	Self.GetActorRef().SetAlpha(0)
	Self.GetActorRef().MoveTo(Self.GetActorRef().GetLinkedRef(SummonSpotLink))
EndFunction

Function Manifest()
	Self.GetActorRef().MoveTo(Self.GetActorRef().GetLinkedRef(SummonSpotLink))
	Self.GetActorRef().PlaceAtMe(ExplosionFX)
	VFXShader.Play(Self.GetActorRef())
	GhostShader.Play(Self.GetActorRef())
	Self.GetActorRef().SetAlpha(Alpha, True)
	Self.GetActorRef().SetAV("Magicka", 1000)
	;Self.GetActorRef().SetAV("Variable06", 0)
	Self.GetActorRef().StartCombat(Game.GetPlayer())
	Self.GetActorRef().EvaluatePackage()
EndFunction

Event OnDying(Actor akKiller)
	VFXShader.Stop(Self.GetActorRef())
	GhostShader.Stop(Self.GetActorRef())
	Self.GetActorRef().SetAlpha(0.1, True)
	TargetVFX.Play(Self.GetReference(),3,Halldir.GetReference())
	CasterVFX.Play(Halldir.GetReference(),3,Self.GetReference())
	TargetFXS.Play(Self.GetReference(),3)
	CasterFXS.Play(Halldir.GetReference(),3)
	Utility.Wait(3)
	Self.GetActorRef().Disable(True)
EndEvent
