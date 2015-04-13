Scriptname MS12bQuestScript extends Quest  

Quest Property RealQuest auto

Quest Property CourierQuest auto
Book Property QuintusLetter auto
int Property CourierDelayInDays auto
ReferenceAlias Property CourierLetterAlias auto
ReferenceAlias Property Player auto

MiscObject Property UnmeltingSnow auto
MiscObject Property TuskPowder auto
Ingredient Property BriarHeart auto

Function Setup()
	(CourierQuest as WICourierScript).AddItemToContainer(CourierLetterAlias.GetReference())
	Player.AddInventoryEventFilter(BriarHeart)
EndFunction

; 75977: Player unable to complete objectives if getting ingredients early
Function FixEarlyCollection()
	if (GetStage() != 30)
		return
	endif
	if (Game.GetPlayer().GetItemCount(UnmeltingSnow) > 0)
		GotIngredientBase(UnmeltingSnow)
	endif
	if (Game.GetPlayer().GetItemCount(TuskPowder) > 0)
		GotIngredientBase(TuskPowder)
	endif
	if (Game.GetPlayer().GetItemCount(BriarHeart) > 0)
		GotIngredientBase(BriarHeart)
	endif
EndFunction

; this is a total dupe of the GotIngredient() function, but it takes the base
;   object instead of object reference. For the sake of the patch, I didn't 
;   want to mess with the existing function if I could avoid it, so here 
;   we are.
Function GotIngredientBase(Form obj)
	if (obj == UnmeltingSnow)
		SetObjectiveCompleted(30)
	elseif (obj == TuskPowder)
		SetObjectiveCompleted(40)
	elseif (obj == BriarHeart)
		SetObjectiveCompleted(50)
	endif
	
	if (IsObjectiveCompleted(30) && IsObjectiveCompleted(40) && IsObjectiveCompleted(50)	)
		SetStage(60)
	endif
EndFunction
; /75977

Function GotIngredient(ObjectReference obj)
; 	Debug.Trace("MS12b: Got ingredient -- " + obj)
	if (obj.GetBaseObject() == UnmeltingSnow)
		SetObjectiveCompleted(30)
	elseif (obj.GetBaseObject() == TuskPowder)
		SetObjectiveCompleted(40)
	elseif (obj.GetBaseObject() == BriarHeart)
		SetObjectiveCompleted(50)
	endif
	
	if (IsObjectiveCompleted(30) && IsObjectiveCompleted(40) && IsObjectiveCompleted(50)	)
		SetStage(60)
	endif
EndFunction

Function Cleanup()
	Player.RemoveInventoryEventFilter(BriarHeart)
EndFunction
