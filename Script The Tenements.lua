-- The Tenements

MissionSetup = function()

		DATLoad("3_05.DAT", 2)
		DATInit()
		ClockSet(21)
		SoundDisableSpeech_ActionTree()
		ToggleHUDComponentVisibility(11, false)
		ToggleHUDComponentVisibility(4, false)
		ToggleHUDComponentVisibility(0, false)
		PauseGameClock()
		MissionDontFadeInAfterCompetion()
		
end

main = function()
	
	Wait(500)
		
		LoadAnims()
		SceneInside()
   
end

SceneInside = function()

		AreaTransitionXYZ(36, -551.42, -32, 31)
		CreateThread("WallScene1")
		--[[CreatePersistentEntity("TennBrkWall01", -540.366028, -40.618900, 32.205001, 0, 36)
		CreatePersistentEntity("TennBrkWall02", -539.953003, -41.662102, 37.210799, 0, 36)
		CreatePersistentEntity("TennBrkWall03", -528.711975, -40.939499, 37.423500, 0, 36)
		CreatePersistentEntity("TennBrkWall04", -528.708984, -40.667999, 42.050301, 0, 36)
		CreatePersistentEntity("TennBrkWall05", -528.640015, -41.172600, 32.613700, 0, 36)]]
		SoundPlayStream("MS_TenementsLow.rsm", MUSIC_DEFAULT_VOLUME)
		PlayerSetControl(0)
		Vance = PedCreateXYZ(27, -541.08, -24.70, 31.04)
		Lefty = PedCreateXYZ(24, -540.14, -26.99, 31.27)
		LolaDiary, LolaDiary1 = CreatePersistentEntity("AddBook", -539.932007, -17.955500, 32.08, 0, 36) --"PermanentButes")
		LolaPerf, LolaPerf1 = CreatePersistentEntity("Perfume", -530.575989, -47.101700, 31.227700, 0, 36)
		LolaKeys, LolaKeys1 = CreatePersistentEntity("LolaKeys", -538.276001, -45.651001, 35.743599, 0, 36)
		LolaLipStick, LolaLipStick1 = CreatePersistentEntity("lipstick", -552.460999, -19.093201, 36.853598, 0, 36)
		LolaLaund, LolaLaund1 = CreatePersistentEntity("laundbag", -533.502014, -37.471901, 40.708098, 0, 36)
		
	Wait(5)
		
		PedFaceXYZ(Vance, -540.17, -26.77, 31.03)
		PedFaceXYZ(Lefty, -538, -27, 31)
		
	Wait(5)

		PedSetActionNode(Lefty, "/Global/1_02/NIS/MeetRussell/Bullies/Bullies", "Act/Conv/1_02.act")
		
	Wait(600)
		
		TextPrintString("Collect Lola's items.", 3, 1)
		CameraSetXYZ(-544.22, -24.56, 33.90, -542.33, -25.42, 32.70)
		
	Wait(500)
	
		SoundPlayScriptedSpeechEvent(Vance, "M_3_05", 1, "supersize")
		
	Wait(3000)
	
		PedMoveToXYZ(Vance, 0, -549.79, -24.42, 31.02)
		
	Wait(1500)
	
		CameraSetXYZ(-544.20, -20.67, 32.56, -546.40, -23.98, 32.09)
	
	Wait(2600)
	
		PedMoveToXYZ(Vance, 0, -549.92, -30.31, 31.02)
		
	Wait(3000)
	
		CameraSetXYZ(-549.39, -32.33, 32.52, -551.03, -28.07, 31.95)
		
	Wait(3000)

		SoundPlayStream("MS_TenementsMid.rsm", MUSIC_DEFAULT_VOLUME)
		PedSetPedToTypeAttitude(Vance, 13, 2)
		SoundDisableSpeech()
		PlayerSetControl(1)
		--TextPrintString("Grab him!!!", 2, 1)
		CameraSetXYZ(-547, -29.51, 31.44, -550.97, -29.96, 31.74)
		
		repeat
		Wait(0)
		until PedIsDead(Vance) and PlayerIsInAreaXYZ(-550.74, -28.16, 31.03, 1, 0)
		
		SoundPlayStream("MS_TenementsLow.rsm", MUSIC_DEFAULT_VOLUME)
		SoundEnableSpeech()
		PlayerSetControl(0)
		CameraSetXYZ(-539.48, -27.80, 31.70, -541.94, -24.16, 31.79)
		PedMoveToXYZ(gPlayer, 1, -540.44, -18.36, 31.06)
		SoundPlayScriptedSpeechEvent(Lefty, "M_3_05", 2, "supersize")

		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-543.37, -19.44, 31.03, 2, 0)
		
		PedStop(gPlayer)
		CameraSetXYZ(-542.22, -24.06, 32.64, -540.03, -27.25, 31.89)
		PedSetActionNode(Lefty, "/Global/4_B2/ReactionAnims/GetUpEasy/GetUpEasy2", "Act/Conv/4_B2.act")
		SoundStopCurrentSpeechEvent()
		
	Wait(1000)
	
		PedLockTarget(Lefty, gPlayer, 3)
		PedFaceObject(Lefty, gPlayer, 3, 1)
		PedLockTarget(Lefty, gPlayer, 3)
		PedFaceXYZ(gPlayer, -540.14, -26.99, 31.27)
		
		SoundPlayScriptedSpeechEvent(Lefty, "M_3_05", 3, "supersize")
		
	Wait(1200)
	
		PedSetActionNode(Lefty, "/Global/1_08/CafeteriaLady/Point/Point", "Act/Conv/1_08.act")
		SoundPlayScriptedSpeechEvent(Lefty, "M_3_05", 4, "supersize")
		
	Wait(2000)

		PedSetActionNode(gPlayer, "/Global/2_B/Empty", "Act/Conv/PriOff.act")
		
	Wait(500)

		CameraSetXYZ(-544.57, -22.35, 32.52, -544.79, -18.35, 32.41)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_3_05", 5, "supersize")
		
	Wait(1500)
	
		CameraSetXYZ(-544.59, -21.68, 32.52, -544.81, -17.68, 32.41)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_3_05", 6, "supersize")
		
	Wait(550)
	
		SoundPlayStream("MS_TenementsMid.rsm", MUSIC_DEFAULT_VOLUME)
		PedAttack(Lefty, gPlayer, 2)
		PedSetPedToTypeAttitude(Lefty, 13, 0)
	
	Wait(550)

		TextPrintString("Get Lola's Address Book.", 2, 1)
		PlayerSetControl(1)
		CameraReturnToPlayer()
		--CameraSetXYZ(-542.54, -19.04, 33.12, -542.94, -22.89, 32.12)
		Hal = PedCreateXYZ(22, -518.08, -44.32, 35.74)
		Ricky = PedCreateXYZ(28, -519.03, -43.96, 35.74)
		
	Wait(5)
	
		PedFaceXYZ(Hal, -519.03, -43.96, 35.74)
		PedFaceXYZ(Ricky, -518.08, -44.32, 35.74)

		repeat
		Wait(0)
		until PedIsDead(Lefty)
		
		PlayerSetControl(0)
		
	Wait(500)
		
		CreateThread("LolaDiaryScene")
		SoundPlayStream("MS_TenementsLow.rsm", MUSIC_DEFAULT_VOLUME)
		
	Wait(500)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-550.76, -29.32, 31.08, 2, 0)
		
		CameraSetXYZ(-535.07, -35.42, 32.70, -538.11, -32.55, 32.24)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-536.96, -31.86, 31.01, 3, 0)
		
		CameraSetXYZ(-535.98, -29.18, 34.11, -533.27, -30.62, 32.64)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-511.82, -30.61, 32.56, 3, 0)
		
		CameraSetXYZ(-520.03, -28.96, 38.85, -517.37, -31.28, 37.47)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-516.76, -33.86, 35.74, 3, 0)
		
		CameraSetXYZ(-528.52, -31.17, 37.36, -526.13, -33.53, 36.84)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-525.82, -37.78, 35.74, 1, 0)
		
		PlayerSetControl(0)
		CameraSetXYZ(-519.05, -42.65, 37.30, -517.64, -46.37, 36.87)
		SoundPlayScriptedSpeechEvent(Hal, "M_3_05", 7, "supersize")
		
	Wait(1500)
	
		PlayerSetPosXYZ(-525.69, -37.27, 35.75)
		
	Wait(5)
	
		PedFaceXYZ(gPlayer, -519.03, -43.96, 35.74)
		CameraSetXYZ(-516.95, -45.57, 38.20, -519.66, -42.85, 37.08)
		PedFaceXYZ(Hal, -525.82, -37.78, 35.74)
		PedFaceXYZ(Ricky, -525.82, -37.78, 35.74)
		
	Wait(1500)

		CameraSetXYZ(-525.07, -38.21, 37.25, -527.15, -34.80, 37.03)
		SoundPlayScriptedSpeechEvent(Hal, "M_3_05", 8, "supersize")
		
	Wait(4500)
	
		CameraSetXYZ(-518.68, -42.94, 37.25, -517.95, -46.87, 37.09)
		
	Wait(2000)
	
		CameraSetXYZ(-525.07, -38.21, 37.25, -527.15, -34.80, 37.03)
		--PedSetActionNode(gPlayer, "/Global/3_04/3_04_Anim/AlgieOhFace/OhFace", "Act/Conv/3_04.act")
		
	Wait(2000)
	
		CameraSetXYZ(-518.68, -42.94, 37.25, -517.95, -46.87, 37.09)
		SoundPlayScriptedSpeechEvent(Hal, "M_3_05", 9, "supersize")
		PedSetActionNode(gPlayer, "/Global/2_B/Empty", "Act/Conv/PriOff.act")

	Wait(1500)
		
		SoundPlayStream("MS_TenementsMid.rsm", MUSIC_DEFAULT_VOLUME)
		PedSetPedToTypeAttitude(Hal, 13, 0)
		PedSetPedToTypeAttitude(Ricky, 13, 0)
		CameraReturnToPlayer()
		PlayerSetControl(1)
		
		repeat
		Wait(0)
		until PedIsDead(Ricky)
		
		PedStop(Hal)
		PedSetPedToTypeAttitude(Hal, 13, 2)
		PedSetActionNode(Hal, "/Global/2_B/Empty", "Act/Conv/PriOff.act")
		PlayerSetControl(0)
		
	Wait(200)
		
		PedSetPosXYZ(Hal, -510.78, -48.64, 35.73)
		PedFaceXYZ(Hal, -518.08, -44.32, 35.74)
		
	Wait(50)
		
		PedSetActionNode(Hal, "/Global/1_07/BackUp", "Act/Conv/1_07.act")
		SoundPlayScriptedSpeechEvent(Hal, "M_3_05", 10, "supersize")
		CameraSetXYZ(-512.33, -46.99, 36.99, -509.78, -50.03, 36.46)

	Wait(1500)
		
		PedMoveToXYZ(Hal, 2, -524.20, -52.15, 35.71)
		Lucky = PedCreateXYZ(26, -526.04, -51.53, 35.71)

	Wait(500)
	
		CameraReturnToPlayer()
		PlayerSetControl(1)

		repeat
		Wait(0)
		until PedIsInAreaXYZ(Hal, -524.20, -52.15, 35.71, 1, 0)
		
	Wait(100)
	
		PedSetPedToTypeAttitude(Lucky, 13, 0)
		PedAttack(Lucky, gPlayer, 2)
		PedAttack(Hal, gPlayer, 2)
		
	Wait(2500)
	
		Krakauer = PedCreateXYZ(131, -520.20, -61.38, 29.85)
		PedSetEffectedByGravity(Krakauer, false)
		SoundPlayScriptedSpeechEvent(Krakauer, "M_3_05", 11, "supersize")
		CameraSetXYZ(-521.27, -62.85, 30.68, -520.97, -59.13, 32.11)
		CameraAllowChange(false)

	Wait(2200)
	
		SoundPlayScriptedSpeechEvent(Krakauer, "M_3_05", 11, "supersize")
		
	Wait(2200)
	
		CameraAllowChange(true)
		CameraReturnToPlayer()
		PedDelete(Krakauer)

		repeat
		Wait(0)
		until PedIsDead(Hal) and PedIsDead(Lucky) and PlayerIsInAreaXYZ(-541.72, -27.22, 35.76, 2, 0)

		CreateThread("LolaLipStickScene")
		
	Wait(500)

		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-534.11, -38.55, 40.52, 1, 0)
		
		CreateThread("MeetJason")
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-528.03, -41.11, 40.65, 3, 0)
		
		CameraSetXYZ(-530.84, -46.24, 43.89, -532.21, -42.73, 42.54)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-541.13, -38.77, 40.65, 2, 0)
		
		CameraSetXYZ(-543.52, -28.60, 44.05, -545.29, -31.80, 42.41)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-556.49, -33.39, 37.85, 3, 0)
		
		PlayerSetControl(0)
		PedMoveToXYZ(gPlayer, 1, -548.91, -30.28, 35.74)
		CameraSetXYZ(-524.78, -32.88, 36.96, -528.73, -32.63, 36.36)
		SoundPlayStream("MS_TenementsHigh.rsm", MUSIC_DEFAULT_VOLUME)
		Ricky = PedCreateXYZ(28, -526.32, -33.64, 35.84)
		Vance = PedCreateXYZ(27, -526.12, -32.00, 35.84)
		
	Wait(5)
		
		PedFaceXYZ(Ricky, -548.91, -30.28, 35.74)
		PedFaceXYZ(Vance, -548.91, -30.28, 35.74)
		
	Wait(2000)
		
		SoundPlayScriptedSpeechEvent(Ricky, "M_3_05", 24, "supersize")
		
	Wait(1000)
	
		SoundPlayScriptedSpeechEvent(Vance, "M_3_05", 25, "supersize")
		
	Wait(1500)
	
		CameraSetXYZ(-547.67, -31.14, 37.25, -550.79, -28.63, 37.13)
		--SoundPlayScriptedSpeechEvent(gPlayer, "M_3_05", 27, "supersize")
		
	Wait(1500)

		PedAttack(Ricky, gPlayer, 2)
		PedAttack(Vance, gPlayer, 2)
		PedSetWeaponNow(Ricky, 281, 1)
		PedSetWeaponNow(Vance, 281, 1)
		CameraReturnToPlayer()
		PlayerSetControl(1)
		PedSetPedToTypeAttitude(Ricky, 13, 0)
		PedSetPedToTypeAttitude(Vance, 13, 0)
		
		repeat
		Wait(0)
		until PedIsDead(Ricky) and PedIsDead(Vance) and PlayerIsInAreaXYZ(-539.13, -41.39, 35.70, 2, 0)
		
		CreateThread("LolaKeysScene")
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-538.77, -40.98, 31.01, 1, 0)
		
		CreateThread("LolaPerfScene")
		
		repeat
		Wait(0)
		until AreaGetVisible() == 0
		
		Racer = VehicleCreateXYZ(258, 581.57, -476.32, 4.46)
		Lola = PedCreatePoint(25, POINTLIST._3_05_LOLAEND)
		PedSetPedToTypeAttitude(Lola, 13, 4)
		PedIgnoreAttacks(Lola, true)
		PedSetStationary(Lola, true)
		PedIgnoreStimuli(Lola, true)
		

		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(492.40, -236.38, 2.19, 2, 0)
		
		PedFaceObject(gPlayer, Lola, 2, 1)
		PedFaceObject(Lola, gPlayer, 3, 1)
		PedLockTarget(gPlayer, Lola, 3)
		
	Wait(500)
		
		PedSetActionNode(gPlayer, "/Global/3_05/Animations/Give/GiveLola3_05/", "Act/Conv/3_05.act")
		
	Wait(4000)
		
		SoundPlayScriptedSpeechEvent(gPlayer, "M_3_05", 27, "supersize")
		
		repeat
		Wait(0)
		until not PedIsPlaying(gPlayer, "/Global/3_05/Animations/Give/GiveLola3_05/", true)
		
		PedLockTarget(Lola, gPlayer)
		PedLockTarget(gPlayer, Lola)
		
	Wait(500)
		
		SoundPlayScriptedSpeechEvent(Lola, "M_3_05", 28, "supersize")
		
	Wait(2200)
		
		PedSetActionNode(gPlayer, "/Global/Player/Social_Actions/MakeOut/Makeout/GrappleAttempt", "Act/Player.act")
		repeat
		Wait(0)
		until PedIsPlaying(gPlayer, "/Global/Player/Social_Actions/MakeOut/Makeout/GrappleAttempt/Kisses", true)
		Wait(1000)
		MinigameSetCompletion("M_PASS", true, 2000)
		MinigameAddCompletionMsg("MRESPECT_GM10", 1)
		SoundPlayMissionEndMusic(true, 0)
		repeat
		Wait(0)
		until not PedIsPlaying(gPlayer, "/Global/Player/Social_Actions/MakeOut/Makeout/GrappleAttempt/Kisses", true) and not PedIsPlaying(Lola, "/Global/Player/Social_Actions/MakeOut/Makeout/GrappleAttempt/Kisses", true)
		PedLockTarget(gPlayer, -1, 3)
		PedMakeAmbient(Lola)
		PedWander(Lola, 0)
		SetFactionRespect(4, GetFactionRespect(4) - 10)
		repeat
		Wait(0)
		until not MinigameIsShowingCompletion()
		MissionSucceed()

end

LolaDiaryScene = function()

		PedMoveToXYZ(gPlayer, 1, -540.87, -18.63, 31.03)
		CameraSetXYZ(-541.82, -18.11, 32.63, -538.04, -18.67, 31.45)
		
	Wait(1500)
	
		SoundPlayScriptedSpeechEvent(gPlayer, "M_3_05", 15, "supersize")
		
	Wait(2500)
	
		PlayerSetControl(1)
		CameraReturnToPlayer()
		DeletePersistentEntity(LolaDiary, LolaDiary1)
		TextPrintString("You got Lola's Address Book.", 3, 1)

	Wait(3000)
	
		TextPrintString("Get Lola's Lipstick.", 2, 1)
end

LolaLipStickScene = function()

		PlayerSetControl(0)
		PedMoveToXYZ(gPlayer, 3, -551.94, -19.59, 35.76)
		CameraSetXYZ(-552.63, -18.43, 37.26, -551.65, -22.19, 36.30)
		
	Wait(2400)
		
		SoundPlayScriptedSpeechEvent(gPlayer, "M_3_05", 13, "supersize")
		
	Wait(3000)
	
		DeletePersistentEntity(LolaLipStick, LolaLipStick1)
		CameraReturnToPlayer()
		PlayerSetControl(1)
		TextPrintString("You got Lola's Lipstick.", 2, 1)

	Wait(2000)
	
		TextPrintString("Get Lola's Laundry.", 2, 1)
end

LolaKeysScene = function()

		PlayerUnequip()
		PlayerSetControl(0)
		CameraSetXYZ(-536.71, -46.73, 36.37, -539.12, -43.54, 36.41)
		PedMoveToXYZ(gPlayer, 1, -537.86, -44.64, 35.70)
		
	Wait(1500)
	
		CameraSetXYZ(-538.36, -46.36, 36.65, -537.49, -42.59, 37.67)
		PedSetActionNode(gPlayer, "/Global/1_10_anims/Gary/KeyPickup", "Act/Conv/1_10.act")
		
		repeat
		Wait(0)
		until PedIsPlaying(gPlayer, "/Global/1_10_anims/Gary/KeyPickup", true)
		
		SoundPlayScriptedSpeechEvent(gPlayer, "M_3_05", 16, "supersize")
		
	Wait(3500)
		
		DeletePersistentEntity(LolaKeys, LolaKeys1)
		PlayerSetControl(1)
		CameraReturnToPlayer()
		TextPrintString("You got Lola's Keys.", 2, 1)
		
	Wait(2000)
	
		TextPrintString("Get Lola's Perfume.", 2, 1)

end

LolaPerfScene = function()

		PlayerUnequip()
		PlayerSetControl(0)
		PedMoveToXYZ(gPlayer, 1, -531.88, -45.68, 30.87)
		
	Wait(1250)
	
		CameraSetXYZ(-530.56, -48.78, 31.85, -532.25, -45.19, 31.39)
		
	Wait(1500)
	
		PedSetActionNode(gPlayer, "/Global/1_10_anims/Gary/KeyPickup", "Act/Conv/1_10.act")
		CameraSetXYZ(-530.36, -46.33, 32.30, -533.97, -44.65, 31.95)

		repeat
		Wait(0)
		until PedIsPlaying(gPlayer, "/Global/1_10_anims/Gary/KeyPickup", true)
		
		SoundPlayScriptedSpeechEvent(gPlayer, "M_3_05", 17, "supersize")
		
	Wait(2500)
		
		DeletePersistentEntity(LolaPerf, LolaPerf1)
		PlayerSetControl(1)
		CameraReturnToPlayer()
		TextPrintString("You got Lola's Perfume.", 2, 1)
		
	Wait(2000)
	
		TextPrintString("Return the items to Lola.", 2, 1)
		SoundStopStream()

end

MeetJason = function()

		PlayerUnequip()
		PlayerSetControl(0)
		PedMoveToXYZ(gPlayer, 0, -533.59, -38.14, 40.52)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_3_05", 14, "supersize")
		
	Wait(2000)
		
		SoundFadeWithCamera(false)
		MusicFadeWithCamera(false)
		CameraFade(1000, 0)
		Wait(1050)
		PedSetPosPoint(gPlayer, POINTLIST._3_05_JIMKNOCK)
		
	Wait(1000)
  
		PlayerFaceHeadingNow(-273)
		Jason = PedCreateXYZ(29, -543.04, -37.98, 40.49)
		--PedSetWeapon(Jason, 302, 1)
		PedSetWeapon(Jason, 324, 1)
		PedSetPedToTypeAttitude(Jason, 13, 4)
		DeletePersistentEntity(LolaLaund, LolaLaund1)
		CameraFade(1000, 1)
		CameraSetXYZ(-537.03, -38.08, 41.84, -540.96, -38.81, 42.03)
		SoundPlayScriptedSpeechEvent(Jason, "M_3_05", 18, "supersize")
		PedMoveToXYZ(Jason, 0, -531.26, -41.11, 40.49)
		
	Wait(3000)

		CameraSetXYZ(-528.92, -42.69, 42.39, -531.97, -40.24, 41.53)
		SoundPlayScriptedSpeechEvent(Jason, "M_3_05", 19, "supersize")

	Wait(3000)
		
		F_SetupJason()
		CameraSetFOV(40)
		CameraSetXYZ(-533.05096435547, -42.586360931396, 41.973148345947, -532.16448974609, -42.126842498779, 41.922660827637)
		PedSetActionNode(gPlayer, "/Global/3_05/Animations/Player/Player01", "Act/Conv/3_05.act")
		SoundPlayScriptedSpeechEvent(gPlayer, "M_3_05", 20, "supersize")

	Wait(3000)
		
		CameraSetFOV(40)
		CameraSetXYZ(-528.74255371094, -42.006507873535, 41.884609222412, -529.63531494141, -41.556339263916, 41.890232086182)
		SoundPlayScriptedSpeechEvent(Jason, "M_3_05", 21, "supersize")

	Wait(2200)
		
		PedSetActionNode(gPlayer, "/Global/3_05/Animations/DontHurt", "Act/Conv/3_05.act")
		PedSetActionNode(Jason, "/Global/3_05/Animations/SledgeSwing", "Act/Conv/3_05.act")

	Wait(300)
		
		CameraSetFOV(70)
		CameraSetXYZ(-523.94641113281, -42.22375869751, 41.15767288208, -524.90686035156, -41.977615356445, 41.28751373291)
		
	Wait(300)
		
		PedSetActionNode(gPlayer, "/Global/3_05/Animations/Wall_Break", "Act/Conv/3_05.act")
		
	Wait(1200)
		
		PedStop(Jason)
		PedClearObjectives(Jason)
		
	Wait(500)
		
		PedSetActionNode(Jason, "/Global/3_05/Animations/Laugh", "Act/Conv/3_05.act")
		CameraFade(1000, 0)
		
	Wait(1000)
		
		CameraDefaultFOV()
		PedSetActionNode(Jason, "/Global/3_05/Animations/Break", "Act/Conv/3_05.act")
		PedSetPosPoint(Jason, POINTLIST._3_05_BOSSBATTLEJASON, 1)
		PedSetPosPoint(gPlayer, POINTLIST._3_05_BOSSBATTLEJASON, 2)
		PedFaceObjectNow(Jason, gPlayer, 3)
		PedFaceObjectNow(gPlayer, Jason, 2)
		PedSetPedToTypeAttitude(Jason, 13, 0)
		PedShowHealthBar(Jason, true, "N_Norton", true)
		CameraReturnToPlayer()
		SoundPlayStream("MS_TenementsHigh.rsm", MUSIC_DEFAULT_VOLUME)
		
	Wait(1000)
		
		Pipes, Pipes1 = CreatePersistentEntity("TennBRkPipes01", -529.15100097656, -40.750999450684, 41.207801818848, 0, 36)
		CameraFade(1000, 1)
		
	Wait(1000)
		
		CameraSetWidescreen(false)
		PlayerSetControl(1)
		PedAttack(Jason, gPlayer, true, false)
		UnLoadAnimationGroup("NIS_3_05")
		SoundFadeWithCamera(true)
		MusicFadeWithCamera(true)
		TextPrintString("Defeat Jason.", 3, 1)

	Wait(500)

		repeat
		Wait(0)
		until PedIsDead(Jason)
		
		TextPrintString("Get Jason's sledgehammer.", 3, 1)
		SoundPlayStream("MS_TenementsLow.rsm", MUSIC_DEFAULT_VOLUME)

		repeat
		Wait(0)
		until PlayerHasWeapon(302)
		
		TextPrintString("Use Jason's hammer to get some of Lola's items.", 5, 1)
		
	Wait(2000)

		SoundPlayScriptedSpeechEvent(gPlayer, "M_3_05", 22, "supersize")
		
	Wait(2000)
		
		SoundPlayScriptedSpeechEvent(gPlayer, "M_3_05", 23, "supersize")

	Wait(1000)
	
		TextPrintString("Get Lola's Keys.", 2, 1)
end

F_SetupJason = function()
  PedSetIsStealthMissionPed(Jason, false)
  PedSetStatsType(Jason, "STAT_3_05_NORTON")
  PedSetCombatZoneMask(Jason, true, false, false)
  PedSetAITree(Jason, "/Global/NortonAI", "Act/AI/AI_Norton.act")
  PedSetActionTree(Jason, "/Global/Norton", "Act/Anim/3_05_Norton.act")
  PedSetDamageTakenMultiplier(Jason, 3, 0.5)
  PedSetDamageTakenMultiplier(Jason, 0, 0.5)
  PlayerSocialDisableActionAgainstPed(Jason, 35, true)
  PlayerSocialDisableActionAgainstPed(Jason, 23, true)
  PlayerSocialDisableActionAgainstPed(Jason, 30, true)
  PlayerSocialDisableActionAgainstPed(Jason, 29, true)
  PlayerSocialDisableActionAgainstPed(Jason, 28, true)

end

WallScene1 = function()

		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-526.31, -36.80, 31.01, 2, 0)
	
		PlayerSetControl(0)
		PlayerSetPosXYZ(-526.92, -41.13, 31.01)
		
	Wait(5)
		
		PedFaceXYZ(gPlayer, -528.06, -41.01, 31.01)
		CameraSetXYZ(-525.42, -41.90, 31.41, -529.22, -41.22, 32.46)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_3_05", 12, "supersize")
	
	Wait(2600)
	
		TextPrintString("Find a way to knock down the walls.", 3, 1)
		PlayerSetControl(1)
		CameraReturnToPlayer()

end

LoadAnims = function()

  --[[LoadAnimationGroup("1_02BYourSchool")]]
  LoadAnimationGroup("1_02_MeetWithGary")
  --[[LoadAnimationGroup("1_03The Setup")
  LoadAnimationGroup("1_04TheSlingshot")
  LoadAnimationGroup("1_06ALittleHelp")]]
  LoadAnimationGroup("1_07_SaveBucky")
  LoadAnimationGroup("1_07_Sk8Board")
  LoadAnimationGroup("1_08ThatBitch")
  LoadAnimationGroup("1_08_MandPuke")
  --[[LoadAnimationGroup("1_09_Candidate")
  LoadAnimationGroup("1_10Betrayal")
  LoadAnimationGroup("1_11B_HeBigPrank")
  LoadAnimationGroup("1_G1_TheDiary")
  LoadAnimationGroup("1_S01HatVsGall")
  LoadAnimationGroup("2_01LastMinuteShop")
  LoadAnimationGroup("2_02ComicKlepto")
  LoadAnimationGroup("2_05TadsHouse")
  LoadAnimationGroup("2_06MovieTickets")
  LoadAnimationGroup("2_07BeachRumble")
  LoadAnimationGroup("2_08WeedKiller")
  LoadAnimationGroup("2_4RichAreaRace")
  LoadAnimationGroup("2_G2CarnivalDate")
  LoadAnimationGroup("2_G2_GiftExchange")
  LoadAnimationGroup("2_R03PaperRoute")
  LoadAnimationGroup("2_S02CharSheets")
  LoadAnimationGroup("2_S04CharSheets")
  LoadAnimationGroup("2_S05_CooksCrush")
  LoadAnimationGroup("2_S06PantyRaid")
  LoadAnimationGroup("3_01JealousJohnny")]]
  LoadAnimationGroup("3_04WrongPtTown")
  LoadAnimationGroup("3_05TheTenements")
  --[[LoadAnimationGroup("3_BFightJohnnyV")
  LoadAnimationGroup("3_G3")
  LoadAnimationGroup("3_R05ChemicalDeliv")
  LoadAnimationGroup("3_R08RaceLeague")
  LoadAnimationGroup("3_S03CheatinTime")
  LoadAnimationGroup("4_01Paparazzi")
  LoadAnimationGroup("4_04_FunhouseFun")
  LoadAnimationGroup("4_06BigGame")]]
  LoadAnimationGroup("4_B2_JockBossBattle")
  --[[LoadAnimationGroup("5_01Grp")
  LoadAnimationGroup("5_01Rats")
  LoadAnimationGroup("5_02PrVandalized")
  LoadAnimationGroup("5_05Zoe")
  LoadAnimationGroup("5_09MakingAMark")
  LoadAnimationGroup("6B_PARA")
  LoadAnimationGroup("Ambient")
  LoadAnimationGroup("Ambient2")
  LoadAnimationGroup("Ambient3")
  LoadAnimationGroup("Boxing")
  LoadAnimationGroup("B_Striker")
  LoadAnimationGroup("C_Wrestling")
  LoadAnimationGroup("DO_Striker")
  LoadAnimationGroup("DO_Grap")
  LoadAnimationGroup("DO_StrikeCombo")
  LoadAnimationGroup("DO_Edgar")
  LoadAnimationGroup("EnglishClass")
  LoadAnimationGroup("DodgeBall")
  LoadAnimationGroup("DodgeBall2")
  LoadAnimationGroup("Earnest")
  LoadAnimationGroup("F_Adult")
  LoadAnimationGroup("F_BULLY")
  LoadAnimationGroup("F_Crazy")
  LoadAnimationGroup("F_Douts")
  LoadAnimationGroup("F_Girls")
  LoadAnimationGroup("F_Greas")
  LoadAnimationGroup("F_Jocks")
  LoadAnimationGroup("F_Nerds")
  LoadAnimationGroup("F_OldPeds")
  LoadAnimationGroup("F_Pref")
  LoadAnimationGroup("F_Preps")
  LoadAnimationGroup("Grap")
  LoadAnimationGroup("G_Grappler")
  LoadAnimationGroup("G_Johnny")
  LoadAnimationGroup("G_Striker")
  LoadAnimationGroup("Hang_Jock")
  LoadAnimationGroup("Hang_Moshing")
  LoadAnimationGroup("Hang_Talking")
  LoadAnimationGroup("Hang_Workout")
  LoadAnimationGroup("IDLE_AUTH_A")
  LoadAnimationGroup("IDLE_AUTH_B")
  LoadAnimationGroup("IDLE_AUTH_C")
  LoadAnimationGroup("IDLE_AUTH_D")
  LoadAnimationGroup("IDLE_BULLY_A")
  LoadAnimationGroup("IDLE_BULLY_B")
  LoadAnimationGroup("IDLE_BULLY_C")
  LoadAnimationGroup("IDLE_BULLY_D")
  LoadAnimationGroup("IDLE_CIVM_A")
  LoadAnimationGroup("IDLE_CIVM_B")
  LoadAnimationGroup("IDLE_CIVM_C")
  LoadAnimationGroup("IDLE_DOUT_A")
  LoadAnimationGroup("IDLE_DOUT_B")
  LoadAnimationGroup("IDLE_DOUT_C")
  LoadAnimationGroup("IDLE_DOUT_D")
  LoadAnimationGroup("IDLE_FATG_A")
  LoadAnimationGroup("IDLE_FATG_B")
  LoadAnimationGroup("IDLE_FATG_C")
  LoadAnimationGroup("IDLE_FAT_A")
  LoadAnimationGroup("IDLE_FAT_B")
  LoadAnimationGroup("IDLE_FAT_C")
  LoadAnimationGroup("IDLE_GREAS_A")
  LoadAnimationGroup("IDLE_GREAS_B")
  LoadAnimationGroup("IDLE_GREAS_C")
  LoadAnimationGroup("IDLE_GREAS_D")
  LoadAnimationGroup("IDLE_GSF_A")
  LoadAnimationGroup("IDLE_GSF_B")
  LoadAnimationGroup("IDLE_GSF_C")
  LoadAnimationGroup("IDLE_GSM_A")
  LoadAnimationGroup("IDLE_GSM_B")
  LoadAnimationGroup("IDLE_GSM_C")
  LoadAnimationGroup("IDLE_JOCK_A")
  LoadAnimationGroup("IDLE_JOCK_B")
  LoadAnimationGroup("IDLE_JOCK_C")
  LoadAnimationGroup("IDLE_JOCK_D")
  LoadAnimationGroup("IDLE_NERD_A")
  LoadAnimationGroup("IDLE_NERD_B")
  LoadAnimationGroup("IDLE_NERD_C")
  LoadAnimationGroup("IDLE_NERD_D")
  LoadAnimationGroup("IDLE_NGIRL")
  LoadAnimationGroup("IDLE_PREP_A")
  LoadAnimationGroup("IDLE_PREP_B")
  LoadAnimationGroup("IDLE_PREP_C")
  LoadAnimationGroup("IDLE_PREP_D")
  LoadAnimationGroup("JV_Asylum")
  LoadAnimationGroup("J_Damon")
  LoadAnimationGroup("J_Grappler")
  LoadAnimationGroup("J_Melee")
  LoadAnimationGroup("J_Ranged")
  LoadAnimationGroup("J_Striker")
  LoadAnimationGroup("LE_Officer")
  LoadAnimationGroup("LE_Orderly")
  LoadAnimationGroup("N2B Dishonerable")
  LoadAnimationGroup("Nemesis")
  LoadAnimationGroup("nerdBar1")
  LoadAnimationGroup("NIS_0_00A")]]
  LoadAnimationGroup("NIS_1_02")
  LoadAnimationGroup("NIS_1_02B")
  --[[LoadAnimationGroup("NIS_1_03")
  LoadAnimationGroup("NIS_1_04")
  LoadAnimationGroup("NIS_1_05")
  LoadAnimationGroup("NIS_1_07")]]
  LoadAnimationGroup("NIS_1_08_1")
  --[[LoadAnimationGroup("NIS_1_09")
  LoadAnimationGroup("NIS_1_11")
  LoadAnimationGroup("NIS_2_01")
  LoadAnimationGroup("NIS_2_03")
  LoadAnimationGroup("NIS_2_04")
  LoadAnimationGroup("NIS_2_06_1")
  LoadAnimationGroup("NIS_2_B")
  LoadAnimationGroup("NIS_2_S04")
  LoadAnimationGroup("NIS_3_01")
  LoadAnimationGroup("NIS_3_02")]]
  LoadAnimationGroup("NIS_3_04")
  LoadAnimationGroup("NIS_3_05")
  --[[LoadAnimationGroup("NIS_3_06")
  LoadAnimationGroup("NIS_3_08")
  LoadAnimationGroup("NIS_3_11")
  LoadAnimationGroup("NIS_3_B")
  LoadAnimationGroup("NIS_3_G3")
  LoadAnimationGroup("NIS_3_R09_D")
  LoadAnimationGroup("NIS_3_R09_G")
  LoadAnimationGroup("NIS_3_R09_J")
  LoadAnimationGroup("NIS_3_R09_N")
  LoadAnimationGroup("NIS_3_R09_P")
  LoadAnimationGroup("NIS_3_S03")
  LoadAnimationGroup("NIS_3_S03_B")
  LoadAnimationGroup("NIS_3_S11")
  LoadAnimationGroup("NIS_4_01")
  LoadAnimationGroup("NIS_4_05")
  LoadAnimationGroup("NIS_4_06")]]
  LoadAnimationGroup("NIS_4_B2")
  --[[LoadAnimationGroup("NIS_5_01")
  LoadAnimationGroup("NIS_5_02")
  LoadAnimationGroup("NIS_5_03")
  LoadAnimationGroup("NIS_5_04")
  LoadAnimationGroup("NIS_5_05")
  LoadAnimationGroup("NIS_5_07")
  LoadAnimationGroup("NIS_5_G5")
  LoadAnimationGroup("NIS_6_02")
  LoadAnimationGroup("NIS_6_03")
  LoadAnimationGroup("NLock01A")
  LoadAnimationGroup("NPC_Adult")
  LoadAnimationGroup("NPC_AggroTaunt")
  LoadAnimationGroup("NPC_Chat_1")
  LoadAnimationGroup("NPC_Chat_2")
  LoadAnimationGroup("NPC_Chat_F")
  LoadAnimationGroup("NPC_Cheering")
  LoadAnimationGroup("NPC_Love")
  LoadAnimationGroup("NPC_Mascot")
  LoadAnimationGroup("NPC_NeedsResolving")
  LoadAnimationGroup("NPC_Principal")
  LoadAnimationGroup("NPC_Shopping")
  LoadAnimationGroup("NPC_Spectator")
  LoadAnimationGroup("N_Ranged")
  LoadAnimationGroup("N_Striker")
  LoadAnimationGroup("N_Striker_A")
  LoadAnimationGroup("N_Striker_B")
  LoadAnimationGroup("Px_Ladr")
  LoadAnimationGroup("P_Grappler")
  LoadAnimationGroup("P_Striker")
  LoadAnimationGroup("Russell")
  LoadAnimationGroup("Russell_PBomb")
  LoadAnimationGroup("SBULL_A")
  LoadAnimationGroup("SBULL_F")
  LoadAnimationGroup("SBULL_S")
  LoadAnimationGroup("SBULL_U")
  LoadAnimationGroup("SBULL_X")
  LoadAnimationGroup("SCBell")
  LoadAnimationGroup("SFAT_A")
  LoadAnimationGroup("SFAT_F")
  LoadAnimationGroup("SFAT_I")
  LoadAnimationGroup("SFAT_S")
  LoadAnimationGroup("SGEN_A")
  LoadAnimationGroup("SGEN_F")
  LoadAnimationGroup("SGEN_I")
  LoadAnimationGroup("SGEN_S")
  LoadAnimationGroup("SNERD_A")
  LoadAnimationGroup("SNERD_F")
  LoadAnimationGroup("SNERD_I")
  LoadAnimationGroup("SNERD_S")
  LoadAnimationGroup("SPLAY_A")
  LoadAnimationGroup("SPLAY_B")
  LoadAnimationGroup("Straf_Dout")
  LoadAnimationGroup("Straf_Fat")
  LoadAnimationGroup("Straf_Male")
  LoadAnimationGroup("Straf_Nerd")
  LoadAnimationGroup("Straf_Prep")
  LoadAnimationGroup("Straf_Savage")
  LoadAnimationGroup("Straf_Wrest")
  LoadAnimationGroup("TSGate")
  LoadAnimationGroup("W_SpudGun")
  LoadAnimationGroup("Cheer_Cool1")
  LoadAnimationGroup("CHEER_COOL2")
  LoadAnimationGroup("Cheer_Cool3")
  LoadAnimationGroup("Cheer_Gen1")
  LoadAnimationGroup("Cheer_Gen2")
  LoadAnimationGroup("CHEER_GEN3")
  LoadAnimationGroup("CHEER_NERD1")
  LoadAnimationGroup("Cheer_Nerd2")
  LoadAnimationGroup("CHEER_NERD3")
  LoadAnimationGroup("CHEER_POSH1")
  LoadAnimationGroup("Cheer_Posh2")
  LoadAnimationGroup("CHEER_POSH3")
	LoadActionTree("Act/Conv/Chap5Trans.act")]]
	LoadActionTree("Act/Conv/PriOff.act")
	--[[LoadActionTree("Act/Conv/C3_1.act")
	LoadActionTree("Act/Conv/Boss_Russell.act")
	LoadActionTree("Act/Conv/1_03.act")
	LoadActionTree("Act/Conv/2_04.act")
	LoadActionTree("Act/Conv/2_B.act")
	LoadActionTree("Act/Conv/2_S04.act")
	LoadActionTree("Act/Conv/3_B.act")
	LoadActionTree("Act/Conv/5_04.act")]]
	
end