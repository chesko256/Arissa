Scriptname DWRCGScript extends Quest  Conditional

Outfit Property pStormcloakOutfit Auto
Outfit Property pSteelArmorOutfit Auto
ReferenceAlias Property pCaius Auto
ReferenceAlias Property pSinmir Auto
Faction Property pCaptainGuardFaction Auto

;This function will set the Captains of the Guard
;Commander Caius moves to the Bannered Mare and Sinmir moves to Dragonsreach
Function StormcloakGo()

	pCaius.GetActorRef().SetOutfit(pSteelArmorOutfit,false)
	pCaius.GetActorRef().RemoveFromFaction(pCaptainGuardFaction)

	pSinmir.GetActorRef().SetOutfit(pStormcloakOutfit,false)
	pCaius.GetActorRef().AddToFaction(pCaptainGuardFaction)

endFunction