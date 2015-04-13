Scriptname CWMapScript extends ObjectReference  

CWScript Property CWs Auto
CWMapQuestScript Property CWMapQuestS Auto

Activator Property CWMapFlagRed Auto
Activator Property CWMapFlagBlue Auto

;# Haafingar
float FortHraggstadX
float FortHraggstadY

float SolitudeX = -21.503418
float SolitudeY = 38.820190

float SolitudeSawmillX
float SolitudeSawmillY

float KatlasFarmX
float KatlasFarmY

float DragonBridgeX
float DragonBridgeY

float IrontreeMillX
float IrontreeMillY


;# Reach
float FortSungardX
float FortSungardY

float MarkarthX = -58.291870
float MarkarthY = -1.773193

float CidhnaMineX
float CidhnaMineY

float LeftHandMineX
float LeftHandMineY

float SalviusFarmX
float SalviusFarmY

float KarthwastenX
float KarthwastenY

float OldHroldanX
float OldHroldanY

float KolskeggrMineX
float KolskeggrMineY

;# Hjaalmarch
float FortSnowhawkX
float FortSnowhawkY

float MorthalX = -17.033081
float MorthalY = 15.850586

float StonehillsX
float StonehillsY

float FrostRiverFarmX
float FrostRiverFarmY



;# Whiterun
float FortBlackmoorX
float FortBlackmoorY

float WhiterunX = 5.868042
float WhiterunY = -4.947021

float BattleBornFarmX
float BattleBornFarmY

float ChillfurrowFarmX
float ChillfurrowFarmY

float PelagiaFarmX
float PelagiaFarmY

float RoriksteadX
float RoriksteadY

float RiverwoodX = 5.098145
float RiverwoodY = -17.048950

float BarleydarkFarmX
float BarleydarkFarmY



;# Falkreath
float FortNeugradX
float FortNeugradY

float FalkreathX = -11.780396
float FalkreathY = -32.024597

float GraniteHillX
float GraniteHillY

float HelgenX
float HelgenY

float BearsCaveMillX
float BearsCaveMillY

float HalfmoonMillX
float HalfmoonMillY



;# Pale
float FortDunstadX
float FortDunstadY

float DawnstarX = 10.083740
float DawnstarY = 32.814026

float HeljarchenX
float HeljarchenY

float AngasMillX
float AngasMillY

float LoreiusFarmX
float LoreiusFarmY



;# Winterhold
float FortKastavX
float FortKastavY

float WinterholdX = 35.133057
float WinterholdY = 32.586548

float WhistlingMineX
float WhistlingMineY



;# Eastmarch
float FortAmolX
float FortAmolY

float WindhelmX = 44.252197
float WindhelmY = 12.137512

float BrandyMugFarmX
float BrandyMugFarmY

float HlaaluFarmX
float HlaaluFarmY

float HollyfrostFarmX
float HollyfrostFarmY

float KynesgroveX
float KynesgroveY

float DarkwaterCrossingX
float DarkwaterCrossingY

float MixwaterMillX
float MixwaterMillY



;# Rift
float FortGreenwallX
float FortGreenwallY

float RiftenX = 54.574341
float RiftenY = -34.423218

float SnowShodFarmX
float SnowShodFarmY

float MerryfairFarmX
float MerryfairFarmY

float IvarsteadX
float IvarsteadY

float ShorsStoneX
float ShorsStoneY

float HeartwoodMillX
float HeartwoodMillY

float SarethiFarmX
float SarethiFarmY




Event OnLoad()

; 	CWScript.Log("CWMapScript", "OnLoad()")


	;**** TEMPORARILY FORCE THE CWDEBUGON 
	while CWs.DebugOn.value != 1
; 		debug.trace("CWDebugOn->" + CWs.DebugOn.value)
		CWs.DebugOn.value = 1
		Utility.wait(1)
	EndWhile
	;**** 
	
	
	While CWMapQuestS.IsRunning() == False
		utility.wait(1)
; 		CWScript.Log("CWMapScript", "OnLoad() waiting for CWMapQuest to start")
		
	EndWhile
	

; 	CWScript.Log("CWMapScript", "X = " + X + "Y = " + Y + "Z = " + Z)

	PlaceFlags()	
	
EndEvent

Function PlaceFlags()
	PlaceFlag(CWs.SolitudeLocation, SolitudeX, SolitudeY)
	PlaceFlag(CWs.MarkarthLocation, MarkarthX, MarkarthY)
	PlaceFlag(CWs.MorthalLocation, MorthalX, MorthalY)
	PlaceFlag(CWs.WhiterunLocation, WhiterunX, WhiterunY)
	PlaceFlag(CWs.FalkreathLocation, FalkreathX, FalkreathY)
	PlaceFlag(CWs.DawnstarLocation, DawnstarX, DawnstarY)
	PlaceFlag(CWs.WinterholdLocation, WinterholdX, WinterholdY)
	
	PlaceFlag(CWs.WindhelmLocation, WindhelmX, WindhelmY)
	PlaceFlag(CWs.RiverwoodLocation, RiverwoodX, RiverwoodY)
	
	
	PlaceFlag(CWs.RiftenLocation, RiftenX, RiftenY)	

EndFunction


Function PlaceFlag(location FlagLocation, float offsetX, float offsetY, float offsetZ = 0.0)
	Activator flagToPlace
	
	if FlagLocation.GetKeywordData(CWs.CWOwner) == CWs.iImperials
		flagToPlace = CWMapFlagRed
	Else ;assume iSons
		flagToPlace = CWMapFlagBlue
	EndIf
	

	ObjectReference FlagRef = placeNearMe(FlagToPlace, offsetX,offsetY, offsetZ)
;	(FlagRef as CWMapFlagScript).setMyLocation(FlagLocation)
	
	CWMapQuestS.SetFlagAlias(FlagRef, FlagLocation)
	
; 	CWScript.Log("CWMapScript", "Placed " + FlagRef)
	
EndFunction

objectReference Function placeNearMe(Form ObjectToPlace, float xOffset, float yOffset, float zOffset)
{x,y,z are offsets of the object you are placing at. The placed object will have SetPosition called passing in the calling objects coordinates thus offset.}

	ObjectReference placedObject = placeAtMe(ObjectToPlace)
	
	placedObject.setPosition(X + xOffset, Y + yOffset, Z + zOffset)
	
	return placedObject
	
EndFunction
