Scriptname WEDogFollowerScript extends ObjectReference

DialogueFollowerScript Property DialogueFollower Auto
GlobalVariable Property PlayerAnimalCount Auto
;Actor property dog auto

auto state Waiting
event onActivate(objectReference AkActivator)
	;if player does not have an animal, make this animal player's animal
	If PlayerAnimalCount.GetValueInt() == 0
		(DialogueFollower as DialogueFollowerScript).SetAnimal(self)
		gotostate ("done")
	EndIF
endEvent
endState

state done
endstate
