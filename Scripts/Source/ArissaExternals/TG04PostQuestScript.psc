Scriptname TG04PostQuestScript extends Quest  Conditional

int Property pTG04PostChoice Auto Conditional
Armor Property pTGArmorHoodOld Auto
Armor Property pTGArmorHoodNew Auto
Armor Property pTGArmorCuirassOld Auto
Armor Property pTGArmorCuirassNew Auto
Armor Property pTGArmorBootsOld Auto
Armor Property pTGArmorBootsNew Auto
Armor Property pTGArmorGauntletsOld Auto
Armor Property pTGArmorGauntletsNew Auto

Function ArmorChoice()

	if pTG04PostChoice == 1
		Game.GetPlayer().RemoveItem(pTGArmorHoodOld,1)
		Game.GetPlayer().AddItem(pTGArmorHoodNew,1)
	elseif  pTG04PostChoice == 2
		Game.GetPlayer().RemoveItem(pTGArmorCuirassOld,1)
		Game.GetPlayer().AddItem(pTGArmorCuirassNew,1)
	elseif  pTG04PostChoice == 3
		Game.GetPlayer().RemoveItem(pTGArmorGauntletsOld,1)
		Game.GetPlayer().AddItem(pTGArmorGauntletsNew,1)
	elseif  pTG04PostChoice == 4
		Game.GetPlayer().RemoveItem(pTGArmorBootsOld,1)
		Game.GetPlayer().AddItem(pTGArmorBootsNew,1)
	endif

	SetStage(200)

endFunction