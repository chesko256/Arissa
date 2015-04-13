Scriptname MS05BardLutePlay extends ObjectReference  

sound property MUSBardFlute01 auto
idle property IdleFluteStart auto
idle property IdleStop auto
ObjectReference Property ActivatorParent  Auto  


Float StartTime = 0.0
Int instanceID

State PreMS05

EndState


Auto State PostMS05

	Event OnActivate(ObjectReference akActionRef)
			If  StartTime == 0.0 || Utility.GetCurrentRealTime() >= (StartTime+37)
; 				Debug.Trace ("LutePlay Activated. Player playing Song.")
				Game.DisablePlayerControls(abCamSwitch = true, abSneaking = true, abActivate = false)
				Game.ForceThirdPerson()
				ActivatorParent.Enable()
				game.getplayer().playidle(IdleFluteStart)
				instanceID = MUSBardFlute01.play(self)
				StartTime = Utility.GetCurrentRealTime()
				RegisterForSingleUpdate(34)
				;GoToState("Playing")		
			Else
				game.enableplayercontrols()
; 				Debug.Trace ("LutePlay Activated during playing. Contorls unlocking.")
				Sound.StopInstance(InstanceID)
				ActivatorParent.Disable()
				game.getplayer().playidle(IdleStop)
				StartTime = 0.0
			Endif
	EndEvent

	Event OnUpdate ()
			Self.Activate(Game.GetPlayer())
	EndEvent


EndState





;/

			game.enableplayercontrols()
; 			Debug.Trace ("LutePlay updating. Contorls unlocking.")
			ActivatorParent.Disable()
			game.getplayer().playidle(IdleStop)

State Playing

	Event OnActivate(ObjectReference akActionRef)
			EndSong()
; 			Debug.Trace ("LutePlay Activated during playing. Contorls unlocking.")
			Sound.StopInstance(InstanceID)
			ActivatorParent.Disable()
			game.getplayer().playidle(IdleStop)
			GoToState("PostMS05")				
	EndEvent

Endstate
			
			

Function EndSong()
					game.enableplayercontrols()
EndFunction


/;

