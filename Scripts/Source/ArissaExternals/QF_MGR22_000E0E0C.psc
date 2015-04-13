;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_MGR22_000E0E0C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Urag
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Urag Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE MGR22QuestScript
Quest __temp = self as Quest
MGR22QuestScript kmyQuest = __temp as MGR22QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterforUpdateGameTime(3)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
MGR21.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE MGR22QuestScript
Quest __temp = self as Quest
MGR22QuestScript kmyQuest = __temp as MGR22QuestScript
;END AUTOCAST
;BEGIN CODE
if kmyquest.RewardSuggested == 1
	Game.GetPlayer().AddItem(MGR21ScrollAlteration, 3)
	kmyquest.LastReward2=LastReward
	kmyquest.LastReward=RewardSuggested
	kmyquest.RewardPicked=0
elseif kmyquest.RewardSuggested== 2
	Game.GetPlayer().AddItem(MGR21ScrollConjuration, 3)
	kmyquest.LastReward2=LastReward
	kmyquest.LastReward=RewardSuggested
	kmyquest.RewardPicked=0
elseif kmyquest.RewardSuggested== 3
	Game.GetPlayer().AddItem(MGR21ScrollDestruction, 3)
	kmyquest.LastReward2=LastReward
	kmyquest.LastReward=RewardSuggested
	kmyquest.RewardPicked=0
elseif kmyquest.RewardSuggested== 4
	Game.GetPlayer().AddItem(MGR21ScrollIllusion, 3)
	kmyquest.LastReward2=LastReward
	kmyquest.LastReward=RewardSuggested
	kmyquest.RewardPicked=0
elseif kmyquest.RewardSuggested== 5
	Game.GetPlayer().AddItem(MGR21ScrollRestoration, 3)
	kmyquest.LastReward2=LastReward
	kmyquest.LastReward=RewardSuggested
	kmyquest.RewardPicked=0
elseif kmyquest.RewardSuggested == 6
	if kmyquest.SkillSuggested==1
		Game.IncrementSkill("Alteration")
	elseif kmyquest.SkillSuggested == 2
		Game.IncrementSkill("Conjuration")
	elseif kmyquest.SkillSuggested == 3
		Game.IncrementSkill("Destruction")
	elseif kmyquest.SkillSuggested == 4
		Game.IncrementSkill("Illusion")
	elseif kmyquest.SkillSuggested == 5
		Game.IncrementSkill("Restoration")
	endif
endif

kmyQuest.RegisterforUpdateGameTime(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE MGR22QuestScript
Quest __temp = self as Quest
MGR22QuestScript kmyQuest = __temp as MGR22QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MGR22RunReward()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest Property MGR21  Auto  

Scroll Property MGR21ScrollAlteration Auto  

Scroll Property MGR21ScrollConjuration Auto

Scroll Property MGR21ScrollDestruction Auto

Scroll Property MGR21ScrollIllusion Auto

Scroll Property MGR21ScrollRestoration Auto    
int Property RewardSuggested  Auto  

Int Property RewardPicked  Auto  

int Property LastReward  Auto  

int Property LastReward2  Auto  

Int Property SkillSuggested  Auto  

int Property SkillPicked  Auto  

Int Property MaxRewardInt  Auto  
