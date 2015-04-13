scriptName TG08BTowerFallScript extends objectReference
{This script turns on fx and plays sound for faking the tower falling}

objectReference property TG08TowerSoundRef auto
objectReference property TG08TowerFXRef auto

float property rumbleAmount = 1.0 Auto
float property rumbleDuration = 7.0 Auto
float property cameraShakeAmount = 0.8 Auto
sound property earthQuakeSound Auto

auto state waiting
	event onActivate(objectReference akActivator)
		goToState("quake")
	endEvent
endState


state Quake
	event onBeginState()
		TriggerQuake()
		utility.wait(2.0)
		TG08TowerSoundRef.enable()
		TG08TowerFXRef.playAnimation("playanim01")
		
		utility.wait(4.0)
		TG08TowerSoundRef.disable()
		TG08TowerSoundRef.delete()
		goToState("done")
	endEvent
endState

state Done
	;event onCellDetach()
		;TG08TowerFXRef.disable()
		;TG08TowerFXRef.delete()
	;endEvent
endState


Function TriggerQuake()
	if earthQuakeSound
		earthQuakeSound.play(game.getPlayer())
	endif
	game.ShakeController(rumbleAmount, rumbleAmount, rumbleDuration)
	game.ShakeCamera(none, cameraShakeAmount, rumbleDuration)
	
EndFunction
