scriptName dunAnsilvundDraugrDeathSCRIPT extends objectReference
;
;
;
;===============================================================

objectReference property WhiteSoulGem auto
objectReference property BlackSoulGem auto

event onDeath ()
	self.addItem(WhiteSoulGem)
	self.removeItem(BlackSoulGem)
endevent
