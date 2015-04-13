Scriptname FXChaurusScript extends ActiveMagicEffect  
{This script managage the fx art for the Charus}
;===============================================

;===============================================

Actor selfRef
Armor Property ChaurusSpitSkin  Auto  


	EVENT OnEffectStart(Actor Target, Actor Caster)
		selfRef = caster
		if (selfRef.GetSleepState() == 3)
; 			Debug.Trace("Charus is sleeping! 3")
		else
			selfRef.EquipItem(ChaurusSpitSkin)
		endIf
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		selfRef.UnequipItem(ChaurusSpitSkin)	
	endEvent
	
	Event OnGetUp(ObjectReference akFurniture)
; 		Debug.Trace("Charus just got up from " )
		selfRef.EquipItem(ChaurusSpitSkin)
	endEvent
	
	EVENT onDeath(actor myKiller)
		selfRef.UnequipItem(ChaurusSpitSkin)	
	ENDEVENT
	
