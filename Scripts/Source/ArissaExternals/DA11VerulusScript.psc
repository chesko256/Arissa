scriptName DA11VerulusScript extends ReferenceAlias

Int ButtonPressed = 0
Int PlayerFeasted = 0
Message property CorpseMessage auto
Message property EatMessage auto
DA11QuestScript Property pDA11QuestScript  Auto  
Idle Property IdleCannibalFeedStanding Auto

Event OnDeath(Actor akKiller)
	If (GetOwningQuest().GetStageDone(45) == 1) && (GetOwningQuest().GetStageDone(225) == 0)
		GetOwningQuest().SetStage(60)
	ElseIf (GetOwningQuest().GetStageDone(45) == 0)
		GetOwningQuest().SetStage(500)
	EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
	If (Self.GetActorRef().IsDead() == True) && (GetOwningQuest().GetStage() == 60) && (GetOwningQuest().GetStageDone(100) == 0) && (akActionRef == Game.GetPlayer())
		ButtonPressed = CorpseMessage.Show()
		If (ButtonPressed == 1)
			Actor Player = Game.GetPlayer() as Actor

			Player.StartCannibal(Self.GetActorRef() as Actor)

			;If Player.PlayIdle(IdleCannibalFeedStanding)
; 			;	debug.Trace(self + "Player is playing the cannibal idle")
			;Else
; 			;	debug.Trace(self + "Animation fail: Player is NOT playing the cannibal idle")
			;EndIf
			Utility.Wait(3)
			GetOwningQuest().SetStage(70)
		EndIf
	;ElseIf (akActionRef == Game.GetPlayer()) && (Self.GetActorRef().IsDead() == True)
		;Self.GetActorRef().Activate(Game.GetPlayer())
	EndIf
EndEvent

