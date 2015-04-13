Scriptname MS06Script extends Quest  Conditional

int Property IntroScene  Auto  Conditional
{Used for MS06Intro to mark when scene is finished
}

int Property MaidScream  Auto  Conditional
{Used for the MS06BystanderScene}

int Property DeadCultists  Auto  Conditional
{tracks how many cultists are killed in initial scene}

int Property TotalCultists = 3 Auto  Conditional
{how many cultists do you need to kill in first scene?}

function IncrementDeadCultists()
	DeadCultists = DeadCultists + 1
	if DeadCultists >= TotalCultists
		setStage(100)
	endif
endFunction