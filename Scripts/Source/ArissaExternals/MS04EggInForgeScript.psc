Scriptname MS04EggInForgeScript extends ReferenceAlias  

Message Property EggTooHotMessage  Auto  

Message Property EggChoiceMessage  Auto  

int choice		; what did the player choose?

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		if GetOwningQuest().GetStage() < 160
		else
			choice = EggChoiceMessage.Show()
			if choice == 1
				GetOwningQuest().SetStage(170)
			elseif choice == 2
				GetOwningQuest().SetStage(175)
			endif
		endif
	endif
endEvent

