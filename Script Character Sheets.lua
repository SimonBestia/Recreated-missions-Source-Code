MissionSetup = function()

	MissionDontFadeIn()
	DATLoad("2_S04.DAT", 2)
	DATInit()
	LoadActionTree("Act/Anim/Overrides/Mission/2_S04Greeting.act")
	LoadActionTree("Act/Conv/2_S04.act")
	LoadActionTree("Act/Gifts/Give2S04.act")
	LoadAnimationGroups(true)
	PedSetUniqueModelStatus(6, -1)
	AreaDisablePatrolPath(PATH._SGD_PREFECT3)
	ChapterSet(1)
	SoundDisableSpeech_ActionTree()
	ToggleHUDComponentVisibility(11, false)
	ToggleHUDComponentVisibility(4, false)
	ToggleHUDComponentVisibility(0, false)
	LockFPS30(false)
	MissionSurpressMissionNameText()
	ClockSet(15, 30)
	ToggleHUDComponentVisibility(19, false)
	PauseGameClock()
	ItemSetCurrentNum(463, 0)
end

main = function()
		
		SoundPlayInteractiveStream("MS_EpicConfrontationLow.rsm", 0.60000002384186)
		SoundSetMidIntensityStream("MS_EpicConfrontationMid.rsm", 0.69999998807907)
		SoundSetHighIntensityStream("MS_EpicConfrontationHigh.rsm", 0.69999998807907)
		Intro()
		--WadeSheet()
		--TroySheet()
		--TrentSheet()
		--DavisTroySheet()
		TroyTrentSheet()
		ReturnToMelvin()

end

Intro = function()

		F_SetupMelvin()
		F_SetupPlayer()
		CreateThread("T_DeletePeds")
		CameraFade(1000, 1)
		Wait(1450)
		SoundPlayScriptedSpeechEvent(Melvin, "M_2_S04", 1, "large")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Melvin)
		CameraSetXYZ(187.50, -152.48, 9.07, 190.36, -149.83, 8.17)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 2, "large")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(gPlayer)
		PedSetDefaultTypeToTypeAttitude(11, 13, 2)
		PedSetTypeToTypeAttitude(1, 13, 4)
		PedSetDefaultTypeToTypeAttitude(11, 13, 2)
		PedMoveToXYZ(gPlayer, 1, 188.820999, -146.067993, 7.874070)
		Wait(750)
		CameraReset()
		CameraReturnToPlayer()
		PlayerSetControl(1)
		ISaySo = true
		TextPrintString("Recover Melvin's lost Character Sheets.", 3, 1)
		CounterSetIcon("charasheet", "charasheet_x")
		CounterSetCurrent(0)
		CounterSetMax(5)

end

F_SetupMelvin = function()

	Melvin = PedCreatePoint(6, POINTLIST._2_S04_MELVIN)
	PedIgnoreAttacks(Melvin, true)
	PlayerSocialDisableActionAgainstPed(Melvin, 28, true)
    PlayerSocialDisableActionAgainstPed(Melvin, 29, true)
    PlayerSocialDisableActionAgainstPed(Melvin, 32, true)
    PlayerSocialDisableActionAgainstPed(Melvin, 35, true)
    PedIgnoreStimuli(Melvin, true)
    PedMakeTargetable(Melvin, false)
	Wait(5)
	PedFaceXYZ(Melvin, 188.57, -150.54, 7.51)

end

F_SetupPlayer = function()

		AreaTransitionXYZ(0, 188.57, -150.54, 7.51)
		CameraSetXYZ(187.15, -150.46, 9.07, 190.57, -152.38, 8.29)
		Wait(5)
		PedFaceXYZ(gPlayer, 188.919998, -151.835007, 7.666410)
end

T_DeletePeds = function()

		repeat
		AreaOverridePopulation(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		AreaClearAllPeds()
		Wait(0)
		until ISaySo
		AreaRevertToDefaultPopulation()

end

LoadAnimationGroups = function(l_6_0)
  if l_6_0 then
    LoadAnimationGroup("2_S04CharSheets")
    LoadAnimationGroup("NIS_2_S04")
    LoadAnimationGroup("F_Girls")
    LoadAnimationGroup("F_Nerds")
    LoadAnimationGroup("Cheer_Nerd1")
    LoadAnimationGroup("Hang_Talking")
    LoadAnimationGroup("NPC_Cheering")
    LoadAnimationGroup("POI_Smoking")
    LoadAnimationGroup("POI_Booktease")
    LoadAnimationGroup("NPC_AggroTaunt")
    LoadAnimationGroup("LE_Orderly")
    LoadAnimationGroup("GEN_Social")
    LoadAnimationGroup("IDLE_GSF")
	LoadAnimationGroup("SBULL_A")
  else
    UnLoadAnimationGroup("2_S04CharSheets")
    UnLoadAnimationGroup("NIS_2_S04")
    UnLoadAnimationGroup("F_Girls")
    UnLoadAnimationGroup("F_Nerds")
    UnLoadAnimationGroup("Cheer_Nerd1")
    UnLoadAnimationGroup("Hang_Argue")
    UnLoadAnimationGroup("Hang_Talking")
    UnLoadAnimationGroup("NPC_Cheering")
    UnLoadAnimationGroup("POI_Smoking")
    UnLoadAnimationGroup("POI_Booktease")
    UnLoadAnimationGroup("NPC_AggroTaunt")
    UnLoadAnimationGroup("LE_Orderly")
    UnLoadAnimationGroup("GEN_Social")
    UnLoadAnimationGroup("IDLE_GSF")
	UnLoadAnimationGroup("SBULL_A")
  end
end


SetupWade = function()

		Davis = PedCreatePoint(99, POINTLIST._2_S04_SHEET4)
		PedIgnoreAttacks(Davis, true)
		PedAddPedToIgnoreList(Davis, gPlayer)
		PedIgnoreStimuli(Davis, true)
		PedSetInfiniteSprint(Davis, true)
		PedSetActionNode(Davis, "/Global/2_S04/Anim/BullyWall_Smoke", "Act/Conv/2_S04.act")

end

WadeSheet = function()

		SetupWade()
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(190.61, -128.22, 6.09, 2.5, 0)
		CounterMakeHUDVisible(false)
		PlayerSetControl(0)
		ISaySo = false
		CameraSetXYZ(197.67, -119.58, 7.49, 201.43, -120.94, 7.70)
		SoundPlayScriptedSpeechEvent(Davis, "M_2_S04", 3, "large")
		Wait(650)
		PedMoveToXYZ(gPlayer, 2, 196.85, -121.47, 6.26)
		CreateThread("T_DeletePeds")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Davis)
		CameraSetXYZ(198.11, -116.91, 8.07, 197.67, -120.75, 7.02)
		Wait(1250)
		CameraSetXYZ(195.33, -120.65, 7.98, 199.22, -120.63, 7.04)
		CameraAllowChange(false)
		PlayerSetControl(1)
		ExecuteActionNode(Davis, "/Global/2_S04/Anim/BullyWall_Smoke/EndingSequences/StepAwayEnd", "Act/Conv/2_S04.act")
		PedFaceHeading(Davis, -225)
		Wait(2500)
		SoundPlayScriptedSpeechEvent(Davis, "M_2_S04", 4, "large")
		CameraSetXYZ(197.77, -120.38, 7.56, 201.69, -119.61, 7.43)
		ExecuteActionNode(Davis, "/Global/1_02/TauntOnce", "Act/Conv/1_02.act")
		PlayerSetControl(0)
		PedSetFlag(gPlayer, 11, true)
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Davis)
		CameraSetXYZ(198.05, -121.25, 7.46, 194.09, -121.53, 7.97)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 5, "large")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(gPlayer)
		ISaySo = true
		CameraAllowChange(true)
		CameraReset()
		CameraReturnToPlayer()
		CounterMakeHUDVisible(true)
		PedSetFlag(gPlayer, 11, false)
		GameSetPedStat(Davis, 20, 165)
		GameSetPedStat(gPlayer, 20, 99)
		PlayerSetControl(1)
		CreateThread("DavisMarbles")
		CreateThread("DavisTroubleMeter")
		CreateThread("JimmyFell")
		PedFollowPath(Davis, PATH._2_S04_FLEE1, 0, 2)
		Wait(1500)
		ExecuteActionNode(Davis, "/Global/2_S04/Anim/AttachMarbles", "Act/Conv/2_S04.act")
		SoundPlayScriptedSpeechEvent(Davis, "M_2_S04", 6, "large")
		PedSetInfiniteSprint(Davis, true)
		repeat
		Wait(0)
		until PedIsInAreaXYZ(Davis, 221.796997, -62.500801, 8.757530, 1.5, 0)
		PedFaceObject(Davis, gPlayer, 3, 0)
		PedSetFlag(Davis, 2, true)
		PedClearObjectives(Davis)
		DavisHasStopped = true
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(232.24, -82.01, 6.20, 7, 0)
		DavisStoppedConv()
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(221.796997, -62.500801, 8.757530, 12, 0)
		DavisHasStopped = false
		PedSetFlag(Davis, 2, false)
		PedFollowPath(Davis, PATH._2_S04_FLEE2, 0, 2)
		CreateThread("Stage2ChaseConv")
		Stage2Chase = true
		CreateThread("DavisMarbles")
		repeat
		Wait(0)
		until PedIsInAreaXYZ(Davis, 169.248993, -27.000999, 6.356960, 1.5, 0)
		PedFaceObject(Davis, gPlayer, 3, 0)
		PedSetFlag(Davis, 2, true)
		PedClearObjectives(Davis)
		DavisHasStopped = true
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(169.248993, -27.000999, 6.356960, 10, 0)
		DavisHasStopped = false
		PedSetFlag(Davis, 2, false)
		PedFollowPath(Davis, PATH._2_S04_FLEE3, 0, 2)
		CreateThread("Stage3ChaseConv")
		Stage3Chase = true
		CreateThread("DavisMarbles")
		repeat
		Wait(0)
		until PedIsInAreaXYZ(Davis, 157.013000, -99.585403, 6.448740, 1, 0)
		PedFaceObject(Davis, gPlayer, 3, 0)
		PedSetFlag(Davis, 2, true)
		PedClearObjectives(Davis)
		DavisHasStopped = true
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(157.013000, -99.585403, 6.448740, 12, 0)
		AreaDisableAllPatrolPaths()
		DavisHasStopped = false
		PedSetFlag(Davis, 2, false)
		PedFollowPath(Davis, PATH._2_S04_FLEE4, 0, 2)
		CreateThread("Stage4ChaseConv")
		CreateThread("DavisMarbles")
		repeat
		Wait(0)
		until PedIsInAreaXYZ(Davis, 194.992996, -104.890999, 7.969270, 5, 0)
		PedFaceObject(Davis, gPlayer, 3, 0)
		PedClearObjectives(Davis)
		DavisHasStopped = true
		ChaseDone = true
		GameSetPedStat(Davis, 20, 100)
		Wait(150)
		PedAttack(Davis, gPlayer, 3)
		CreateThread("DavisDropSheet")
		CreateThread("SlingshotQuotes")
		Wait(500)
		SoundPlayScriptedSpeechEvent(Davis, "M_2_S04", 19, "large")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Davis)
		PlayerSetWeapon(284, 1)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 20, "xtralarge")

end

DavisMarbles = function()

		repeat
		if not PedIsPlaying(Davis, "/Global/WProps/WallClimb", true) and PedGetFlag(Davis, 2) == false then
		ExecuteActionNode(Davis, "/Global/2_S04/Anim/AttachMarbles", "Act/Conv/2_S04.act")
		end
		if not SoundSpeechPlaying(Davis) and not SoundSpeechPlaying(gPlayer) and not Stage2Chase and not Stage3Chase then
		SoundPlayScriptedSpeechEvent(Davis, "M_2_S04", 6, "xtralarge")
		end
		Wait(3100)
		Wait(0)
		until DavisHasStopped or Chasedone

end

DavisTroubleMeter = function()

		while true do
		if PedIsValid(Davis) then
		PedSetPunishmentPoints(Davis, 0)
		end
		Wait(0)
		end

end

JimmyFell = function()

		repeat
		if PedIsPlaying(gPlayer, "/Global/HitTree/Standing/Ranged/Marbles/HIT_LEG_FRONT_R_FALL", true) and not SoundSpeechPlaying(Davis) and not SoundSpeechPlaying(gPlayer) then
		SoundPlayScriptedSpeechEvent(Davis, "M_2_S04", 7, "xtralarge")
		end
		Wait(0)
		until not PedIsValid(Davis) or PedIsDead(Davis) or DavisHasStopped or Chasedone

end

DavisStoppedConv = function()

		repeat
		Wait(0)
		until DavisHasStopped and not SoundSpeechPlaying(Davis)
		PlayerSetControl(0)
		CounterMakeHUDVisible(false)
		CameraSetXYZ(221.85, -66.55, 9.30, 221.95, -62.56, 9.43)
		SoundPlayScriptedSpeechEvent(Davis, "M_2_S04", 8, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Davis)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 9, "xtralarge")
		local X1, Y1, Z1 = PedGetOffsetInWorldCoords(gPlayer, 0.5, 1, 1.2000000476837)
		local X2, Y2, Z2 = PedGetOffsetInWorldCoords(gPlayer, -0.5, -0.69999998807907, 1.7000000476837)
		PedSetFlag(gPlayer, 11, true)
		CameraSetXYZ(X1, Y1, Z1, X2, Y2, Z2)
		repeat
		Wait(0)
		until not SoundSpeechPlaying(gPlayer)
		PedSetFlag(gPlayer, 11, false)
		PlayerSetControl(1)
		CameraReset()
		CameraReturnToPlayer()
		CounterMakeHUDVisible(true)
end

Stage2ChaseConv = function()

		repeat
		Wait(0)
		until not DavisHasStopped and not SoundSpeechPlaying(gPlayer) and not SoundSpeechPlaying(Davis)
		SoundPlayScriptedSpeechEvent(Davis, "M_2_S04", 10, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Davis)
		Wait(300)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 11, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(gPlayer)
		Wait(300)
		SoundPlayScriptedSpeechEvent(Davis, "M_2_S04", 12, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Davis)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 13, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(gPlayer)
		Wait(300)
		SoundPlayScriptedSpeechEvent(Davis, "M_2_S04", 14, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Davis)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 15, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(gPlayer)

end

Stage3ChaseConv = function()

		repeat
		Wait(0)
		until not DavisHasStopped and not SoundSpeechPlaying(gPlayer) and not SoundSpeechPlaying(Davis)
		SoundPlayScriptedSpeechEvent(Davis, "M_2_S04", 16, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Davis)
		Wait(300)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 17, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(gPlayer)
		Wait(300)
		SoundPlayScriptedSpeechEvent(Davis, "M_2_S04", 18, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Davis)

end

DavisDropSheet = function()

			repeat
			Wait(0)
			until PedIsDead(Davis)
			
			X, Y, Z = PedGetPosXYZ(gPlayer)
			PickupDestroyTypeInAreaXYZ(X,Y,Z, 5, 468)
			X, Y, Z = PedGetPosXYZ(Davis)
			Sheet1 = PickupCreateXYZ(463, X, Y, Z + 0.90, "PermanentButes") --463 497SE
			CharSheetPickup = AddBlipForPickup(Sheet1, 0, 4)
			repeat
			Wait(0)
			until PlayerHasItem(463)--463 497SE
			AreaEnableAllPatrolPaths()
			GameSetPedStat(gPlayer, 20, 100)
			PlayerUnequip()
			PedDestroyWeapon(gPlayer, 284)
			CounterSetCurrent(1)
			SoundDisableSpeech()
			Wait(450)
			SoundEnableSpeech()
			SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 22, "xtralarge")

end

SlingshotQuotes = function()

		DavisWasHit = false
		repeat
		if PedGetWhoHitMeLast(Davis) == gPlayer and PedGetLastHitWeapon(Davis) == 300 then
		SoundPlayScriptedSpeechEvent(Davis, "M_2_S04", 21, "xtralarge")
		DavisWasHit = true
		end
		Wait(0)
		until DavisWasHit

end


TroySheet = function()

		CreateThread("SetupTroyAndBucky")
		repeat
		Wait(0)
		until PlayerIsInTrigger(TRIGGER._2_S04_SHEET3OUTER)
		PedSetActionNode(Troy, "/Global/2_S04/Anim/BullyNerdTease", "Act/Conv/2_S04.act")
		PedSetActionNode(Bucky, "/Global/2_S04/Anim/NerdTeased", "Act/Conv/2_S04.act")
		Wait(600)
		SoundFadeWithCamera(false)
		MusicFadeWithCamera(false)
		PlayerSetControl(0)
		CameraFade(500, 0)
		Wait(500)
		CounterMakeHUDVisible(false)
		SoundSetAudioFocusCamera()
		CameraFade(250, 1)
		TroyAndBuckyCut()
		PedSetFlag(gPlayer, 11, false)
		CameraReturnToPlayer()
		CameraReset()
		CounterMakeHUDVisible(true)
		Wait(50)
		PlayerSetControl(1)
		SoundFadeWithCamera(true)
		MusicFadeWithCamera(true)
		SoundSetAudioFocusPlayer()
		PedAttack(Troy, gPlayer, 3)
		GameSetPedStat(Troy, 4, 160)
		PedSetHealth(Troy, 160)
		CreateThread("BuckyRunsAndCheers")
		CreateThread("TroyDropSheet")
		repeat
		Wait(0)
		until PedIsDead(Troy)
		PedSetActionNode(Bucky, "/Global/N_Ranged_A", "Act/Anim/N_Ranged_A.act")
		Wait(20)
		PedWander(Bucky, 0)
		SoundPlayScriptedSpeechEvent(Bucky, "M_2_S04", 34, "large")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Bucky)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 35, "large")
		repeat
		Wait(0)
		until PickupIsPickedUp(Sheet2)
		CounterSetCurrent(2)
		SoundDisableSpeech()
		Wait(450)
		SoundEnableSpeech()
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 36, "xtralarge")

end

SetupTroyAndBucky = function()

		Troy = PedCreatePoint(102, POINTLIST._2_S04_SHEET3)
		Bucky = PedCreatePoint(8, POINTLIST._2_S04_SHEET3_1)
		PedClearAllWeapons(Troy)
		PedClearAllWeapons(Bucky)
		Wait(200)
		PedSetPedToTypeAttitude(Troy, 1, 2)
		PedSetPedToTypeAttitude(Bucky, 11, 2)

end

TroyAndBuckyCut = function()

		CameraSetXYZ(240.49531555176, -131.45654296875, 7.2897257804871, 241.23704528809, -130.78591918945, 7.2903890609741)
		Wait(500)
		SoundPlayScriptedSpeechEvent(Troy, "M_2_S04", 23, "large")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Troy)
		CameraSetXYZ(240.87, -128.48, 7.42, 243.48, -131.50, 7.32)
		SoundPlayScriptedSpeechEvent(Bucky, "M_2_S04", 24, "large")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Bucky)
		CameraSetXYZ(240.49531555176, -131.45654296875, 7.2897257804871, 241.23704528809, -130.78591918945, 7.2903890609741)
		SoundPlayScriptedSpeechEvent(Troy, "M_2_S04", 25, "large")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Troy)
		CameraSetXYZ(240.87, -128.48, 7.42, 243.48, -131.50, 7.32)
		SoundPlayScriptedSpeechEvent(Bucky, "M_2_S04", 26, "large")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Bucky)
		CameraSetXYZ(240.49531555176, -131.45654296875, 7.2897257804871, 241.23704528809, -130.78591918945, 7.2903890609741)
		SoundPlayScriptedSpeechEvent(Troy, "M_2_S04", 27, "large")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Troy)
		CameraSetXYZ(240.87, -128.48, 7.42, 243.48, -131.50, 7.32)
		SoundPlayScriptedSpeechEvent(Bucky, "M_2_S04", 28, "large")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Bucky)
		PlayerSetPosXYZ(241.91, -121.48, 6.12)
		CameraSetXYZ(241.96, -124.64, 7.36, 243.44, -120.93, 7.39)
		PedMoveToXYZ(gPlayer, 1, 242.35, -123.19, 6.12)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 29, "large")
		PedStop(Troy)
		PedFaceXYZ(Troy, 242.35, -123.19, 6.12)
		repeat
		Wait(0)
		until not SoundSpeechPlaying(gPlayer)
		CameraSetXYZ(241.64, -127.57, 7.46, 243.24, -131.23, 7.51)
		PedSetActionNode(Troy, "/Global/2_08Conv/ComeOn", "Act/Conv/2_08.act")
		SoundPlayScriptedSpeechEvent(Troy, "M_2_S04", 30, "large")
		PedFaceXYZ(gPlayer, 242.485992, -129.419006, 6.366140)
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Troy)
		CameraSetXYZ(242.04, -124.27, 7.36, 243.79, -120.67, 7.35)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 31, "large")
		PedSetFlag(gPlayer, 11, true)
		PedSetActionNode(Bucky, "/Global/2_S04/Anim/NerdTeased/endTeased", "Act/Conv/2_S04.act")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(gPlayer)

end

BuckyRunsAndCheers = function()

		PedFollowPath(Bucky, PATH._2_S04_NERD_LOOP, 0, 2, cbBuckyFinished)
		Wait(4000)
		PedStop(Bucky)
		PedClearObjectives(Bucky)
		Wait(10)
		PedFaceObject(Bucky, gPlayer, 2, 0)
		Wait(40)
		PedSetActionNode(Bucky, "/Global/2_S04/Anim/NerdCheer", "Act/Conv/2_S04.act")
		SoundPlayScriptedSpeechEvent(Bucky, "M_2_S04", 33, "large")
		repeat
		Wait(0)
		until PedIsDead(Troy)

end

TroyDropSheet = function()

		repeat
		Wait(0)
		until PedIsDead(Troy)

		Wait(500)
		X, Y, Z = PedGetPosXYZ(gPlayer)
		PickupDestroyTypeInAreaXYZ(X,Y,Z, 5, 468)
		X, Y, Z = PedGetPosXYZ(Troy)
		Sheet2 = PickupCreateXYZ(463, X, Y, Z + 0.90, "PermanentButes") --463 497SE
		CharSheetPickup = AddBlipForPickup(Sheet2, 0, 4)

end


TrentSheet = function()

		SetupTrentAndAngie()
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(121.985001, -72.465599, 4.198750, 4.5, 0)
		CameraFade(500, 0)
		PlayerSetControl(0)
		Wait(500)
		CounterMakeHUDVisible(false)
		PlayerSetPosXYZ(108.40, -73.86, 3.29)
		SoundSetAudioFocusCamera()
		PedSetEffectedByGravity(gPlayer, false)
		TrentAndAngieCut()
		CameraFade(500, 0)
		Wait(500)
		AreaDisableAllPatrolPaths()
		CameraReset()
		CameraReturnToPlayer()
		PlayerSetPosXYZ(121.985001, -72.465599, 6.198750)
		CameraFade(500, 1)
		CounterMakeHUDVisible(true)
		PedSetEffectedByGravity(gPlayer, true)
		PlayerSetControl(1)
		PedIgnoreAttacks(Trent, true)
		SoundSetAudioFocusPlayer()
		CreateThread("TrentBullied")
		GameSetPedStat(Trent, 4, 120)
		PedSetHealth(Trent, 120)
		Wait(2400)
		repeat
		Wait(0)
		until PedGetHealth(Trent) <= 50
		Wait(500)
		TextPrintString("Run away.", 2, 1)
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(116.84, -66.38, 5.97, 3, 0)
		PedStop(Trent)
		PedClearObjectives(Trent)
		PedMoveToXYZ(Trent, 1, 104.217003, -67.750000, 7.379570)
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(131.326004, -68.049599, 5.769390, 1, 0)
		PlayerSetWeapon(284, 1)
		PedFaceXYZ(Trent, 102.025002, -67.652199, 7.309770)
		TextPrintString("Hit Seth without being seen.", 3, 1)
		PedSetStationary(Seth, false)
		PedMoveToPoint(Seth, 0, POINTLIST._2_S04_Sheet5_Prefect, 2)
		DisablePunishmentSystem(true)
		repeat
		Wait(0)
		until PedIsHit(Seth) and PedGetLastHitWeapon(Seth) == 300 and PedGetWhoHitMeLast(Seth) == gPlayer
		AreaRevertToDefaultPopulation()
		PedClearObjectives(Seth)
		CameraFade(500, 0)
		PlayerSetControl(0)
		Wait(500)
		PlayerSetPosXYZ(116.99, -62.63, 5.99)
		CameraSetXYZ(111.76, -71.60, 8.67, 108.22, -73.44, 8.43)
		Wait(50)
		CameraFade(500, 1)
		Wait(150)
		ExecuteActionNode(Seth, "/Global/5_03/5_03_NIS_Gateclose/Johnny/Johnny01", "Act/Conv/5_03.act")
		SoundPlayScriptedSpeechEvent(Seth, "M_2_S04", 55, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Seth)
		Wait(250)
		DisablePunishmentSystem(false)
		CameraSetXYZ(104.04, -64.60, 9.18, 105.26, -68.33, 8.38)
		X,Y,Z = PedGetPosXYZ(Seth)
		PedFaceXYZ(Seth, 104.217003, -67.750000, 7.379570)
		PedFaceXYZ(Trent, X,Y,Z)
		ExecuteActionNode(Seth, "/Global/1_08/CafeteriaLady/Point/Point", "Act/Conv/1_08.act")
		SoundPlayScriptedSpeechEvent(Seth, "M_2_S04", 56, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Seth)
		ExecuteActionNode(Trent, "/Global/1_02/TauntOnce", "Act/Conv/1_02.act")
		SoundPlayScriptedSpeechEvent(Trent, "M_2_S04", 57, "xtralarge")
		Wait(2600)
		PedLockTarget(Seth, Trent, 3)
		PedMoveToXYZ(Seth, 2, 105.18, -67.98, 7.21)
		Wait(1200)
		ExecuteActionNode(Seth, "/Global/Actions/Grapples/Front/Grapples/GrappleMoves/Tonfa_Impale/TonfaImpale", "Act/Anim/Ambient.act")
		repeat
		Wait(0)
		until PedIsDead(Trent)
		Wait(150)
		X, Y, Z = PedGetPosXYZ(Trent)
		PickupDestroyTypeInAreaXYZ(X,Y,Z, 5, 468)
		Sheet3 = PickupCreateXYZ(463, X, Y, Z + 0.90, "PermanentButes") --463 497SE
		CharSheetPickup = AddBlipForPickup(Sheet3, 0, 4)
		CameraFade(500, 0)
		PlayerUnequip()
		Wait(600)
		PlayerSetPosXYZ(132.10, -66.93, 6.15)
		Wait(50)
		PedDelete(Trent)
		if PedIsValid(Angie) then
		PedDelete(Angie)
		end
		CameraFade(500, 1)
		CameraReset()
		CameraReturnToPlayer()
		PlayerSetControl(1)
		PedWander(Seth)
		repeat
		Wait(0)
		until PickupIsPickedUp(Sheet3)
		CounterSetCurrent(3)
		SoundDisableSpeech()
		Wait(450)
		SoundEnableSpeech()
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 58, "xtralarge")

end

SetupTrentAndAngie = function()

		Trent = PedCreatePoint(85, POINTLIST._2_S04_SHEET5, 1)
		Angie = PedCreatePoint(39, POINTLIST._2_S04_Sheet5_Chick, 1)
		Seth = PedCreatePoint(50, POINTLIST._2_S04_Sheet5_Prefect, 1)
		PedClearAllWeapons(Trent)
		PedIgnoreStimuli(Angie, true)
		PedIgnoreStimuli(Trent, true)
		PedIgnoreStimuli(Seth, true)
		PedAddPedToIgnoreList(Seth, gPlayer)
		PedSetStationary(Seth, true)
		
end

TrentAndAngieCut = function()

		CameraSetXYZ(108.00, -76.91, 8.83, 104.15, -75.88, 8.45)
		AreaOverridePopulation(3, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0)
		AreaClearPatrolPaths()
		CameraFade(500, 1)
		Wait(250)
		SoundPlayScriptedSpeechEvent(Trent, "M_2_S04", 36, "xtralarge")
		PedSetActionNode(Trent, "/Global/Ambient/Talking/Talking", "Act/Anim/Ambient.act")
		Wait(2500)
		CameraSetXYZ(106.75, -78.22, 8.83, 105.60, -74.81, 8.41)
		SoundPlayScriptedSpeechEvent(Angie, "M_2_S04", 37, "xtralarge")
		ExecuteActionNode(Angie, "/Global/Ambient/Talking/Talking", "Act/Anim/Ambient.act")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Angie)
		CameraSetXYZ(108.00, -76.91, 8.83, 104.15, -75.88, 8.45)
		SoundPlayScriptedSpeechEvent(Trent, "M_2_S04", 38, "xtralarge")
		PedSetActionNode(Trent, "/Global/Ambient/Talking/Talking", "Act/Anim/Ambient.act")
		Wait(1600)
		CameraSetXYZ(106.75, -78.22, 8.83, 105.60, -74.81, 8.41)
		SoundPlayScriptedSpeechEvent(Angie, "M_2_S04", 39, "xtralarge")
		ExecuteActionNode(Angie, "/Global/Ambient/Talking/Talking", "Act/Anim/Ambient.act")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Angie)
		CameraSetXYZ(108.00, -76.91, 8.83, 104.15, -75.88, 8.45)
		SoundPlayScriptedSpeechEvent(Trent, "M_2_S04", 40, "xtralarge")
		ExecuteActionNode(Trent, "/Global/Ambient/Talking/Talking", "Act/Anim/Ambient.act")
		Wait(1400)
		CameraSetXYZ(106.75, -78.22, 8.83, 105.60, -74.81, 8.41)
		SoundPlayScriptedSpeechEvent(Angie, "M_2_S04", 41, "xtralarge")
		ExecuteActionNode(Angie, "/Global/Ambient/Talking/Talking", "Act/Anim/Ambient.act")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Angie)
		CameraSetXYZ(108.00, -76.91, 8.83, 104.15, -75.88, 8.45)
		SoundPlayScriptedSpeechEvent(Trent, "M_2_S04", 42, "xtralarge")
		ExecuteActionNode(Trent, "/Global/Ambient/Talking/Talking", "Act/Anim/Ambient.act")
		Wait(2800)
		CameraSetXYZ(106.75, -78.22, 8.83, 105.60, -74.81, 8.41)
		SoundPlayScriptedSpeechEvent(Angie, "M_2_S04", 43, "xtralarge")
		ExecuteActionNode(Angie, "/Global/Ambient/Talking/Talking", "Act/Anim/Ambient.act")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Angie)
		CameraSetXYZ(108.00, -76.91, 8.83, 104.15, -75.88, 8.45)
		SoundPlayScriptedSpeechEvent(Trent, "M_2_S04", 44, "xtralarge")
		ExecuteActionNode(Trent, "/Global/Ambient/Talking/Talking", "Act/Anim/Ambient.act")
		Wait(2500)
		CameraSetXYZ(106.75, -78.22, 8.83, 105.60, -74.81, 8.41)
		SoundPlayScriptedSpeechEvent(Angie, "M_2_S04", 45, "xtralarge")
		ExecuteActionNode(Angie, "/Global/Ambient/Talking/Talking", "Act/Anim/Ambient.act")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Angie) and not PedIsPlaying(Angie, "/Global/Ambient/Talking/Talking", true)
		PedMoveToPoint(Angie, 0, POINTLIST._2_S04_Sheet5_Chick, 2)
		Wait(1000)
		CameraSetXYZ(109.75, -71.11, 8.72, 106.82, -73.80, 8.32)
		repeat
		Wait(0)
		until not PedIsOnScreen(Angie)
		CameraSetXYZ(102.74, -66.00, 8.92, 105.37, -69.01, 8.81)
		Wait(350)
		PedMoveToPoint(Trent, 1, POINTLIST._2_S04_SHEET5, 2)
		Wait(3725)
		CameraSetXYZ(102.00, -66.08, 8.79, 104.79, -70.90, 8.23)
		PedSetStationary(Trent, true)
		SoundPlayScriptedSpeechEvent(Trent, "M_2_S04", 46, "xtralarge")
		ExecuteActionNode(Trent, "/Global/Ambient/Talking/Talking", "Act/Anim/Ambient.act")
		Wait(1200)
		CameraSetXYZ(104.15, -65.99, 8.79, 101.88, -69.24, 8.32)
		PedFaceXYZ(Angie, 104.217003, -67.750000, 7.379570)
		Wait(100)
		SoundPlayScriptedSpeechEvent(Angie, "M_2_S04", 47, "xtralarge")
		ExecuteActionNode(Angie, "/Global/Ambient/Talking/Talking", "Act/Anim/Ambient.act")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Angie)

		--TRENT NOTICING YOU CLIP
		--[[repeat
		Wait(0)
		until PlayerIsInAreaXYZ(106.36, -67.50, 7.25, 4, 0)
		X,Y,Z = PlayerGetPosXYZ(gPlayer)
		CameraFade(500, 0)
		PlayerSetControl(0)
		Wait(500)
		CounterMakeHUDVisible(false)
		CameraSetXYZ(105.63, -68.41, 8.71, 102.02, -66.69, 8.67)
		PedFaceXYZ(Trent, X,Y,Z)
		Wait(50)
		CameraFade(500, 1)
		Wait(350)
		ExecuteActionNode(Trent, "/Global/1_08/CafeteriaLady/Point/Point", "Act/Conv/1_08.act")
		SoundPlayScriptedSpeechEvent(Trent, "M_2_S04", 48, "xtralarge")
		Wait(2400)
		CameraFade(500, 0)
		Wait(1000)]]

end

TrentBullied = function()

		repeat
		if PedIsHit(Trent, 2, 500) and PedGetWhoHitMeLast(Trent) == gPlayer then
		Wait(200)
		X,Y,Z = PlayerGetPosXYZ()
		PedFaceXYZ(Trent, X,Y,Z)
		ExecuteActionNode(Trent, "/Global/Ambient/Dialog/Help/HelpMale", "Act/Anim/Ambient.act")
		SoundPlayScriptedSpeechEvent(Trent, "M_2_S04", 50, "xtralarge")
		end
		Wait(0)
		until PedIsPlaying(Trent, "/Global/Ambient/Dialog/Help/HelpMale", true)
		PedAttack(Trent, gPlayer, 3)
		PedSetStationary(Trent, false)
		Wait(2000)
		CreateThread("AngieQuotes")
end

AngieQuotes = function()

		SoundPlayScriptedSpeechEvent(Angie, "M_2_S04", 51, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Angie)
		Wait(500)
		SoundPlayScriptedSpeechEvent(Angie, "M_2_S04", 54, "xtralarge")

end


DavisTroySheet = function()

		NerdsBulliesSetup()
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(103.75, -62.76, 7.38, 2.5, 0)
		CreateThread("DeleteGreasers")
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(108.46, -15.29, 6.12, 4, 0)
		CounterMakeHUDVisible(false)
		PedSetStationary(Thad, false)
		PedSetStationary(Fatty, false)
		PedSetStationary(Algie, false)
		PedSetStationary(Beatrice, false)
		PedSetFlag(Davis, 11, true)
		PedSetFlag(Troy, 11, true)
		CameraSetXYZ(106.81, -19.55, 11.93, 107.38, -16.05, 10.10)
		PlayerSetControl(0)
		PedMoveToXYZ(gPlayer, 1, 106.84, -5.09, 6.13)
		PedFollowPath(Fatty, PATH._2_S04_NERD_ESCAPE2, 0, 2)
		PedFollowPath(Beatrice, PATH._2_S04_NERD_ESCAPE2, 0, 2)
		PedMoveToXYZ(Thad, 2, 131.62, -21.27, 6.17)
		PedMoveToXYZ(Algie, 2, 128.91, 25.07, 6.14)
		SoundPlayScriptedSpeechEvent(Thad, "M_2_S04", 60, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Thad)
		CameraSetXYZ(104.13, -7.50, 8.14, 105.81, -3.95, 7.40)
		SoundPlayScriptedSpeechEvent(Fatty, "M_2_S04", 61, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Fatty)
		PedSetFlag(gPlayer, 11, true)
		Wait(500)
		PedDelete(Algie)
		PedDelete(Fatty)
		CameraReset()
		CameraReturnToPlayer()
		CounterMakeHUDVisible(true)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 62, "xtralarge")
		PedAttack(Davis, gPlayer, 1)
		PedAttackPlayer(Troy, 1)
		PlayerSetControl(1)
		PedSetStationary(Davis, false)
		PedSetStationary(Troy, false)
		PedSetFlag(gPlayer, 11, false)
		PedSetFlag(Davis, 11, false)
		PedSetFlag(Troy, 11, false)
		CreateThread("ThadReturnsToHelp")
		CreateThread("BeatriceBringsSoda")
		repeat
		Wait(0)
		until ThadIsBack and BeaIsBack
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 65, "xtralarge")
		repeat
		Wait(0)
		until PedIsDead(Davis)
		X, Y, Z = PedGetPosXYZ(Davis)
		PickupDestroyTypeInAreaXYZ(X,Y,Z, 5, 468)
		Sheet4 = PickupCreateXYZ(463, X, Y, Z + 0.90, "PermanentButes") --463 497SE
		CharSheetPickup = AddBlipForPickup(Sheet4, 0, 4)
		repeat
		Wait(0)
		until PickupIsPickedUp(Sheet4)
		PedDismissAlly(gPlayer, Thad)
		CounterSetCurrent(4)

end

DeleteGreasers = function()

		repeat
		AreaClearSpawners()
		AreaClearAllPeds()
		Wait(0)
		until PedIsDead(Davis) and PedIsDead(Troy) and PlayerIsInAreaXYZ(106.05, -40.81, 5.56, 3, 0)
		PedDelete(Thad)

end

NerdsBulliesSetup = function()

		Davis = PedCreatePoint(99, POINTLIST._2_S04_SHEET2)
		Troy = PedCreatePoint(102, POINTLIST._2_S04_SHEET2_G1)
		Thad = PedCreatePoint(7, POINTLIST._2_S04_SHEET2_N1)
		Fatty = PedCreatePoint(5, POINTLIST._2_S04_SHEET2_N2)
		Algie = PedCreatePoint(4, POINTLIST._2_S04_SHEET2_N3)
		Beatrice = PedCreatePoint(3, POINTLIST._2_S04_SHEET2_N4)
		GameSetPedStat(Davis, 4, 125)
		GameSetPedStat(Troy, 4, 125)
		PedSetHealth(Davis, 125)
		PedSetHealth(Troy, 125)
		PedSetStationary(Davis, true)
		PedSetStationary(Troy, true)
		PedSetStationary(Thad, true)
		PedSetStationary(Fatty, true)
		PedSetStationary(Algie, true)
		PedSetStationary(Beatrice, true)

end

ThadReturnsToHelp = function()

		Wait(5000)
		PedClearObjectives(Thad)
		Wait(50)
		PedSetPedToTypeAttitude(Thad, 13, 4)
		PedSetPedToTypeAttitude(Thad, 11, 0)
		PedSetInvulnerableToPlayer(Thad, true)
		PedMakeTargetable(Thad, false)
		PedOverrideStat(Thad, 6, 0)
		PedOverrideStat(Thad, 14, 100)
		PedOverrideStat(Thad, 7, 0)
		PedOverrideStat(Thad, 8, 80)
		Wait(100)
		PedRecruitAlly(gPlayer, Thad)
		PedSetAllyAutoEngage(Thad, true)
		PedSetAllyJump(Thad, true)
		SoundPlayScriptedSpeechEvent(Thad, "M_2_S04", 63, "xtralarge")
		PedHideHealthBar()
		ThadIsBack = true

end

BeatriceBringsSoda = function()

		repeat
		Wait(0)
		until ThadIsBack
		PedStop(Beatrice)
		PedSetInvulnerable(Beatrice, true)
		PedFollowPath(Beatrice, PATH._2_S04_NERDRETURN, 0, 2)
		PedSetInfiniteSprint(Beatrice, true)
		repeat
		Wait(0)
		until PedIsInAreaXYZ(Beatrice, 112.373001, -9.055620, 6.221150, 1.5, 0)
		X,Y,Z = PedGetPosXYZ(Beatrice)
		PedStop(Beatrice)
		PedClearObjectives(Beatrice)
		SoundPlayScriptedSpeechEvent(Beatrice, "M_2_S04", 64, "xtralarge")
		Wait(1000)
		PickupCreateXYZ(468, X,Y,Z, "HealthBute")
		Wait(2000)
		BeaIsBack = true
		PedFollowPath(Beatrice, PATH._2_S04_NERD_ESCAPE1, 0, 2)
		Wait(6000)
		PedDelete(Beatrice)
end


TroyTrentSheet = function()

		CounterSetCurrent(4)
		SetupTroyAndTrent()
		repeat
		Wait(0)
		until PlayerIsInTrigger(TRIGGER._2_S04_LIBRARYJUMP) and PedIsPlaying(gPlayer, "/Global/WProps/WallClimb", true) or PedIsPlaying(gPlayer, "/Global/Player/JumpActions/Jump/IdleJump", true)
		PlayerSetControl(0)
		CounterMakeHUDVisible(false)
		Wait(1000)
		local X, Y, Z = GetPointList(POINTLIST._2_S04_SHEET1START)
		PedFollowPath(gPlayer, PATH._2_S04_PLAYERENTERPATH, 0, 0)
		PedFaceObject(gPlayer, Trent, 2, 1)
		PedFaceXYZ(Trent, 163.814996, -160.371994, 7.777900)
		PedFaceObject(Troy, gPlayer, 3, 1)
		CameraSetXYZ(160.97711181641, -165.27909851074, 9.8641910552979, 161.49369812012, -164.42340087891, 9.8343620300293)
		AreaSetPathableInRadius(164.39999389648, -176.89999389648, 7.8000001907349, 0.10000000149012, 5, false)
		MinigameDone = false
		CreateThread("BulliesRunAway")
		Wait(2000)
		CameraSetXYZ(166.31854248047, -163.2389831543, 9.0046405792236, 166.13482666016, -162.25619506836, 9.0201873779297)
		ExecuteActionNode(gPlayer, "/Global/2_S04/Anim/RochambeauNIS/JimmyLine1", "Act/Conv/2_S04.act")
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 66, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(gPlayer)
		CameraSetXYZ(163.12055969238, -159.45274353027, 8.8421993255615, 164.06008911133, -159.77383422852, 8.9605579376221)
		ExecuteActionNode(Trent, "/Global/2_S04/Anim/RochambeauNIS/TrentGreet", "Act/Conv/2_S04.act")
		SoundPlayScriptedSpeechEvent(Trent, "M_2_S04", 67, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Trent)
		CameraSetXYZ(167.10, -162.16, 9.08, 165.01, -158.76, 8.78)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 68, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(gPlayer)
		CameraSetXYZ(163.12055969238, -159.45274353027, 8.8421993255615, 164.06008911133, -159.77383422852, 8.9605579376221)
		ExecuteActionNode(Trent, "/Global/2_S04/Anim/RochambeauNIS/TrentRules", "Act/Conv/2_S04.act")
		SoundPlayScriptedSpeechEvent(Trent, "M_2_S04", 68, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Trent)
		CameraSetXYZ(164.00285339355, -163.56578063965, 9.202618598938, 164.43383789063, -162.67166137695, 9.0821895599365)
		ExecuteActionNode(gPlayer, "/Global/2_S04/Anim/RochambeauNIS/JimmyThatStupid", "Act/Conv/2_S04.act")
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 69, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(gPlayer)
		ExecuteActionNode(Troy, "/Global/2_S04/Anim/RochambeauNIS/TroyAttacks", "Act/Conv/2_S04.act")
		SoundPlayScriptedSpeechEvent(Troy, "M_2_S04", 70, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Troy)
		PedFollowPath(Troy, PATH._2_S04_SBPATH, 0, 0)
		Wait(25)
		CameraSetXYZ(161.50213623047, -161.16604614258, 8.283805847168, 162.47860717773, -160.96713256836, 8.3640851974487)
		CameraAllowChange(false)
		PedLockTarget(Troy, gPlayer)
		PedSetActionNode(Troy, "/Global/2_S04/Anim/Rochambeau", "Act/Conv/2_S04.act")
		Wait(1500)
		PedSetActionNode(Trent, "/Global/2_S04/Anim/Laugh", "Act/Conv/2_S04.act")
		PlayerSetControl(1)
		PedSetActionNode(gPlayer, "/Global/HitTree/Standing/Melee/Unique/ROCHAMBEAU/Front", "Act/HitTree.act")
		LockFPS30(true)
		Wait(1000)
		repeat
		Wait(0)
		until not PedIsPlaying(gPlayer, "Global/HitTree/Standing/Melee/Unique/Rochambeau/KickedFront/SackedOut", true)
		LockFPS30(false)

		--WIN SCENARIO
		Wait(2400)
		CameraSetXYZ(164.87, -160.83, 9.08, 160.75, -158.79, 9.07)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 74, "xtralarge")
		PedSetPosXYZ(Trent, 166.42, -161.16, 7.78)
		PedFaceXYZ(Trent, 163.814996, -160.371994, 7.777900)
		PedFaceObject(Trent, gPlayer, 3, 1)
		PedSetHealth(Troy, 5)
		repeat
		Wait(0)
		until not SoundSpeechPlaying(gPlayer)
		CameraSetXYZ(165.22, -161.69, 9.21, 169.64, -158.99, 8.74)
		PedSetActionNode(Trent, "/Global/3_04/3_04_Anim/AlgieOhFace/OhFace", "Act/Conv/3_04.act")
		SoundPlayScriptedSpeechEvent(Trent, "M_2_S04", 75, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Trent)
		PedStop(Trent)
		CameraSetXYZ(165.04, -159.84, 9.36, 168.97, -160.52, 8.97)
		SoundPlayScriptedSpeechEvent(Troy, "M_2_S04", 76, "xtralarge")
		PedSetActionNode(Troy, "/Global/4_G4/Scream", "Act/Conv/4_G4.act")
		PedSetActionNode(Trent, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Act/Anim/Ambient.act")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Troy)
		X, Y, Z = PedGetPosXYZ(Trent)
		Sheet5 = PickupCreateXYZ(463, X, Y, Z + 0.90, "PermanentButes") --463 497SE
		CharSheetPickup = AddBlipForPickup(Sheet5, 0, 4)
		PlayerSetControl(1)
		CameraReset()
		CameraAllowChange(true)
		CameraReturnToPlayer()
		CounterMakeHUDVisible(true)
		MinigameDone = true
		PedSetAsleep(Trent, false)
		PedSetAsleep(Troy, false)
		PedIgnoreStimuli(Trent, true)
		PedIgnoreStimuli(Troy, true)
		PedClearObjectives(Trent)
		PedStop(Trent)
		PedSetStationary(Trent, false)
		PedSetStationary(Troy, false)
		repeat
		Wait(0)
		until PickupIsPickedUp(Sheet5)
		PedDelete(Trent)
		PedDelete(Troy)
		CounterSetCurrent(5)
		SoundDisableSpeech()
		Wait(450)
		SoundEnableSpeech()
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 79, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(gPlayer)
		CounterMakeHUDVisible(false)

		--LOSE SCENARIO
		--[[Wait(5200)
		Lost = true
		PlayerSetControl(1)
		CameraReset()
		CameraAllowChange(true)
		CameraReturnToPlayer()
		CounterMakeHUDVisible(true)
		MinigameDone = true
		PedSetAsleep(Trent, false)
		PedSetAsleep(Troy, false)
		PedIgnoreStimuli(Trent, true)
		PedIgnoreStimuli(Troy, true)
		PedSetStationary(Trent, false)
		PedSetStationary(Troy, false)
		SoundPlayScriptedSpeechEvent(Troy, "M_2_S04", 77, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Troy)
		SoundPlayScriptedSpeechEvent(Trent, "M_2_S04", 78, "xtralarge")]]

end

SetupTroyAndTrent = function()
    Trent = PedCreatePoint(85, POINTLIST._2_S04_SHEET1)
    PedClearAllWeapons(Trent)
    PedSetStationary(Trent, true)
    sheet1GuardAttitude = PedGetPedToTypeAttitude(Trent, 13)
    PedSetPedToTypeAttitude(Trent, 13, 4)
    PedSetFlag(Trent, 75, true)
    PedSetFlag(Trent, 98, false)
	PedIgnoreStimuli(Trent, true)
    PedSetMinHealth(Trent, 20)
    Troy = PedCreatePoint(102, POINTLIST._2_S04_SHEET1BRUISER)
    PedClearAllWeapons(Troy)
    PedAddPedToIgnoreList(Troy, gPlayer)
    PedSetStationary(Troy, true)
    sheet1BruiserAttitude = PedGetPedToTypeAttitude(Troy, 13)
    PedSetPedToTypeAttitude(Troy, 13, 4)
    PedSetFlag(Troy, 75, true)
    PedSetFlag(Troy, 98, false)
	PedIgnoreStimuli(Troy, true)
    PedSetMinHealth(Troy, 20)
end

BulliesRunAway = function()

		repeat
		Wait(0)
		until MinigameDone
		Wait(150)
		PedClearObjectives(Trent)
		PedStop(Trent)
		PedSetHealth(Troy, 100)
		if Lost then
		PedMoveToPoint(Trent, 1, POINTLIST._2_S04_SHEET1EXIT, 2, cbSheet1BruiserDoneClimb, 0.30000001192093, false, true)
		else PedMoveToPoint(Trent, 2, POINTLIST._2_S04_SHEET1EXIT, 2, cbSheet1BruiserDoneClimb, 0.30000001192093, false, true)
		end
		Wait(200)
		PedClearObjectives(Troy)
		PedStop(Troy)
		Wait(100)
		if Lost then
		PedMoveToPoint(Troy, 1, POINTLIST._2_S04_SHEET1EXIT, 1, cbSheet1GuardDoneClimb, 0.30000001192093, false, true)
		else
		PedMoveToPoint(Troy, 2, POINTLIST._2_S04_SHEET1EXIT, 1, cbSheet1GuardDoneClimb, 0.30000001192093, false, true)
		end

end

cbSheet1GuardDoneClimb = function()
end


ReturnToMelvin = function()

		TextPrintString("Return the sheets to Melvin.", 3, 1)
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(188.919998, -151.835007, 7.666410, 2, 0)
		PedMakeTargetable(Melvin, true)
		CameraSetWidescreen(true)
		PlayerSetControl(0)
		PedFaceObject(Melvin, gPlayer, 3, 1)
		PedLockTarget(gPlayer, Melvin, 3)
		Wait(300)
		PedSetActionNode(gPlayer, "/Global/Give2S04/Give_Attempt", "Act/Gifts/Give2S04.act")
		Wait(2400)
		CameraAllowChange(false)
		repeat
		Wait(0)
		until not PedIsPlaying(gPlayer, "/Global/Give2S04", true)
		PedLockTarget(gPlayer, -1)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_S04", 83, "xtralarge")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(gPlayer)
		MinigameSetCompletion("M_PASS", true, l_0_0)
		SoundPlayMissionEndMusic(true, 10)
		PedLockTarget(Melvin, -1)
		PedClearObjectives(Melvin)
		PedWander(Melvin)
		Wait(10)
		PedSetActionNode(Melvin, "/Global/2_S04/Anim/MelvinCheers", "Act/Conv/2_S04.act")
		repeat
		Wait(0)
		until not MinigameIsShowingCompletion()
		CameraFade(501, 0)

end
