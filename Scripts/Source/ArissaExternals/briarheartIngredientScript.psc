Scriptname briarheartIngredientScript extends ObjectReference  
{Script handles the visuals of a briarheart going in or out of a briarheart forsworn}
armor property ArmorBriarHeartEmpty auto
armor property ArmorBriarHeart auto
spell property dunReanimateSelf auto

EVENT OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if (akOldContainer as actor)

; 		; debug.trace("Briarheart: Handle removal from an actor")
		actor oldHost = (akOldContainer as actor)
		if oldHost.isEquipped(armorBriarHeart)
			if oldHost.getItemCount(armorBriarHeartEmpty) < 1
				oldHost.additem(armorBriarHeartEmpty, 1)
			endif
			if !oldHost.isDead()
; 				; debug.trace("Briarheart: if I was a living Briarheart, then kill me and blame it on whomever took my heart.:")
				oldHost.kill(akNewContainer as actor)
			endif
			while utility.isInMenuMode()
				utility.wait(0.1)
			endWhile
			
			oldHost.equipItem(armorBriarHeartEmpty, TRUE, TRUE)
			oldHost.unequipItem(armorBriarHeart, TRUE, TRUE)
		endif
	endif	
	
	if (akNewContainer as actor)
; 		debug.trace("DEBUG LiNE 28")
; 		; debug.trace("Briarheart: my new container is an actor.  See if it's a briarheart w/o a  heart")
		actor newHost = (akNewContainer as actor)
		
		if newHost.isEquipped(armorBriarHeartEmpty)	
			if newHost.getItemCount(ArmorBriarHeart) < 1
				newHost.addItem(armorBriarHeart,1)
			endif
			
			if newHost.isDead()
				; if the briarheart was dead, resurrect it.
				;dunReanimateSelf.cast(newHost,newHost)
				
				while utility.isInMenuMode()
					utility.wait(0.1)
				endWhile
							
				if !newHost.isEquipped(armorBriarHeart)
					newHost.equipItem (armorBriarHeart, TRUE, TRUE)
				endif
				
				;newHost.unequipItem (armorBriarHeartEmpty, TRUE, TRUE)	
			endif
		endif
	endif

endEVENT
