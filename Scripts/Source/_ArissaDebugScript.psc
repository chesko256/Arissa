scriptname _ArissaDebugScript extends Quest

function ArissaDebug(string sMessage, GlobalVariable gvDebug, int iSeverity = 1) global
	if iSeverity == gvDebug.GetValueInt()
		debug.trace("[ARISSA] " + sMessage)
	endif
endFunction