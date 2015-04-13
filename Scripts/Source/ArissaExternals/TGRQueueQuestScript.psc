Scriptname TGRQueueQuestScript extends Quest  Conditional

LocationAlias Property pTGRQHouse01 Auto
LocationAlias Property pTGRQHouse02 Auto
LocationAlias Property pTGRQHouse03 Auto
LocationAlias Property pTGRQHouse04 Auto
LocationAlias Property pTGRQHouse05 Auto

LocationAlias Property pTGRQBusiness01 Auto
LocationAlias Property pTGRQBusiness02 Auto
LocationAlias Property pTGRQBusiness03 Auto
LocationAlias Property pTGRQBusiness04 Auto
LocationAlias Property pTGRQBusiness05 Auto

Keyword Property TGWealthyHome Auto
Keyword Property TGBusiness Auto

Function UpdateQueue(LocationAlias pTGRQLastCalled, Keyword pTGRQKeyword)

	;if this is a business run the business queue
	If (pTGRQKeyword == TGBusiness)
		;set data on the incoming location and clear the oldest location
		pTGRQLastCalled.GetLocation().SetKeywordData(TGBusiness, 1)
		pTGRQBusiness05.GetLocation().SetKeywordData(TGBusiness, 0)

		;reset the queue
		pTGRQBusiness05.ForceLocationto(pTGRQBusiness04.GetLocation())
		pTGRQBusiness04.ForceLocationto(pTGRQBusiness03.GetLocation())
		pTGRQBusiness03.ForceLocationto(pTGRQBusiness02.GetLocation())
		pTGRQBusiness02.ForceLocationto(pTGRQBusiness01.GetLocation())
		pTGRQBusiness01.ForceLocationto(pTGRQLastCalled.GetLocation())

	;if this is a home run the home queue
	ElseIf (pTGRQKeyword == TGWealthyHome)
		;set data on the incoming location and clear the oldest location
		pTGRQLastCalled.GetLocation().SetKeywordData(TGWealthyHome, 1)
		pTGRQHouse05.GetLocation().SetKeywordData(TGWealthyHome, 0)

		;reset the queue
		pTGRQHouse05.ForceLocationto(pTGRQHouse04.GetLocation())
		pTGRQHouse04.ForceLocationto(pTGRQHouse03.GetLocation())
		pTGRQHouse03.ForceLocationto(pTGRQHouse02.GetLocation())
		pTGRQHouse02.ForceLocationto(pTGRQHouse01.GetLocation())
		pTGRQHouse01.ForceLocationto(pTGRQLastCalled.GetLocation())
	EndIf

endFunction