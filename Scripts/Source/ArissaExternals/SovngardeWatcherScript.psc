Scriptname SovngardeWatcherScript extends ObjectReference  

float property bob = 512.0 auto
{How much up/down variance per adjustment?  DEFAULT = 512}
float property minSpeed = 1.0 auto
{Slowest possible movement? DEFAULT = 1}
float property maxSpeed = 5.0 auto
{fastest possible movement? DEFAULT = 5}

EVENT onLoad()
	while self.is3dLoaded() == FALSE
		utility.wait(1.0)
	endWhile
	self.setMotionType(Motion_Keyframed, TRUE)
	registerForSingleUpdate(0.50)
	
	int dice = utility.randomInt(0,1)
	if dice == 1
		bob = bob*-1
	endif
		
endEVENT

EVENT onUpdate()
		
	bob = bob*-1
	
	float Angle = self.getHeadingAngle(game.getPlayer())
; 	debug.trace("WATCHER: My Angle = "+Angle)
; 	debug.trace("WATCHER: My Goal Angle = "+Angle*-1)
	
	if Angle > 180
		Angle = (360 - Angle)
	endif
	
	if math.abs(angle) < 5
		Angle = 0
	endif
	
	float actualSpeed = utility.RandomFloat(minSpeed,maxSpeed)
	
	self.translateTo(self.x,self.y,self.z+bob,self.getAngleX(),self.getAngleY(),(self.getAngleZ()+Angle)+180,actualSpeed,0)
endEVENT

EVENT OnTranslationAlmostComplete()
; 	debug.trace("WATCHER: Almost done translating, register for another!")
	registerForSingleUpdate(1.0)
endEVENT
