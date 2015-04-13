Scriptname BoundBowEffectScript extends ActiveMagicEffect  
; Modder's Note - this feature was removed for functionality reasons.  However; I'm leaving the script in for anybody who may want to play with bound arrows. -JB


Ammo Property boundArrow  Auto  
MagicEffect Property BoundBowFFSelf  Auto  

EVENT OnEffectStart(Actor Target, Actor Caster)
; 	debug.trace("Bound Bow - Effect Starting - add and equip bound arrows")
	caster.additem(boundArrow,100,TRUE)
	caster.equipItem(boundArrow, TRUE, TRUE)
endEVENT

EVENT onLoad()
; 	debug.trace("Bound Bow caught Cell Attach")
	if !(getCasterActor().hasMagicEffect(BoundBowFFSelf))
; 		debug.trace("Bound Bow - Cell Attached, script active, but effect not found on "+getCasterActor())
		dispel()
	endif
endEVENT

EVENT OnEffectFinish(Actor Target, Actor Caster)
; 	debug.trace("Bound Bow - Effect Finishing, remove any bound arrows")
	caster.removeitem(boundArrow,caster.getItemCount(boundArrow),TRUE)
endEVENT

