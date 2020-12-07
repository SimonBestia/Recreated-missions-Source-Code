-- Movie Tickets

MissionSetup = function()

		LoadAnims()
		ClockSet(9)
		SoundDisableSpeech_ActionTree()
		ToggleHUDComponentVisibility(11, false)
		ToggleHUDComponentVisibility(4, false)
		ToggleHUDComponentVisibility(0, false)
		PauseGameClock()
		DisablePunishmentSystem(true)
		
end

main = function()

	MovieTickets()

end

MovieTickets = function()

	Wait(500)
	
		AreaTransitionXYZ(0, 526.66, -145.67, 5.35)
		DisablePunishmentSystem(true)
		PlayerSetControl(0)
		SetupWaiters()
		CreateThread("PinkyPunishmentPoints")
		CreateThread("ChadPunishmentPoints")
		CreateThread("TrevorPunishmentPoints")
		CreateThread("JimmysTroubleMeter")
		
	Wait(500)
		
		PedSetUniqueModelStatus(100, -1)
		PedSetUniqueModelStatus(81, -1)
		PedSetUniqueModelStatus(69, -1)
		PedSetUniqueModelStatus(114, -1)
		PedSetUniqueModelStatus(144, -1)
		PedSetUniqueModelStatus(32, -1)
		PedSetUniqueModelStatus(73, -1)
		
		PedFaceXYZ(gPlayer, 526.81, -146.82, 5.52)
		CameraSetXYZ(528.31, -148.12, 7.01, 526.28, -144.77, 6.22)
		PedSetActionNode(Pinky, "/Global/3_03/Animations/Talking", "Act/Conv/3_03.act")
		
	Wait(5)
	
		SoundPlayScriptedSpeechEvent(Pinky, "M_2_06", 1, "supersize")
		
	Wait(3800)

		CameraSetXYZ(525.36, -147.56, 7.01, 528.18, -144.86, 6.19)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_06", 2, "supersize")
		PedSetActionNode(gPlayer, "/Global/Ambient/Talking/Talking", "Act/Anim/Ambient.act")
		PedSetActionNode(Pinky, "/Global/3_03/Animations/Talking", "Act/Conv/3_03.act")
		
	Wait(2100)
	
		CameraReturnToPlayer()
		PlayerSetControl(1)
		TextPrintString("Clear the line for Pinky without using any violence.", 3, 1)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(520.13, -151.22, 5.23, 1, 0)
		
		PlayerSetPosXYZ(520.13, -151.22, 5.23)
		
	Wait(5)
		
		PedFaceXYZ(gPlayer, 518.38, -151.26, 5.23)
		CameraSetXYZ(520.85, -150.29, 6.72, 517.89, -152.98, 6.66)
		PlayerSetControl(0)
		
	Wait(50)

		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_06", 4, "supersize")
	
	Wait(2500)

		SoundPlayScriptedSpeechEvent(Bethany, "M_2_06", 5, "supersize")
		CameraSetXYZ(519.89, -152.07, 6.82, 516.81, -149.54, 6.63)
		
	Wait(2200)
	
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_06", 6, "supersize")
		CameraSetXYZ(520.85, -150.29, 6.72, 517.89, -152.98, 6.66)
		
	Wait(2200)
	
		PedLockTarget(Bethany, gPlayer, 3)
		PedFaceObject(Bethany, gPlayer, 3, 1)
		PedLockTarget(Bethany, gPlayer, 3)
		SoundPlayScriptedSpeechEvent(Bethany, "M_2_06", 7, "supersize")
		PedSetActionNode(Bethany, "/Global/Ambient/Talking/Talking/Female", "Act/Anim/Ambient.act")
		
	Wait(4200)
	
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_06", 8, "supersize")
		
	Wait(1200)
	
		SoundPlayScriptedSpeechEvent(Bethany, "M_2_06", 9, "supersize")
		
	Wait(3500)

		CameraReturnToPlayer()
		PlayerSetControl(1)
		
		TextPrintString("Find Larry, make sure he's going to be late.", 3, 1)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(546.16, 130.03, 12.10, 4, 0)
		
		Breckindale = PedCreateXYZ(100, 534.76, 157.53, 14.12)
		CameraFade(500, 0)
		
	Wait(500)

		PedSetInfiniteSprint(Breckindale, true)
		PedMoveToXYZ(Breckindale, 1, 559.76, 62.64, 13.51)
		CreateThread("BreckindaleReact")
		PlayerSetControl(0)

	Wait(1099)

		PlayerSetPosXYZ(551.40, 138.51, 12.56)
		
	Wait(1000)
		
		CameraFade(500, 1)
		CameraSetXYZ(544.10, 133.32, 13.59, 542.45, 136.96, 13.58)

	Wait(2000)

		CameraReturnToPlayer()
		CameraReset()
		PlayerSetControl(1)

	Wait(10000)

		--FailSceneBreckindale()
		SuccessSceneBreckindale()
		
		CameraFade(500, 0)
		
	Wait(499)
		
		PlayerSetPosXYZ(530.41, -143.67, 5.46)
		CameraReturnToPlayer()
		PlayerSetControl(1)
		CameraFade(500, 1)
		
	Wait(1000)
	
		SoundPlayScriptedSpeechEvent(Pinky, "M_2_06", 3, "supersize")
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(519.93, -150.20, 5.23, 1, 0)
		
		PlayerSetPosXYZ(519.79, -150.07, 5.23)
		
	Wait(5)

		AreaClearAllVehicles()
		PlayerSetControl(0)
		PedFaceXYZ(gPlayer, 518.86, -150.41, 5.23)
		CameraSetXYZ(521.06, -149.09, 6.73, 517.56, -151.01, 6.75)
		
	Wait(500)
		
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_06", 21, "supersize")
		
	Wait(1000)
	
		PedLockTarget(Dorsey, gPlayer, 3)
		PedFaceObject(Dorsey, gPlayer, 3, 1)
		PedLockTarget(Dorsey, gPlayer, 3)
		SoundPlayScriptedSpeechEvent(Dorsey, "M_2_06", 22, "supersize")
		PedSetActionNode(Dorsey, "/Global/Ambient/Talking/Talking", "Act/Anim/Ambient.act")

	Wait(8100)
	
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_06", 23, "supersize")
		CameraSetXYZ(518.14, -151.59, 7.06, 521.02, -148.87, 6.56)
		
	Wait(6200)
	
		SoundPlayScriptedSpeechEvent(Dorsey, "M_2_06", 24, "supersize")
		CameraSetXYZ(521.06, -149.09, 6.73, 517.56, -151.01, 6.75)

	Wait(6500)
	
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_06", 25, "supersize")
		CameraSetXYZ(518.14, -151.59, 7.06, 521.02, -148.87, 6.56)

	Wait(3200)

		PlayerSetControl(1)
		CameraReturnToPlayer()
		TextPrintString("Go get some flowers at the cemetery.", 3, 1)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(650.80, 198.73, 16.26, 4, 0)

		CreateThread("StopMusic")
		CameraFade(500, 0)
		PlayerSetControl(0)
		
	Wait(499)
	
		if WeatherGet() ~= 2 then
		WeatherSet(2)
		end

		CameraSetXYZ(611.16, 162.18, 21.45, 614.60, 163.92, 20.41)
		Pedro = PedCreateXYZ(69, 613.62, 164.57, 19.81)
		MissDanvers = PedCreateXYZ(59, 614.42, 164.21, 19.81)
		
	Wait(5)	
	
		Flowers = PickupCreateXYZ(337, 613.37, 163.89, 19.92)

	Wait(5)
	
		CreateThread("PedroPunishmentPoints")
		PedFaceXYZ(Pedro, 613.62, 163.57, 19.81)
		PedFaceXYZ(MissDanvers, 614.42, 163.21, 19.81)
		PedSetPedToTypeAttitude(MissDanvers, 6, 3)
		PedSetPedToTypeAttitude(MissDanvers, 13, 3)

	Wait(50)
		
		PedSetActionNode(Pedro, "/Global/Ambient/Scripted/Crying/Idle/DoCrying", "Act/Anim/Ambient.act")
		CameraFade(500, 1)
		
	Wait(400)
	
		SoundPlayScriptedSpeechEvent(Pedro, "M_2_06", 30, "supersize")
		
	Wait(6000)
	
		SoundPlayScriptedSpeechEvent(Pedro, "M_2_06", 31, "supersize")
		
	Wait(2000)
	
		SoundPlayScriptedSpeechEvent(MissDanvers, "M_2_06", 32, "supersize")
		
	Wait(4500)
	
		SoundPlayScriptedSpeechEvent(Pedro, "M_2_06", 33, "supersize")
		
	Wait(3200)
	
		SoundPlayScriptedSpeechEvent(MissDanvers, "M_2_06", 34, "supersize")
		
	Wait(7500)
	
		SoundPlayScriptedSpeechEvent(Pedro, "M_2_06", 35, "supersize")
		
	Wait(2200)
	
		SoundPlayScriptedSpeechEvent(MissDanvers, "M_2_06", 34, "supersize")
		
	Wait(2500)
		
		PedMoveToXYZ(Pedro, 0, 631.58, 159.62, 19.98)
		
	Wait(250)
		
		PedMoveToXYZ(MissDanvers, 0, 631.97, 160.82, 21.80)

	Wait(1500)

		CameraFade(500, 0)
		
	Wait(1000)
		
MusicCanNowStart = true
		
		CameraFade(500, 1)
		CameraReturnToPlayer()
		PlayerSetControl(1)
		TextPrintString("Get the flowers.", 2, 1)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(639.06, 172.43, 19.52, 2, 0)
		
		CameraFade(500, 0)
		
	Wait(499)
		
		PlayerSetControl(0)
		CameraSetXYZ(634.46, 158.98, 21.50, 631.06, 160.99, 20.91)
		CameraFade(500, 1)
		
	Wait(500)
		
		PedMoveToXYZ(gPlayer, 2, 613.61, 164.01, 20)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(613.61, 164.01, 20, 1, 0)
		
		PedStop(gPlayer)
		
	Wait(5)
		
		PedSetActionNode(gPlayer, "/Global/1_10_anims/Gary/KeyPickup", "Act/Conv/1_10.act")
		PedStop(Pedro)
		PickupDelete(Flowers)
		
	Wait(500)

		PedFaceObject(Pedro, gPlayer, 3, 1)
		PedFaceObject(MissDanvers, gPlayer, 3, 1)
		
		repeat
		Wait(0)
		until PedIsPlaying(gPlayer, "/Global/1_10_anims/Gary/KeyPickup", true)
		
		PedMoveToXYZ(gPlayer, 2, 642.32, 180.12, 18.93)
		PedLockTarget(Pedro, gPlayer, 3)
		PedFaceObject(Pedro, gPlayer, 3, 1)
		PedLockTarget(Pedro, gPlayer, 3)

	Wait(1220)
	
		PedSetActionNode(Pedro, "/Global/1_08/CafeteriaLady/Point/Point", "Act/Conv/1_08.act")
		
	Wait(2)
	
		SoundPlayScriptedSpeechEvent(Pedro, "M_2_06", 37, "supersize")
		CameraSetXYZ(630.29, 159.81, 21.39, 634.18, 160.71, 21.10)

	Wait(3300)
	
		SoundPlayScriptedSpeechEvent(MissDanvers, "M_2_06", 38, "supersize")
		CameraSetXYZ(631.02, 162.21, 21.69, 632.31, 158.45, 21.29)
		PedFaceObject(Pedro, gPlayer, 3, 1)
		PedFaceObject(MissDanvers, gPlayer, 3, 1)
		
	Wait(3100)
	
		PedStop(gPlayer)
		
	Wait(100)
	
		CameraFade(500, 1)
		PlayerSetPosXYZ(647.16, 192.18, 17.39)
		
	Wait(499)
	
		WeatherRelease()
		PlayerSetControl(1)
		CameraReturnToPlayer()
		TextPrintString("Give the flowers to Dorsey.", 3, 1)
		PedDelete(Pedro)
		PedDelete(MissDanvers)

		--FailSceneDorsey()
		SuccessSceneDorsey()
		
	Wait(499)
	
		SetupWaiters2()
		PlayerSetPosXYZ(529.23, -141.46, 5.48)

	Wait(125)
	
		PlayerSetControl(1)
		CameraReturnToPlayer()
		CameraFade(500, 1)
		TextPrintString("Return to Pinky.", 2, 1)

	Wait(2100)

		SoundPlayScriptedSpeechEvent(Pinky, "M_2_06", 42, "supersize")
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(521.40, -149.38, 5.23, 1, 0)

		PlayerSetControl(0)
		PedMoveToXYZ(gPlayer, 0, 520.17, -150.62, 5.23)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_06", 43, "supersize")
		
	Wait(1200)
	
		PedLockTarget(Chad, gPlayer, 3)
		PedFaceObject(Chad, gPlayer, 3, 1)
		PedLockTarget(Chad, gPlayer, 3)
		
	Wait(3000)
	
		SoundPlayScriptedSpeechEvent(Chad, "M_2_06", 44, "supersize")
		
	Wait(3200)
	
		CameraFade(500, 0)
		
	Wait(499)
	
		PedDelete(Chad)
		PlayerSetControl(1)
		PlayerSetPosXYZ(526.93, -144.63, 5.23)
		
		CameraFade(500, 1)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(521.51, -148.45, 5.23, 1, 0)
		
		PlayerSetControl(0)
		PedMoveToXYZ(gPlayer, 0, 519.77, -149.76, 5.23)
		
	Wait(1900)
		
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_06", 54, "supersize")
		PedSetActionNode(gPlayer, "/Global/Chapter3Trans/JimmyBye", "Act/Conv/Chapt3Trans.act")
		CameraSetXYZ(521.56, -150.67, 7.10, 517.85, -149.49, 6.19)

	Wait(1000)
	
		PedLockTarget(Martin, gPlayer, 3)
		PedFaceObject(Martin, gPlayer, 3, 1)
		PedLockTarget(Martin, gPlayer, 3)
		SoundPlayScriptedSpeechEvent(Martin, "M_2_06", 55, "supersize")
		PedSetActionNode(Martin, "/Global/Ambient/Talking/Talking", "Act/Anim/Ambient.act")
		CameraSetXYZ(517.56, -148.85, 7.45, 520.67, -150.84, 5.94)
		
	Wait(6200)
	
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_06", 56, "supersize")
		CameraSetXYZ(521.56, -150.67, 7.10, 517.85, -149.49, 6.19)

	Wait(4200)
	
		SoundPlayScriptedSpeechEvent(Martin, "M_2_06", 57, "supersize")
		CameraSetXYZ(517.56, -148.85, 7.45, 520.67, -150.84, 5.94)
		AreaClearAllVehicles()

	Wait(2900)
	
		PlayerSetControl(1)
		CameraReturnToPlayer()
		TextPrintString("Go smash Rocket In My Pocket's windows!", 3, 1)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(509.58, -89.27, 4.11, 4, 0)
		
		TextPrintString("Make sure nobody sees you.", 3, 1)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(500.23, -97.42, 4.64, 3, 0)
		
		CameraSetXYZ(501.74, -93.66, 8.44, 500.25, -97.08, 7.01)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(500.38, -108.48, 5.07, 3, 0)
		
		CameraSetXYZ(501.28, -118.51, 8.75, 499.05, -115.22, 8.28)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(486.66, -109.19, 12.55, 1, 0)
		
		PlayerSetControl(0)
		CameraSetXYZ(484.88, -101.79, 15.02, 487.52, -99.42, 13.20)
		PedMoveToXYZ(gPlayer, 1, 487.86, -99.10, 12.50)
		
	Wait(2500)
	
		TextPrintString("Break all of the store's windows.", 3, 1)
		
	Wait(1000)
	
		PlayerSetControl(1)
		CameraReturnToPlayer()
		PlayerSetWeapon(284, 1)
	
		Nate = PedCreateXYZ(103, 499.20, -75.82, 5.59)
		
	Wait(2000)
	
		PedMoveToXYZ(Nate, 2, 498.83, -81.18, 4.75)
		
	Wait(1500)
	
		PedSetActionNode(Nate, "/Global/Welcome/ShakeFist", "Act/Conv/Store.act")
		SoundPlayScriptedSpeechEvent(Nate, "M_2_06", 60, "supersize")
		
	Wait(3000)
	
		PedSetActionNode(Nate, "/Global/Welcome/ShakeFist", "Act/Conv/Store.act")
		SoundPlayScriptedSpeechEvent(Nate, "M_2_06", 60, "supersize")
		
	Wait(3000)
	
		PedSetActionNode(Nate, "/Global/Welcome/ShakeFist", "Act/Conv/Store.act")
		SoundPlayScriptedSpeechEvent(Nate, "M_2_06", 60, "supersize")
		
	Wait(1000)
	
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(486.69, -109.64, 12.50, 1, 0)
		
		--FailSceneNate()
		SuccessSceneNate()

	Wait(505)
	
		PedFaceXYZ(Pinky, 526.37, -145.34, 5.37)
		PlayerSetPosXYZ(526.60, -106.76, 4.69)
		PlayerSetControl(1)
		CameraReturnToPlayer()
		PedDelete(Trevor)

	Wait(50)
		
		CameraFade(500, 1)
		
	Wait(250)

		TextPrintString("Return to Pinky.", 3, 1)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(526.37, -145.34, 5.37, 2, 0)

		CameraFade(500, 0)
		PlayerSetControl(0)
		
	Wait(501)

		PedLockTarget(gPlayer, Pinky)
		PlayerSetPosXYZ(526.64, -145.73, 5.38)
		PedSetStationary(Pinky, false)
		
	Wait(1000)
		
		CameraFade(500, 1)
		CameraSetXYZ(527.53, -144.89, 6.71, 525.69, -148.43, 6.92)
		PedSetActionNode(Pinky, "/Global/2_06/NISPINKY/Pinky/Pinky01", "Act/Conv/2_06.act")
		SoundPlayScriptedSpeechEvent(Pinky, "M_2_06", 66, "supersize")
		
	Wait(5300)
		
		CameraSetXYZ(527.80, -147.50, 6.91, 525.64, -144.20, 6.25)
		PedSetActionNode(gPlayer, "/Global/2_06/NISPINKY/Jimmy/Jimmy01", "Act/Conv/2_06.act")
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_06", 67, "supersize")
		
	Wait(2400)
		
		CameraSetXYZ(527.53, -144.89, 6.71, 525.69, -148.43, 6.92)
		PedSetActionNode(Pinky, "/Global/2_06/NISPINKY/Pinky/Pinky02", "Act/Conv/2_06.act")
		SoundPlayScriptedSpeechEvent(Pinky, "M_2_06", 68, "supersize")
		
	Wait(2800)
		
		PedSetActionNode(Pinky, "/Global/2_06/NISPINKY/Pinky/Pinky03", "Act/Conv/2_06.act")
		SoundPlayScriptedSpeechEvent(Pinky, "M_2_06", 69, "supersize")
		
	Wait(4200)
		
		PedSetActionNode(Pinky, "/Global/2_06/NISPINKY/Pinky/Pinky04", "Act/Conv/2_06.act")
		SoundPlayScriptedSpeechEvent(Pinky, "M_2_06", 70, "supersize")
		
	Wait(7800)

		CameraSetXYZ(527.80, -147.50, 6.91, 525.64, -144.20, 6.25)
		PedSetActionNode(gPlayer, "/Global/2_06/NISPINKY/Jimmy/Jimmy02", "Act/Conv/2_06.act")
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_06", 71, "supersize")
		
	Wait(3300)

		CameraReset()
		CameraFollowPed(gPlayer)
		PedMoveToXYZ(Pinky, 1, 519.62, -147.22, 5.23)
		CameraFade(500, 0)
		Wait(501)
		CameraSetXYZ(525.11, -146.40, 6.64, 528.80, -144.89, 6.97)
		Wait(500)
		CameraFade(500, 1)
		Wait(501)
		MinigameSetCompletion("M_PASS", true, 1500)
		SoundPlayMissionEndMusic(true, 7)
		MinigameAddCompletionMsg("MRESPECT_PM5", 1)
		SetFactionRespect(5, GetFactionRespect(5) - 5)
		repeat
		Wait(0)
		until not MinigameIsShowingCompletion()
		CameraFade(500, 0)


end

SetupWaiters = function()
		
		Trevor = PedCreateXYZ(73, 519.48, -152.60, 5.23)
		Pinky = PedCreateXYZ(38, 526.81, -146.82, 5.52)
		Bethany = PedCreateXYZ(81, 519.14, -151.31, 5.23)
		Dorsey = PedCreateXYZ(114, 518.86, -150.41, 5.23)
		Chad = PedCreateXYZ(32, 518.51, -149.00, 5.23)
		PedSetPedToTypeAttitude(Chad, 13, 2)
		Martin = PedCreateXYZ(144, 518.27, -148.23, 5.23)
	
	Wait(5)
	
		PedFaceXYZ(Trevor, 519.86, -154.31, 5.23)
		PedFaceXYZ(Bethany, 519.43, -152.79, 5.23)
		PedFaceXYZ(Dorsey, 519.43, -152.79, 5.23)
		PedFaceXYZ(Chad, 519.43, -152.79, 5.23)
		PedFaceXYZ(Martin, 519.43, -152.79, 5.23)
		PedSetStationary(Pinky, true)
		PedSetStationary(Chad, true)
		PedSetStationary(Trevor, true)

end

SetupWaiters2 = function()

	PedSetPosXYZ(Chad, 519.14, -151.31, 5.23)
	PedSetPosXYZ(Martin, 518.86, -150.41, 5.23)

end

BreckindaleReact = function()

		Breckindale = nil
		repeat
		Breckindale = PedGetTargetPed(gPlayer)
		if PedIsValid(Breckindale) and PedGetName(Breckindale) == "N_MrBreckindale" then
		PedStop(Breckindale)
		PedSetPedToTypeAttitude(Breckindale, 13, 0)
		PedAttack(Breckindale, gPlayer, 2)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_06", 11, "supersize")
		PedSetActionNode(gPlayer, "/Global/Ambient/SocialAnims/SocialBringItOn", "Act/Anim/Ambient.act")
		
	Wait(3300)
	
		SoundPlayScriptedSpeechEvent(Breckindale, "M_2_06", 12, "supersize")

		end
		Wait(0)
		until PedIsValid(Breckindale)

end

FailSceneBreckindale = function()
	
		CameraFade(500, 0)
		
	Wait(500)
	
		PlayerSetControl(0)
		PlayerSetPosXYZ(508.09, -132.25, 5.43)
		CameraSetXYZ(514.11, -147.98, 8.99, 516.33, -150.75, 7.18)
		PedStop(Breckindale)
		PedSetPosXYZ(Breckindale, 511.71, -149.60, 5.34)
		
	Wait(2500)
		
		CameraFade(500, 1)
		
	Wait(5)
	
		PedMoveToXYZ(Breckindale, 1, 517.53, -151.40, 5.34)
		
	Wait(1400)
	
		PedLockTarget(Bethany, Breckindale, 3)
		PedFaceObject(Bethany, Breckindale, 3, 1)
		PedLockTarget(Bethany, Breckindale, 3)
		
	Wait(500)
	
		SoundPlayScriptedSpeechEvent(Bethany, "M_2_06", 19, "supersize")
		
	Wait(3800)
	
		SoundPlayScriptedSpeechEvent(Breckindale, "M_2_06", 20, "supersize")
		
	Wait(2200)

end

SuccessSceneBreckindale = function()

		CameraFade(500, 0)
		
	Wait(499)
		
		PlayerSetControl(0)
		PlayerSetPosXYZ(568.32, 27.40, 10.87)
		
		if PlayerIsInAnyVehicle() then
		PlayerDetachFromVehicle()
		end

	Wait(1000)
		
		PedSetPosXYZ(Breckindale, 567.09, 33.28, 11.93)
		CameraSetXYZ(572.14, 21.86, 11.52, 569.45, 24.80, 11.84)
		PedMoveToXYZ(gPlayer, 3, 563.48, 17.63, 8.91)
		PedMoveToXYZ(Breckindale, 2, 565.11, 18.23, 9.30)
		CameraFade(500, 1)

	Wait(2000)
	
		CameraFade(500, 0)
		
	Wait(499)
	
		AreaClearAllVehicles()
		PlayerClearLastVehicle()
		PedStop(gPlayer)
		PedStop(Breckindale)
		PlayerSetPosXYZ(551.95, -126.39, 5.60)
		
		if PlayerIsInAnyVehicle() then
		PlayerDetachFromVehicle()
		end

	Wait(1500)
		
		PedSetPosXYZ(Breckindale, 553.95, -126.39, 5.60)
		CameraSetXYZ(534.70, -134.66, 7.32, 537.89, -132.26, 7.32)
		PedMoveToXYZ(gPlayer, 3, 527.88, -130.27, 5.69)
		PedMoveToXYZ(Breckindale, 2, 527.88, -130.27, 5.69)
		CameraFade(500, 1)
		
		
	Wait(2500)
		
		CameraFade(500, 0)
		
	Wait(400)
		
		PedSetPedToTypeAttitude(Breckindale, 13, 2)
		PedStop(Breckindale)
		PedStop(gPlayer)
		
	Wait(1000)
		
		PlayerSetPosXYZ(533.17, -150.79, 5.53)
		PedSetPosXYZ(Bethany, 522.05, -144.80, 5.29)
		
	Wait(1500)

		CameraSetXYZ(523.19, -145.82, 6.77, 520.05, -143.38, 7.19)
		CameraFade(500, 1)
		
	Wait(1000)

		--PedSetActionNode(Bethany, "/Global/2_06/NISLOLA/Lola/Lola01", "Act/Conv/2_06.act")
		SoundPlayScriptedSpeechEvent(Bethany, "M_2_06", 15, "supersize")
	
	Wait(5300)
	
		PedMoveToXYZ(Bethany, 0, 532.00, -143.62, 5.57)
		CameraSetXYZ(528.41, -147.88, 6.91, 526.25, -144.57, 6.32)
		SoundPlayScriptedSpeechEvent(Pinky, "M_2_06", 16, "supersize")
		
		repeat
		Wait(0)
		until not PedIsOnScreen(Bethany)
		
		PedDelete(Bethany)
		CameraFade(500, 0)

	Wait(2000)

		PedSetPosXYZ(Breckindale, 533.50, -143.18, 5.68)
		CameraSetXYZ(523.88, -142.89, 7.11, 527.47, -144.60, 6.66)
		
	Wait(50)
	
		CameraFade(500, 1)
		
	Wait(200)
		
		PedMoveToXYZ(Breckindale, 2, 527.13, -143.88, 5.68)
		
		repeat
		Wait(0)
		until PedIsInAreaXYZ(Breckindale, 527.13, -143.88, 5.68, 1, 0)
		
		PedStop()
		PedSetActionNode(Breckindale, "/Global/Ambient/MissionSpec/FireMan/LookAround", "Act/Conv/Ambient.act")
		SoundPlayScriptedSpeechEvent(Breckindale, "M_2_06", 17, "supersize")
		
	Wait(4800)
	
		CameraSetXYZ(525.89, -145.45, 6.88, 528.44, -148.47, 6.30)
		
	Wait(100)
	
		SoundPlayScriptedSpeechEvent(Pinky, "M_2_06", 18, "supersize")
		PedDelete(Breckindale)
		
	Wait(2200)
		
end

FailSceneDorsey = function()

		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(521.45, -148.63, 5.23, 1, 0)

	Wait(5)
		
		PlayerSetControl(0)
		CameraSetXYZ(520.76, -149.45, 6.88, 517.21, -151.29, 6.66)
		PedSetActionNode(Dorsey, "/Global/Ambient/SocialAnims/SocialAcceptApology", "Act/Conv/Ambient.act")
		SoundPlayScriptedSpeechEvent(Dorsey, "M_2_06", 39, "supersize")
		
	Wait(2400)
	
		CameraFade(500, 0)
	
end

SuccessSceneDorsey = function()

		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(519.93, -150.20, 5.23, 1, 0)
		
	Wait(5)
		
		PlayerSetControl(0)
		repeat
		PedLockTarget(gPlayer, Dorsey, 3)
		PedSetActionNode(gPlayer, "/Global/3_01/Anims/FlowerGive/FlowerGive", "Act/Conv/3_01.act")
		
	Wait(500)
		
		until PedIsPlaying(Dorsey, "/Global/3_01/Anims/FlowerGive/FlowerGive", true)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_06", 40, "supersize")
		CameraSetXYZ(522.18, -150.97, 6.93, 518.34, -149.93, 6.59)
		
	Wait(2000)
		
		repeat
		Wait(0)
		until not PedIsPlaying(gPlayer, "/Global/3_01/Anims/FlowerGive/FlowerGive", true)
		
		SoundPlayScriptedSpeechEvent(Dorsey, "M_2_06", 41, "supersize")
		PedStop(gPlayer)
		PedStop(Dorsey)
		
	Wait(5800)
	
		PedMoveToXYZ(Dorsey, 1, 530.88, -144.25, 5.23)
		
		repeat
		Wait(0)
		until not PedIsOnScreen(Dorsey)
		
		PedDelete(Dorsey)
		CameraFade(500, 0)

end

FailSceneNate = function()

		CameraFade(500, 0)
		PlayerSetControl(0)
		AreaClearAllVehicles()
		PedSetPosXYZ(Nate, 494.67, -84.41, 4.83)
	
	Wait(501)
	
		CameraSetXYZ(497.21, -83.22, 6.10, 494.58, -86.18, 6.65)
		PlayerSetPosXYZ(487.80, -99.39, 12.50)
		PedFaceXYZ(Nate, 487.80, -99.39, 12.50)
		
	Wait(50)
		
		CameraFade(500, 1)
		
	Wait(450)
	
		PedMoveToXYZ(gPlayer, 2, 486.69, -109.64, 12.50)

	Wait(499)
	
		PedSetActionNode(Nate, "/Global/Welcome/ShakeFist", "Act/Conv/Store.act")
		SoundPlayScriptedSpeechEvent(Nate, "M_2_06", 58, "supersize")
		
		repeat
		Wait(0)
		until PedIsPlaying(Nate, "/Global/Welcome/ShakeFist", true)
		
	Wait(1500)

		PedSetActionNode(Nate, "/Global/Welcome/ShakeFist", "Act/Conv/Store.act")
		SoundPlayScriptedSpeechEvent(Nate, "M_2_06", 59, "supersize")
		
	Wait(3200)
	
		CameraFade(500, 0)
	
end

SuccessSceneNate = function()

		PedSetUniqueModelStatus(149, -1)
		CameraFade(500, 0)
		PlayerSetControl(0)

	Wait(499)

		PlayerSetPosXYZ(503.07, -130.27, 5.30)
		CameraSetXYZ(514.44, -144.42, 8.09, 516.40, -147.72, 6.99)
		PedFaceXYZ(Martin, 519.48, -152.60, 5.23)
		Huntingdon = PedCreateXYZ(149, 508.83, -147.33, 5.24)
		
		CameraFade(500, 1)
		
		PedMoveToXYZ(Huntingdon, 1, 514.54, -148.54, 5.24)
		
	Wait(2000)
	
		PedLockTarget(Martin, Huntingdon, 3)
		PedFaceObject(Martin, Huntingdon, 3, 1)
		PedLockTarget(Martin, Huntingdon, 3)
		PedSetActionNode(Huntingdon, "/Global/1_08/CafeteriaLady/Point/Point", "Act/Conv/1_08.act")
		SoundPlayScriptedSpeechEvent(Huntingdon, "M_2_06", 61, "supersize")
		
	Wait(4500)
	
		CameraSetXYZ(517.65, -149.08, 6.88, 520.21, -152.14, 6.68)
		
	Wait(100)

		SoundPlayScriptedSpeechEvent(Martin, "M_2_06", 62, "supersize")

	Wait(3100)
	
		CameraSetXYZ(517.79, -147.93, 7.25, 514.19, -149.13, 6.00)
		SoundPlayScriptedSpeechEvent(Huntingdon, "M_2_06", 63, "supersize")
		PedSetActionNode(Huntingdon, "/Global/Ambient/Talking/Talking", "Act/Anim/Ambient.act")
		PedMoveToXYZ(Martin, 0, 515.72, -149.06, 5.24)
		
	Wait(6000)
	
		CameraSetXYZ(527.77, -146.20, 7.08, 524.00, -147.35, 6.43)
		PedFaceXYZ(Pinky, 515.72, -149.06, 5.24)
		
	Wait(100)
	
		SoundPlayScriptedSpeechEvent(Pinky, "M_2_06", 64, "supersize")
		PedMoveToXYZ(Martin, 1, 525.98, -131.39, 5.47)
		PedMoveToXYZ(Huntingdon, 1, 525.98, -131.39, 5.47)
		
		repeat
		Wait(0)
		until not PedIsOnScreen(Martin) and not PedIsOnScreen(Huntingdon)
		
		PedDelete(Martin)
		PedDelete(Huntingdon)
		PedDelete(Nate)
		CameraFade(500, 0)
		PlayerUnequip()

end

StopMusic = function()

	
		repeat
		if WeatherGet() == 2 or AreaGetVisible() == 0 then
			SoundStopStream() --When SoundStopStream is used, the game stops the music and then starts the walking theme shortly after, but if we constantly stop the music, the game won't play anything
			SoundStopInteractiveStream()
		end
		Wait(0)
		until MusicCanNowStart

end

PedroPunishmentPoints = function()

	repeat
	if PedIsValid(Pedro) then
	PedSetPunishmentPoints(Pedro, 0)
	end
	Wait(0)
	until not PedIsValid(Pedro)

end

PinkyPunishmentPoints = function()

	repeat
	if PedIsValid(Pinky) then
	PedSetPunishmentPoints(Pinky, 0)
	end
	Wait(0)
	until not PedIsValid(Pinky)

end

TrevorPunishmentPoints = function()

	repeat
	if PedIsValid(Trevor) then
	PedSetPunishmentPoints(Trevor, 0)
	end
	Wait(0)
	until not PedIsValid(Trevor)

end

ChadPunishmentPoints = function()

	repeat
	if PedIsValid(Chad) then
	PedSetPunishmentPoints(Chad, 0)
	end
	Wait(0)
	until not PedIsValid(Chad)

end

JimmysTroubleMeter = function()

	repeat
	if PedIsValid(gPlayer) then
	DisablePunishmentSystem(true)
	end
	Wait(0)
	until not Alive
	
end

LoadAnims = function()

  --[[LoadAnimationGroup("1_02BYourSchool")
  LoadAnimationGroup("1_02_MeetWithGary")
  LoadAnimationGroup("1_03The Setup")
  LoadAnimationGroup("1_04TheSlingshot")
  LoadAnimationGroup("1_06ALittleHelp")
  LoadAnimationGroup("1_07_SaveBucky")
  LoadAnimationGroup("1_07_Sk8Board")]]
  LoadAnimationGroup("1_08ThatBitch")
  LoadAnimationGroup("1_08_MandPuke")
  --[[LoadAnimationGroup("1_09_Candidate")
  LoadAnimationGroup("1_10Betrayal")
  LoadAnimationGroup("1_11B_HeBigPrank")
  LoadAnimationGroup("1_G1_TheDiary")
  LoadAnimationGroup("1_S01HatVsGall")
  LoadAnimationGroup("2_01LastMinuteShop")
  LoadAnimationGroup("2_02ComicKlepto")
  LoadAnimationGroup("2_05TadsHouse")]]
  LoadAnimationGroup("2_06MovieTickets")
  --[[LoadAnimationGroup("2_07BeachRumble")
  LoadAnimationGroup("2_08WeedKiller")
  LoadAnimationGroup("2_4RichAreaRace")
  LoadAnimationGroup("2_G2CarnivalDate")
  LoadAnimationGroup("2_G2_GiftExchange")
  LoadAnimationGroup("2_R03PaperRoute")
  LoadAnimationGroup("2_S02CharSheets")
  LoadAnimationGroup("2_S04CharSheets")
  LoadAnimationGroup("2_S05_CooksCrush")
  LoadAnimationGroup("2_S06PantyRaid")
  LoadAnimationGroup("3_01JealousJohnny")
  LoadAnimationGroup("3_04WrongPtTown")
  LoadAnimationGroup("3_05TheTenements")
  LoadAnimationGroup("3_BFightJohnnyV")
  LoadAnimationGroup("3_G3")
  LoadAnimationGroup("3_R05ChemicalDeliv")
  LoadAnimationGroup("3_R08RaceLeague")
  LoadAnimationGroup("3_S03CheatinTime")
  LoadAnimationGroup("4_01Paparazzi")
  LoadAnimationGroup("4_04_FunhouseFun")
  LoadAnimationGroup("4_06BigGame")
  LoadAnimationGroup("4_B2_JockBossBattle")
  LoadAnimationGroup("5_01Grp")
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
  LoadAnimationGroup("NIS_0_00A")
  LoadAnimationGroup("NIS_1_02")
  LoadAnimationGroup("NIS_1_02B")
  LoadAnimationGroup("NIS_1_03")
  LoadAnimationGroup("NIS_1_04")
  LoadAnimationGroup("NIS_1_05")
  LoadAnimationGroup("NIS_1_07")]]
  LoadAnimationGroup("NIS_1_08_1")
  --[[LoadAnimationGroup("NIS_1_09")
  LoadAnimationGroup("NIS_1_11")
  LoadAnimationGroup("NIS_2_01")
  LoadAnimationGroup("NIS_2_03")
  LoadAnimationGroup("NIS_2_04")]]
  LoadAnimationGroup("NIS_2_06_1")
  --[[LoadAnimationGroup("NIS_2_B")
  LoadAnimationGroup("NIS_2_S04")
  LoadAnimationGroup("NIS_3_01")
  LoadAnimationGroup("NIS_3_02")
  LoadAnimationGroup("NIS_3_04")
  LoadAnimationGroup("NIS_3_05")
  LoadAnimationGroup("NIS_3_06")
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
  LoadAnimationGroup("NIS_4_06")
  LoadAnimationGroup("NIS_4_B2")
  LoadAnimationGroup("NIS_5_01")
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
  LoadAnimationGroup("CHEER_POSH3")]]
  LoadAnimationGroup("NPC_Adult")
  LoadActionTree("Act/Conv/DTGeneral.act")
	--LoadActionTree("Act/Conv/Chap5Trans.act")
	LoadActionTree("Act/Conv/PriOff.act")
	LoadActionTree("Act/Conv/Store.act")
	--[[LoadActionTree("Act/Conv/C3_1.act")
	LoadActionTree("Act/Conv/Boss_Russell.act")
	LoadActionTree("Act/Conv/1_03.act")
	LoadActionTree("Act/Conv/2_04.act")
	LoadActionTree("Act/Conv/2_B.act")
	LoadActionTree("Act/Conv/2_S04.act")
	LoadActionTree("Act/Conv/3_B.act")
	LoadActionTree("Act/Conv/5_04.act")]]
	
end