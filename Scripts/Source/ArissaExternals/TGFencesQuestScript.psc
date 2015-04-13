Scriptname TGFencesQuestScript extends Quest  Conditional

ObjectReference Property pGulumEnabler Auto Conditional
ObjectReference Property pMallusEnabler Auto Conditional
ObjectReference Property pEnthirEnabler Auto Conditional
ObjectReference Property pNiranyeEnabler Auto Conditional
ObjectReference Property pEndonEnabler Auto Conditional
ObjectReference Property pKhajiitEnabler Auto Conditional
Faction Property pJobFenceFaction Auto Conditional
Faction Property pJobMiscFaction Auto Conditional
Faction Property pJobMerchantFaction Auto Conditional
Faction Property pTGFaction Auto Conditional
Faction Property pGulumServiceFaction Auto Conditional
Faction Property pMallusServiceFaction Auto Conditional
Faction Property pEnthirServiceFaction Auto Conditional
Faction Property pNiranyeServiceFaction Auto Conditional
Faction Property pNiranyeOldServiceFaction Auto Conditional
Faction Property pEndonServiceFaction Auto Conditional
Faction Property pAtahbaServiceFaction Auto Conditional
Faction Property pMajhadServiceFaction Auto Conditional
Faction Property pZaynabiServiceFaction Auto Conditional
int Property pGulumReady Auto Conditional
int Property pMallusReady Auto Conditional
int Property pEnthirReady Auto Conditional
int Property pNiranyeReady Auto Conditional
int Property pEndonReady Auto Conditional
int Property pKhajiitReady Auto Conditional
ReferenceAlias Property pGulumEi Auto Conditional
ReferenceAlias Property pMallus Auto Conditional
ReferenceAlias Property pEnthir Auto Conditional
ReferenceAlias Property pNiranye Auto Conditional
ReferenceAlias Property pEndon Auto Conditional
ReferenceAlias Property pAtahba Auto Conditional
ReferenceAlias Property pMajhad Auto Conditional
ReferenceAlias Property pZaynabi Auto Conditional
ObjectReference Property pEndonMarker Auto Conditional
ObjectReference Property pGulumEiMarker Auto Conditional
ObjectReference Property pHonningMarker Auto Conditional

Function GulumSetup()

	if pGulumReady == 0
		pGulumEnabler.Enable()
		pGulumEiMarker.Enable()
		pGulumEi.GetActorRef().AddToFaction(pJobFenceFaction)
		pGulumEi.GetActorRef().AddToFaction(pJobMiscFaction)
		pGulumEi.GetActorRef().AddToFaction(pJobMerchantFaction)
		pGulumEi.GetActorRef().AddToFaction(pTGFaction)
		pGulumEi.GetActorRef().AddToFaction(pGulumServiceFaction)
		pGulumReady = 1
	endif

endFunction

Function MallusSetup()

	if pMallusReady == 0
		pMallusEnabler.Enable()
		pHonningMarker.Enable()
		pMallus.GetActorRef().AddToFaction(pJobFenceFaction)
		pMallus .GetActorRef().AddToFaction(pJobMiscFaction)
		pMallus .GetActorRef().AddToFaction(pJobMerchantFaction)
		pMallus .GetActorRef().AddToFaction(pTGFaction)
		pMallus .GetActorRef().AddToFaction(pMallusServiceFaction)
		pMallusReady = 1
	endif

endFunction

Function EnthirSetup()

	if pEnthirReady == 0
		pEnthirEnabler.Enable()
		pEnthir.GetActorRef().AddToFaction(pJobFenceFaction)
		pEnthir.GetActorRef().AddToFaction(pJobMiscFaction)
		pEnthir.GetActorRef().AddToFaction(pJobMerchantFaction)
		pEnthir.GetActorRef().AddToFaction(pTGFaction)
		pEnthir.GetActorRef().AddToFaction(pEnthirServiceFaction)
		pEnthirReady = 1
	endif

endFunction

Function NiranyeSetup()

	if pNiranyeReady == 0
		pNiranyeEnabler.Enable()
		pNiranye.GetActorRef().AddToFaction(pJobFenceFaction)
		pNiranye.GetActorRef().AddToFaction(pJobMerchantFaction)
		pNiranye.GetActorRef().AddToFaction(pTGFaction)
		pNiranye.GetActorRef().AddToFaction(pNiranyeServiceFaction)
		pNiranye.GetActorRef().RemoveFromFaction(pNiranyeOldServiceFaction)
		pNiranyeReady = 1
	endif

endFunction

Function EndonSetup()

	if pEndonReady == 0
		pEndonEnabler.Enable()
		pEndonMarker.Enable()
		pEndon.GetActorRef().AddToFaction(pJobFenceFaction)
		pEndon.GetActorRef().AddToFaction(pJobMiscFaction)
		pEndon.GetActorRef().AddToFaction(pJobMerchantFaction)
		pEndon.GetActorRef().AddToFaction(pTGFaction)
		pEndon.GetActorRef().AddToFaction(pEndonServiceFaction)
		pEndonReady = 1
	endif

endFunction

Function KhajiitSetup()

	if pKhajiitReady == 0
		pKhajiitEnabler.Enable()
		pAtahba.GetActorRef().AddToFaction(pJobFenceFaction)
		pAtahba.GetActorRef().AddToFaction(pJobMiscFaction)
		pAtahba.GetActorRef().AddToFaction(pJobMerchantFaction)
		pAtahba.GetActorRef().AddToFaction(pAtahbaServiceFaction)
		pMajhad.GetActorRef().AddToFaction(pJobFenceFaction)
		pMajhad.GetActorRef().AddToFaction(pJobMiscFaction)
		pMajhad.GetActorRef().AddToFaction(pJobMerchantFaction)
		pMajhad.GetActorRef().AddToFaction(pMajhadServiceFaction)
		pZaynabi.GetActorRef().AddToFaction(pJobFenceFaction)
		pZaynabi.GetActorRef().AddToFaction(pJobMiscFaction)
		pZaynabi.GetActorRef().AddToFaction(pJobMerchantFaction)
		pZaynabi.GetActorRef().AddToFaction(pZaynabiServiceFaction)
		pKhajiitReady = 1
	endif

endFunction