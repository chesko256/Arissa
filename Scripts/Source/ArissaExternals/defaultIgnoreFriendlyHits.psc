Scriptname defaultIgnoreFriendlyHits extends ObjectReference  
{this actor will always ignore friendly hits}

event OnLoad()
	IgnoreFriendlyHits(true)
endEvent