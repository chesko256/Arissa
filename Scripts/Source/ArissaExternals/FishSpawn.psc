scriptName FishSpawn extends ObjectReference

import TestFish
import Utility

Activator property FishType auto

Event OnLoad()

	wait(10)

	int count = 0
	while (count < 25)
		ObjectReference fishRef = PlaceAtMe(FishType)
		TestFish fish = fishRef as TestFish
		fish.Spawner = self
		fish.Start()
		wait(0.2)
		count = count + 1
	endWhile

endEvent