;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_DialogueIvarstead_00021236 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnkeeperBackup
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnkeeperBackup Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Lynly Plays Lute for free (Persuade success)
(BardSongs as BardSongsScript).PlaySong(pLynly,"Lute",False,0,True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Commands Lynly to Play
Game.GetPlayer().RemoveItem(pGold,5)
(BardSongs as BardSongsScript).PlaySongRequest(pLynly,"Lute",False,0,True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property pGold  Auto 

Quest Property BardSongs  Auto  

ObjectReference Property pLynly  Auto  
