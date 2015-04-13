scriptName dunDruadachRedoubtMap extends objectReference

objectReference property DruadachRedoubtMapMarker auto
objectReference property BrokenTowerRedoubtMapMarker auto
objectReference property BrucasLeapRedoubtMapMarker auto
objectReference property DeepwoodRedoubtMapMarker auto
objectReference property DragonBridgeOverlookMapMarker auto
objectReference property HagRockRedoubtMapMarker auto
objectReference property KarthspireMapMarker auto
objectReference property LostValleyRedoubtMapMarker auto
objectReference property RebelsCairnMapMarker auto
objectReference property RedEagleRedoubtMapMarker auto
objectReference property SerpentsBluffRedoubtMapMarker auto
objectReference property SunderedTowersMapMarker auto


auto state waiting
	event onActivate(objectReference akActivator)
		if akActivator == game.getPlayer()
			DruadachRedoubtMapMarker.addtoMap(false)
			BrokenTowerRedoubtMapMarker.addtoMap(false)
			BrucasLeapRedoubtMapMarker.addtoMap(false)
			DeepwoodRedoubtMapMarker.addtoMap(false)
			DragonBridgeOverlookMapMarker.addtoMap(false)
			HagRockRedoubtMapMarker.addtoMap(false)
			KarthspireMapMarker.addtoMap(false)
			LostValleyRedoubtMapMarker.addtoMap(false)
			RebelsCairnMapMarker.addtoMap(false)
			RedEagleRedoubtMapMarker.addtoMap(false)
			SerpentsBluffRedoubtMapMarker.addtoMap(false)
			SunderedTowersMapMarker.addtoMap(false)
			goToState("doNothing")
		endif
	endEvent
endState

state doNothing
	event onBeginState()
		self.disable()
		self.delete()
	endEvent
endState
