Scriptname CWQuartermasterScript extends Actor  

ObjectReference Property MerchantContainer Auto

Event OnCellLoad()

; 	debug.trace(self + "calling reset() on merchant container:" + MerchantContainer)

	MerchantContainer.Reset()


EndEvent

