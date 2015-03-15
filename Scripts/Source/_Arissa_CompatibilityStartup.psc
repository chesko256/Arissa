Scriptname _Arissa_CompatibilityStartup extends Quest  

Quest property _Arissa_CompatibilityQuest auto
ReferenceAlias property Alias_Player auto

Event OnInit()
	if !(_Arissa_CompatibilityQuest.IsRunning())
		_Arissa_CompatibilityQuest.Start()
	endif

	Alias_Player.ForceRefIfEmpty(Game.GetPlayer())
endEvent