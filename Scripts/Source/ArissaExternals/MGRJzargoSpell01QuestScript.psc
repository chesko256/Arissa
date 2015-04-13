Scriptname MGRJzargoSpell01QuestScript extends Quest  Conditional

int Property HelpAsked  Auto  Conditional

int Property EffectTriggered  Auto  Conditional

GlobalVariable Property MGRJ1Test  Auto

GlobalVariable Property MGRJ1Total  Auto



;SCRIPTING FOR SPELL IS ON MAGIC EFFECT 'MGRJZARGOFIREDAMAGECONCAIMED'


Function VCount()

	ModObjectiveGlobal(1, MGRJ1Test, 20)
	if MGRJ1Test.value == MGRJ1Total.value
		SetStage (30)
	endif

EndFunction