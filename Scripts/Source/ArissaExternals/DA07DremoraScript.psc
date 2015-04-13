ScriptName DA07DremoraScript extends ReferenceAlias

VisualEffect Property SummonTargetVisualFX Auto
Sound Property MAGConjureFire Auto

EVENT onLoad()
; 	debug.trace(self + "playing visual effects")
	SummonTargetVisualFX.Play(Self.GetActorRef())
	MAGConjureFire.Play(Self.GetActorRef())	
endEVENT
