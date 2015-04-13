Scriptname DA04OghmaInfiniumScript extends ReferenceAlias  



; shamelessly copied/modified from the MiddenEnchantedSkull script
float Property MaxRotate auto
float Property MaxMove auto
bool Up

Event OnCellAttach()
; 	Debug.Trace("DA04: Loading Oghma Infinium.")
; 	Debug.Trace("DA04: Stage is " + GetOwningQuest().GetStage())
	if (GetOwningQuest().GetStage() < 55)
		GetReference().BlockActivation()
		GetReference().SetNoFavorAllowed()
	endif

	if (GetOwningQuest().GetStage() < 60)
		GetReference().SetNoFavorAllowed()
		GetReference().SetMotionType(GetReference().Motion_Keyframed)
	endif
	
;/ 	if (MaxRotate == 0)
		MaxRotate = 359.0
	endif

	if (GetReference().Is3Dloaded())
		registerForSingleUpdate(1.0)
	endif /;
EndEvent

Event OnUpdate()
;/ 	float bob = 0.0
	if (Up)
		bob = MaxMove
		Up = False
	else
		bob = -1 * MaxMove
		Up = True
	endif
; 	; Debug.Trace("DA04: Translating by: " + bob + ", current Z == " + GetReference().z)
	GetReference().TranslateTo(GetReference().x, GetReference().y, (GetReference().z + bob), 0, 0, Utility.RandomFloat(1, MaxRotate), 0.15) 

	if (GetReference().Is3Dloaded())
		registerForSingleUpdate(3.0)
	endif /;
EndEvent
