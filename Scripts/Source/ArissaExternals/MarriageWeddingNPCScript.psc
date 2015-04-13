ScriptName MarriageWeddingNPCScript extends ReferenceAlias

ReferenceAlias Property LoveInterest Auto
Int Property DoOnce Auto

Event OnUnload()

	;Move everyone back to whence they came
	If GetOwningQuest().GetStage() == 500
		If GetActorRef() != LoveInterest.GetActorRef()
			GetActorRef().MovetoMyEditorLocation()
			GetOwningQuest().SetStage(1000)	
		EndIf
	EndIf

EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)

	; fail the wedding if the player enters combat with anyone
	If GetOwningQuest().GetStage() < 100
		If akTarget== Game.GetPlayer()
; 			debug.trace(self + "player enters combat with Wedding NPC. Failing Wedding.")
			GetOwningQuest().SetStage(150)	
		EndIf
	EndIf

EndEvent

;Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
;
;	; fail the wedding if the player hits anyone
;	If GetOwningQuest().GetStage() < 100
;		If akAggressor == Game.GetPlayer()
; ;			debug.trace(self + "player hit a Wedding NPC. Failing Wedding.")
;			GetOwningQuest().SetStage(150)
;		EndIf
;	EndIf
;
;EndEvent


Event OnDeath(Actor akKiller)

	If GetOwningQuest().GetStage() < 100
		; fail the wedding if the player kills anyone
; 		debug.trace(self + "player killed a Wedding NPC. Failing Wedding.")
		GetOwningQuest().SetStage(150)
	EndIf

EndEvent

Event OnEnterBleedout()

	If GetOwningQuest().GetStage() < 100
		; fail the wedding if the player puts anyone in bleedout
; 		debug.trace(self + "player put a Wedding NPC in bleedout. Failing Wedding.")
		GetOwningQuest().SetStage(150)
	EndIf

EndEvent