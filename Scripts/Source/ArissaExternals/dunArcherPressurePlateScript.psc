scriptName dunArcherPressurePlateScript extends ObjectReference

import debug
import utility

Formlist property flArrows auto
int property targetNumber auto
{0=Left Target 1=Middle Target 2=RightTarget  3=FarTarget}

ObjectReference property LeftTarget auto
ObjectReference property MiddleTarget auto
ObjectReference property RightTarget auto
ObjectReference property FarTarget auto
ObjectReference property myActorTarget auto
Actor property myActor auto
Quest property dunArcherQST auto
dunArcherQuestScript myQuest
bool playerHitTarget
bool correctArrows
bool inBox

;************************************

Event OnLoad()
	myQuest = dunArcherQST as dunArcherQuestScript
endEvent

;************************************

auto State Waiting
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		Actor actorRef = akAggressor as Actor
		gotoState("DoNothing")
		if(myQuest.getStage() == 30 && myQuest.getStage() <= 32)
			myQuest.feedbackFlag = 0
		endif
		
		activate(self as objectReference)
		
		if(actorRef == game.GetPlayer())
			;player hit the target
			playerHitTarget = true
		endif
		
		if(flArrows.hasForm(akProjectile))
			;target was hit with correct arrow
			correctArrows = true
		endif
		
		if(myQuest.playerInBox == 1)
			;player is in box when target was hit
			inBox = true
		endif
		
		if(playerHitTarget && correctArrows && inBox)
			;player hit target and is using the correct arrows and is in box
			if(targetNumber == 0)
				;if player hit left target
				if(myQuest.getStage() == 30 || myQuest.getStage() == 32 || myQuest.getStage() == 60)
					;player hit the wrong target
					myQuest.feedbackFlag = 4
				else
					if(myQuest.getStage() == 31)
						;player hit the left target correctly
						myQuest.feedbackFlag = 0
						myQuest.setStage(32)
					else
						if(myQuest.getStage() == 50 || myQuest.getStage() == 51 || myQuest.getStage() == 70 || myQuest.getStage() == 71)
							;checking for when player needs to hit each of the three targets
							myQuest.playerHitTargetLeft = 1
						endif
					endif
				endif
			else
				if(targetNumber == 1)
					;if player hit middle target
					if(myQuest.getStage() == 30)
						;player hit middle target correctly
						myQuest.feedbackFlag = 0
						myQuest.setStage(31)
					else
						if(myQuest.getStage() == 31 || myQuest.getStage() == 32 || myQuest.getStage() == 60)
							;player hit the wrong target
							myQuest.feedbackFlag = 4
						else
							if(myQuest.getStage() == 50 || myQuest.getStage() == 51 || myQuest.getStage() == 70 || myQuest.getStage() == 71)
								;checking for when player needs to hit each of the three targets
								myQuest.playerHitTargetMiddle = 1
							endif
						endif
					endif
				else
					if(targetNumber == 2)
						;player hit right target
						if(myQuest.getStage() == 30 || myQuest.getStage() == 31 || myQuest.getStage() == 60)
							;player hit the wrong target
							myQuest.feedbackFlag = 4
						else
							if(myQuest.getStage() == 32)
								;player hit the right target correctly
								myQuest.feedbackFlag = 0
								myQuest.setStage(40)
							else
								if(myQuest.getStage() == 50 || myQuest.getStage() == 51 || myQuest.getStage() == 70 || myQuest.getStage() == 71)
									;checking for when player needs to hit each of the three targets
									myQuest.playerHitTargetRight = 1
								endif
							endif
						endif
					else
						if(targetNumber == 3)
							;player hit far target
							if(myQuest.getStage() == 30 || myQuest.getStage() == 31 || myQuest.getStage() == 32)
								;player hit the wrong target
								myQuest.feedbackFlag = 4
							else
								if(myQuest.getStage() == 60)
									;player hit the far target correctly
									myQuest.feedbackFlag = 0
									myQuest.playerChallengeComplete01 = 1
									myQuest.setStage(62)
								else
									if(myQuest.getStage() == 70 || myQuest.getStage() == 71)
										;checking for when player needs to hit all targets
										myQuest.playerHitTargetFar = 1
									endif
								endif
							endif
						endif
					endif
				endif
			endif
			
		else
			if(playerHitTarget && correctArrows && !inBox)
				;player hit target, used correct arrows, but is not in box
				myQuest.feedbackFlag = 1
			else
				if(playerHitTarget && !correctArrows && inBox)
					;player hit target, is in box, but used wrong arrows
					myQuest.feedbackFlag = 2
				else
					if(playerHitTarget && !correctArrows && !inBox)
						;player hit target, but used wrong arrows and is not in box
						myQuest.feedbackFlag = 3
					endif
				endif
			endif
		endif

		
		;this is for angie
		if(actorRef == myActor)
			if(myQuest.getStage() == 45)
				;Angi is shooting the three targets
				if(myQuest.count == 0)
					myActorTarget.moveto(LeftTarget)
					myQuest.count = 1
				else
					if(myQuest.count == 1)
						myActorTarget.moveto(RightTarget)
						myQuest.count = 2
					else
						if(myQuest.count == 2)
							myActorTarget.moveto(MiddleTarget)
							myQuest.count = 0
						else
							myQuest.count = 0
						endif
					endif
				endif
			else
				if(myQuest.getStage() == 69)
					;Angi is shooting all four targets
					if(myQuest.count == 0)
						myActorTarget.moveto(LeftTarget)
						myQuest.count = 1
					else
						if(myQuest.count == 1)
							myActorTarget.moveto(MiddleTarget)
							myQuest.count = 2
						else
							if(myQuest.count == 2)
								myActorTarget.moveto(FarTarget)
								myQuest.count = 3
							else
								if(myQuest.count == 3)
									myActorTarget.moveto(MiddleTarget)
									myQuest.count = 0
								endif
							endif
						endif
					endif
				endif
			endif
		endif
		
		;reset vars
		playerHitTarget = false
		correctArrows = false
		inBox = false

		
		;for player hitting three targets
		if(myQuest.getStage() == 50 || myQuest.getStage() == 51)
			if((myQuest.playerHitTargetLeft == 1) && (myQuest.playerHitTargetMiddle == 1) && (myQuest.playerHitTargetRight == 1))
				myQuest.playerChallengeComplete01 = 1
			endif
		endif
		
		if(myQuest.getStage() == 70 || myQuest.getStage() == 71)
			if((myQuest.playerHitTargetLeft == 1) && (myQuest.playerHitTargetMiddle == 1) && (myQuest.playerHitTargetRight == 1) && (myQuest.playerHitTargetFar == 1))
				myQuest.playerChallengeComplete01 = 1
			endif
		endif
		gotoState("Waiting")
	endEvent
	
endState

;************************************

State DoNothing
	;do nothing
EndState

;************************************
