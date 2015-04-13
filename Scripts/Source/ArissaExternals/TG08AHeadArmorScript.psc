Scriptname TG08AHeadArmorScript extends ReferenceAlias  Conditional

Quest Property pTG08AQuest  Auto  

Event OnEquipped(Actor akActor)

	if akActor == Game.GetPlayer()
		(pTG08AQuest as TG08AQuestScript).pTG08AHeadEquip = 1
		(pTG08AQuest as TG08AQuestScript).TG08AArmor()
	endif

endEvent