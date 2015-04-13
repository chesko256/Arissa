Scriptname MGRitual03EffectScript extends ReferenceAlias

Quest Property MGRitual03  Auto


Function DremoraSummon()

	MGRitualSummonMarker.PlaceAtMe(SummonTargetFXActivator, 1)
	Utility.Wait(0.33)
	DremoraAlias.ForceRefTo(MGRitualSummonMarker.PlaceAtMe(MGRDremoraSummon, 1))
	If (MGRitual03 as MGRitual03QuestScript).DremoraFlag >= 6
	DremoraAlias.GetActorReference().SetGhost()
	endif

EndFunction



Event OnSpellCast(Form AkSpell)

MGRitual03QuestScript QuestScript = MGRitual03 as MGRitual03QuestScript

	if QuestScript.DremoraSummoned==0
		if QuestScript.InTrigger == 1
			if AkSpell == MGRSummonDremora
				if QuestScript.DremoraFlag == 0
					DremoraSummon()
					QuestScript.DremoraFlag= 1	
				elseif QuestScript.DremoraFlag == 3
					DremoraSummon()
					QuestScript.DremoraFlag= 4
				elseif QuestScript.DremoraFlag == 6
					DremoraSummon()
					QuestScript.DremoraFlag= 7
				elseif QuestScript.DremoraFlag == 8
					DremoraSummon()
					QuestScript.DremoraFlag= 10
				endif
			endif
		endif
	endif
EndEvent
objectReference Property MGRitualSummonMarker  Auto  

ActorBase Property MGRDremoraSummon  Auto  

activator Property SummonTargetFXActivator  Auto  

Spell Property MGRSummonDremora  Auto
ReferenceAlias Property DremoraAlias  Auto  
