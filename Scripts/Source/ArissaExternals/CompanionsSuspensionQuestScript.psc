Scriptname CompanionsSuspensionQuestScript extends Quest  

Event OnStoryCrimeGold(ObjectReference akVictim, ObjectReference akCriminal, Form akFaction, int aiGoldAmount, int aiCrime)
	if (aiCrime == 0 || aiCrime == 1)
		; handle theft -- repay value
	elseif (aiCrime == 2)
		; handle trespass -- Companions don't care
	elseif (aiCrime == 3)
		; handle assault -- start a single combat
	elseif (aiCrime == 4)
		; handle murder -- kicked out, have to rejoin
	endif
EndEvent
