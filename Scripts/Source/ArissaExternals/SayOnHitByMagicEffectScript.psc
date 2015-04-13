Scriptname SayOnHitByMagicEffectScript extends ActiveMagicEffect  
{Causes actor to say a line when hit by this spell}

Topic Property TopicToSay Auto
{Which topic has the info the target should say?}

Event OnEffectStart(Actor akTarget, Actor akCaster)

; ;	debug.trace(self + "OnEffectStart(" + akTarget + "," + akCaster + ")")

	If akTarget != Game.GetPlayer()
		If akTarget.GetCurrentScene() == None
			If GameDaysPassed.value > WICastNonHostileTimer.value
				If AllowForTeammate == 0
					If akTarget.IsCommandedActor() == 0 || akTarget.IsPlayerTeammate() == 0
						If akTarget.IsInCombat() == 0
; ;							debug.trace(self + "OnEffectStart() will call Say(" + TopicToSay + ")")
							WICastNonHostileTimer.SetValue(GameDaysPassed.GetValue() + 0.01)
							akTarget.Say(TopicToSay)
						ElseIf CombatTopicToSay != None
							WICastNonHostileTimer.SetValue(GameDaysPassed.GetValue() + 0.01)
							akTarget.Say(CombatTopicToSay)
						EndIf
					EndIf
				ElseIf akTarget.IsPlayerTeammate() == 1
; ;					debug.trace(self + "OnEffectStart() will call Say(" + TopicToSay + ")")
					WICastNonHostileTimer.SetValue(GameDaysPassed.GetValue() + 0.01)
					akTarget.Say(TopicToSay)
				EndIf
			EndIf
		EndIf
	EndIf

EndEvent


int Property AllowForTeammate = 0 Auto  

Topic Property CombatTopicToSay  Auto  

GlobalVariable Property WICastNonHostileTimer  Auto  

GlobalVariable Property GameDaysPassed  Auto  
