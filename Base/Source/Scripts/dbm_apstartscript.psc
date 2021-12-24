scriptName dbm_apstartscript extends ObjectReference

;-- Properties --------------------------------------
globalvariable property DBM_MuseumStart auto
quest property DBM_MuseumIntro auto
armor property RHBoots auto
armor property RHGloves auto
globalvariable property GameDaysPassed auto
armor property ClothesFineHat02 auto
message property DBMLALMSG auto
armor property ClothesFineBoots01 auto
armor property ClothesFineClothes01 auto
weapon property SteelSword auto
quest property RelicHunterQST auto
leveleditem property DBM_LALStartItems auto
armor property RHArmor auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function OnCellAttach()

	utility.Wait(2 as Float)
	if self.GetDistance(game.GetPlayer() as ObjectReference) > 500 as Float
		self.Disable(false)
		self.GotoState("Inactive")
	endIf
endFunction

function OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == game.GetPlayer() as ObjectReference
		debug.TraceUser("LegacyoftheDragonborn", "[[LAL Start Marker]] - Player has triggered LAL start marker.", 0)
		if Quest.GetQuest("AP_HelgenDialogue") != none ; Remove LAL Check & Replace with AP one zzz
			debug.TraceUser("LegacyoftheDragonborn", "[[LAL Start Marker]] - ASLAL Located.", 0)
			if !RelicHunterQST.IsRunning() && DBM_MuseumIntro.GetStage() == 0 && GameDaysPassed.value <= 3 as Float
				Int iButton = DBMLALMSG.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
				if iButton == 0
					game.GetPlayer().RemoveItem(ClothesFineBoots01 as form, 1, true, none)
					game.GetPlayer().RemoveItem(ClothesFineClothes01 as form, 1, true, none)
					game.GetPlayer().RemoveItem(ClothesFineHat02 as form, 1, true, none)
					game.GetPlayer().AddItem(DBM_LALStartItems as form, 1, true)
					game.GetPlayer().EquipItem(RHArmor as form, false, true)
					game.GetPlayer().EquipItem(RHGloves as form, false, true)
					game.GetPlayer().EquipItem(SteelSword as form, false, true)
					game.GetPlayer().EquipItem(RHBoots as form, false, true)
					DBM_MuseumStart.SetValue(1 as Float)
					RelicHunterQST.SetStage(5)
					debug.TraceUser("LegacyoftheDragonborn", "[[LAL Start Marker]] - Relic Hunter start successful.", 0)
					self.Disable(false)
					self.GotoState("Inactive")
				elseIf iButton == 1
					debug.TraceUser("LegacyoftheDragonborn", "[[LAL Start Marker]] - Player chose not to become relic hunter.", 0)
					self.Disable(false)
					self.GotoState("Inactive")
				endIf
			else
				debug.TraceUser("LegacyoftheDragonborn", "[[LAL Start Marker]] - Museum Quests already started or it has been over 3 game days since game start.", 0)
				self.Disable(false)
				self.GotoState("Inactive")
			endIf
		else
			debug.Trace("Alternate Start - Live Another Life is not currently running. Please ignore errors, these are normal", 0)
			debug.TraceUser("LegacyoftheDragonborn", "[[LAL Start Marker]] - ASLAL not found, disabling trigger.", 0)
			self.Disable(false)
			self.GotoState("Inactive")
		endIf
	endIf
endFunction

; Skipped compiler generated GetState

;-- State -------------------------------------------
state Inactive
endState
