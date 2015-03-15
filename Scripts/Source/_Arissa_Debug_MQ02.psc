Scriptname _Arissa_Debug_MQ02 extends Quest  

ReferenceAlias property Alias_Arissa auto
ReferenceAlias property Alias_MapMarker auto
ReferenceAlias property Alias_Gunnher auto


import debug

Event OnInit()
	if self.IsRunning()
		SetStage(31)
	endif

endEvent