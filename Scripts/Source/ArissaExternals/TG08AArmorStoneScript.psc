Scriptname TG08AArmorStoneScript extends ReferenceAlias  

ReferenceAlias Property TGNightingaleBoots  Auto  
ReferenceAlias Property TGNightingaleCuirass  Auto  
ReferenceAlias Property TGNightingaleGloves  Auto  
ReferenceAlias Property TGNightingaleHelmet  Auto  
Quest Property pTG08AQuest  Auto  
TG08AQuestScript Property pTG08AQS  Auto  
int Property pTG08AActivated Auto

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG08AActivated == 0
			if pTG08AQuest.GetStage() >=40 && pTG08AQuest.GetStage() < 45
				Game.GetPlayer().AddItem(TGNightingaleBoots.GetRef())
				Game.GetPlayer().AddItem(TGNightingaleCuirass.GetRef())
				Game.GetPlayer().AddItem(TGNightingaleGloves.GetRef())
				Game.GetPlayer().AddItem(TGNightingaleHelmet.GetRef())
				pTG08AQuest.SetObjectiveCompleted(40,1)
				pTG08AQuest.SetObjectiveDisplayed(42,1)
				pTG08AQS.pTG08AStoneDone = 1
				pTG08AActivated = 1
			endif
		endif
	endif

endEvent