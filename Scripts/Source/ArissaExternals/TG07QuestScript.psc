Scriptname TG07QuestScript extends Quest  Conditional

int Property pTG07SceneMover  Auto  Conditional
int Property pTG07KarliahMoved Auto Conditional
int Property pTG07KarliahFG01 Auto Conditional
int Property pTG07BrynjolfFG01 Auto Conditional
int Property pTG07MustSay01 Auto Conditional
int Property pTG07MustSay02 Auto Conditional
int Property pTG07MustSay03 Auto Conditional
int Property pTG07MustSayTotal Auto Conditional
int Property pTG07Dia Auto Conditional
int Property pTG07Dia01 Auto Conditional
int Property pTG07ValdSpeechGate Auto Conditional
Quest Property pTG07SPQuest  Auto  Conditional
Quest Property pTG08AQuest  Auto  Conditional
Cell Property pTG07MercerHouse  Auto  Conditional
Key Property pTG07Key Auto Conditional
ObjectReference Property pTG07BrynjolfStartMarker  Auto  Conditional
ObjectReference Property pTG07KarliahStartMarker  Auto  Conditional
ObjectReference Property pTG07DelvinStartMarker  Auto  Conditional
ObjectReference Property pTG07VexStartMarker  Auto  Conditional
MiscObject Property pTG07Plans	Auto Conditional
ReferenceAlias Property pTG07KarliahAlias Auto Conditional
GlobalVariable Property pTGFavorLarge Auto Conditional
Faction Property pTG07TGFaction  Auto  Conditional
ObjectReference Property pTG07ValdEnabler  Auto  Conditional

event OnUpdate()

;At the initiation of the quest, move Karliah to the meeting marker at Ragged Flagon once Player has changed cells

	if pTG07KarliahMoved == 0 && Game.GetPlayer().GetParentCell() != pTG07KarliahAlias.GetRef().GetParentCell()
		pTG07KarliahAlias.GetRef().MoveTo(pTG07KarliahStartMarker)
		pTG07KarliahAlias.GetRef().Enable()
		pTG07KarliahMoved = 1
	else	
		RegisterForSingleUpdate(1)
	endif	

endEvent