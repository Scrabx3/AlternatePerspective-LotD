;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 28
Scriptname dbm_qf_dbm_relichunterqst_063f14fc Extends Quest Hidden

;BEGIN ALIAS PROPERTY SilentMoonsREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SilentMoonsREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NoteRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NoteRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BleakFallsBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BleakFallsBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AuryenRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AuryenRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HelgenMark
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HelgenMark Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;after reading note, 3 objectives

; Alias_HelgenMark.TryToEnable()

SilentMoonsMapRef.AddToMap()

BleakFallsMapRef.AddToMap()

; HelgenMapRef.AddToMap()

SetObjectiveCompleted(20)

; SetObjectiveDisplayed(25)

SetObjectiveDisplayed(26)

SetObjectiveDisplayed(27)

if Game.GetPlayer().GetItemCount(Alias_SilentMoonsRef.GetReference())
   SetObjectiveCompleted(27)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
SetObjectiveDisplayed(5)


RegisterForSingleUpdate(20)
;DBM_MuseumJoinQST.SetStage(200)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Helgen Discovered

SetObjectiveFailed(25)

if IsObjectiveFailed(25) && IsObjectiveCompleted(26) && IsObjectiveCompleted(27)
    
SetStage(35)

Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Silent Moons Done

SetObjectiveCompleted(27)

if IsObjectiveFailed(25) && IsObjectiveCompleted(26) && IsObjectiveCompleted(27)

    SetStage(35)

Endif

Alias_SilentMoonsRef.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
if IsObjectiveDisplayed(10)

SetObjectiveCompleted(10)

Elseif IsObjectiveDisplayed(11)

SetObjectiveCompleted(11)

Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
; holding stage to bypass auryen meeting objective for Guildmaster Start after already having met him.
SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Bleak Falls Done

SetObjectiveCompleted(26)

if IsObjectiveCompleted(26) && IsObjectiveCompleted(27)
; if IsObjectiveFailed(25) && IsObjectiveCompleted(26) && IsObjectiveCompleted(27)

    SetStage(35)

Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
DBM_SafehouseKeyDelivery.Stop()

if DBM_MuseumIntroTour.Start()

	Debug.TraceUser("LegacyoftheDragonborn", Self + "Tour Starting.")

else
	Debug.TraceUser("LegacyoftheDragonborn", Self + "Tour Failed.")

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;after reading note, 3 objectives
; Alias_HelgenMark.TryToEnable()
SilentMoonsMapRef.AddToMap()
; HelgenMapRef.AddToMap()
SetObjectiveCompleted(20)
; SetObjectiveDisplayed(25)
SetObjectiveDisplayed(26)
SetObjectiveDisplayed(27)
SetObjectiveCompleted(26)
if Game.GetPlayer().GetItemCount(Alias_SilentMoonsRef.GetReference())
   SetObjectiveCompleted(27)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
DBM_MuseumJoinQST.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DBM_SafehouseKeyDelivery  Auto  


ObjectReference Property HelgenMapRef  Auto  

ObjectReference Property SilentMoonsMapRef  Auto  

ObjectReference Property BleakFallsMapRef  Auto  

Quest Property DBM_MuseumJoinQST  Auto  

GlobalVariable Property DBM_MuseumStart  Auto  

Book Property DBM_CuratorNote Auto

Event OnUpdate()
	if !GetStageDone(10)
		Game.GetPlayer().RemoveItem(DBM_CuratorNote, 1, TRUE)
		(Alias_NoteRef.GetReference()).Activate(Game.GetPlayer())
	endif
EndEvent

Quest  Property DBM_MuseumIntroTour  Auto  

