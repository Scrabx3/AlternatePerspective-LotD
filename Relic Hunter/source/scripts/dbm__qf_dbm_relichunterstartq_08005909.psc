;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname DBM__QF_DBM_RelicHunterStartQ_08005909 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CompassREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompassREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PackREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PackREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RelicREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RelicREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FarlanREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FarlanREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LeverREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LeverREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlvaroToolREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlvaroToolREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SextantRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SextantRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KarlREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KarlREF Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
RegisterForSingleUpdateGameTime(120)
DBM_RelicHUnterQST.Start()
SetObjectiveDisplayed(35)
;Stop the regular intro quest
DBM_MuseumIntro.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(10)
setObjectiveDisplayed(15)
Actor Guard = Alias_GuardRef.GetReference() as actor
Guard.SetPlayerteammate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
SanctumDoor.Lock(false)
SetObjectiveCompleted(20)
DBM_RHStartQSTGuardContinue.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
RHStartTent.Enable()
DBM_ArcSkill.value = 4
Alias_SextantREF.TryToEnable()
Alias_AlvarotoolREF.TryToEnable()
Alias_PackREF.TryToEnable()
Alias_CompassREF.TryToEnable()
DBM_ExplorerGuildHouse.SetStage(100)
DBM_ExplorerGuildMembers.SetStage(100)
Game.GetPlayer().AddToFaction(DBM_ExplorerGuild)
Game.GetPlayer().SetFactionRank(DBM_ExplorerGuild, 0)
Game.GetPlayer().MoveTo(RHStartMark)
Game.ForceFirstPerson()
Game.GetPlayer().EquipItem(ClothesFarmGloves03, absilent = true)
Game.GetPlayer().EquipItem(ClothesMinerBoots, absilent = true)
Game.GetPlayer().EquipItem(ClothesMinerClothes, absilent = true)
Game.GetPlayer().Additem(Gold001, 320, absilent = true)
DeanoPack.Disable()
AlvaroPack.Disable()
KamhilMap.Enable()
Ralis.RemoveItem(Sextant)
DBM_MuseumStart.SetValue(4)
HorseREF.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
SetObjectiveDisplayed(31)
Actor Guard = Alias_GuardRef.GetReference() as actor
Guard.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Alias_LeverREF.TryToEnable()
SetObjectiveDisplayed(20)
DBM_RHStartQSTDoorScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
DBM_RHStartQSTDoorScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
SetObjectiveCompleted(15)
Actor Guard = Alias_GuardRef.GetReference() as actor
Guard.EvaluatePackage()
Guard.SetPlayerteammate(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property RHStartTent Auto
Armor  Property ClothesFarmGloves03 Auto
Armor Property ClothesMinerBoots Auto
Armor Property ClothesMinerClothes Auto
MiscObject Property Gold001 Auto
ObjectReference Property RhStartMark  Auto  
ObjectReference Property Ralis Auto
MiscObject Property Sextant Auto
ObjectReference Property AlvaroPack Auto
ObjectReference Property DeanoPack Auto
Quest Property DBM_ExplorerGuildHouse Auto  
Quest Property DBM_ExplorerGuildMembers Auto  
Faction Property DBM_ExplorerGuild Auto

Event OnUpdateGameTime()
	RHStartTent.Disable()
	Stop()
EndEvent

ObjectReference Property KamhilMap  Auto  

Scene Property DBM_RHStartQSTDoorScene  Auto  

ObjectReference Property SanctumDoor  Auto  

Scene Property DBM_RHStartQSTGuardContinue  Auto  

Quest Property DBM_RelicHunterQST  Auto  

GlobalVariable Property DBM_MuseumStart  Auto  

GlobalVariable Property DBM_ArcSkill  Auto  

ObjectReference Property HorseREF  Auto  

Quest Property DBM_MuseumIntro  Auto  
