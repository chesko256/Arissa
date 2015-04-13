Scriptname MG06ArmillaryScript extends ObjectReference  Conditional

Quest Property MG06  Auto  

int Property ReadyForSpells Auto Conditional
int Property Positionvar Auto Conditional

MagicEffect Property FlameEffect  Auto
MagicEffect Property FrostEffect  Auto


FUNCTION AttenuateFire(int StateNumber, int AnimEventNumber)


		

			PlayAnimationAndWait("Fire0"+AnimEventNumber, "TransBack0"+AnimEventNumber)


EndFunction

Function AttenuateFrost(int StateNumber, int AnimEventNumber)




			PlayAnimationAndWait("Ice0"+AnimEventNumber, "TransSeq0"+ (AnimEventNumber+1))



EndFunction





Event OnLoad()

 If MG06.GetStage() < 50
	GoToState("Initial")
endif

EndEvent


Event OnAnimationEvent(ObjectReference Source, string EventString)

	MG06QuestScript QuestScript = MG06 as MG06QuestScript

	if Source == Self
		if EventString == "Correct"
			if QuestScript.Dome01Ready == 1
				Dome01Ref.PlayAnimation("LightRay")
				QuestScript.CrystalLocked=1
				(Button01 as MG06ButtonScript).Close()
			endif
			if QuestScript.Dome02Ready == 1
				Dome02Ref.PlayAnimation("LightRay")
				QuestScript.CrystalLocked=1
				(Button02 as MG06ButtonScript).Close()
			endif
			if QuestScript.Dome03Ready == 1
				Dome03Ref.PlayAnimation("LightRay")
				QuestScript.CrystalLocked=1
				(Button03 as MG06ButtonScript).Close()
			endif
		endif
	endif
	if  QuestScript.Dome01Ready == 1
		if QuestScript.Dome02Ready == 1
			if QuestScript.Dome03Ready == 1
				MG06.SetStage(55)
			endif
		endif
	endif
		UnRegisterForAnimationEvent(Self, "Correct")

EndEvent





State Initial



Event OnActivate(ObjectReference TriggerRef)
	if MG06.GetStage() == 40
		if TriggerRef == Game.GetPlayer()
			if ReadyForSpells == 0
				GoToState("busy")
				MG06.SetStage(50)
				Game.GetPlayer().RemoveItem(MG06Crystal.GetReference(), 1)
				PlayAnimationandWait("Engage", "TransSeq01")
				ReadyForSpells = 1
				GoToState("Position01")
				Positionvar = 1
				(Button01 as MG06ButtonScript).Open()
				(Button02 as MG06ButtonScript).Open()
				(Button03 as MG06ButtonScript).Open()
			endif
		endif
	endif

EndEvent



EndState


State Position01

	Event OnMagicEffectApply(ObjectReference Caster, MagicEffect SpellEffect)

		if SpellEffect.HasKeyword(MagicDamageFrost) == 1
			AttenuateFrost(1,1)
			GoToState("Position02")
			PositionVar=2
		endif

	EndEvent

EndState


State Position02

	Event OnMagicEffectApply(ObjectReference Caster, MagicEffect SpellEffect)
	
		if SpellEffect.HasKeyword(MagicDamageFire) == 1
			AttenuateFire(2,1)
			GoToState("Position01")
			PositionVar=1

		elseif SpellEffect == FrostEffect
			AttenuateFrost(2,2)
			GoToState("Position03")
			PositionVar =3
		endif

	EndEvent

EndState

State Position03

	Event OnMagicEffectApply(ObjectReference Caster, MagicEffect SpellEffect)


		MG06QuestScript QuestScript = MG06 as MG06QuestScript	

		if SpellEffect == FlameEffect
			AttenuateFire(3,2)
			GoToState("Position02")
			PositionVar =2
		elseif SpellEffect == FrostEffect
			RegisterForAnimationEvent(Self,"Correct")
			AttenuateFrost(3,3)
			GoToState("Position04")
			QuestScript.BeamsReady =1
			PositionVar= 4
		endif

	EndEvent

EndState


State Position04

	Event OnMagicEffectApply(ObjectReference Caster, MagicEffect SpellEffect)
	
		MG06QuestScript QuestScript = MG06 as MG06QuestScript	

	if QuestScript.CrystalLocked== 0
		if SpellEffect == FlameEffect
			AttenuateFire(4,3)
			GoToState("Position03")
			QuestScript.BeamsReady = 0
			PositionVar =3
		elseif SpellEffect == FrostEffect
			AttenuateFrost(4,4)
			GoToState("Position05")
			QuestScript.BeamsReady = 0
			PositionVar= 5
		endif
	endif
	EndEvent

EndState

State Position05



	Event OnMagicEffectApply(ObjectReference Caster, MagicEffect SpellEffect)

	MG06QuestScript QuestScript = MG06 as MG06QuestScript
	
		if SpellEffect == FlameEffect
			RegisterForAnimationEvent(Self, "Correct")
			AttenuateFire(5,4)
			GoToState("Position04")
			QuestScript.BeamsReady = 1
			PositionVar =4
		elseif SpellEffect == FrostEffect
			AttenuateFrost(5,5)
			GoToState("Position06")
			PositionVar= 6
		endif

	EndEvent

EndState


State Position06

	Event OnMagicEffectApply(ObjectReference Caster, MagicEffect SpellEffect)
	
		if SpellEffect == FlameEffect
			AttenuateFire(6,5)
			GoToState("Position05")
			PositionVar =5
		endif

	EndEvent

EndState

ObjectReference Property Dome01Ref  Auto  

ObjectReference Property Dome02Ref  Auto  

ObjectReference Property Dome03Ref  Auto  

ReferenceAlias Property MG06Crystal  Auto  

ObjectReference Property Button01  Auto  

ObjectReference Property Button02  Auto  

ObjectReference Property Button03  Auto  

Keyword Property MagicDamageFire  Auto  

Keyword Property MagicDamageFrost  Auto  
