Scriptname defaultDeleteSelfOnReset extends ObjectReference Hidden
{DOESN'T DO WHAT IT'S NAME IMPLIES.  IT'S HAD CHANGES MADE TO IT SPECIFICALLY FOR FIXING A NIRNROOT GLOW ISSUE.}

EVENT OnCellAttach()
	self.Disable()
	self.Delete()
endEVENT
