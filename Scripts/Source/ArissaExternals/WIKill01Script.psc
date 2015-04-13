Scriptname WIKill01Script extends WorldInteractionsScript  Conditional
{Extends WorldInteractionsScript which extends Quest script.}

Quest Property pWI  Auto  
{Pointer to WI quest}

float Property pStartMourningDay Auto  
{Day quest started (expressed as GameDaysPassed)}


float Property pEndMourningDay  Auto  
{Day quest should stop and remove mourners from factions (expressed as GameDaysPassed)}


; OBOSLETE?
;Event OnUpdate()	;registered/unregistered in stage 0/255
;	if pEndMourningDay < pGameDaysPassed.value
;		stop()
;	endif
;EndEvent
