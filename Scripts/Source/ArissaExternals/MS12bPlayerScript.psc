Scriptname MS12bPlayerScript extends ReferenceAlias  

Ingredient Property BriarHeart auto
ReferenceAlias Property Ingredient3 auto

bool __done = false

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if (akBaseItem == BriarHeart && !__done)
		__done = true
		GetReference().RemoveItem(BriarHeart, 1, true)
		ObjectReference heart = Game.GetPlayer().PlaceAtMe(BriarHeart)
		Ingredient3.ForceRefTo(heart)
		(GetOwningQuest() as MS12bQuestScript).GotIngredient(heart)
		GetReference().AddItem(heart, 1, true)
	endif
EndEvent
