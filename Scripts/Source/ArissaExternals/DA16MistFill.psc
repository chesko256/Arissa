scriptName DA16MistFill extends objectReference
;
;
;==============================================

quest property myQuest auto
int property stage auto

objectReference property mistFeed01 auto
objectReference property mistFeed02 auto
objectReference property mist01 auto
objectReference property mist01a auto
objectReference property mist02 auto
objectReference property mist03 auto
objectReference property mist04 auto
objectReference property mist05 auto
bool property doStuffWithMist = true auto 
actor property myActor01 auto
actor property myActor02 auto
actor property myActor03 auto
actor property myActor04 auto
bool property coughingActive = true auto hidden
topic property DialogueGenericPoisonCoughBranchTopic auto
idle property idleUncontrollableCough auto
faction property da16OrcDreamFaction auto
faction property da16VaerminaDreamFaction auto
objectReference property mySoundObject auto

auto state waiting
	event onActivate(objectReference activateRef)
		if doStuffWithMist
			doStuffWithMist = false
			IF mySoundObject
				mySoundObject.enable(self)
			endif
			game.DisablePlayerControls(abMovement = true, abFighting = true, \
			abCamSwitch = false, abLooking = false, abSneaking = true, \
			abMenu = true, abActivate = true, abJournalTabs = true)
			
			mistFeed01.enable(abFadeIn=True)
			mistFeed02.enable(abFadeIn=True)
			utility.wait(0.1)
			
			mist01.enable(abFadeIn=True)
			utility.wait(0.1)
			
			mist01a.enable(abFadeIn=True)
			utility.wait(0.2)
			
			myQuest.setStage(stage)
			goToState("complete")
			
			doCoughing()
		
			mist02.enable(abFadeIn=True)
			
			mist03.enable(abFadeIn=True)
		
			mist04.enable(abFadeIn=True)
			;coughingActive = False
			
		endif
	endEvent
endState

state complete
	event onBeginState()
		game.EnablePlayerControls(abMovement = true, abFighting = true, \
		abCamSwitch = true, abLooking = true, abSneaking = true, \
		abMenu = true, abActivate = true, abJournalTabs = true)
	endEvent
endstate

Function doCoughing()
	da16OrcDreamFaction.setAlly(da16VaerminaDreamFaction)
	da16VaerminaDreamFaction.setAlly(da16OrcDreamFaction)
	
	if !myActor01.isDead()
		myActor01.stopCombat()
		myActor01.getActorBase().SetInvulnerable(false)
		myActor01.getActorBase().SetEssential(true)
		myActor01.playIdle(idleUncontrollableCough)
	endif
	if !myActor02.isDead()
		myActor02.stopCombat()
		myActor02.getActorBase().setInvulnerable(false)
		myActor02.getActorBase().SetEssential(true)
		myActor02.playIdle(idleUncontrollableCough)
	endif
	if !myActor03.isDead()
		myActor03.stopCombat()
		myActor03.getActorBase().setInvulnerable(false)
		myActor03.getActorBase().SetEssential(true)
		myActor03.playIdle(idleUncontrollableCough)
	endif
	if !myActor04.isDead()
		myActor04.stopCombat()
		myActor04.getActorBase().setInvulnerable(false)
		myActor04.getActorBase().SetEssential(true)
		myActor04.playIdle(idleUncontrollableCough)
	endif
	;(game.getPlayer() as actor).say(DialogueGenericPoisonCoughBranchTopic)
	utility.wait(0.02)
	;myActor01.say(DialogueGenericPoisonCoughBranchTopic)
	utility.wait(0.05)
	;myActor02.say(DialogueGenericPoisonCoughBranchTopic)
	utility.wait(0.03)
	;myActor03.say(DialogueGenericPoisonCoughBranchTopic)
	utility.wait(0.02)
	;myActor04.say(DialogueGenericPoisonCoughBranchTopic)
	utility.wait(1.0)
	myActor01.damageAv("health", 100000)
	myActor02.damageAv("health", 100000)
	myActor03.damageAv("health", 100000)
	myActor04.damageAv("health", 100000)
	;(game.getPlayer() as actor).say(DialogueGenericPoisonCoughBranchTopic)
	utility.wait(0.02)
	;myActor01.say(DialogueGenericPoisonCoughBranchTopic)
	utility.wait(0.02)
	;myActor02.say(DialogueGenericPoisonCoughBranchTopic)
	utility.wait(0.01)
	;myActor03.say(DialogueGenericPoisonCoughBranchTopic)
	utility.wait(0.03)
	;myActor04.say(DialogueGenericPoisonCoughBranchTopic)
	
endFunction



