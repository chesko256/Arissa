Scriptname MQ201DrinkScript extends ReferenceAlias  
{clear the alias when player drinks this (if necessary)}

Event OnEquipped(Actor akActor)
; 	debug.trace(self + " OnEquipped?")
	(GetOwningQuest() as MQ201QuestScript).RemoveDrinkFromPlayer()
endEvent