Scriptname SoulSwordQuestScript extends Quest  Conditional

ObjectReference Property SoulSword  Auto  
{sword's reference}

int Property Power  Auto  Conditional
{current power level of sword}


; call this when the sword kills something
function IncreasePower(actor akVictim)
	; TODO - make victim matter
	; for now, just add to power
	power = power + 1
endFunction