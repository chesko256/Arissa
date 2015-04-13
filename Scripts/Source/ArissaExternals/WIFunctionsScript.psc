Scriptname WIFunctionsScript extends Quest  Conditional
{A place to hold functions that more than one world interaction quest might need that require properties I don't want to have to set up more than once.}

;HOW TO USE THIS: Make this Quest a property cast as this quest, in the calling quest, and then you can access it's functions using the properties set up on WI quest.

MiscObject Property Gold001 Auto

;These are factions used by the function to make people mourn Kill event victims
faction property pWIMournAuntFaction auto
faction property pWIMournBoyfriendFaction auto
faction property pWIMournBrotherFaction auto
faction property pWIMournCousinFemaleFaction auto
faction property pWIMournCousinMaleFaction auto
faction property pWIMournDaughterFaction auto
faction property pWIMournFatherFaction auto
faction property pWIMournFriendFemaleFaction auto
faction property pWIMournFriendMaleFaction auto
faction property pWIMournGirlfriendFaction auto
faction property pWIMournHusbandFaction auto
faction property pWIMournKinsmanFaction auto
faction property pWIMournKinswomanFaction auto
faction property pWIMournMotherFaction auto
faction property pWIMournNephewFaction auto
faction property pWIMournNieceFaction auto
faction property pWIMournSisterFaction auto
faction property pWIMournSonFaction auto
faction property pWIMournUncleFaction auto
faction property pWIMournWifeFaction auto

Faction Property WIAssaultedFaction Auto  

faction Property WIPlayerEnemyFaction Auto

;used for WIDragonKill scene when the player absorbs power - see MQKillDragonScript
Faction Property WIDragonKilledAbsorbedFaction Auto
GlobalVariable Property WINextDragon Auto
GlobalVariable Property WIWaitDragon Auto

;Note: this is a subset of all the AssociationTypes because this script only cares about these types.
associationType property pAuntUncle auto
associationType property pCourting auto
associationType property pCousins auto
associationType property pParentChild auto
associationType property pSiblings auto
associationType property pSpouse auto



;WIDeadBodyCleanUpScript properties:
GlobalVariable Property GameDaysPassed Auto
faction property WINoBodyCleanupFaction auto
ObjectReference Property WIDeadBodyCleanupCellMarker Auto

;Keywords
Keyword Property WIGamesTagStart Auto
Keyword Property WIDragonKilledStart Auto

Keyword Property WIComplexInteractionToggle Auto	;used to control complex interactions, keyword data >= 0 complex interactions like dragon attacks are allowed, < 0 means not allowed to occur at this Location
Keyword Property WIDragonsToggle Auto

Keyword Property WIDragonAttacked Auto	;used by the DragonActorScript to set keyword data on locations that have been attacked so people can respond to that fact

Keyword Property WIRentRoomWalkToStart Auto

;Locations

Location Property SolitudeLocation Auto
Location Property MarkarthLocation Auto
Location Property WhiterunLocation Auto
Location Property WindhelmLocation Auto
Location Property RiftenLocation Auto

Location Property BattleBornFarmLocation Auto
Location Property ChillfurrowFarmLocation Auto
Location Property LeftHandMineLocation Auto
Location Property MerryfairFarmLocation Auto
Location Property SalviusFarmLocation Auto
Location Property SnowShodFarmLocation Auto
Location Property PelagiaFarmLocation Auto




;Quests
Quest property WIGamesTag auto 
Quest property MQ305 auto 


Event OnInit()

; 	debug.trace(self + " OnInit() turning off dragon WI events in cities and settlements near them")
	
	DisallowDragons(SolitudeLocation)
	DisallowDragons(MarkarthLocation)
	DisallowDragons(WhiterunLocation)
	DisallowDragons(WindhelmLocation)
	DisallowDragons(RiftenLocation)

	DisallowDragons(BattleBornFarmLocation)
	DisallowDragons(ChillfurrowFarmLocation)
	DisallowDragons(LeftHandMineLocation)
	DisallowDragons(MerryfairFarmLocation)
	DisallowDragons(SalviusFarmLocation)
	DisallowDragons(SnowShodFarmLocation)
	DisallowDragons(PelagiaFarmLocation)
	
	
EndEvent



function RemoveMournerActorFromFactions(Actor Mourner)
	
	Mourner.RemoveFromFaction(pWIMournAuntFaction)
	Mourner.RemoveFromFaction(pWIMournBoyfriendFaction)
	Mourner.RemoveFromFaction(pWIMournBrotherFaction)
	Mourner.RemoveFromFaction(pWIMournCousinFemaleFaction)
	Mourner.RemoveFromFaction(pWIMournCousinMaleFaction)
	Mourner.RemoveFromFaction(pWIMournDaughterFaction)
	Mourner.RemoveFromFaction(pWIMournFatherFaction)
	Mourner.RemoveFromFaction(pWIMournFriendFemaleFaction)
	Mourner.RemoveFromFaction(pWIMournFriendMaleFaction)
	Mourner.RemoveFromFaction(pWIMournGirlfriendFaction)
	Mourner.RemoveFromFaction(pWIMournHusbandFaction)
	Mourner.RemoveFromFaction(pWIMournKinsmanFaction)
	Mourner.RemoveFromFaction(pWIMournKinswomanFaction)
	Mourner.RemoveFromFaction(pWIMournMotherFaction)
	Mourner.RemoveFromFaction(pWIMournNephewFaction)
	Mourner.RemoveFromFaction(pWIMournNieceFaction)
	Mourner.RemoveFromFaction(pWIMournSisterFaction)
	Mourner.RemoveFromFaction(pWIMournSonFaction)
	Mourner.RemoveFromFaction(pWIMournUncleFaction)
	Mourner.RemoveFromFaction(pWIMournWifeFaction)
endFunction

function PutMournerAliasInFaction(ReferenceAlias VictimAlias, ReferenceAlias MournerAlias)
{Calls PutMournerActorInFaction passing VictimAlias and MournerAlias as actors. Based on the relationship of the Victim to Mourner, mourer is placed in a faction to get related dialogue.}	

	if MournerAlias.GetReference() == None
		;bail out earlu
		return
	EndIf
	
	actor VictimActor = VictimAlias.GetReference() as Actor
	actor MournerActor = MournerAlias.GetReference() as Actor
	
	if VictimActor && MournerActor		;double check the cast before passing in as actor
		PutMournerActorInFaction(VictimActor, MournerActor)
	else
; 		debug.trace("WIFunctionsScript: PutMournerAliasInFaction expected ReferenceAliases that could be cast as actors, got some other kind of ReferenceAlias. Victim: " + VictimAlias.GetReference() +", Mourner: " + MournerAlias.GetReference() + ".")
	endif

endFunction

function PutMournerActorInFaction(Actor Victim, Actor Mourner)
{Based on the relationship of the Victim to Mourner, mourer is placed in a faction to get related dialogue.}
	string relation = GetRelationshipString(Victim, Mourner)
	
	if relation == "aunt"
		Mourner.AddToFaction(pWIMournAuntFaction)
	elseif relation == "boyfriend"
		Mourner.AddToFaction(pWIMournBoyfriendFaction)
	elseif relation == "brother"
		Mourner.AddToFaction(pWIMournBrotherFaction)
	elseif relation == "cousin female"
		Mourner.AddToFaction(pWIMournCousinFemaleFaction)
	elseif relation == "cousin male"
		Mourner.AddToFaction(pWIMournCousinMaleFaction)
	elseif relation == "daughter"
		Mourner.AddToFaction(pWIMournDaughterFaction)
	elseif relation == "father"
		Mourner.AddToFaction(pWIMournFatherFaction)
	elseif relation == "friend female"
		Mourner.AddToFaction(pWIMournFriendFemaleFaction)
	elseif relation == "friend male"
		Mourner.AddToFaction(pWIMournFriendMaleFaction)
	elseif relation == "girlfriend"
		Mourner.AddToFaction(pWIMournGirlfriendFaction)
	elseif relation == "husband"
		Mourner.AddToFaction(pWIMournHusbandFaction)
	elseif relation == "kinsman"
		Mourner.AddToFaction(pWIMournKinsmanFaction)
	elseif relation == "kinswoman"
		Mourner.AddToFaction(pWIMournKinswomanFaction)
	elseif relation == "mother"
		Mourner.AddToFaction(pWIMournMotherFaction)
	elseif relation == "nephew"
		Mourner.AddToFaction(pWIMournNephewFaction)
	elseif relation == "niece"
		Mourner.AddToFaction(pWIMournNieceFaction)
	elseif relation == "sister"
		Mourner.AddToFaction(pWIMournSisterFaction)
	elseif relation == "son"
		Mourner.AddToFaction(pWIMournSonFaction)
	elseif relation == "uncle"
		Mourner.AddToFaction(pWIMournUncleFaction)
	elseif relation == "wife"
		Mourner.AddToFaction(pWIMournWifeFaction)
	else
; 		debug.trace("WIFunctionsScript PutMournerInFaction() returned unexpected relation variable: " + relation + " when Actor1 is " + Victim + " and Actor2 is " + Mourner + ".")
	
	endif
		
endFunction

string function GetRelationshipString(Actor Actor1, Actor Actor2)
{Returns a string based on Actor1's relationship to Actor2 (ie if Actor1 is in Sibling relationship and a male, returns "brother") Note: Not all relationship types are supported by this function. See function comments for details.}
	string sex			;"male" | "female" - CASE SENSITIVE description of Actor1
	string position		;"parent" | "child" - CASE SENSITIVE description of Actor1 (ie if Actor1 is niece, then = "child", if Actor1 is aunt then = "parent")
	string relation		;"kinsman", "father", "sister", "friend male", "boyfriend", etc. -  CASE SENSTIVE description of Actor1
	;Supported replationships:
	;Friend:
	;	"friend male", "friend female"
	;Family:
	;	"kinsman", "kinswoman"
	;	"husband", "wife"
	;	"father", "mother"
	;		"son", "daughter"
	;	"brother", "sister"
	;	"uncle", "aunt"
	;		"nephew", "niece"
	;	"cousin male", "cousin female"
	;Boyfriend/Girlfriend:
	;	"boyfriend", "girlfriend"

	;sex
	if Actor1.getActorBase().getSex() == 0 ;male
		sex = "male"
	else	;female
		sex = "female"
	endif

	;parent/child
	if Actor1.hasParentRelationship(Actor2)	;We have set up data, so someone is never both a parent and a child in different relationshps to the same person
		position = "parent"
	else	;child
		position = "child"
	endif

	;friend male/friend female
	;we set the relation to be friend if there's any family relation at all. This will get "overwritten" if we discover a more specific relationship
	if Actor1.GetRelationshipRank(Actor2) >= 1
		if sex == "male"
			relation = "friend male"
		else	;female
			relation = "friend female"
		endif
	endif
	
	;kinsman/kinswoman
	;we set the relation to be kinsmen if there's any family relation at all. This will get "overwritten" if we discover a more specific relationship
	if Actor1.hasFamilyRelationship(Actor2)
		if sex == "male"
			relation = "kinsman"
		else	;female
			relation = "kinswoman"
		endif
	endif

	;husband/wife
	if Actor1.hasAssociation(pSpouse, Actor2)
		if sex == "male"
			relation = "husband"
		else	;female
			relation = "wife"
		endif
	endif
	
	;father/mother
	if Actor1.hasAssociation(pParentChild, Actor2)
		if position == "parent"
			if sex == "male"
				relation = "father"
			else	;female
				relation = "mother"
			endif
		
		else	;child
			if sex == "male"
				relation = "son"
			else	;female
				relation = "daughter"
			endif
		endif
	endif

	;brother/sister
	if Actor1.hasAssociation(pSiblings, Actor2)
		if sex == "male"
			relation = "brother"
		else	;female
			relation = "sister"
		endif
	endif

	;uncle/aunt
	if Actor1.hasAssociation(pAuntUncle, Actor2)
		if position == "parent"
			if sex == "male"
				relation = "uncle"
			else	;female
				relation = "aunt"
			endif
		
		else	;child
			if sex == "male"
				relation = "nephew"
			else	;female
				relation = "niece"
			endif
		endif
	endif
	
	;cousin male/cousin female
	if Actor1.hasAssociation(pCousins, Actor2)
		if sex == "male"
			relation = "cousin male"
		else	;female
			relation = "cousin female"
		endif
	endif

	;boyfriend/girlfriend
	if Actor1.hasAssociation(pCourting, Actor2)
		if sex == "male"
			relation = "boyfriend"
		else	;female
			relation = "girlfriend"
		endif
	endif

	return relation
endFunction

function StartGameTag(ObjectReference FirstPlayer, ObjectReference SecondPlayer, int SecondsToPlay, form CallingFormSelf)

; 	debug.trace("WIFunctions StartGameTag(" + FirstPlayer + ", " + SecondPlayer + ", " + SecondsToPlay + ", " + CallingFormSelf + ")")

	WIGamesTag.Stop()
	
	int bailOutTime = 30	;wait at most 30 seconds so you don't hold up whatever script is calling this function
	int waitingFor = 0
	
	bool timeToBailOut = False
		
	while WIGamesTag.IsRunning() && timeToBailOut == false
		utility.wait(1)
		waitingFor += 1
; 		debug.trace("WIFunctions StartGameTag() waiting for previous WIGamesTag quest to finish stopping. Have been waiting for " +  waitingFor + "seconds.")
		
		if waitingFor >= bailOutTime
			timeToBailOut = True
; 			debug.trace("WIFunctions StartGameTag() have been waiting to long, bailing out. This means this game of tag will not start.", 1)
			
		EndIf
		
	EndWhile
	
	WIGamesTagStart.SendStoryEvent(akRef1 = FirstPlayer,  akRef2 = SecondPlayer,  aiValue1 = SecondsToPlay)


EndFunction

function updateWIDragonTimer()
	; update timer for when next WI dragon is allowed to appear
	WINextDragon.SetValue(GameDaysPassed.GetValue() + WIWaitDragon.GetValue())

	if MQ305.IsCompleted()
		WINextDragon.SetValue(WINextDragon.GetValue() + 3 )
	endif
endFunction

function startWIDragonKillQuest(Actor Dragon)
; 	debug.trace("WIFunctions startWIDragonKillQuest(" + Dragon + ")")
	WIDragonKilledStart.SendStoryEvent(akRef1 = Dragon)
EndFunction

function PlayerIsCurrentlyAbsorbingPower(Actor Dragon)
; 	debug.trace("WIFunctions PlayerIsCurrentlyAbsorbingPower(" + Dragon + ") calling SetFactionRank(WIDragonKilledAbsorbedFaction, 0)")
	Dragon.SetFactionRank(WIDragonKilledAbsorbedFaction, 1)		;means "player is currently absorbing - used to conditionalize scene dialogue in WIDragonKilled quest
EndFunction

function PlayerIsDoneAbsorbingPower(Actor Dragon)
; 	debug.trace("WIFunctions PlayerIsDoneAbsorbingPower(" + Dragon + ") calling SetFactionRank(WIDragonKilledAbsorbedFaction, 1)")
	Dragon.SetFactionRank(WIDragonKilledAbsorbedFaction, 2)		;means "player is done absorbing - used to conditionalize scene dialogue in WIDragonKilled quest
EndFunction


function DisallowComplexInteractions(Location LocationToToggle)
{Decrements the keyword data on WIComplexInteractionToggle}
	
	if LocationToToggle.HasKeyword(WIComplexInteractionToggle)
		Float keywordData = LocationToToggle.GetKeywordData(WIComplexInteractionToggle) - 1
		
		LocationToToggle.SetKeywordData(WIComplexInteractionToggle, keywordData)
		
; 		debug.trace("WIFunctions DisallowComplexInteractions(" + LocationToToggle + ") decremented keyword data WIComplexInteractionOffToggle to: " + keywordData)

		
	Else
; 		debug.trace(" WARNING: WIFunctions DisallowComplexInteractions(" + LocationToToggle + ") -- keyword WIComplexInteractionOffToggle does not exist on location.", 2)
	
	EndIf
	
EndFunction


function DisallowDragons(Location LocationToToggle)
{Decrements the keyword data on WIComplexInteractionToggle}
	
	if LocationToToggle.HasKeyword(WIDragonsToggle)
		Float keywordData = LocationToToggle.GetKeywordData(WIDragonsToggle) - 1
		
		LocationToToggle.SetKeywordData(WIDragonsToggle, keywordData)
		
; 		debug.trace("WIFunctions DisallowDragons(" + LocationToToggle + ") decremented keyword data WIDragonsToggle to: " + keywordData)

		
	Else
; 		debug.trace(" WARNING: WIFunctions DisallowDragons(" + LocationToToggle + ") -- keyword WIDragonsToggle does not exist on location.", 2)
	
	EndIf
	
EndFunction

function AllowComplexInteractions(Location LocationToToggle)
{Increments the keyword data on WIComplexInteractionToggle}
	
	if LocationToToggle.HasKeyword(WIComplexInteractionToggle)
		Float keywordData = LocationToToggle.GetKeywordData(WIComplexInteractionToggle) + 1
		
		LocationToToggle.SetKeywordData(WIComplexInteractionToggle, keywordData)
		
; 		debug.trace("WIFunctions AllowComplexInteractions(" + LocationToToggle + ") incremented keyword data WIComplexInteractionOffToggle to: " + keywordData)
		
	Else
; 		debug.trace(" WARNING: WIFunctions AllowComplexInteractions(" + LocationToToggle + ") -- keyword WIComplexInteractionOffToggle does not exist on location.", 2)
	
	EndIf
	
EndFunction


function AllowDragons(Location LocationToToggle)
{Increments the keyword data on WIComplexInteractionToggle}
	
	if LocationToToggle.HasKeyword(WIComplexInteractionToggle)
		Float keywordData = LocationToToggle.GetKeywordData(WIComplexInteractionToggle) + 1
		
		LocationToToggle.SetKeywordData(WIComplexInteractionToggle, keywordData)
		
; 		debug.trace("WIFunctions AllowDragons(" + LocationToToggle + ") incremented keyword data WIComplexInteractionOffToggle to: " + keywordData)
		
	Else
; 		debug.trace(" WARNING: WIFunctions AllowDragons(" + LocationToToggle + ") -- keyword WIComplexInteractionOffToggle does not exist on location.", 2)
	
	EndIf
	
EndFunction

function ShowPlayerRoom(Actor Innkeeper, ObjectReference Bed)
; 	debug.trace("WIFunctions ShowPlayerRoom(" + Innkeeper + ")")
	
	WIRentRoomWalkToStart.SendStoryEvent(akRef1 = Innkeeper, akRef2 = Bed)
	

EndFunction


bool function RegisterDragonAttack(Location LocationOfDragonAttack, Actor Dragon)
	
	;CALLED BY: DragonActorScript, DragonPerchScript, quest fragment scripts attached to WIDragonKilled, WIChangeLocation09

; 	debug.trace("WIFunctions RegisterDragonAttack(" + LocationOfDragonAttack + "," + Dragon + ")")
	
;	debug.MessageBox("WIFunctions RegisterDragonAttack(" + LocationOfDragonAttack + "," + Dragon + ")")
	
	bool returnVar
	
	if LocationOfDragonAttack.HasKeyword(WIDragonAttacked)
; 		debug.trace("WIFunctions RegisterDragonAttack() Location has WIDragonAttacked keyword, setting data.")
		
		LocationOfDragonAttack.SetKeywordData(WIDragonAttacked, 1)	
		returnVar = True
		
	Else
; 		debug.trace("WIFunctions RegisterDragonAttack() Location does NOT have WIDragonAttacked keyword, so we are NOT setting data.")
	
		returnVar = False
		
	EndIf
	
	return returnVar

EndFunction

