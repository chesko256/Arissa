Scriptname MG08AncanoScript extends ReferenceAlias  

Quest Property MG08 Auto

Event OnLoad()

MG08QuestScript MG08Script = MG08 as MG08QuestScript

	GetActorReference().SetGhost()
	AncanoShield.Play(GetReference())
	MG08Script.AncanoShield=1

EndEvent




Event OnDeath(Actor AkKiller)


	if MG08.GetStage() == 30
		MG08.SetStage(40)
	endif


EndEvent
EffectShader Property AncanoShield  Auto  
