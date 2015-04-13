Scriptname DA08EbonyBladeTrackingScript extends Quest conditional

int Property FriendsKilled auto conditional
int Property MaxFriendsKilled auto

Scene Property GratsScene auto

Function FriendKilled()
	if (FriendsKilled < MaxFriendsKilled)
		FriendsKilled += 1
; 		Debug.Trace("EBONY BLADE: Killed a friend, current count: " + FriendsKilled)
		if (FriendsKilled % 2 == 0)
			GratsScene.Start()
		endif
	endif
EndFunction


