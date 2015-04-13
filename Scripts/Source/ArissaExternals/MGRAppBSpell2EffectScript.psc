Scriptname MGRAppBSpell2EffectScript extends ActiveMagicEffect  

Activator Property SummonTargetFXActivator  Auto  

Race Property ChickenRace  Auto  

Race Property HorkerRace  Auto  

Quest Property MGRAppBrelyna01  Auto  


Event OnEffectStart(Actor akTarget, Actor akCaster)

MGRAppBrelyna01QuestScript QuestScript = MGRAppBrelyna01 as MGRAppBrelyna01QuestScript

;	if akTarget == Game.GetPlayer()
		if QuestScript.Spell2Cast == 0
			QuestScript.SavedRace = Game.GetPlayer().GetRace()
			Game.GetPlayer().PlaceAtMe(SummonTargetFXActivator, 1)
			Utility.Wait(0.3)
			Game.GetPlayer().SetAlpha(0)
			Creature1.ForceRefTo(Game.GetPlayer().PlaceAtMe(EncCow,1))
			Utility.Wait(0.2)
			QuestScript.Spell2Cast = 1
		elseif QuestScript.Spell2Cast == 1
		
			Creature1.GetReference().PlaceAtMe(SummonTargetFXActivator, 1)
			Utility.Wait(0.3)
			Creature1.GetReference().Disable()
			Creature2.ForceRefTo(Creature1.GetReference().PlaceAtMe(EncHorseBrown,1))
			Utility.Wait(0.2)
			QuestScript.Spell2Cast = 2
		elseif QuestScript.Spell2Cast== 2
			Creature2.GetReference().PlaceAtMe(SummonTargetFXActivator,1 )
			Utility.Wait(0.3)
			Creature2.GetReference().Disable()
			Creature3.ForceRefTo(Creature2.GetReference().PlaceAtMe(EncDog,1))
			Utility.Wait(0.2)
			QuestScript.Spell2Cast = 3
		elseif QuestScript.Spell2Cast == 3
			Creature3.GetReference().PlaceAtMe(SummonTargetFXActivator, 1)
			Utility.Wait(0.3)
			Creature3.GetReference().Disable()
			Game.GetPlayer().MoveTo(Creature3.GetReference())
			Game.GetPlayer().SetAlpha(1)
			Utility.Wait(0.2)
			QuestScript.Spell2Cast = -1
		endif

;	endif

EndEvent
  

Race Property HareRace  Auto  

ActorBase Property EncCow  Auto  

ActorBase Property EncHorseBrown Auto

ActorBase Property EncDog Auto

ReferenceAlias Property Creature1  Auto  

ReferenceAlias Property Creature2  Auto  

ReferenceAlias Property Creature3  Auto  
