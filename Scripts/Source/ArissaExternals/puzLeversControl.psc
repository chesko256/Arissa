Scriptname puzLeversControl extends ObjectReference  
{Script that contains variables for the Lever puzzles.}

import Debug

int property gleverA Auto hidden 
int property gleverB Auto hidden
int property gleverC Auto hidden
int property gleverD Auto hidden
int property gleverE Auto hidden

int SolutionA = 0
int SolutionB = 0
int SolutionC = 0
int SolutionD = 0
int SolutionE = 0

int Property Lever01Solution
	{This property is the Solution state of Lever A
	Acceptable Integers: 0-2}
	int Function Get()
		return solutionA
	endFunction
	
	Function Set (int value)
		if (value >= 0 && value <= 3)
			solutionA = Value
		else
			solutionA = 0
		endif
	endFunction
endProperty

int Property Lever02Solution
	{This property is the Solution state of Lever B
	Acceptable Integers: 0-2}
	int Function Get()
		return solutionB
	endFunction
	
	Function Set (int value)
		if (value >= 0 && value <= 3)
			solutionB = Value
		else
			solutionB = 0
		endif
	endFunction
endProperty

int Property Lever03Solution
	{This property is the Solution state of Lever C
	Acceptable Integers: 0-2}
	int Function Get()
		return solutionC
	endFunction
	
	Function Set (int value)
		if (value >= 0 && value <= 3)
			solutionC = Value
		else
			solutionC = 0
		endif
	endFunction
endProperty

int Property Lever04Solution
	{This property is the Solution state of Lever D
	Acceptable Integers: 0-2}
	int Function Get()
		return solutionD
	endFunction
	
	Function Set (int value)
		if (value >= 0 && value <= 3)
			solutionD = Value
		else
			solutionD = 0
		endif
	endFunction
endProperty

int Property Lever05Solution
	{This property is the Solution state of Lever E
	Acceptable Integers: 0-2}
	int Function Get()
		return solutionE
	endFunction
	
	Function Set (int value)
		if (value >= 0 && value <= 3)
			solutionE = Value
		else
			solutionE = 0
		endif
	endFunction
endProperty

function checkSolution ()
	IF (gLeverA == Lever01Solution && gLeverB ==Lever02Solution && gLeverC == Lever03Solution && \
		gLeverD == Lever04Solution && gLeverE == Lever05Solution)
		messageBox("Correct Combination")
		activateDoor() 
		self.activate(game.getplayer())
	ELSE
		messageBox("Incorrect Combination")
	ENDIF
endfunction

function activateDoor ()
	activate(game.getplayer())
; 	debug.trace("activate the door")
endfunction   


