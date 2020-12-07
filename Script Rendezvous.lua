-- Rendezvous

MissionSetup = function()

		DATLoad("3_03.DAT", 2)
		LoadAnims()
		ClockSet(18, 30)
		ToggleHUDComponentVisibility(11, false)
		ToggleHUDComponentVisibility(4, false)
		ToggleHUDComponentVisibility(0, false)
		SoundDisableSpeech_ActionTree()

end

main = function()

		Rendezvous()

end

Rendezvous = function()

	Wait(500)

		PlayCutsceneWithLoad("3-03", true)
		AreaTransitionXYZ(0, 503.81, -436.80, 4.09)
		PedSetUniqueModelStatus(25, -1)
		PedSetUniqueModelStatus(31, -1)
		PlayerSetControl(0)
	
	Wait(100)

		CameraSetXYZ(497.63, -428.60, 7.02, 499.73, -430.50, 6.06)
		Lola = PedCreateXYZ(25, 506.011993, -432.837006, 5.022610)
		
	Wait(2)
		
		PedFaceXYZ(Lola, 502.62, -431.33, 4.08)
		PedFaceXYZ(gPlayer, 504.09, -434.50, 4.08)
		LolaVehicle = VehicleCreateXYZ(255, 505.139008, -432.299988, 4.362010)
		JimmyBike = VehicleCreateXYZ(255, 502.96, -434.75, 4.09)

	Wait(2)
	
		VehicleFaceHeading(LolaVehicle, 90)
		VehicleFaceHeading(JimmyBike, 10)
		VehicleMakeAmbient(LolaVehicle)
		PedMakeTargetable(Lola, false)
		PedSetFlag(Lola, 20, true)
		
	Wait(500)

		PedEnterVehicle(Lola, LolaVehicle)

		repeat
		Wait(0)
		until PedIsInVehicle(Lola, LolaVehicle)
		
	Wait(500)

		--PedFollowPath(Lola, PATH._INTROLOLARIDEOFF, 0, 1)
		PedMoveToXYZ(Lola, 1, 496.118988, -396.536987, 2.381840)
		
		repeat
		Wait(0)
		until PedIsOnScreen(Lola)
		
	Wait(2000)
	
		CameraReturnToPlayer()
		PlayerSetControl(1)
		PedDelete(Lola)
		VehicleDelete(LolaVehicle)
		TextPrintString("Meet with Lola in the alley.", 3, 1)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(529.20, -112.77, 5.20, 5, 0)

		PlayerSetControl(0)
		PedStop(gPlayer)
		CameraFade(500, 0)
		
	Wait(501)

		AreaOverridePopulation(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		AreaClearAllVehicles()
		AreaClearSpawners()
		AreaClearAllPeds()
		PedSetTypeToTypeAttitude(3, 4, 2)
		PedSetTypeToTypeAttitude(3, 5, 2)
		PedSetTypeToTypeAttitude(3, 13, 4)

		if PlayerIsInAnyVehicle() then
		PlayerDetachFromVehicle()
		end
		
		Lola = PedCreateXYZ(25, 546.005981, -118.325996, 5.934280)
        PedSetFlag(Lola, 23, true)
        PedSetInvulnerable(Lola, true)
		LolaVehicle = VehicleCreateXYZ(255, 553.216003, -121.535004, 5.811990)
		VehicleDelete(JimmyBike)
		PlayerSetControl(0)
		PlayerSetPosXYZ(538.12, -114.43, 5.45)
		
	Wait(999)

		CameraFade(500, 1)
		PedMoveToXYZ(gPlayer, 1, 543.78, -116.89, 5.45)
		CameraSetXYZ(548.14, -116.70, 6.37, 544.34, -117.95, 6.58)
		
	Wait(2000)
	
		PedLockTarget(Lola, gPlayer, 3)
		PedFaceObject(Lola, gPlayer, 3, 1)
		PedLockTarget(Lola, gPlayer, 3)
		SoundPlayScriptedSpeechEvent(Lola, "M_3_03", 1, "supersize")
		
	Wait(1500)
	
		CameraSetXYZ(544.40, -120.51, 6.00, 545.01, -116.63, 6.77)
		
	Wait(4500)
	
		PlayerSetControl(1)
		CameraReturnToPlayer()
		TextPrintString("Get on the balcony.", 3, 1)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(544.986023, -105.348000, 9.866200, 1, 0)
	
		PlayerSetControl(0)
		CameraFade(499, 0)
		
	Wait(501)
		
		CameraSetXYZ(543.63, -116.63, 7.23, 547.36, -117.76, 6.34)
		Tad = PedCreateXYZ(31, 569.132996, -108.128998, 6.216200)
		PedSetInvulnerableToPlayer(Tad, true)
		PedSetHealth(Tad, 350)
		
	Wait(100)

		PedSetTypeToTypeAttitude(3, 5, 2)
		CameraFade(500, 1)
		PedMoveToXYZ(Tad, 2, 548.54, -118.55, 5.51)
		PedFaceObject(Lola, Tad, 2, 1)
		
	Wait(1500)

		SoundPlayScriptedSpeechEvent(Lola, "M_3_03", 2, "supersize")
		PedSetActionNode(Lola, "/Global/3_03/Wave", "Act/Conv/3_03.act")
		
	Wait(3500)
		
		PedSetTetherToTrigger(Tad, TRIGGER._TRIGGERTADTETHER)
		CameraSetXYZ(573.18, -109.80, 7.64, 569.48, -111.28, 7.31)
		Ricky = PedCreateXYZ(28, 572.02, -106.46, 5.69)
		PedMoveToXYZ(Ricky, 1, 564.90, -112.97, 5.56)
		Norton = PedCreateXYZ(29, 572.08, -109.52, 5.97)
		PedMoveToXYZ(Norton, 1, 565.36, -114.61, 5.54)
		PedFaceXYZ(gPlayer, 547.973999, -118.098000, 5.547000)
		PedSetUniqueModelStatus(28, -1)
		PedSetUniqueModelStatus(29, -1)

	Wait(2500)
		
		CameraSetXYZ(561.40, -112.84, 6.76, 565.17, -114.19, 6.66)
		
	Wait(250)
	
		SoundPlayScriptedSpeechEvent(Ricky, "M_3_03", 5, "supersize")
		PedSetActionNode(Ricky, "/Global/1_08/CafeteriaLady/Point/Point", "Act/Conv/1_08.act")
		
	Wait(2100)
	
		SoundPlayScriptedSpeechEvent(Norton, "M_3_03", 6, "supersize")
		PedFaceXYZ(Tad, 564.90, -112.97, 5.56)

	Wait(1600)
	
		PedMoveToXYZ(Norton, 1, 566.65, -122.27, 5.70)
		
	Wait(2000)
		
		PedDelete(Norton)
		CameraSetXYZ(543.63, -116.63, 7.23, 547.36, -117.76, 6.34)
		SoundPlayScriptedSpeechEvent(Lola, "M_3_03", 7, "supersize")
		
	Wait(2000)
	
		CameraSetXYZ(548.45, -120.87, 6.55, 546.14, -117.61, 6.45)
		
	Wait(2100)
	
		PedFollowPath(Lola, PATH._ROUTELOLARUN, 0, 1, F_routeLolaRun)
		SoundPlayScriptedSpeechEvent(Tad, "M_3_03", 8, "supersize")
		CameraSetXYZ(549.36, -119.28, 6.93, 545.52, -118.15, 6.74)

	Wait(3800)
	
		PlayerSetWeapon(284, 1)
		CameraFade(500, 0)
		
	Wait(1001)
	
		CameraSetXYZ(541.87, -107.84, 11.83, 544.41, -104.88, 10.93)
		PedFaceXYZ(gPlayer, 543.28, -103.03, 9.73)
		
	Wait(500)

		CameraFade(1000, 1)
		
	Wait(500)
	
		SoundPlayScriptedSpeechEvent(gPlayer, "M_3_03", 9, "supersize")
		
	Wait(1800)
	
		SoundPlayScriptedSpeechEvent(Lola, "M_3_03", 10, "supersize")
		
	Wait(3200)
	
		CameraFade(500, 0)
		
	Wait(501)
		
		PedFaceXYZ(gPlayer, 547.973999, -118.098000, 5.547000)
		
	Wait(5)

		CameraFade(500, 1)
		CameraReturnToPlayer()
		PlayerSetControl(1)
		TextPrintString("Defend Tad.", 2, 1)
		--CreateThread("MonitorTad")
		PedShowHealthBar(Tad, true, "N_TAD", false)
		PedMakeTargetable(Tad, false)
		PedSetFlag(Tad, 20, true)
		PedAttack(Ricky, Tad, 2)
		SoundPlayStream("MS_FightingGreasers.rsm", MUSIC_DEFAULT_VOLUME)
		PedSetPedToTypeAttitude(Tad, 4, 0)
		PedSetTypeToTypeAttitude(4, 5, 0)
		PedSetTypeToTypeAttitude(5, 4, 0)
		PedAttack(Tad, Ricky, 2)
		CreateThread("T_LolaQuotesNiceShoot")

		repeat
		Wait(0)
		until PedIsDead(Ricky)
		
	Wait(1000)
	
		SoundPlayScriptedSpeechEvent(Lola, "M_3_03", 12, "supersize")
		
	Wait(500)

		Norton = PedCreateXYZ(29, 567.14, -113.31, 5.75)
		Lucky = PedCreateXYZ(26, 562.14, -112.31, 5.75)
		
	Wait(5)
	
		PedAttack(Norton, Tad, 2)
		PedAttack(Lucky, Tad, 2)
		PedAttack(Tad, Lucky, 2)
	
	Wait(1500)
	
		SoundPlayScriptedSpeechEvent(Norton, "M_3_03", 18, "supersize")
		
		repeat
		Wait(0)
		until PedIsDead(Norton) and PedIsDead(Lucky)
		
		SoundPlayScriptedSpeechEvent(Lola, "M_3_03", 16, "supersize")
		
	Wait(1500)

		SoundPlayScriptedSpeechEvent(Lola, "M_3_03", 13, "supersize")
		
	Wait(500)

		Ricky = PedCreateXYZ(28, 528.58, -109.04, 4.83)
		Vance = PedCreateXYZ(27, 528.99, -116.77, 5.49)
		Hal = PedCreateXYZ(22, 526.73, -116.30, 5.35)
	
		PedAttack(Tad, Vance, 2)
		PedAttack(Ricky, Tad, 2)
		PedAttack(Vance, Tad, 2)
		PedAttack(Hal, Tad, 2)
		
	Wait(1500)
	
		SoundPlayScriptedSpeechEvent(Ricky, "M_3_03", 19, "supersize")

	Wait(3200)
	
		SoundPlayScriptedSpeechEvent(Hal, "M_3_03", 20, "supersize")

		repeat
		Wait(0)
		until PedIsDead(Ricky) and PedIsDead(Vance) and PedIsDead(Hal)
		
		SoundPlayScriptedSpeechEvent(Lola, "M_3_03", 16, "supersize")
		
	Wait(1500)
	
		Lefty = PedCreateXYZ(24, 540.04, -120.52, 10.01)
		Hal = PedCreateXYZ(22, 561.90, -112.22, 5.57)
		Lucky = PedCreateXYZ(26, 562.07, -114.70, 5.57)
		--LuckyBike = VehicleCreateXYZ(249, 570.92, -114.84, 5.78)
		--HalBike = VehicleCreateXYZ(249, 569.78, -111.04, 6.78)
		
	Wait(5)

		SoundPlayScriptedSpeechEvent(Lola, "M_3_03", 15, "supersize")
		PedSetWeapon(Lefty, 281, 1)
		PedAttack(Lefty, Tad, 2)
		PedAttack(Tad, Hal, 2)
		PedAttack(Hal, Tad, 2)
		PedAttack(Lucky, Tad, 2)
		
	Wait(2000)
	
		--VehicleStop(HalBike)
		--VehicleStop(LuckyBike)
		--PedExitVehicle(Lucky)
		--PedExitVehicle(Hal)
		
		repeat
		Wait(0)
		until PedIsDead(Hal) and PedIsDead(Lucky) and PedIsDead(Lefty)
		
		SoundPlayScriptedSpeechEvent(Lola, "M_3_03", 16, "supersize")
		
	Wait(1500)

		SoundPlayScriptedSpeechEvent(Lola, "M_3_03", 14, "supersize")
		Vance = PedCreateXYZ(27, 546.06, -126.00, 5.76)
		Ricky = PedCreateXYZ(28, 547.98, -125.33, 5.76)
		
	Wait(5)
	
		PedJump(Vance, POINTLIST._EASTWALL, 1, 2)
		PedJump(Ricky, POINTLIST._EASTWALL, 1, 2)
		
	Wait(1000)
	
		PedAttack(Vance, Tad)
		PedAttack(Ricky, Tad)
		PedAttack(Tad, Vance, 2)

	Wait(2000)
	
		Norton = PedCreateXYZ(29, 526.73, -116.30, 5.35)
		PedAttack(Norton, Tad, 2)

		repeat
		Wait(0)
		until PedIsDead(Vance) and PedIsDead(Ricky) and PedIsDead(Norton)
		
		SoundPlayScriptedSpeechEvent(Lola, "M_3_03", 12, "supersize")
		Peanut = PedCreateXYZ(21, 569.87, -112.20, 5.78)
		Ricky = PedCreateXYZ(28, 570.88, -113.89, 5.78)
		PedAttack(Peanut, Tad, 2)
		PedAttack(Ricky, Tad, 2)
		PedAttack(Tad, Peanut, 2)

		repeat
		Wait(0)
		until PedIsDead(Ricky) and PedIsDead(Peanut)

	Wait(1500)
	
		CameraFade(500, 0)
		PlayerSetControl(0)
		SoundStopStream()
		
	Wait(501)
		
		AreaClearAllExplosions()
		AreaClearAllPeds()
		AreaClearAllProjectiles()
		AreaClearAllVehicles()
		AreaClearDockers()
		AreaClearPatrolPaths()
		AreaClearSpawners()

	Wait(500)

		PedSetPosPoint(Tad, POINTLIST._ENDTADLOCATION, 1)
		PedClearTether(Tad)
		PedSetPosPoint(Lola, POINTLIST._ENDLOLALOCATION, 1)
		PedMoveToXYZ(gPlayer, 0, 545.416016, -105.663002, 9.726280)
		
	Wait(1000)
	
		PedFaceXYZ(gPlayer, 547.090027, -105.777000, 9.726280)
		AreaClearAllExplosions()
		AreaClearAllPeds()
		AreaClearAllProjectiles()
		AreaClearAllVehicles()
		AreaClearDockers()
		AreaClearPatrolPaths()
		AreaClearSpawners()
		CameraSetXYZ(543.93, -107.00, 11.23, 547.40, -105.07, 10.82)

	Wait(50)
		
		AreaClearAllExplosions()
		AreaClearAllPeds()
		AreaClearAllProjectiles()
		AreaClearAllVehicles()
		AreaClearDockers()
		AreaClearPatrolPaths()
		AreaClearSpawners()
		PedHideHealthBar()

	Wait(500)
		
		CameraFade(500, 1)
		
	Wait(500)

		SoundPlayScriptedSpeechEvent(Lola, "M_3_03", 26, "supersize")
		
	Wait(3200)
		
		PedFollowPath(Lola, PATH._ENDLOLARUN, 0, 1)
		
	Wait(1000)
		
		SoundPlayScriptedSpeechEvent(Lola, "M_3_03", 27, "supersize")
		CameraSetXYZ(560.09, -117.22, 5.83, 556.82, -114.92, 5.90)
		
	Wait(2500)
		
		SoundPlayScriptedSpeechEvent(Tad, "M_3_03", 28, "supersize")
		PedFollowPath(Tad, PATH._ENDTADRUN, 0, 1)
		
		repeat
		Wait(0)
		until PedIsOnScreen(Tad)
		
	Wait(3500)
		
		CameraFade(500, 0)
		PedDelete(Tad)
		PedDelete(Lola)
		
	Wait(501)
		
		CameraSetXYZ(547.00, -105.78, 10.93, 543.03, -105.30, 10.93)
		
	Wait(2)

		CameraFade(500, 1)
		
	Wait(250)

		MinigameSetCompletion("M_PASS", true, 2000)
		MinigameAddCompletionMsg("MRESPECT_GM5", 1)
		SoundPlayMissionEndMusic(true, 0)
	  
     Wait(3000)
	  
		repeat
		Wait(0)
		until not MinigameIsShowingCompletion()

		CameraFade(500, 0)
		
	Wait(2500)
	
		PedFaceXYZ(gPlayer, 547.973999, -118.098000, 5.547000)
		Lucky = PedCreateXYZ(26, 553.70, -113.58, 5.33)
		
	Wait(5)
	
		PedFaceXYZ(Lucky, 545.416016, -105.663002, 9.726280)
		PedLockTarget(Lucky, gPlayer, 3)
		PedFaceObject(Lucky, gPlayer, 3, 1)
		PedLockTarget(Lucky, gPlayer, 3)
		CameraSetXYZ(554.25, -115.46, 6.03, 552.01, -112.28, 6.95)
		
	Wait(50)
	
		CameraFade(500, 1)
		
	Wait(500)
	
		SoundPlayStream("MS_FightingGreasers.rsm", MUSIC_DEFAULT_VOLUME)
		
	Wait(250)
	
		SoundPlayScriptedSpeechEvent(Lucky, "M_3_03", 21, "supersize")
		PedSetActionNode(Lucky, "/Global/1_08/CafeteriaLady/Point/Point", "Act/Conv/1_08.act")

end

MonitorTad = function()

		repeat
		Wait(0)
		until PedIsDead(Tad)
		
		PlayerSetControl(0)
		CameraFade(500, 0)
		
	Wait(1000)

		PedSetPosPoint(Lola, POINTLIST._ENDLOLALOCATION, 1)
		PedMoveToXYZ(gPlayer, 0, 545.416016, -105.663002, 9.726280)
		
	Wait(1000)
	
		PedFaceXYZ(gPlayer, 547.090027, -105.777000, 9.726280)
		CameraSetXYZ(543.93, -107.00, 11.23, 547.40, -105.07, 10.82)
		
	Wait(1000)
	
		CameraFade(500, 1)
		
	Wait(500)
	
		SoundPlayScriptedSpeechEvent(Lola, "M_3_03", 17, "supersize")
		
	Wait(3300)
	
		PedFollowPath(Lola, PATH._ENDLOLARUN, 0, 1)
		
	Wait(1500)
	
		SoundPlayMissionEndMusic(false, 0)
		MissionFail(false)
		
	Wait(5500)
	
		CameraFade(500, 0)

end

LoadAnims = function()

		LoadAnimationGroup("1_08ThatBitch")
		LoadAnimationGroup("NIS_1_08_1")

end
