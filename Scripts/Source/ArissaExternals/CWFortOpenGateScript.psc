Scriptname CWFortOpenGateScript extends Quest  Conditional 
{Extends Quest}

int Property EnteringOrLeaving Auto hidden Conditional		;0 = unset, 1 = entering, 2 = leaving -- set in start up stage based on which marker actor is closer to

;## Aliases ##
ReferenceAlias property GateLever Auto
ReferenceAlias property Gatekeeper Auto
ReferenceAlias property TriggerBox Auto

;## Scenes ##
Scene Property CWFortOpenGateScene Auto

;## Globals ##
GlobalVariable Property DebugOn auto
{Pointer to CWDebugOn global}


