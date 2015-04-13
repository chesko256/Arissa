Scriptname DialogueWinterholdCollegeQuestScript extends Quest  Conditional

int Property GateOpen  Auto  Conditional

int Property CollapseInfo  Auto  Conditional

int Property AncanoAdviceInfo  Auto  Conditional

int Property FalionInfo  Auto  Conditional

bool Property EnthirSell  Auto  Conditional

bool Property CollegeUnsafe  Auto  Conditional

Quest Property MGR30  Auto  

Quest Property MG08  Auto  


Event OnUpdateGameTime()

; Debug.Trace("DialogueWinterhold: Game Time Update Called")

	if MG08.GetStage() == 200
		MGR30.Start()
	endif

EndEvent
int Property TolfdirPostQuestFG  Auto  Conditional

int Property SavosIntro  Auto  Conditional

Int Property ScrollDonated  Auto  Conditional