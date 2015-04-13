Scriptname TG09JournalScript extends ReferenceAlias  

int Property pReadBook Auto Conditional
Quest Property pTG09Quest Auto

Event OnRead()

	if pReadBook == 0
		if pTG09Quest.IsObjectiveDisplayed(25) == 1
			pTG09Quest.SetObjectiveCompleted(25,1)
			pReadBook = 1
		endif
	endif

endEvent