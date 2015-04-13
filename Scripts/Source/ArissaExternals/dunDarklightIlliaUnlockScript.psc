scriptName dunDarklightIlliaUnlockScript extends ObjectReference
{
- When player activates the linked door, Illia should walk to it and unlock it for the player
- This script is for player trigger only
- This script only fires once
}

import game
import actor
import utility

scene property UnlockScene auto
key property dunDarklightClosetKey auto
objectReference property illiaRef auto
quest property darklightQST auto

float n

Event onActivate(ObjectReference triggerRef)
	wait(1) ;an attempt to wait and see if the player has unlocked the door, may need to up the wait
		if (self.IsLocked()) && (darklightQst.getStage() >= 10 && darklightQst.getStage() < 20)
			n = game.GetPlayer().getdistance(illiaRef)
			if n < 1024 ;once illia gets in range of the player, add the key to the player's inventory
				UnlockScene.start()
				game.getPlayer().additem(dunDarklightClosetKey, 01) 
			endIf
		endif
endEvent
