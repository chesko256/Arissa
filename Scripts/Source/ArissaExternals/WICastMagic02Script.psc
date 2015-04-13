Scriptname WICastMagic02Script extends WorldInteractionsScript  
{Extends WorldInteractionsScript which extends Quest}

Keyword Property WISpellDangerous Auto

float tempUpdateCount

Event OnUpdate()

;THIS IS BRAND NEW, might not work for a few builds
;	if Game.GetPlayer().HasEffectKeyword(WISpellDangerous) == False	
;		stop()
;	EndIf

	tempUpdateCount += 1

	if tempUpdateCount > 20
		unregisterForUpdate()
		stop()
	EndIf
	
EndEvent
