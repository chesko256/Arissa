Scriptname NN01JournalScript extends ReferenceAlias  

Quest Property pNN01Quest Auto

Event OnRead()

	if pNN01Quest.GetStage() < 20
		pNN01Quest.SetStage(20)
	endif

endEvent