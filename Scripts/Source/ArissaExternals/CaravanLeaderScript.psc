Scriptname CaravanLeaderScript extends ReferenceAlias  Conditional

Int Property CaravanNumber auto
ReferenceAlias Property Leader  Auto
ReferenceAlias Property Follower1  Auto
ReferenceAlias Property Follower2 Auto
ReferenceAlias Property Follower3 Auto
ReferenceAlias Property Follower4 Auto

{1=Caravan A, 2=Caravan B, 3=Caravan C}

Event OnUpdateGameTime()
	
	Actor LeaderRef = GetActorReference()

; 	debug.trace(self + "OnUpdateGameTime() calling UpdateCaravan()")

	(GetOwningQuest() as CaravanScript).UpdateCaravan(CaravanNumber, LeaderRef, LeaderRef, WeAreDisablingCamp = True)

EndEvent

event OnDeath(Actor akKiller)
	
	ObjectReference Follower1Ref 
	ObjectReference Follower2Ref 
	ObjectReference Follower3Ref 
	ObjectReference Follower4Ref 

	if Follower1
		Follower1Ref = Follower1.GetReference()
	endif
	if Follower2
		Follower2Ref = Follower2.GetReference()
	endif
	if Follower3
		Follower3Ref = Follower3.GetReference()
	Endif
	if Follower4
		Follower4Ref = Follower4.GetReference()
	endif

	Promote(Leader, Follower1Ref )
	Promote(Follower1, Follower2Ref )
	Promote(Follower2, Follower3Ref )
	Promote(Follower3, Follower4Ref )

EndEvent 

function Promote(ReferenceAlias AliasToFill, ObjectReference RefToFillWith)
	if RefToFillWith
; 		debug.trace(self + "Promote(" + AliasToFill +", " + RefToFillWith + ")")
		AliasToFill.ForceRefTo(RefToFillWith)
	endif

endFunction