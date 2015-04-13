Scriptname MQ201PartyScript extends Quest  Conditional

Quest Property MQ201  Auto  

function MoveToParty(ReferenceAlias guestAlias, ObjectReference partyMarker, bool bIsJarl = false)
	Actor guest = guestAlias.GetActorRef()
	; first, check if empty
	if guest == None
		return
	endif

	; next, check anything special needs to be checked
	; 1. make sure nobody's the player's enemy
	if guest.GetRelationshipRank(Game.GetPlayer()) < 0
		; clear them from alias
		guestAlias.Clear()
		return
	endif
	
	
	; 2. if this is a jarl, clear them if they're exiled
	if !bAllJarls && bIsJarl && guest.IsInFaction(GovExiled)
		; clear them from alias
		guestAlias.Clear()
		return
	endif

	; move them to the party marker and set their flag to true
	guest.moveTo(partyMarker)
endFunction

; return party guests
function MoveHome(ReferenceAlias guestAlias)
	Actor guest = guestAlias.GetActorRef()
	; first, check if empty
	if guest == None
		return
	endif

	; move to editor location
	guest.MoveToMyEditorLocation()
endFunction

function StartFriendDistractionScene(Actor friend, bool bPersuade = true)
; 	debug.trace(self + "StartFriendDistractionScene friend=" + friend)
	; spend favor points
	;friend.playerSpendFavorPoints(FavorCost.value as int)
	if bPersuade
		; call persuade function to track stats
		DialogueFavorGeneric.Persuade(friend)
	endif

	; put friend in "done" faction so you can't repeat
	friend.AddToFaction(MQ201FriendDistractionDoneFaction)

	; special cases
	if friend.GetActorBase() == Ondolemar
		(MQ201 as MQ201QuestScript).OndolemarDistractionFlag = true
	endif
	; put friend into alias
	Alias_Friend.ForceRefTo(friend)

	; start scene
; 	debug.trace(self + " starting scene " + FriendDistractionScene)
	(MQ201 as MQ201QuestScript).StartDistractionScene(FriendDistractionScene)
endFunction

function EndFriendDistractionScene()
	; remove friend from alias
	Alias_Friend.Clear()
endFunction

function TryToStartErikurIntroScene()
	; if Erikur is in dialogue with the player, start the scene
	if GetStageDone(20) == 0 && Alias_Erikur.GetActorRef().IsInDialogueWithPlayer()
		setStage(20)
	endif
endFunction



; testing:
function AddToGuestList(ReferenceAlias guest)
	if guest && guest.GetActorRef()
; 		debug.trace(self + " AddToGuestList: " + guest)
		GuestList.AddForm(guest.GetActorRef())
	else
; 		debug.trace(self + " AddToGuestList: FAILED TO ADD " + guest)
	endif
endFunction

event OnUpdate()
; 	debug.trace(self + " OnUpdate: clearing actor value on " + guestlist.GetSize() + " guests")
	; first, clear actor value on all guests
	int cfIndex = 0
	while (cfIndex < GuestList.GetSize())
	       (GuestList.GetAt(cfIndex) as Actor).SetActorValue("variable01", 0)
		cfIndex += 1
	endwhile

	; then, pick iMaxGuestHellos at random
	cfIndex = 0
	while (cfIndex < iMaxGuestHellos)
		int iGuest = utility.RandomInt(1, GuestList.GetSize()) - 1
		(GuestList.GetAt(iGuest) as Actor).SetActorValue("variable01", 1)
; 		debug.trace(self + " OnUpdate: picked guest " + iGuest + " = " + GuestList.GetAt(iGuest)+ " to say hello")
		cfIndex += 1
	endwhile
	
	; register for next update
	RegisterForSingleUpdate(fRandomizeHelloTimer)
endEvent

FormList Property GuestList  Auto  

float property fRandomizeHelloTimer = 10.0 Auto Conditional
{ how long between randomizing hello to a different guest }

int property iMaxGuestHellos = 2 Auto
{ how many random guests are allowed to say hello? }

FavorDialogueScript Property DialogueFavorGeneric Auto  

Scene Property FriendDistractionScene  Auto  

ReferenceAlias Property Alias_Friend  Auto  

GlobalVariable Property FavorCost  Auto  

ActorBase Property Ondolemar  Auto  

ReferenceAlias Property Alias_Erikur Auto

bool Property OrthusIntroducedVittoria  Auto  Conditional
{true after VittoriaIntroScene finishes}

bool Property HideTulliusCWObjectives  Auto  Conditional
{set to true to hide CW objectives on Tullius}

Faction Property GovExiled  Auto  

bool Property bAllJarls  Auto  
{set to true (quickstart) to get all jarls at the party
(ignoring whether or not they've been exiled)
}

ObjectReference Property ExiledJarlMoveToMarker  Auto  
{marker to move exiled jarls back to Blue Palace}


Faction Property MQ201FriendDistractionDoneFaction  Auto  
