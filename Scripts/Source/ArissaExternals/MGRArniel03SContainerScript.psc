Scriptname MGRArniel03SContainerScript extends ObjectReference  Conditional

ReferenceAlias Property SoulGemStage1  Auto  

ReferenceAlias Property SoulGemStage2  Auto  

Quest Property MGRArniel03  Auto  

ReferenceAlias Property SoulGemStage3  Auto  

ReferenceAlias Property SoulGemStage4  Auto  

int Counter

int Property Used Auto Conditional

Event OnInit()
	AddInventoryEventFilter(MGRArniel03SoulGemList)
EndEvent



Event OnItemAdded(Form BaseItem, int ItemCount, ObjectReference ItemReference, ObjectReference SourceContainer)
	if Used == 0
		if ItemReference == SoulGemStage1.GetReference()
			if MGRArniel03.IsObjectiveDisplayed(10) == 1
				MGRArniel03.SetObjectiveDisplayed(10,0)
				MGRArniel03.SetObjectiveDisplayed(20)
			endif
		endif
		if ItemReference == SoulGemStage2.GetReference()
			if MGRArniel03.IsObjectiveDisplayed(13) == 1
				MGRArniel03.SetObjectiveDisplayed(13,0)
				MGRArniel03.SetObjectiveDisplayed(20)
			endif
		elseif ItemReference == SoulGemStage3.GetReference()
			if MGRArniel03.IsObjectiveDisplayed(16) == 1
				MGRArniel03.SetObjectiveDisplayed(16,0)
				MGRArniel03.SetObjectiveDisplayed(20)
			endif
		endif
	endif

EndEvent

Event OnMagicEffectApply(ObjectReference Caster, MagicEffect Effect)

; Debug.Trace("Magic Effect hitting convector")


; if the proper effect is applied

	if Effect == FlameEffect

	Counter +=1
	if Counter > 15

; Debug.trace("Quest Effect hitting convector")

; and we're at the proper stage

		if MGRArniel03.IsObjectiveDisplayed(20) == 1

			MGRArniel03Script QuestScript = MGRArniel03 as MGRArniel03Script


			if QuestScript.SoulGemStage ==3
				if GetItemCount(SoulGemStage3.GetReference()) > 0
					RemoveAllItems()
					ObjectReference Obj = Game.GetPlayer().PlaceAtMe(SoulGemBase4)
					SoulGemStage4.ForceRefTo(Obj)
					AddItem(Obj)
					QuestScript.SoulGemStage= 4
					MGRArniel03.SetObjectiveDisplayed(20,0)
					MGRArniel03.SetObjectiveDisplayed(30)
					Used=1
				endif
			endif



			if QuestScript.SoulGemStage == 2
				if GetItemCount(SoulGemStage2.GetReference()) > 0
					RemoveAllItems()
					ObjectReference Obj = Game.GetPlayer().PlaceAtMe(SoulGemBase3)
					SoulGemStage3.ForceRefTo(Obj)
					AddItem(Obj)
					QuestScript.SoulGemStage= 3
					MGRArniel03.SetObjectiveDisplayed(20,0)
					MGRArniel03.SetObjectiveDisplayed(30)
					Used=1
				endif
			endif


			if QuestScript.SoulGemStage == 1
				if GetItemCount(SoulGemStage1.GetReference()) > 0
					RemoveAllItems()
					ObjectReference Obj = Game.GetPlayer().PlaceAtMe(SoulGemBase2)
					SoulGemStage2.ForceRefTo(Obj)
					AddItem(Obj)
					QuestScript.SoulGemStage= 2
					MGRArniel03.SetObjectiveDisplayed(20,0)
					MGRArniel03.SetObjectiveDisplayed(30)
					Used=1
				endif
			endif




		endif
	endif
	endif

EndEvent

Event OnItemRemoved(Form BaseItem, int ItemCount, ObjectReference ItemReference, ObjectReference TargetContainer)

; If we're pulling the original gem out, it means nothing has been done yet, set stage to put gem in

	if ItemReference == SoulGemStage1.GetReference()
		if MGRArniel03.IsObjectiveDisplayed(20) == 1
				MGRArniel03.SetObjectiveDisplayed(20,0)
				MGRArniel03.SetObjectiveDisplayed(10)
				Counter=0
		endif
	endif

; If we're removing the 2nd stage gem, it means the operation was a success - set stage to 10 for next convector

	if ItemReference == SoulGemStage2.GetReference()
		if MGRArniel03.IsObjectiveDisplayed(30) == 1
			MGRArniel03.SetObjectiveDisplayed(30,0)
			MGRArniel03.SetObjectiveDisplayed(13)
				Counter=0
		endif
	endif

; Same goes for 3rd stage gem

	if ItemReference == SoulGemStage3.GetReference()
		if MGRArniel03.IsObjectiveDisplayed(30) == 1
				MGRArniel03.SetObjectiveDisplayed(30,0)
				MGRArniel03.SetObjectiveDisplayed(16)
		endif
	endif

; And if it's the 4th stage, point the player back to Arniel

	if ItemReference == SoulGemStage4.GetReference()
		if MGRArniel03.IsObjectiveDisplayed(30) == 1
			if ( MGRArniel03.GetStage() < 40)
				MGRArniel03.SetStage(40)
			endif
		endif
	endif

EndEvent
MagicEffect Property FlameEffect  Auto  
MiscObject Property SoulGemBase2 Auto
MiscObject Property SoulGemBase3 Auto
MiscObject Property SoulGemBase4 Auto
FormList Property MGRArniel03SoulGemList  Auto  
