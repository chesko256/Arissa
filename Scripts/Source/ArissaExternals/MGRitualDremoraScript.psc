Scriptname MGRitualDremoraScript extends ObjectReference  

activator Property SummonTargetFXActivator  Auto  

quest Property MGRitual03  Auto

Event OnLoad()

MGRitual03QuestScript QuestScript = MGRitual03 as MGRitual03QuestScript

	if QuestScript.DremoraSummoned == 0
		QuestScript.DremoraSummoned=1
	endif

EndEvent




Event OnDying(Actor Killer)

	
	BlockActivation(true) 

EndEvent


Event OnDeath(actor Killer)

MGRitual03QuestScript QuestScript = MGRitual03 as MGRitual03QuestScript

	QuestScript.DremoraFlag += 1
	if QuestScript.DremoraSummoned==1
		QuestScript.DremoraSummoned=0
	endif


	if MGRitual03.GetStage() == 20
		MGRitual03.SetStage(30)
	endif

	if MGRitual03.GetStage() == 40
		MGRitual03.SetStage(50)
	endif


	Self.PlaceAtMe(SummonTargetFXActivator,1)
	Utility.Wait(0.33)
	Self.Disable()


EndEvent