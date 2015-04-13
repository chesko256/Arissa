Scriptname FXChangeToNecroPriestScript extends ObjectReference  
{Changes the dunKilkreathWarlock into a necro priest on death.}

actorBase Property EncSkeletonNecroPriest auto
EffectShader Property SkeletonNecroBirthFXS auto

Event OnDying(Actor akKiller)

	self.PlaceAtMe(EncSkeletonNecroPriest)
	SkeletonNecroBirthFXS.play(self)
	
EndEvent


