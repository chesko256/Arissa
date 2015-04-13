Scriptname MGRitual02BookScript extends ReferenceAlias  

Quest Property MGRitual02  Auto  


Event OnLoad()

MGRitual02QuestScript QuestScript = MGRitual02 as MGRitual02QuestScript

	if QuestScript.SpellActive == 1
		Self.GetReference().Enable(true)
		LifeDetected.Play(Self.GetReference())
	else
		LifeDetected.Stop(Self.GetReference())
		Self.GetReference().Disable(true)
	endif


EndEvent
EffectShader Property LifeDetected  Auto  
