Scriptname VampireDiseaseEffectScript extends ActiveMagicEffect  

Event OnUpdate()

	;Make sure the player is out of combat, then trigger change
	If Game.GetPlayer().GetCombatState() == 0 && Game.IsMovementControlsEnabled() && Game.IsFightingControlsEnabled()
		VampireSleepMessage.Show()
; 		Debug.Trace(self + "Player not in combat, and controls are enabled. Trigger Vampire change")
		PlayerVampireQuest.VampireChange(Game.GetPlayer())
	Else
		RegisterForSingleUpdate(10)
	EndIf

EndEvent

Event OnUpdateGameTime()

	If GameHour.GetValueInt() == 5
		VampireSunriseMessage.Show()		
		;int instanceID = IntroSoundFX.play((Game.GetPlayer()))          ; play IntroSoundFX sound from my self
		VampireTransformDecreaseISMD.applyCrossFade(2.0)
		utility.wait(2.0)
		imageSpaceModifier.removeCrossFade()
	EndIf
	
	If GameHour.GetValueInt() == 19
		VampireSunsetMessage.Show()
		;int instanceID = IntroSoundFX.play((Game.GetPlayer()))          ; play IntroSoundFX sound from my self
		VampireTransformIncreaseISMD.applyCrossFade(2.0)
		utility.wait(2.0)
		imageSpaceModifier.removeCrossFade()
	EndIf
	
	If GameDaysPassed.Value >= VampireChangeTimer
		UnRegisterForUpdateGameTime()
		RegisterForSingleUpdate(10)
	EndIf
EndEvent


Event OnEffectStart(Actor Target, Actor Caster)

	;Player has three days before he becomes a Vampire	
	If Target == Game.GetPlayer()
		RegisterForUpdateGameTime(1)
		VampireChangeTimer = GameDaysPassed.Value + 3
	EndIf

EndEvent

Message Property VampireSunriseMessage Auto

Message Property VampireSunsetMessage Auto

Message Property VampireSleepMessage Auto

ImageSpaceModifier Property AbsorbRedImod  Auto  

Sound Property IntroSoundFX  Auto  

Sound Property OutroSoundFX  Auto  

Message Property VampireDiseaseMessage Auto

Float Property VampireChangeTimer Auto

GlobalVariable Property Gamehour Auto

GlobalVariable Property GameDaysPassed Auto

Perk Property VampireFeed Auto

PlayerVampireQuestScript Property PlayerVampireQuest Auto

imageSpaceModifier Property VampireTransformIncreaseISMD  Auto
imageSpaceModifier Property VampireTransformDecreaseISMD  Auto 