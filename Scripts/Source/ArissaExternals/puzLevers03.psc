scriptName puzLevers03 extends objectReference
import Debug

objectReference Property controllerScript Auto

; the lever states
; 0 -> Bing
; 1 -> Bong
; 2 -> Bang
int leverStateVar
int Property leverState hidden

	int function get()
		return leverStateVar
	endFunction

	function set(int i)
		leverStateVar = i
		
		IF ( leverNumberVal == 1 )
			mainScript.gLeverA = i
; 			;debug.trace(mainScript.gLeverA)
		ELSEIF (leverNumberVal == 2 )
			mainScript.gLeverB = i
; 			;debug.trace(mainScript.gLeverB)
		ELSEIF (leverNumberVal == 3 )
			mainScript.gLeverC = i
; 			;debug.trace(mainScript.gLeverC)
		ELSEIF (leverNumberVal == 4 )
			mainScript.gLeverD = i
; 			;debug.trace(mainScript.gLeverD)
		ELSEIF (leverNumberVal == 5 )
			mainScript.gLeverE = i
; 			;debug.trace(mainScript.gLeverE)
		ENDIF ; if the number is 0, it won't talk to the main script at all and not be involved in the puzzle
	endFunction

endProperty

	
; what the lever should do next when it's at state 1
; 0 -> Push
; 1 -> Pull
int leverNext
bool doOnce

; main script variable
puzLeversControl mainScript

; the lever properties

;/bool Property puzzle01LeverA Auto
bool Property puzzle01LeverB Auto
bool Property puzzle01LeverC Auto
bool Property puzzle01LeverD Auto
bool Property puzzle01LeverE Auto/;

int leverNumberVal = 0 ; Invalid value so if it isn't set it doesn't affect the puzzle
int Property leverNumber
	{This property is the lever number for this lever
	valid values are 1 - 5}
	int Function Get()
		return leverNumberVal
	endFunction
	
	Function Set (int value)
		if (value >= 1 && value <= 5)
			leverNumberVal = Value
		else
			leverNumberVal = 0
		endif
	endFunction
endProperty

 EVENT onInit()
	
	mainScript = controllerScript as puzLeversControl
	
	;default leverstate to 1
	leverState = 1
	leverNext = 1
	 
 ENDEVENT

EVENT onActivate ( objectReference triggerRef )
			
		IF ( leverState == 0)
			playAnimationandWait("PushUp", "UnPushed")
			messageBox("State to 1")
			leverState = 1
		ELSEIF (leverState == 1)
			playAnimationandWait("PullDown", "Pulled")
			messageBox("State to 2")
			leverState = 2
		ELSEIF (leverState == 2)
			playAnimationandWait ("PullUp", "UnPulled")
			playAnimationandWait ("PushDown", "Pushed")
			messageBox("State to 0")
			leverState = 0
		ENDIF
		mainScript.CheckSolution()
		messageBox("Puzzle Solution: A = " + mainScript.lever01Solution  + " B = " + mainScript.lever02Solution + " C = " + mainScript.lever03Solution + " D = " + mainScript.lever04Solution + " E = " + mainScript.lever05Solution)
endEVENT
