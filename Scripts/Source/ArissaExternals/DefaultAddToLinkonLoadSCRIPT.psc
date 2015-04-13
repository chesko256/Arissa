scriptname DefaultAddToLinkonLoadSCRIPT extends objectReference
{Add the reference to the linked container or actor inventory on Load}
import Debug
import Utility

bool Property ShouldEquip = FALSE Auto
{
OPTIONAL: Set to TRUE if you want the actor to equip this item also. (DEFAULT = FALSE)
Warning! - Has to be an actor!
}
bool Property ForceEquip = FALSE Auto
{
OPTIONAL: If set to TRUE the actor cannot unequip this themselves (ShouldEquip MUST be TRUE also). (DEFAULT = FALSE)
Warning! - Has to be an actor!
}
bool Property AlreadyLoaded = FALSE Auto hidden
;;bool Property AllowDuplicates = FALSE Auto
;;{Check TRUE if you want the script to add the item even if the LinkRef already has one in its inventory (Default FALSE)}

Event onCellLoad()

	if AlreadyLoaded == FALSE
		getLinkedRef().addItem(self, 1, true)
		;Trace("DARYL - " + self + " added to " + GetLinkedRef())
		
		if (ShouldEquip == TRUE)
			(getLinkedRef() as Actor).EquipItem(self.GetBaseObject(), ForceEquip)
			;Trace("DARYL - " + self + " equipping onto " + GetLinkedRef())
		endif
		AlreadyLoaded = TRUE
	endif
	
endEvent
