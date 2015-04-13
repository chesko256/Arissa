Scriptname _Arissa_MQ01_InsideJailTriggerScript extends ObjectReference  

Quest property _Arissa_MQ01 auto
Quest property JailQuest auto
ReferenceAlias property Alias_Arissa auto
Scene property _Arissa_MQ01_GoToJailScene auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef as Actor) == Game.GetPlayer() && JailQuest.IsRunning() && _Arissa_MQ01.IsRunning()
		while _Arissa_MQ01_GoToJailScene.IsPlaying()
			utility.wait(0.5)
		endwhile

		;Is the player still in the cell?
		if Game.GetPlayer().GetPositionY() >= 240.0
			_Arissa_MQ01.SetStage(73)
			Alias_Arissa.GetActorReference().EvaluatePackage()
		endif
	endif
endEvent