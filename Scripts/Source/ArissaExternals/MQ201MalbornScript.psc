Scriptname MQ201MalbornScript extends ReferenceAlias  


; make his hands bound when he enters the dungeon during the escape scene
event OnLoad()
	if MQ201EscapeScene.IsPlaying()
		GetActorRef().PlayIdle(offsetBoundStandingStart)
	endif
endEvent
Scene Property MQ201EscapeScene  Auto  

Idle Property offsetBoundStandingStart  Auto  
