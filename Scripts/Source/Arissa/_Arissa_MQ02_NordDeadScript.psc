Scriptname _Arissa_MQ02_NordDeadScript extends ObjectReference  

_Arissa_iNPC_Behavior property iNPCSystem auto
ObjectReference property _Arissa_CaveInTemp auto
Quest property _Arissa_MQ02 auto
Scene property _Arissa_MQ02_AreYouOKScene auto

Sound property mySound01 auto
{the sound to play}

ObjectReference property mySoundOrigin01 auto
{the reference to play the sound from}

ObjectReference property myDustOrigin01 auto
{the reference to play the dust from}

ObjectReference property myDustOrigin02 auto
{the reference to play the dust from}

Explosion property myDustFX auto

float property fCameraShake01 auto
{camera shake intensity}

float property fCameraShake02 auto
{camera shake intensity}

float property fduration01 auto
{camera shake duration}

float property fduration02 auto
{camera shake duration}

float property fLIntensity01 auto
{shake left intensity}

float property fLIntensity02 auto
{shake left intensity}

float property fRIntensity01 auto
{shake right intensity}

float property fRIntensity02 auto
{shake right intensity}

objectReference property staggerOrigin auto
{where should the stagger originate from}

objectReference property _Arissa_MQ02_SnapPlayerMarker auto
objectReference property _Arissa_MQ02_SnapArissaMarker auto

Event OnDeath(Actor akKiller)
	if Game.GetPlayer().GetPositionX() > -10700.0 || iNPCSystem.iNPC.GetActorRef().GetPositionX() > -10700.0 
		Game.GetPlayer().MoveTo(_Arissa_MQ02_SnapPlayerMarker)
		iNPCSystem.iNPC.GetActorRef().MoveTo(_Arissa_MQ02_SnapArissaMarker)
	endif
	_Arissa_CaveInTemp.Enable()
	mySound01.play(mySoundOrigin01)
	staggerOrigin.knockAreaEffect(1,2048)
	game.shakeCamera(NONE, fCameraShake01)
	game.shakeController(fLIntensity01, fRIntensity01, fduration01)
	utility.wait(1)
	myDustOrigin01.placeatme(myDustFX)
	utility.wait(0.4)
	game.shakeCamera(NONE, fCameraShake02)
	game.shakeController(fLIntensity02, fRIntensity02, fduration02)
	myDustOrigin02.placeatme(myDustFX)

	_Arissa_MQ02.SetObjectiveCompleted(50)
	_Arissa_MQ02.SetObjectiveDisplayed(100)
	_Arissa_MQ02.SetStage(51)

	utility.wait(2)
	_Arissa_MQ02_AreYouOKScene.Start()
endEvent