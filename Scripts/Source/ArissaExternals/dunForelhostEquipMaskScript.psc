scriptName dunForelhostEquipMaskScript extends referenceAlias
{this script should get the dragon priest to equip his mask}

armor property DragonPriestMaskGreenstone01 auto

event onLoad()
	if (self.getReference() as actor).getItemCount(DragonPriestMaskGreenstone01) >= 1
		(self.getReference() as actor).equipItem(DragonPriestMaskGreenstone01)
	endif
endEvent
