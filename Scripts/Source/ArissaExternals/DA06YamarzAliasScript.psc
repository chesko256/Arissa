Scriptname DA06YamarzAliasScript extends ReferenceAlias  

Quest Property DA06  Auto  





Event OnDeath(Actor AkKiller)

DA06QuestScript DA06Script = DA06 as DA06QuestScript



		if DA06.GetStage() == 90
			if DA06Script.GiantDead100 == 0
				DA06.SetStage(100)
			endif	
		endif

Actor GiantActor = Giant.GetReference() as Actor

		if GiantActor.IsDead() == true
			DA06HammerGroveScene.Start()
		endif


EndEvent
ReferenceAlias Property Giant  Auto  

Scene Property DA06HammerGroveScene  Auto  
