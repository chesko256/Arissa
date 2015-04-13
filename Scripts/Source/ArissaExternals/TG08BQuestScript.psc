Scriptname TG08BQuestScript extends Quest  Conditional

ActorBase Property pTG08BMercer Auto Conditional
Faction Property pTG08BFalmerFaction Auto Conditional
Faction Property pTG08BCreatureFaction Auto Conditional
int Property pTG08BKarliahFG01 Auto Conditional
int Property pTG08BKarliahAccompany Auto Conditional
int Property pTG08BMercerFG01 Auto Conditional
int Property pTG08BKarliahFG02 Auto Conditional
int Property pTG08BScene02Done Auto Conditional
int Property pTG08BNoCheck Auto Conditional
Cell Property pTG08Irkngthand  Auto  Conditional
Quest Property pTG09Quest  Auto  Conditional
Quest Property pTG08BQuest Auto Conditional
MiscObject Property pTG08BSkeletonKey  Auto  Conditional
ObjectReference Property pTG08BKarliahRef Auto Conditional
ObjectReference Property pTG08BRisingWaterRef Auto Conditional
ObjectReference Property pTG08BMonsterDisablerRef Auto Conditional
ObjectReference Property pTG08BKarliahFinal Auto Conditional
ObjectReference Property pTG08BBrynjolfFinal Auto Conditional
Scene Property pTG08BFinalScene01 Auto Conditional
GlobalVariable Property pTGFavorLarge Auto Conditional
objectReference Property pTG08BridgeEnableRef  Auto  Conditional
objectReference Property pTG08bIrkngthandLockedDoorRef  Auto  Conditional
Faction Property pTG08BTGFaction  Auto  Conditional
ObjectReference Property pTG08BKarliahFightMarker  Auto  
ObjectReference Property pTG08BBrynjolfFightMarker  Auto  
Scene Property pTG08bFloodScene01  Auto
ObjectReference Property pTG08BBrynjolfStarterMarker  Auto  Conditional
ObjectReference Property pTG08BKarliahStarterMarker  Auto  Conditional
Outfit Property pTG08BNGaleOutfit  Auto  Conditional

Event OnUpdate()

;This first block handles checking to see if the Player has entered Irkngthand... if so, it sets a new stage and changes the objectives

	if getstage() == 10
		if Game.GetPlayer().GetParentCell() == pTG08Irkngthand
			setstage(20)
		else
			RegisterForSingleUpdate(1)
		endif
	endif

;This block is doing a check for the Player's distance from Karliah only when the Player has told her to wait.
;If Player currently exceeds 1000 units, she will automatically attempt to catch up, and negates the waiting.

	if pTG08BNoCheck == 0
		if getstage() == 32
			if Game.GetPlayer().GetDistance(pTG08BKarliahRef) >= 1000
				setstage(33)
			endif
		endif
	endif

endEvent


Spell Property TGNightingaleShadowMercer  Auto  

bool Property pTG08BExitTriggeredBrynjolf  Auto  Conditional

bool Property pTG08BExitTriggeredKarliah  Auto  Conditional

bool Property pTG08BExitTriggeredPlayer  Auto  Conditional

bool Property pTG08BStatueDoorReached = false Auto  Conditional

bool Property pTG08BBrynjolfIsCharmed  Auto  Conditional

ObjectReference Property TG08BFightControllerRef  Auto  

Explosion Property TG08BShockwaveExplosion  Auto  

Scene Property TG08BFight  Auto  

MagicEffect Property TG08BSubterfugeExplosionEffect  Auto  
