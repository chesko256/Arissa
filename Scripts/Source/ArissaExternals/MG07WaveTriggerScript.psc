Scriptname MG07WaveTriggerScript extends ObjectReference  

Message Property MG07TestWaveMessage auto

Quest Property MG07 Auto

int DoOnce

float PlayerMagickaVal



Event OnTriggerEnter(ObjectReference AkActionRef)



	if AkActionRef == Game.GetPlayer()

		if DoOnce == 0
			getLinkedRef().PlayAnimation("PlayAnim02")
			TauntMarker.MoveTo(Game.GetPlayer())
			PlayerMagickaVal = Game.GetPlayer().GetAV("Magicka")
			PlayerMagickaVal = 0 - PlayerMagickaVal
			Game.GetPlayer().DamageAV("Magicka", PlayerMagickaVal)
			DoOnce=1
			(MG07 as MG07QuestScript).WaveTrigger +=  1


			utility.wait(1.5)
			getLinkedRef().PlayAnimation("PlayAnim01")
			utility.wait(0.75)
			getLinkedRef().disable()
			Disable()
		endif
	endif

EndEvent


ObjectReference Property TauntMarker  Auto  
