Scriptname DA04BloodHarvestVictimScript extends ReferenceAlias  

Quest Property ParentQuest auto

Message Property HarvestMessage auto

int minutesSinceDeath = 0
int minutesOfFreshness = 5
int updateInterval = 60

bool Function IsElf()
	ActorBase me = GetActorReference().GetLeveledActorBase()
	DA04QuestScript da04script = ParentQuest as DA04QuestScript
	if (me.GetRace() == da04script.Altmer)
		return true
	elseif (me.GetRace() == da04script.Bosmer)
		return true
	elseif (me.GetRace() == da04script.Dunmer)
		return true
	elseif (me.GetRace() == da04script.Falmer)
		return true
	elseif (me.GetRace() == da04script.Orsimer)
		return true
	endif

	return false	
EndFunction


Function InitializeOrShutdownQuest()
;/ 	if !IsElf()
 		Debug.Trace("DA04BH: Killed actor is not an elf, shutting down.")
		GetOwningQuest().SetStage(100)
		return
	endif
	
 	Debug.Trace("DA04BH: Killed an elf, let's keep moving here.")
	GetReference().BlockActivation()
	minutesSinceDeath = 0
	GetRef().RegisterForUpdate(updateInterval)
	
	GetOwningQuest().SetStage(10) /;
EndFunction

Event OnUpdate()
;/ 	minutesSinceDeath += 1
	if (minutesSinceDeath >= minutesOfFreshness)
		GetOwningQuest().SetStage(100)
	endif /;
EndEvent

Function Cleanup()
;/ 	Debug.Trace("DA04BH: Shutting down blood harvest quest.")
	GetReference().BlockActivation(False) /;
EndFunction

Event OnActivate(ObjectReference akActivator)
;/ 	DA04QuestScript da04script = ParentQuest as DA04QuestScript

	int response = HarvestMessage.Show()
	if (response == 0)
		ActorBase me = GetActorReference().GetLeveledActorBase()
		MiscObject bloodType = None
		if (me.GetRace() == da04script.Altmer)
			bloodType = da04script.AltmerBlood
		elseif (me.GetRace() == da04script.Bosmer)
			bloodType = da04script.BosmerBlood
		elseif (me.GetRace() == da04script.Dunmer)
			bloodType = da04script.DunmerBlood
		elseif (me.GetRace() == da04script.Falmer)
			bloodType = da04script.FalmerBlood
		elseif (me.GetRace() == da04script.Orsimer)
			bloodType = da04script.OrsimerBlood
		endif
		
		; Game.GetPlayer().AddItem(bloodType, 1)
		da04script.GotBlood(bloodType)
		
		GetOwningQuest().SetStage(100)
	endif /;
EndEvent
