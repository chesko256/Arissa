Scriptname TG06CalcelmosStoneScript extends ObjectReference  Conditional

Message Property pTG06StoneHeavyMessage  Auto  
Message Property pTG06StoneRubFailMessage  Auto  Conditional
Message Property pTG06StoneRubMessage  Auto  
Quest Property pTG06Quest  Auto  
MiscObject Property pTG06Charcoal  Auto  
MiscObject Property pTG06PaperRoll  Auto
int Property pTG06HaveStuff Auto
Sound Property pQSTTG06CharcoalRub Auto


event onActivate (objectReference activateRef)

	if activateRef == Game.GetPlayer()
		if pTG06HaveStuff == 0
			if Game.GetPlayer().GetItemCount(pTG06Charcoal) >= 1 && Game.GetPlayer().GetItemCount(pTG06PaperRoll) >= 1
				pTG06HaveStuff = 1
			endif			
		endif
	endif

	if activateRef == Game.GetPlayer()
		if pTG06Quest.GetStage() >= 30 && pTG06Quest.GetStage() < 50
			if pTG06HaveStuff == 1
;				pTG06StoneRubMessage.Show()
				pQSTTG06CharcoalRub.Play(Self)
				Game.GetPlayer().RemoveItem(pTG06Charcoal,1)
				Game.GetPlayer().RemoveItem(pTG06PaperRoll,1)
				TG06QuestScript pTG06Script = pTG06Quest as TG06QuestScript
				pTG06Quest.setstage(50)
			elseif pTG06Quest.GetStageDone(40) == 0 && pTG06HaveStuff == 0
				pTG06StoneRubFailMessage.Show()
				pTG06Quest.SetStage(40)
			elseif pTG06Quest.GetStageDone(40) == 1 && pTG06HaveStuff == 0
				pTG06StoneRubFailMessage.Show()				
			endif
		endif
	endif

endevent