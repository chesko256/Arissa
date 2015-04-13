Scriptname Custom Hidden
import objectReference



;This function takes in an ObjectReference and counts the number of linked refs that are in a linked Ref chain.
int Function countLinks(objectReference currentLink) global	
	;Don't use this on a loop of linked refs.
	int numPorts = 0 
 	while(currentLink)	;	 && (numPorts < 100))		;runs until currentLink is None.
		currentLink = currentLink.getLinkedRef()
		numPorts = numPorts + 1
	endWhile
	if numPorts < 100
		return numPorts
	else
; 		debug.trace( "Too many links, or the linked refs are arranged in a loop." )
		return 0
	endif
endFunction

;This function returns the Nth objectReference in a linked ref chain.
;The root link in the chain is 1
objectReference Function goToLink(int linkNum, objectReference startRef ) global
	int linkIndex = 1
	while(linkNum != linkIndex ) 
		linkIndex = linkIndex + 1
		objectReference nextRef = startRef.getLinkedRef()
		if nextRef
			startRef = nextRef
		else
; 			debug.trace( "Tried to access None link in custom.GoToLink()" )
		endif
	endWhile
	return startRef
endFunction
