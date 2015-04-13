ScriptName AnimalTrainerSystemScript extends Quest Conditional

GlobalVariable Property AnimalGold Auto
MiscObject Property Gold Auto
Quest Property pDialogueFollower Auto

Function BuyAnimal(Actor  AnimalTrainer)

	Game.GetPlayer().RemoveItem(Gold, AnimalGold.value as int)	
	AnimalTrainer.GetLinkedRef().SetActorOwner(Game.GetPlayer().GetActorBase())
	;AnimalTrainer.SetActorValue("Variable04", 1)
	(pDialogueFollower as DialogueFollowerScript).SetAnimal(AnimalTrainer.GetLinkedRef())

EndFunction