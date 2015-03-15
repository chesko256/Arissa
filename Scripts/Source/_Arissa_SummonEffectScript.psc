Scriptname _Arissa_SummonEffectScript extends activemagiceffect  

Idle property IdleBlowHornStormcloak auto
Message property _Arissa_SummonMessage auto
_Arissa_iNPC_Behavior property iNPCSystem auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	bool bSwitchBack = false
	if Game.GetPlayer().GetAnimationVariableBool("IsFirstPerson") == true
		Game.ForceThirdPerson()
		bSwitchBack = true
	endif
	Game.GetPlayer().PlayIdle(IdleBlowHornStormcloak)
	_Arissa_SummonMessage.Show()
	iNPCSystem.EngageFollowBehavior()
	iNPCSystem.StopWaiting()
	utility.wait(6)
	if bSwitchBack == true
		Game.ForceFirstPerson()
	endif
endEvent