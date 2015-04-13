scriptName dunSleepingTreeSapDruggedEffect extends ActiveMagicEffect
;
;
;=============================================================


imageSpaceModifier property dunSleepingTreeCampISMD auto

event onEffectStart(actor akTarget, actor akCaster)
	if akTarget == game.GetPlayer()
		dunSleepingTreeCampISMD.applyCrossFade(2.0)
	endif
EndEvent


event onEffectFinish(actor akTarget, actor akCaster)
	if akTarget == game.GetPlayer()
		imageSpaceModifier.removeCrossFade(2.0)
	endif
endEvent
