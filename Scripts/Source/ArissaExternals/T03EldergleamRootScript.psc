Scriptname T03EldergleamRootScript extends ObjectReference  

Quest Property t03 Auto
T03QuestScript t03script
Weapon Property ItemNeededToCut Auto
Message Property CutChoiceMessage Auto
Message Property CantCutMessage Auto
ReferenceAlias Property Sap Auto

Event OnActivate(ObjectReference akActionRef)
	if (Game.GetPlayer().GetItemCount(ItemNeededToCut) > 0)
		int response = CutChoiceMessage.Show()
		if (response == 0)
			t03script = t03 as T03QuestScript
			if (!t03script.RootOpened)
				t03script.RootOpened = true
				Sap.GetReference().Enable()
				t03script.MauriceShouldAdmonish = true
				t03script.MauriceShouldIntro = false  ; should have already been deactivated, but just in case
				Disable()
			endif
		endif
	else
		CantCutMessage.Show()
	endif
endEvent