scriptname dunVolunruudAltarScript extends objectReference
{Script runs on the altar/tomb to allow the player to insert reliquaries}

message property altarMSG auto
miscObject property ReliqLH auto
miscObject property ReliqRH auto
miscObject property ReliqLF auto
miscObject property ReliqRF auto
objectReference property CairnDoor auto
; following are a series of booleans for the reliquaries.  0 == missing, 1 == placed
bool LH = false
bool RH = false
bool LF = false
bool RF = false


auto STATE waiting
	EVENT onActivate(objectReference actronaut)
		; create a player variable to use throughout
		objectReference player = game.getPlayer() as objectReference
		if actronaut == player		; only proceed if it's the player
			int input = altarMSG.show()			; display the text box and get the player's UIchoice
			if input == 0
				player.removeItem(ReliqLH, 1)
				LH = true
				; remove the reliquary and play requisite animation on altar
			elseif input == 1
				player.removeItem(ReliqRH, 1)
				RH = true
			elseif input == 2
				player.removeItem(ReliqLF, 1)
				LF = true
			elseif input == 3
				player.removeItem(ReliqRF, 1)
				RF = true
			endif	
			
			if LH == true && RH == true && LF == true && RF == true
				;win state
				playAnimation("pulldown")
; 				debug.trace("Volunruud puzzle unlocked")
				Game.ShakeController(0.1, 0.1, 0.75)
				CairnDoor.lock(false) ; this unlocks the door to the cairn
			endif
		endif
	endEVENT
endSTATE

STATE completed
endSTATE