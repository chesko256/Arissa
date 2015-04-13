Scriptname FavorDialogueScript extends Quest  Conditional
{functions and properties used by favor dialogue}

GlobalVariable Property GameDaysPassed  Auto  

GlobalVariable Property IntimidateBribeDelayDays  Auto  

GlobalVariable Property FlatterDelayDays  Auto  

GlobalVariable Property BribeReward  Auto  

GlobalVariable Property FlatterReward  Auto  

GlobalVariable Property IntimidateReward  Auto  

GlobalVariable Property IntimidateCost  Auto  
{favor point cost from intimidating}

MiscObject Property Gold Auto

Keyword Property BrawlKeyword  Auto  
{used for brawl story event}

CompanionsRadiantQuest Property CR04 Auto
{One of the Companions quests cares about intimidating someone specific}

ReferenceAlias Property MS10Stig Auto
{MS10 needs to be told after intimidating Stig}

float Property SkillUsePersuade Auto  Conditional
{skill uses for flatter (magnitude for AdvanceSkill)}

float Property SkillUseBribe Auto  Conditional
{skill uses for flatter (magnitude for AdvanceSkill)}

float Property SkillUseIntimidate Auto  Conditional
{skill uses for flatter (magnitude for AdvanceSkill)}

float Property SkillUseMultiplier Auto Conditional
{Base multiplier for skill uses. Formula is based off the skill use multiplier set in Speechcraftt}

float Property SkillUseGiveGiftMult = 1.0  Auto  Conditional
{skill uses for flatter (multipler for for AdvanceSkill magnitude)}

GlobalVariable Property SpeechSkillMult  Auto  
{Global to determine skill uses}

import game
import debug

; call this to persuade target actor

Function Persuade(Actor pTarget)
	trace("Persuade: " + pTarget)
	; give player skill uses
	SkillUseMultiplier = SpeechSkillMult.value
	SkillUsePersuade = SkillUseMultiplier * Game.GetPlayer().GetAv("Speechcraft")
	trace(self + "Current Skill uses given: " + SkillUsePersuade + " times the Skill Use Multiplier")
	AdvanceSkill("Speechcraft", SkillUsePersuade)
	Game.IncrementStat( "Persuasions" )
	if ( Game.QueryStat( "Bribes" ) && Game.QueryStat( "Intimidations" ) )
		AddAchievement(28)
	endif
endFunction

Function ArrestPersuade(Actor pTarget)
	trace("Persuade: " + pTarget)
	; give player skill uses
	SkillUseMultiplier = SpeechSkillMult.value
	SkillUsePersuade = SkillUseMultiplier * Game.GetPlayer().GetAv("Speechcraft")
	AdvanceSkill("Speechcraft", SkillUsePersuade)
	Game.IncrementStat( "Persuasions" )
	if ( Game.QueryStat( "Bribes" ) && Game.QueryStat( "Intimidations" ) )
		AddAchievement(28)
	endif
	; set bribed state
	pTarget.SetBribed()
endFunction


; call this to bribe target actor
Function Bribe(Actor pTarget)
	trace("Bribe: " + pTarget)
	SkillUseMultiplier = SpeechSkillMult.value
	SkillUseBribe = SkillUseMultiplier * Game.GetPlayer().GetAv("Speechcraft")
	trace(self + "Current Skill uses given: " + SkillUseBribe + " times the Skill Use Multiplier")
	if pTarget.GetBribeAmount() <= GetPlayer().GetGoldAmount()
		; remove gold
		GetPlayer().RemoveItem(Gold, pTarget.GetBribeAmount())
		; put gold in target
		pTarget.AddItem(Gold, pTarget.GetBribeAmount())
		; set bribed state
		pTarget.SetBribed()
		; give player skill uses
		AdvanceSkill("Speechcraft", SkillUseBribe)
		; increment game stats
		Game.IncrementStat( "Bribes" )
		if ( Game.QueryStat( "Persuasions" ) && Game.QueryStat( "Intimidations" ) )
			Game.AddAchievement(28)
		endif
	endif
endFunction

; call this to intimidate target actor
Function Intimidate(Actor pTarget)
	trace("Intimidate: " + pTarget)	
	SkillUseMultiplier = SpeechSkillMult.value
	SkillUseIntimidate = SkillUseMultiplier * Game.GetPlayer().GetAv("Speechcraft")
	trace(self + "Current Skill uses given: " + SkillUseIntimidate + " times the Skill Use Multiplier")
	; intimidate actor
	pTarget.SetIntimidated()
	; give player skill uses. don't if the Brawl quest is running, don't track intimidation stats for Brawl
	If DGintimidateQuest.IsRunning() == False
		AdvanceSkill("Speechcraft", SkillUseIntimidate)
		Game.IncrementStat( "Intimidations" )
		if ( Game.QueryStat( "Persuasions" ) && Game.QueryStat( "Bribes" ) )
			Game.AddAchievement(28)
		endif
	EndIf

	if ( CR04.IsRunning() && (10 == CR04.GetStage()) )
		(CR04 as CR04QuestScript).CheckIntimidate(pTarget)
	endif
	if (pTarget == MS10Stig.GetActorReference())
		(MS10Stig.GetOwningQuest() as MS10QuestScript).GetErDoneWithStig()
	endif
endFunction

; call this to initiate brawl quest through story manager
Function Brawl(Actor pTarget, Actor pTargetFriend = None)
	trace("Brawl: " + pTarget + ", friend=" + pTargetFriend)
	BrawlKeyword.SendStoryEvent(None, pTarget, pTargetFriend)
endFunction

; call this to give gift to target actor
Function GiveGift(Actor pTarget)
	FormList giftFilter = pTarget.GetActorBase().GetGiftFilter()
	trace("Give Gift: " + pTarget + ", gift filter = " + giftFilter)
	int favorPointsEarned = pTarget.ShowGiftMenu(true, giftFilter)
	; TEMP cap until we have a formula for this:
	if favorPointsEarned > 100
		favorPointsEarned = 100
	endif
	; give player skill uses
	trace("Give Gift: " + favorPointsEarned * SkillUseGiveGiftMult + " skill uses earned")
	AdvanceSkill("Speechcraft", favorPointsEarned * SkillUseGiveGiftMult)
endFunction


Quest Property DGIntimidateQuest  Auto  


