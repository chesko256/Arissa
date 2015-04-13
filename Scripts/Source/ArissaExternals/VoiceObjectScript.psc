Scriptname VoiceObjectScript extends ObjectReference  

Topic Property SaidTopic Auto

Actor Property Speaker Auto

Event OnLoad()
	Say(SaidTopic, Speaker, false)
	RegisterForSingleUpdate(5.0)
EndEvent

Event OnUpdate()
	Disable()
	Delete()
endEvent

Event OnUnload()
EndEvent