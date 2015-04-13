scriptName DA07QuestScript extends Quest conditional

;Track how many owners of Mehrunes Razor are dead
int property RazorOwnersDead auto conditional
int property TalkedtoValmir auto conditional

;Variable to track if player talks to Ghunzul, triggers his package
int property GhunzulTalked auto conditional

;Variable to track if the player knows Lami is Jorgen's wife
int property KnowsLami auto conditional

;Variable to track if Player puts pieces in the case, triggers Valmir's package
int property PiecesInCase auto conditional

;Track how many pieces of the Razor the player has
int property RazorPiecesOwned auto conditional

MiscObject property Pommel auto 
MiscObject property Blade  auto 
MiscObject property Hilt auto 

Quest Property DA07 auto
Location Property ShrineofMehrunesDagon auto
Scene Property ValmirPraysScene auto
ReferenceAlias Property Razor auto
ReferenceAlias Property Jorgen auto
Scene property PommelScene auto
Scene property HiltScene auto
Scene property BladeScene auto


function IncrementDead()
       RazorOwnersDead = RazorOwnersDead + 1
endFunction

function IncrementRazorCount()
	RazorPiecesOwned = RazorPiecesOwned + 1
endFunction

function DecrementRazorCount()
	RazorPiecesOwned = RazorPiecesOwned - 1
endFunction

Function FixRazor()
	; FIX THE RAZOR DISAPPEARING IF THE CELL RESETS
	If GetStage() == 95
		Altar.GetRef().PlayAnimation("Reforge")	
	EndIf
EndFunction

ReferenceAlias Property Altar  Auto  
