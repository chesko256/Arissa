Scriptname WIDeadBody01 extends WorldInteractionsScript  Conditional
{Extends WorldInteractionsScript which extends Quest.}

Scene Property pScene  Auto  
{pointer to scene}

function ReorderAliasesBasedOnDistance( ObjectReference TargetReference, \
ReferenceAlias RefAlias1, ReferenceAlias RefAlias2, ReferenceAlias RefAlias3 = None, \
ReferenceAlias FirstAlias, ReferenceAlias SecondAlias, ReferenceAlias ThirdAlias = None)
{References in RefAlias1-3 test distance to TargetReference, the references in RefAlias1-3 are then forced into FirstAlias, SecondAlias, ThirdAlias, in order of shortest distance to longest.}
;NOTE: For some reason if you try to name parameters to get passed usued optional parameters, it won't compile. So just pass in NONE for optional parameters you aren't using
	ObjectReference	ref1 = RefAlias1.getReference()
	ObjectReference	ref2 = RefAlias2.getReference()

	ObjectReference	ref3

	float d1 = TargetReference.getDistance(ref1)
	float d2 = TargetReference.getDistance(ref2)
	float d3	;will hold distance of optional RefAlias3
	float dN	;holds temporary value
	
	if d1 < d2
		FirstAlias.forceRefTo(ref1)
		SecondAlias.forceRefTo(ref2)
	else
		FirstAlias.forceRefTo(ref2)
		SecondAlias.forceRefTo(ref1)
		dN = d1
		d1 = d2
		d2 = dN
	endif
		
	if refAlias3		;only do this if we passed in RefAlias3 parameter
		ref3 = RefAlias3.getReference()
		d3 = TargetReference.getDistance(ref3)
		
		if d3 < d1
			if ThirdAlias
				ThirdAlias.forceRefTo(SecondAlias.getReference())
			endif
			SecondAlias.forceRefTo(FirstAlias.getReference())
			FirstAlias.forceRefTo(ref3)
		elseif d3 < d2
			if ThirdAlias
				ThirdAlias.forceRefTo(SecondAlias.getReference())
			endif
			SecondAlias.forceRefTo(ref3)
		elseif thirdAlias	;only do this if we passed in thirdAlias parameter
			ThirdAlias.forceRefTo(ref3)	
		endif
		
	endif

endFunction


