Scriptname MGCollegeLecturesQuestScript extends Quest  Conditional


Event OnUpdate()


;check that we don't have a scene picked (and therefore running)

	if ScenePicked == 0

;then check to make sure it's safe to run; if not come back in 24 hours thanks

		if (DialogueWinterholdCollege as DialogueWinterholdCollegeQuestScript).CollegeUnsafe==1
			RegisterforSingleUpdateGameTime(24)
		else

;check to make sure it's the right time

			if GameHour.GetValueInt() >= 12
				if GameHour.GetValueInt() < 13

;and call function
			
					RunScene()
				else

;otherwise, come back in an hour and try again

					RegisterforSingleUpdateGameTime(1)
				endif
			else
				RegisterforSingleUpdateGameTime(1)
			endif
		endif
	endif

EndEvent


Function RunScene()

		While ScenePicked == 0
			if GameHour.GetValueInt() >= 12
				if GameHour.GetValueInt() < 13


; pick random value				
					SceneSuggested = Utility.RandomInt(1,8)

;check it against last scene played (so we don't repeat 2 in a row)
;also check whether person giving lecture is dead
;if we're good, update Last scene and start the current one
;scene handles it from here, and will reset vars when it's done

					if SceneSuggested != LastScene
						if SceneSuggested == 1
							if Drevis.GetActorReference().IsDead() == 0
								ScenePicked=1
								LastScene=1
								MGDrevisLecture.Start()
							endif
						elseif SceneSuggested== 2
							if Faralda.GetActorReference().IsDead() == 0
								ScenePicked=1
								LastScene=2
								MGFaraldaLecture.Start()
							endif
						elseif SceneSuggested== 3
							if Colette.GetActorReference().IsDead() == 0
								ScenePicked=1
								LastScene=3
								MGColetteLecture.Start()
							endif
						elseif SceneSuggested== 4
							if Urag.GetActorReference().IsDead() == 0
								ScenePicked=1
								LastScene=4
								MGUragLecture.Start()
							endif
						elseif SceneSuggested== 5
							if Phinis.GetActorReference().IsDead() == 0
								ScenePicked=1
								LastScene=5
								MGPhinisLecture01.Start()
							endif
						elseif SceneSuggested== 6
							if Phinis.GetActorReference().IsDead() == 0
								ScenePicked=1
								LastScene=6
								MGPhinisLecture02.Start()
							endif
						elseif SceneSuggested== 7
							if Phinis.GetActorReference().IsDead() == 0
								ScenePicked=1
								LastScene=7
								MGPhinisLecture03.Start()
							endif
						elseif SceneSuggested== 8
							if Phinis.GetActorReference().IsDead() == 0
								ScenePicked=1
								LastScene=8
								MGPhinisLecture04.Start()
							endif
						endif

					endif
				endif
			endif
		endwhile

	




EndFunction	
int Property ScenePicked  Auto  

int Property SceneSuggested  Auto  

int Property LastScene  Auto  

ReferenceAlias Property Drevis  Auto  

ReferenceAlias Property Faralda  Auto  

int Property NewProperty  Auto  

GlobalVariable Property Gamehour  Auto  

ReferenceAlias Property Colette  Auto  

ReferenceAlias Property Urag  Auto  

ReferenceAlias Property Phinis  Auto  

Scene Property MGDrevisLecture  Auto  

Scene Property MGFaraldaLecture  Auto  

Scene Property MGColetteLecture  Auto  

Scene Property MGUragLecture  Auto

Scene Property MGPhinisLecture01  Auto  

Scene Property MGPhinisLecture02  Auto  

Scene Property MGPhinisLecture03  Auto  

Scene Property MGPhinisLecture04  Auto  
Quest Property DialogueWinterholdCollege  Auto  
