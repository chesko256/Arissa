Scriptname WebDestructibleSCRIPT extends ObjectReference  

import debug
import utility

Quest property myQuest auto
{the quest to manipulate when web is destroyed}

Int property myQuestStageOnFirstStage auto
{if needed, the stage to set when web hits first stage of destruction}

Int property myQuestStageOnDestroyed auto
{if needed, the stage to set when web is destroyed}

ObjectReference property webActor auto
{the actor stuck in the web}

ObjectReference property webTrigger auto
{the trigger calling random animations on actor in web and web itself}

Scene property myScene01 auto
{if needed, the scene to start when web hits its first stage}

Scene property myScene02 auto
{if needed, the scene to start when web is destroyed}



Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	
	if(aiCurrentStage == 1)
		if(myQuest)
			myQuest.setStage(myQuestStageOnFirstStage)
			;if there is a scene to start, then start the scene
		endif
		
		if(myScene01)
			myScene01.start()
		endif
	endif
	
	if(aiCurrentStage == 2)
		;web is destroyed
		
		;if there's a trigger controlling the random web animations, then need to set its stopCondition
		if(webTrigger)
			SpiderWebAnimationsSCRIPT myWebTrigger = webTrigger as SpiderWebAnimationsSCRIPT
			myWebTrigger.stopCondition = true
			myWebTrigger.gotoState("done")
		endif
		
		;if there's an actor in the web, set his variable and get him out
		if(webActor)
			Actor myActor = webActor as Actor
			myActor.setav("Variable03", 5)
			myActor.evaluatePackage()
		endif
		
		;if there is a quest to manipulate, then set the stage
		if(myQuest)
			myQuest.setStage(myQuestStageOnDestroyed)
		endif
		
		;if there is a scene to start, then start the scene
		if(myScene02)
			if(!myScene01.isPlaying())
				myScene02.start()
			endif
		endif
		
		;animate the web
		playAnimation("Exit")
	endif
endEvent
