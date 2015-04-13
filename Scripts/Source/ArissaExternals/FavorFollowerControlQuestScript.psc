scriptName FavorFollowerControlQuestScript extends Quest conditional

;Set Follower to follow Player
;1 = Follow Player
;0 = Wait at current location
Int property FollowPlayer auto conditional

;Set Follower to return home
Int property Fired auto conditional
GlobalVariable Property FollowerTimer  Auto  

Scene Property FollowerQuits  Auto  
