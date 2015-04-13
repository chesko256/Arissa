Scriptname C06FuneralObserverQuestScript extends Quest  



ReferenceAlias Property CompanionsObserver1 auto
ReferenceAlias Property CompanionsObserver2 auto
ReferenceAlias Property CompanionsObserver3 auto
ReferenceAlias Property CompanionsObserver4 auto
ReferenceAlias Property CompanionsObserver5 auto
ReferenceAlias Property CompanionsObserver6 auto
ReferenceAlias Property CompanionsObserver7 auto
ReferenceAlias Property Observer1 auto
ReferenceAlias Property Observer2 auto
ReferenceAlias Property Observer3 auto

ObjectReference Property MoveSpot01 auto
ObjectReference Property MoveSpot02 auto
ObjectReference Property MoveSpot03 auto
ObjectReference Property MoveSpot04 auto
ObjectReference Property MoveSpot05 auto
ObjectReference Property MoveSpot06 auto
ObjectReference Property MoveSpot07 auto
ObjectReference Property MoveSpot08 auto
ObjectReference Property MoveSpot09 auto
ObjectReference Property MoveSpot10 auto

Actor Property Balgruuf auto
Actor Property Severio auto
Actor Property Olfird auto

Quest Property MQ104 auto

Function Setup()
	if (Observer1.GetActorReference() == Balgruuf)
		; if Balgruuf is still the Jarl, check to make sure 
		;  we can spare him
		if (!MQ104.GetStageDone(160))
			; swap Balgruuf and Proventus with Severio and Olfird
			Observer1.ForceRefTo(Severio)
			Observer2.ForceRefTo(Olfird)
		endif
	endif

	MoveIfNotDead(CompanionsObserver1.GetActorReference(), MoveSpot01)
	MoveIfNotDead(CompanionsObserver2.GetActorReference(), MoveSpot02)
	MoveIfNotDead(CompanionsObserver3.GetActorReference(), MoveSpot03)
	MoveIfNotDead(CompanionsObserver4.GetActorReference(), MoveSpot04)
	MoveIfNotDead(CompanionsObserver5.GetActorReference(), MoveSpot05)
	MoveIfNotDead(CompanionsObserver6.GetActorReference(), MoveSpot06)
	MoveIfNotDead(CompanionsObserver7.GetActorReference(), MoveSpot07)
	MoveIfNotDead(Observer1.GetActorReference(), MoveSpot08)
	MoveIfNotDead(Observer2.GetActorReference(), MoveSpot09)
	MoveIfNotDead(Observer3.GetActorReference(), MoveSpot10)
EndFunction

Function MoveIfNotDead(Actor mover, ObjectReference spot)
	if (!mover.IsDead())
		mover.MoveTo(spot)
	endif
EndFunction
