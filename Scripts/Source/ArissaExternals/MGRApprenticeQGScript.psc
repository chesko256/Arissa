Scriptname MGRApprenticeQGScript extends ReferenceAlias  

Quest Property MGRQuest  Auto  


Event OnDeath (Actor Killer)

	MGRQuest.SetStage(255)

EndEvent