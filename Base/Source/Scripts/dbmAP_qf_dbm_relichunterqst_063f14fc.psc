; Skipped compiler generated GotoState
;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 0
Scriptname dbmAP_qf_dbm_relichunterqst_063f14fc Extends Quest Hidden

;BEGIN ALIAS PROPERTY BleakFallsBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BleakFallsBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HelgenMark
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HelgenMark Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AuryenRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AuryenRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NoteRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NoteRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SilentMoonsREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SilentMoonsREF Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
self.SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
self.SetObjectiveCompleted(5, true)
self.SetObjectiveDisplayed(10, true, false)
DBM_MuseumJoinQST.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
DBM_SafehouseKeyDelivery.Stop()
if DBM_MuseumIntroTour.Start()
	debug.TraceUser("LegacyoftheDragonborn", self as String + "Tour Starting.", 0)
else
	debug.TraceUser("LegacyoftheDragonborn", self as String + "Tour Failed.", 0)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
if self.IsObjectiveDisplayed(10)
	self.SetObjectiveCompleted(10, true)
elseIf self.IsObjectiveDisplayed(11)
	self.SetObjectiveCompleted(11, true)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
self.SetObjectiveCompleted(27, true)
if self.IsObjectiveCompleted(26) && self.IsObjectiveCompleted(27)
; if self.IsObjectiveFailed(25) && self.IsObjectiveCompleted(26) && self.IsObjectiveCompleted(27)
	self.SetStage(35)
endIf
Alias_SilentMoonsREF.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
self.SetObjectiveDisplayed(20, true, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
self.SetObjectiveDisplayed(5, true, false)
self.RegisterForSingleUpdate(20 as Float)
self.SetActive(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
self.SetObjectiveFailed(25, true)
if self.IsObjectiveCompleted(26) && self.IsObjectiveCompleted(27)
; if self.IsObjectiveFailed(25) && self.IsObjectiveCompleted(26) && self.IsObjectiveCompleted(27)
	self.SetStage(35)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; Alias_HelgenMark.TryToEnable()
SilentMoonsMapRef.AddToMap(false)
; HelgenMapRef.AddToMap(false)
self.SetObjectiveCompleted(20, true)
; self.SetObjectiveDisplayed(25, true, false)
self.SetObjectiveDisplayed(26, true, false)
self.SetObjectiveDisplayed(27, true, false)
self.SetObjectiveCompleted(26, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
self.SetObjectiveCompleted(26, true)
if self.IsObjectiveCompleted(26) && self.IsObjectiveCompleted(27)
; if self.IsObjectiveFailed(25) && self.IsObjectiveCompleted(26) && self.IsObjectiveCompleted(27)
	self.SetStage(35)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; Alias_HelgenMark.TryToEnable()
SilentMoonsMapRef.AddToMap(false)
BleakFallsMapRef.AddToMap(false)
; HelgenMapRef.AddToMap(false)
self.SetObjectiveCompleted(20, true)
; self.SetObjectiveDisplayed(25, true, false)
self.SetObjectiveDisplayed(26, true, false)
self.SetObjectiveDisplayed(27, true, false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest property DBM_MuseumJoinQST auto
Quest property DBM_SafehouseKeyDelivery auto
objectreference property HelgenMapRef auto
objectreference property SilentMoonsMapRef auto
globalvariable property DBM_MuseumStart auto
Quest property DBM_MuseumIntroTour auto
book property DBM_CuratorNote auto
objectreference property BleakFallsMapRef auto

function OnUpdate()
	if !self.GetStageDone(10)
		game.GetPlayer().RemoveItem(DBM_CuratorNote as form, 1, true, none)
		Alias_NoteRef.GetReference().Activate(game.GetPlayer() as objectreference, false)
	endIf
endFunction
