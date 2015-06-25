scriptname _Arissa_2_2_Transfer_Inventory extends ObjectReference

ObjectReference property _Arissa_InventoryActorRef auto

Event OnInit()
	; Arissa 2.2 Update - Transfer all items from Chest to dummy Actor
	self.RemoveAllItems(_Arissa_InventoryActorRef)
EndEvent