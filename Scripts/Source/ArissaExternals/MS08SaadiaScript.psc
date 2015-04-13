Scriptname MS08SaadiaScript extends ReferenceAlias  

MagicEffect Property MS08Paralysis  Auto  

Quest Property MS08  Auto  

Event OnActivate(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if MS08.GetStage() >= 10
			WITavern.ServerGreeted=1
		endif
	endif

EndEvent



Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

;Debug.Notification("Saadia Hit by spell")

	if akEffect == MS08Paralysis
		MS08QuestScript QuestScript = MS08 as MS08QuestScript
;		Debug.Notification("Saadia hit by correct spell")
		QuestScript.SaadiaCaptured = 1
		
	endif

EndEvent


Event OnUnload()

MS08QuestScript QuestScript = MS08 as MS08QuestScript

	if MS08.GetStage() == 201		
		QuestScript.CleanUpCheck()
	endif

EndEvent


Event OnDeath(Actor Killer)

	if ( Self.GetReference()).GetDistance(MS08Kematu.GetReference()) < 1000
		MS08QuestScript QuestScript = MS08 as MS08QuestScript
		QuestScript.KematuAngry = 1
	endif
		

	MS08.SetStage(300)

EndEvent
ReferenceAlias Property MS08Kematu  Auto  

WITavernScript Property  WITavern  Auto