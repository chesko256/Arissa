Scriptname MQ205Script extends Quest  Conditional

import game

Book Property ElderScroll auto

Event OnUpdate()
	; update quest when player gets Elder Scroll
	if GetPlayer().GetItemCount(ElderScroll) > 0
		SetStage(100)
	endif
endEvent