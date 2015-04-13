Scriptname CWAttackCityScript extends CWMissionScript  Conditional
{Extends CWMissionScript which extends Quest}

;REMINDER extends CWMissionScript so has properties like CWs

;ObjectReference Property CWTempWhiterunCastleDoor Auto

Scene Property CWAttackCityConfrontationScene Auto
Scene Property CWAttackCitySurrenderScene Auto
Scene Property CWAttackCityJarlBleedingOutScene Auto
Quest Property CWSiegeObj Auto

ReferenceAlias Property CWSiegeObjJarl Auto
{Alias Jarl in CWSiegeObj quest}

int property jarlWillSurrender Auto hidden Conditional
int property jarlHasSurrendered Auto hidden Conditional

LocationAlias Property City Auto

ActorBase Property CWSiegeWhiterunImperialSoldier  Auto  

ActorBase Property CWSiegeSonsSoldier Auto

MusicType Property MUSCombatCivilWar  Auto  

Outfit Property ArmorBalgruufSteelPlateNoHelmetOutfit Auto
Outfit Property JarlClothesBalgruuf Auto

CWSiegeScript Property CWSiegeS Auto

Weather Property SkyrimOvercastWar  Auto  



;THIS WAS A WHILE LOOP IN STAGE 9000 BUT BECAUSE THAT WAS ULTIMATE TRIGGERED BY A SCENE END SCRIPT, THE SCENE WOULD HANG INDEFINATELY
Event OnUpdate()  ;REGISTERED IN STAGE 9000
	while Game.GetPlayer().IsInLocation(City.GetLocation())
; 		CWScript.Log("AttackCity", "OnUpdate() initiated by stage 9000: Waiting for player to leave City before stoping CWSiege and CWAttackCity quest")
		utility.wait(5)
	endwhile
	
; 	CWScript.Log("AttackCity", "OnUpdate() initiated by stage 9000: stoping CWSiege and CWAttackCity quest")

	
	CWSiegeS.Stop()
	stop()
	
EndEvent
