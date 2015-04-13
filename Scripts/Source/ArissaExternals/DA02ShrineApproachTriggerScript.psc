Scriptname DA02ShrineApproachTriggerScript extends ReferenceAlias  
{Script for DA02 ShrineApproachTrigger alias}

ObjectReference Property Fight2Marker1Ref auto
ObjectReference Property Fight2Marker2Ref Auto

ReferenceAlias Property Fighter1 auto
ReferenceAlias Property Fighter2 auto

int MoveFighters 	;0 = not moved, 1 = moved

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
	
		if moveFighters == 0
			moveFighters = 1
			
			Actor Fighter1Actor = Fighter1.GetActorReference()
			Actor Fighter2Actor = Fighter2.GetActorReference()
			
			Fighter1Actor.MoveTo(Fight2Marker1Ref)
			Fighter2Actor.MoveTo(Fight2Marker2Ref)
			
			Fighter1Actor.StartCombat(Fighter2Actor)
			
			GetOwningQuest().setStage(4)	;starts fight scene 2
			GetOwningQuest().setStage(5)	;Pops objective to talk to the priestess/join cult
			
			
		EndIf
		
	EndIf


EndEvent


