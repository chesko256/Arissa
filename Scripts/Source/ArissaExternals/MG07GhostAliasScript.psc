Scriptname MG07GhostAliasScript extends ReferenceAlias  


{sets the "no favor allowed" flag on the ref on load}

event OnLoad()
	Self.GetReference().SetNoFavorAllowed()
endEvent