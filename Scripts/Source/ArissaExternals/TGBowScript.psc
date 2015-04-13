Scriptname TGBowScript extends ObjectReference

int Property pEquippedBow Auto
ObjectReference Property pBow Auto
Ammo Property pArrows Auto

Event OnLoad()

	if pEquippedBow == 0
		AddItem(pBow,1)
		AddItem(pArrows,50)
		pEquippedBow = 1
	endif

endEvent