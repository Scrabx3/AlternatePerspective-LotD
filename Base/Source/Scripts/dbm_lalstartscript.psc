Scriptname DBM_LALStartScript extends ObjectReference  

GlobalVariable Property DBM_MuseumStart Auto
GlobalVariable Property GameDaysPassed Auto
Message Property DBMLALMSG Auto
Quest Property RelicHunterQST Auto
Quest Property DBM_MuseumIntro Auto

Armor Property RHArmor Auto
Armor Property RHBoots Auto
Armor Property RHGloves Auto
LeveledItem Property DBM_LALStartItems Auto
Weapon Property SteelSword Auto

Armor Property ClothesFineBoots01 Auto
Armor Property ClothesFineClothes01 Auto
Armor Property ClothesFineHat02 Auto

Event OnCellAttach()
	Utility.Wait(2)
	if Self.GetDistance(Game.GetPlayer()) > 500
		Self.Disable()
		GoToState("Inactive")
	Endif
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionref == Game.GetPlayer()
		debug.TraceUser("LegacyoftheDragonborn","[[LAL Start Marker]] - Player has triggered LAL start marker.",0)
		; NOTE: Replaced LAL with AP check here
		If Quest.GetQuest("AP_DialogueHelgen") ; Game.GetFormFromFile(0x000DAF,"Alternate Start - Live Another Life.esp")
			debug.TraceUser("LegacyoftheDragonborn","[[LAL Start Marker]] - ASLAL Located.",0)
			if !RelicHunterQST.IsRunning() && (DBM_MuseumIntro.GetStage() == 1) && GameDaysPassed.Value <= 3
			;Checks if Relic Hunter has already started or if normal start is in progress.
				Int iButton = DBMLALMSG.Show()
				if iButton == 0
					;Relic hunter setup
					Game.GetPlayer().RemoveItem(ClothesFineBoots01, 1, abSilent = true)
					Game.GetPlayer().RemoveItem(ClothesFineClothes01, 1, abSilent = true)
					Game.GetPlayer().RemoveItem(ClothesFineHat02, 1, abSilent = true)

					Game.GetPlayer().AddItem(DBM_LALStartItems, 1, absilent = true)
					Game.GetPlayer().EquipItem(RHArmor, absilent = true)
					Game.GetPlayer().EquipItem(RHGloves, absilent = true)
					Game.GetPlayer().EquipItem(SteelSword, absilent = true)
					Game.GetPlayer().EquipItem(RHBoots, absilent = true)
					DBM_MuseumStart.SetValue(1)
					RelicHUnterQST.SetStage(5)
					debug.TraceUser("LegacyoftheDragonborn","[[LAL Start Marker]] - Relic Hunter start successful.",0)
					Disable()
					GoToState("Inactive")
				elseif iButton == 1
					debug.TraceUser("LegacyoftheDragonborn","[[LAL Start Marker]] - Player chose not to become relic hunter.",0)
					Disable()
					GoToState("Inactive")
				EndIf
			
			Else
				debug.TraceUser("LegacyoftheDragonborn","[[LAL Start Marker]] - Museum Quests already started or it has been over 3 game days since game start.",0)
				Disable()
				GoToState("Inactive")
			EndIf
		Else
			Debug.Trace("Alternate Start - Live Another Life is not currently running. Please ignore errors, these are normal")
			debug.TraceUser("LegacyoftheDragonborn","[[LAL Start Marker]] - ASLAL not found, disabling trigger.",0)
			Disable()
			GoToState("Inactive")
		EndIf
	EndIf
EndEvent

State Inactive
	;Will not process any events here.
EndState
