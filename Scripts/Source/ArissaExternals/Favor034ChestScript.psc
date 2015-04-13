Scriptname Favor034ChestScript extends ReferenceAlias  Conditional

int Property LockMe Auto Conditional

Event OnLoad()

	if LockMe == 0
		GetRef().Lock()
	endif

endEvent