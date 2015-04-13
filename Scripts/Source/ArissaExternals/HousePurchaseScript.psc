Scriptname HousePurchaseScript extends Quest  Conditional

;Properties
miscobject Property Gold  Auto  
faction Property PlayerFaction  Auto  
int Property WhiterunHouseVar  Auto  conditional
int Property SolitudeHouseVar  Auto  conditional
int Property RiftenHouseVar  Auto  conditional
int Property MarkarthHouseVar  Auto  conditional
int Property WindhelmHouseVar  Auto  conditional
GlobalVariable Property HPWhiterun  Auto  
GlobalVariable Property HPWindhelm  Auto  
GlobalVariable Property HPSolitude  Auto  
GlobalVariable Property HPRiften  Auto  
GlobalVariable Property HPMarkarth  Auto  
bool Property WhiterunHousecarlGreet Auto conditional

function PurchaseHouse(cell HouseInterior, key HouseKey, book DecoratingGuide, globalvariable GoldAmount)

	game.getplayer().RemoveItem(Gold, GoldAmount.getvalueint())

	game.getplayer().AddItem(HouseKey)

	game.getplayer().AddItem(DecoratingGuide)

	HouseInterior.SetFactionOwner(playerfaction)

	game.IncrementStat( "Houses Owned" )

endfunction 



