Scriptname FXSetBlendVariableScript extends ObjectReference  
{Sets the blend varaible for this fx on load}

float Property myfToggleBlend auto
{defaults to zero set from 0-1}
float Property myfToggleBlendRageMin = 0.0 auto
{Randomrange min for when makeRandom is used}
float Property myfToggleBlendRageMax = 1.0 auto
{Randomrange max for when makeRandom is used}
int Property makeRandom auto
{set to 1 to make the blend variable randomly set itself}
int Property updateRandomOverTime auto
{set to 1 to make the blend variable randomly change after the waitTime only matters if makeRandom is set to 1}
float Property waitTimeMin = 1.0 auto
{time to wait before changing myfToggleBlend randomly}
float Property waitTimeMax = 0.0 auto
{max amount to add to waitTime randomly}

float myRandom
float myWaitTime
int doWhileLoop 



	Event OnLoad()
	;See if we will set blend variable randomly, randomly over time, or once based on input
		if makeRandom > 0 && updateRandomOverTime == 0
			myRandom = utility.RandomFloat(myfToggleBlendRageMin,myfToggleBlendRageMax)
			SetAnimationVariableFloat("fToggleBlend", myRandom)
		elseif makeRandom > 0 && updateRandomOverTime > 0
			doWhileLoop = 1
		else
			SetAnimationVariableFloat("fToggleBlend", myfToggleBlend)
		endif
		;Loop to change variable over time
		while doWhileLoop == 1
			myRandom = utility.RandomFloat(myfToggleBlendRageMin,myfToggleBlendRageMax)
			SetAnimationVariableFloat("fToggleBlend", myRandom)
			myWaitTime = utility.RandomFloat(waitTimeMin,waitTimeMax)
			utility.wait(myWaitTime)
		endWhile
	endEvent
	
	Event OnUnLoad()
		;Stop while loop for random over time when unloaded
		if doWhileLoop == 1
			doWhileLoop = 0
		endIf
	endEvent
		
