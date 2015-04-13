Scriptname MGRitual04GhostScript extends ReferenceAlias  

int DoOnce

Event OnLoad()

	if DoOnce == 0
		(Self.GetReference() as Actor).SetGhost()
		DoOnce =1
	endif

EndEvent