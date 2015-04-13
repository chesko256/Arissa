Scriptname MGR22QuestScript extends Quest  Conditional

int Property RewardState  Auto  Conditional

Quest Property MGR22  Auto

Event OnUpdateGameTime()
	if MGR22.GetStage() < 20
		if RewardState == 0
			RewardState= 1
			(MGR22 as MGR22QuestScript).RegisterforUpdateGameTime(12)
		elseif RewardState==1
			if RewardPicked==1
				RewardState=2
			else
				(MGR22 as MGR22QuestScript).RegisterforUpdateGameTime(1)				
			endif
		endif
	elseif MGR22.GetStage() == 20
		MGR22.SetStage(200)
	endif
EndEvent


Function MGR22RunReward()




while RewardPicked == 0


; first check if all player's magic skills are over 100
; if they are, change what random # we're looking for

	if MaxRewardInt == 6
		if Game.GetPlayer().GetAV("Alteration") >= 100
			if Game.GetPlayer().GetAV("Conjuration") >= 100
				if Game.GetPlayer().GetAV("Destruction") >=100
					if Game.GetPlayer().GetAV("Illusion") >= 100
						if Game.GetPlayer().GetAV("Restoration") >= 100
							MaxRewardInt=5
						endif
					endif
				endif
			endif
		endif
	endif


;pick random # between 1 and MaxRewardInt

	RewardSuggested=Utility.RandomInt(1,MaxRewardInt)

; check that it's not the same as the last two rewards given

		if RewardSuggested != LastReward
			if RewardSuggested != LastReward2

;if it's 6, which means skill increase, do additional checks

;make sure whichever skill picked isn't at 100 already
				if RewardSuggested == 6
					while SkillPicked == 0

; if we're in this section and player has maxed out his magic skills, dump us out

					if MaxRewardInt == 6

						if Game.GetPlayer().GetAV("Alteration") >= 100
							if Game.GetPlayer().GetAV("Conjuration") >= 100
								if Game.GetPlayer().GetAV("Destruction") >=100
									if Game.GetPlayer().GetAV("Illusion") >= 100
										if Game.GetPlayer().GetAV("Restoration") >= 100
											MaxRewardInt=5
											RewardSuggested=0
										endif
									endif
								endif
							endif
						endif
					endif



						SkillSuggested=Utility.RandomInt(1,5)
						if SkillSuggested== 1
							if Game.GetPlayer().GetAv("Alteration") < 100
								SkillPicked=1
							endif
						elseif SkillSuggested==2
							if Game.GetPlayer().GetAV("Conjuration") < 100
								SkillPicked=1
							endif
						elseif SkillSuggested==3
							if Game.GetPlayer().GetAV("Destruction") < 100
								SkillPicked=1
							endif
						elseif SkillSuggested==4
							if Game.GetPlayer().GetAV("Illusion") < 100
								SkillPicked=1
							endif	
						elseif SkillSuggested==5
							if Game.GetPlayer().GetAV("Restoration") < 100
								SkillPicked=1
							endif
						endif
					endwhile

					RewardPicked=1
				else
					RewardPicked=1
				endif
			endif
		endif
endwhile

EndFunction

int Property RewardSuggested Auto Conditional
int Property MaxRewardInt Auto Conditional
int Property LastReward Auto  Conditional
int Property LastReward2 Auto Conditional
int Property SkillSuggested Auto Conditional
int Property RewardPicked Auto Conditional
int Property SkillPicked Auto Conditional