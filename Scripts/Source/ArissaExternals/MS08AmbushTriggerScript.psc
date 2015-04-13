Scriptname MS08AmbushTriggerScript  extends ReferenceAlias 

int DoOnce



Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Saadia.GetReference()
		if DoOnce == 0
			AmbushScene.Start()
			DoOnce = 1
		endif
	endif


EndEvent
ReferenceAlias Property Saadia  Auto  

Scene Property AmbushScene  Auto  
