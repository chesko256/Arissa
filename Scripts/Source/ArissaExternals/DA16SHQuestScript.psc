Scriptname DA16SHQuestScript extends Quest  Conditional

GlobalVariable Property pDA16Count  Auto  Conditional
Message Property pDA16SkullMessage Auto Conditional

function SleepSkullCount()

	pDA16Count.Value += 5
	UpdateCurrentInstanceGlobal(pDA16Count)
	pDA16SkullMessage.Show()

endFunction

function WakeSkullCount()

	pDA16Count.Value -= 1
	UpdateCurrentInstanceGlobal(pDA16Count)
	pDA16SkullMessage.Show()

endFunction