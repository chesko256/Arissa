ScriptName MQ101DragonAttackQuestScript extends Quest Conditional

; variable to track when the tower smash is done
Int Property AlduinSmashDone Auto conditional

;Variable to track when player is in the town square
Int property playerInSquare auto conditional

Int property dragonInScene1Ready auto conditional

;Variable to track when player is in tower
Int property playerInTower auto conditional


Function TowerDragonRoar()

	mySound01.play(mySoundOrigin01)
	;staggerOrigin.knockAreaEffect(1,2048)
	;game.shakeCamera(NONE, fCameraShake01)
	;game.shakeController(fLIntensity01, fRIntensity01, fduration01)
	Utility.wait(2)
	;myDustOrigin01.placeatme(myDustFX)
	;Utility.wait(1)
	;game.shakeCamera(NONE, fCameraShake02)
	;game.shakeController(fLIntensity02, fRIntensity02, fduration02)
	;myDustOrigin02.placeatme(myDustFX)

EndFunction



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