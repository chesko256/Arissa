Scriptname CompanionsBladeFragmentTracking extends Quest  

ObjectReference Property FragmentMounted01 auto ; missing
ObjectReference Property FragmentMounted02 auto ; in jorrvaskr
ObjectReference Property FragmentMounted03 auto ; missing
ObjectReference Property FragmentMounted04 auto ; missing
ObjectReference Property FragmentMounted05 auto ; in jorrvaskr
ObjectReference Property FragmentMounted06 auto ; in jorrvaskr
ObjectReference Property FragmentMounted07 auto ; starts in Dustmans Cairn
ObjectReference Property FragmentMounted08 auto ; kodlak has it
ObjectReference Property FragmentMounted09 auto ; missing
ObjectReference Property FragmentMounted10 auto ; missing
ObjectReference Property FragmentMounted11 auto ; in jorrvaskr
ObjectReference Property FragmentMounted12 auto ; missing

bool Property FragmentsAvailable auto

bool[] Property InJorrvaskr auto
bool[] Property OtherwiseIndisposed auto

bool __settingMountings = false

ObjectReference[] __fragments

Function Setup()
	__fragments = new ObjectReference[12]

	__fragments[0]  = FragmentMounted01
	__fragments[1]  = FragmentMounted02
	__fragments[2]  = FragmentMounted03
	__fragments[3]  = FragmentMounted04
	__fragments[4]  = FragmentMounted05
	__fragments[5]  = FragmentMounted06
	__fragments[6]  = FragmentMounted07
	__fragments[7]  = FragmentMounted08
	__fragments[8]  = FragmentMounted09
	__fragments[9]  = FragmentMounted10
	__fragments[10] = FragmentMounted11
	__fragments[11] = FragmentMounted12

	InJorrvaskr[1] = true
	InJorrvaskr[4] = true
	InJorrvaskr[5] = true
	InJorrvaskr[10] = true

	OtherwiseIndisposed[7] = true
	OtherwiseIndisposed[8] = true

	FragmentsAvailable = true

	SetMountings()
EndFunction

Function SetMountings()
; 	Debug.Trace("COMPANIONS: Setting fragment mountings.")

	while (__settingMountings)
		Utility.Wait(0.1)
	endwhile

	__settingMountings = true

	int count = 0
	while (count < InJorrvaskr.Length)
		if (InJorrvaskr[count])
; 			Debug.Trace("COMPANIONS: Enabling fragment " + count)
			__fragments[count].Enable()
		else
; 			Debug.Trace("COMPANIONS: Disabling fragment " + count)
			__fragments[count].Disable()
		endif
		count += 1
	endwhile

	__settingMountings = false
EndFunction

ObjectReference Function GetFragmentForRetrieval()
	int count = 0

	while (count < InJorrvaskr.Length)
		if (!InJorrvaskr[count] && !OtherwiseIndisposed[count])
			return __fragments[count]
		endif
	endwhile
EndFunction

Function ReturnFragment(ObjectReference fragmentRef)
	MiscObject fragment = fragmentRef.GetBaseObject() as MiscObject

	int count = 0
	while (count < __fragments.Length)
		if (fragment == __fragments[count].GetBaseObject())
			InJorrvaskr[count] = true
		endif
		count += 1
	endwhile

	SetMountings()
EndFunction

Function AllFragmentsStolen()
	int count = 0
	while (count < __fragments.Length)
		InJorrvaskr[count] = false
		count += 1
	endwhile

	SetMountings()
EndFunction

Function AllFragmentsRestored()
	int count = 0
	while (count < __fragments.Length)
		InJorrvaskr[count] = true
		count += 1
	endwhile

	SetMountings()
EndFunction
