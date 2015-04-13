Scriptname MQSkyHavenSparringTriggerScript extends ObjectReference  

auto state waiting
	EVENT onTriggerEnter(objectReference triggerRef)
		if triggerRef == Game.GetPlayer()
			gotoState("triggered")
			MQSkyHavenSparringKeyword.SendStoryEvent()
		endif
	endEvent
endstate

state triggered
	event OnLoad()
		; reset when I reload
		gotoState("waiting")
	endevent
endstate

Keyword property MQSkyHavenSparringKeyword auto
