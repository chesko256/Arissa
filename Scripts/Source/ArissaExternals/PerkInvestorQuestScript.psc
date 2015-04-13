Scriptname PerkInvestorQuestScript extends Quest  Conditional

miscobject Property Gold  Auto  

int Property GoldAmount = 500 Auto

function GoldTransfer (ObjectReference VendorRef)

	game.getplayer().RemoveItem(Gold, InvestAmount.value as int)

	VendorRef.additem(Gold, InvestAmount.value as int)

	Actor VendorActor=VendorRef as Actor	

	VendorActor.ModFavorPoints(PerkInvestorFavorReward.value as Int)

	game.IncrementStat( "Stores Invested In" )

EndFunction

  

globalvariable Property PerkInvestorFavorReward  Auto  

GlobalVariable Property InvestAmount  Auto  
