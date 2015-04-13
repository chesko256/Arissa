Scriptname TGTQ04NiranyeScript extends ReferenceAlias  

ReferenceAlias Property pTGTQ04Note Auto

Event OnDying(Actor akKiller)

	Self.GetRef().AddItem(pTGTQ04Note.GetRef())

endEvent