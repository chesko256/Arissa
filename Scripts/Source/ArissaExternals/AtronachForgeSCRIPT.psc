scriptname AtronachForgeSCRIPT extends objectReference

formlist property RecipeList auto
{Master list of valid recipes. Most Complex should be first}
formlist property ResultList auto
{Master list of recipe results.  Indices of Rewards MUST MATCH those of the recipe list}
formlist property SigilRecipeList auto
{Recipes that are only available when sigil stone is installed}
formlist property SigilResultList auto
{Items attainable only with sigil stone installed}
objectReference  property createPoint auto
{Marker where we place created items}
objectReference property DropBox auto
{where the player places items to be crafted}
activator property summonFX auto
{Point to a fake summoning cloud activator}
objectReference property summonFXpoint auto
{Where we place the summoning FX cloud}
bool property sigilStoneInstalled auto hidden
{has the sigil stone been installed?}
objectReference property lastSummonedObject auto hidden
; store whatever we summoned last time to help clean up dead references.

STATE busy
	EVENT onActivate(objectReference actronaut)
; 		debug.trace("Atronach Forge is currently busy.  Try again later")
	endEVENT
endSTATE

auto STATE ready
	EVENT onActivate(objectReference actronaut)
			
		gotoState("busy")
		bool DaedricItemCrafted
		
		; first attempt to craft Daedric items if the Sigil Stone is installed
; 		debug.trace("Atronach Forge checking for Sigil Stone")
		if sigilStoneInstalled == TRUE
; 			debug.trace("Atronach Forge detected Sigil Stone, attempt Daedric Combines first")
			DaedricItemCrafted = scanForRecipes(SigilRecipeList, SigilResultList)
			utility.wait(0.1)
		endif
		
		; if no sigil stone, or if we checked and found no valid Daedric recipes...
		if sigilStoneInstalled == FALSE || DaedricItemCrafted == FALSE
; 			debug.trace("Atronach Forge Either did not detect Sigil Stone, or no deadric combines were found")
			ScanForRecipes(RecipeList, ResultList)
		endif
		
		gotoState("ready")
		
	endEVENT
endSTATE

bool FUNCTION ScanForRecipes(formlist Recipes, formList Results)

	; set up our counter vars
	int i = 0
	int t = Recipes.getSize()
	bool foundCombine = FALSE
	bool checking = TRUE
	
	;========================================================
		
	While checking == TRUE && i < t
		formlist currentRecipe = (Recipes.getAt(i)) as formList
		if currentRecipe == NONE
; 			debug.trace("ERROR: Atronach Forge trying to check a NONE recipe")
		else
			if scanSubList(currentRecipe) == TRUE
				; I have found a valid recipe
; 				debug.trace("Atronach Forge found ingredients for "+currentRecipe)
				removeIngredients(currentRecipe)
				foundCombine = TRUE
				checking = FALSE
			else
				; found nothing
			endif
		endif
		
		if foundCombine == FALSE
			; only increment if we are continuing to loop
			i += 1
		endif
		
	endWhile
	
	
	if foundCombine == TRUE
		; we found a valid item, so create it!
; 		debug.trace("Attempting to spawn a "+Results.getAt(i))
		summonFXpoint.placeatme(summonFX);summonFX.playGamebryoAnimation("mIdle")
		utility.wait(0.33)
		objectReference newREF = createPoint.placeAtMe(Results.getAt(i))
		
		; if the last thing I summoned is a dead actor, just get rid of it.
		if (lastSummonedObject)
			if ((lastSummonedObject as actor).isDead())
				; transfer any items to the offering box (just in case I had anything valuable on me!)
				lastSummonedObject.RemoveAllItems(DropBox, FALSE, TRUE)
				lastSummonedObject.disable()
				lastSummonedObject.delete()
			endif
		endif
		
		; now store whatever we just created as the current/last summoned object
		lastSummonedObject = newREF
		
		if (newREF as actor) != NONE
			(newREF as actor).startCombat(game.getPlayer())
		endif
		
		return TRUE
	else
		; did not find any valid combines - choose a "failure" scenario
		return FALSE
	endif

endFUNCTION
;========================================================
;========================================================
;========================================================
bool FUNCTION scanSubList(formList recipe)
	int size = recipe.getSize()
	int cnt = 0
	while cnt < size
		form toCheck = recipe.getAt(cnt)
		if dropBox.getItemCount(toCheck) < 1
; 			;debug.trace("Did not have item "+toCheck+" ("+cnt+") for recipe #"+recipe)
			return FALSE
		else
; 			;debug.trace("I Have item "+toCheck+" ("+cnt+") for recipe #"+recipe)
			; we have the item in cnt
		endif
		cnt += 1
	endWhile
	
	return TRUE
	
endFUNCTION

FUNCTION removeIngredients(formlist recipe)
	 int size = recipe.getSize()
	 int cnt = 0
	 while cnt < size
		form toCheck = recipe.getAt(cnt)
		dropBox.removeItem(toCheck, 1)
; 		debug.trace("Atronach Forge is consuming "+toCheck)
		cnt += 1
	endWhile
endFUNCTION

