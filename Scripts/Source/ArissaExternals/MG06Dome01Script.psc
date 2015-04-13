Scriptname MG06Dome01Script extends ObjectReference  

Quest Property MG06  Auto  

int Property DomeNumber  Auto

ObjectReference Property Button01 Auto
ObjectReference Property Button02 Auto
ObjectReference Property Button03 Auto


bool DomeReady


import Debug
import utility


int Property SolveState  auto
{
This is the position the dome needs to be in to be ready for the next step.
Dome01	= 6
Dome02 = 7
Dome03 = 2
}


Event OnLoad()

	GoToState("Position01")

EndEvent




FUNCTION RotateDomeToState(int StateNumber, int AnimEventNumber)

MG06QuestScript QuestScript = MG06 as MG06QuestScript




		gotoState("busy")
	
		PlayAnimationandWait("Ice0" + AnimEventNumber, "TransSeq0"+ (AnimEventNumber + 1 ) )

;If we're moving into the correct position, start by setting the quest script variable

		if (statenumber == SolveState)
			trace(self + " dome ready!")

			DomeReady = True
			if DomeNumber == 1
				QuestScript.Dome01Ready = True
			elseif DomeNumber == 2 
				QuestScript.Dome02Ready = True
			elseif DomeNumber == 3
				QuestScript.Dome03Ready = True
			endif

;then, if beams are in place already, play Light Ray animation
;also lock dome in place so it can't keep rotating
;also also, lock crystal so it can't be further moved

			if QuestScript.BeamsReady == 1
				PlayAnimation("LightRay")
				QuestScript.CrystalLocked=1
				if DomeNumber==1
					(Button01 as MG06ButtonScript).Close()
				elseif DomeNumber==2
					(Button02 as MG06ButtonScript).Close()
				elseif DomeNumber==3
					(Button03 as MG06ButtonScript).Close()
				endif
;finally, check if all 3 domes are ready, if so then update stage to 60

				if QuestScript.Dome01Ready == 1
					if QuestScript.Dome02Ready == 1
						if QuestScript.Dome03Ready == 1
							MG06.SetStage(55)
						endif
					endif
				endif
			endif

;If we're moving OUT of correct position, update quest script variable


		else
			if DomeReady == True
				DomeReady = False
				if DomeNumber == 1
					QuestScript.Dome01Ready = False
				elseif DomeNumber == 2 
					QuestScript.Dome02Ready = False
				elseif DomeNumber == 3
					QuestScript.Dome03Ready = False
				endif			
			endif
		endif



EndFunction 


State Position01
	Event OnActivate(ObjectReference TriggerRef)
		RotateDomeToState(2,1)
		GoToState("Position02")
	EndEvent
EndState

State Position02
	Event OnActivate(ObjectReference TriggerRef)
		RotateDomeToState(3,2)
		GoToState("Position03")
	EndEvent
EndState

State Position03
	Event OnActivate(ObjectReference TriggerRef)
		RotateDomeToState(4,3)
		GoToState("Position04")
	EndEvent
EndState

State Position04
	Event OnActivate(ObjectReference TriggerRef)
		RotateDomeToState(5,4)
		GoToState("Position05")
	EndEvent
EndState

State Position05
	Event OnActivate(ObjectReference TriggerRef)
		RotateDomeToState(6,5)
		GoToState("Position06")
	EndEvent
EndState

State Position06
	Event OnActivate(ObjectReference TriggerRef)
		RotateDomeToState(7,6)
		GoToState("Position07")
	EndEvent
EndState

State Position07
	Event OnActivate(ObjectReference TriggerRef)
		RotateDomeToState(8,7)
		GoToState("Position08")
	EndEvent
EndState

State Position08
	Event OnActivate(ObjectReference TriggerRef)
		RotateDomeToState(1,8)
		GoToState("Position01")
	EndEvent
EndState