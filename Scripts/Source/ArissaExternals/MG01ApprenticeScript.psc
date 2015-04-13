Scriptname MG01ApprenticeScript extends ReferenceAlias  Conditional

quest Property MG01  Auto  


Event OnDeath(Actor Killer)

	(MG01 as MG01QuestScript).ApprenticeKilled=1

EndEvent