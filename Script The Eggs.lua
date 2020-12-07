-- The Eggs

MissionSetup = function()

		DATLoad("2_03.DAT", 2)
		DATInit()
		ClockSet(13)
		ToggleHUDComponentVisibility(11, false)
		ToggleHUDComponentVisibility(4, false)
		ToggleHUDComponentVisibility(0, false)
		SoundDisableSpeech_ActionTree()

end

main = function()

		TheEggsIntro()
		TheEggs()
		--TadAndJustinDressProperly()

end

TheEggsIntro = function()
		
		Wait(1000)

			AreaTransitionXYZ(27, -732.84, 379.23, 298.04)
			PlayerSetControl(0)
			CameraSetXYZ(-728.61, 388.05, 300.53, -731.74, 385.76, 299.57)
			--CameraSetXYZ(-735.24, 379.71, 300.30, -733.60, 383.15, 299.13)

		Wait(1000)

			ChadIntro = PedCreateXYZ(32, -733.58, 386.95, 298.04)
			ParkerIntro = PedCreateXYZ(40, -732.08, 387.29, 298.04)
			TadIntro = PedCreateXYZ(31, -732.70, 385.62, 298.04)
			
		Wait(5)
			
			PedFaceXYZ(ChadIntro, -732.08, 387.29, 298.04)
			PedFaceXYZ(ParkerIntro, -733.58, 386.95, 298.04)
			PedFaceXYZ(TadIntro, -733.70, 387.37, 298.04)
			
		Wait(750)
			
			PedMoveToXYZ(gPlayer, 0, -732.79, 382.91, 298.04)
			
		Wait(1700)
		
			PedMoveToXYZ(TadIntro, 0, -732.77, 384.08, 298.04)
			
		Wait(750)
		
			CameraSetXYZ(-733.67, 382.05, 299.54, -731.64, 385.48, 299.30)
		
		Wait(250)
		
			SoundPlayScriptedSpeechEvent(TadIntro, "M_2_03", 1, "supersize")

		Wait(3300)

			CameraSetXYZ(-733.56, 384.89, 299.49, -732.22, 381.12, 299.35)
			SoundPlayScriptedSpeechEvent(gPlayer, "M_2_03", 2, "supersize")
			
		Wait(1100)

			CameraSetXYZ(-733.67, 382.05, 299.54, -731.64, 385.48, 299.30)
			SoundPlayScriptedSpeechEvent(TadIntro, "M_2_03", 3, "supersize")
			
		Wait(4750)
			
			CameraSetXYZ(-733.23, 383.50, 299.41, -731.71, 379.81, 299.49)
			SoundPlayScriptedSpeechEvent(gPlayer, "M_2_03", 4, "supersize")
			PedSetActionNode(gPlayer, "/Global/Ambient/MissionSpec/Prefect/PrefectChew", "Act/Anim/Ambient.act")
			
		Wait(2000)
		
			CameraSetXYZ(-733.02, 383.22, 299.31, -732.00, 387.06, 299.72)
			SoundPlayScriptedSpeechEvent(TadIntro, "M_2_03", 5, "supersize")
			
		Wait(3500)
		
			CameraFade(500, 0)

		Wait(501)
		
			PedDelete(ChadIntro)
			PedDelete(ParkerIntro)
			PedDelete(TadIntro)
			AreaTransitionXYZ(0, 394.25, 144.57, 5.22)
			JimmyVehicle = VehicleCreateXYZ(250, 391.911, 146.86, 5.21)
			VehicleFaceHeading(JimmyVehicle, 90)
			PlayerFaceHeadingNow(90)
			CameraReturnToPlayer()

		Wait(2000)
			
			TextPrintString("Buy an Aquaberry sweater.", 3, 1)
			PlayerSetControl(1)
			
			repeat
			Wait(0)
			until AreaGetVisible() == 33
			
			PlayerSetControl(0)
			CameraSetXYZ(-705.14, 259.83, 1.80, -703.02, 262.47, 1.46)

		Wait(6600)
		
			CameraReturnToPlayer()
			PlayerSetControl(1)
			
			repeat
			Wait(0)
			until ClothingGetPlayer(1) == ObjectNameToHashID("R_Sweater5") and not shared.playerShopping
			
			HUDSaveVisibility()
			CameraSetXYZ(-701.52, 270.54, 1.20, -705.22, 269.30, 2.09)
			PlayerSetControl(0)
			
		Wait(2)
			
			HUDClearAllElements()
			
		Wait(500)
			
			SoundPlayScriptedSpeechEvent(gPlayer, "M_2_03", 7, "supersize")

		Wait(3100)

			HUDRestoreVisibility()
			PlayerSetControl(1)
			CameraReturnToPlayer()
			
			repeat
			Wait(0)
			until AreaGetVisible() == 0

end

TadAndJustinDressProperly = function()

		AreaTransitionXYZ(0, 394.25, 144.57, 5.22)

		repeat
		Wait(0)
		until AreaGetVisible() == 27

		LoadActionTree("Act/Conv/2_03i.act")

		--TAD
		--[[TadDP = PedCreateXYZ(31, -734.31, 369.63, 298.04)
		
	Wait(2)
	
		PedFaceXYZ(TadDP, -732.60, 369.67, 298.04)

		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-731.89, 370.24, 297.78, 2, 0)
		
		PlayerSetControl(0)
		CameraSetXYZ(-733.32, 369.91, 299.45, -736.44, 369.24, 299.27)
		PedSetActionNode(TadDP, "/Global/2_03i/animations/TadReject/Rebuff", "Act/Conv/2_03i.act")
		SoundPlayScriptedSpeechEvent(TadDP, "M_2_03", 8, "supersize")]]
		
		--JUSTIN
		JustinDP = PedCreateXYZ(34, -722.31, 389.44, 298.04)
		
	Wait(2)
	
		PedFaceXYZ(JustinDP, -721.33, 389.41, 298.04)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-721.12, 389.41, 298.04, 2, 0)

		PlayerSetControl(0)
		CameraSetXYZ(-721.21, 389.00, 299.51, -724.98, 390.31, 299.31)
		PedSetActionNode(JustinDP, "/Global/2_03i/animations/TadReject/Rebuff", "Act/Conv/2_03i.act")
		SoundPlayScriptedSpeechEvent(JustinDP, "M_2_03", 24, "supersize")
		
end

TheEggs = function()

			if not PlayerIsInAreaXYZ(435.65, 184.57, 8.38, 3, 0) then
			AreaTransitionXYZ(0, 435.65, 184.57, 8.38)
			end

			if ClothingGetPlayer(1) ~= ObjectNameToHashID("R_Sweater5") then
			ClothingSetPlayer(1, "R_Sweater5")
			end
			
			JimmyVehicle = VehicleCreateXYZ(250, 391.911, 146.86, 5.21)
			VehicleFaceHeading(JimmyVehicle, 90)

		Wait(1000)
		
			TextPrintString("Meet with Tad at the Boxing Club.", 3, 1)
			
			repeat
			Wait(0)
			until AreaGetVisible() == 27 and PlayerIsInAreaXYZ(-734.47, 371.91, 298.04, 2, 1)
			
			PlayerSetControl(0)
			PlayCutsceneWithLoad("2-03", true)
			LoadAnimationGroup("TadGates")
			LoadAnimationGroup("NIS_2_03")
			LoadAnimationGroup("MINI_Lock")
			LoadActionTree("Act/Conv/2_03.act")
			LoadActionTree("Act/Conv/1_03.act")
			LoadActionTree("Act/Conv/1_08.act")
			LoadActionTree("Act/Conv/1_S01.act")
			LoadActionTree("Act/Anim/G_Ranged_A.act")
			AreaForceLoadAreaByAreaTransition(true)
			AreaTransitionPoint(0, POINTLIST._2_03_PLAYERSTART_NEW, 1, true)
			AreaForceLoadAreaByAreaTransition(false)
			CameraFade(FADE_IN_TIME, 1)
			Wait(FADE_IN_TIME)
			PlayerSetControl(1)

		Wait(500)
		
			TextPrintString("Take your eggs to Tad's house.", 3, 1)
			Tad = PedCreatePoint(31, POINTLIST._2_03_TADSTART, 1)
			Gord = PedCreatePoint(30, POINTLIST._2_03_TADSTART, 2)
			Chad = PedCreatePoint(32, POINTLIST._2_03_TADSTART, 3)
			l_0_23 = ObjectNameToHashID("TRICH_TADGATES01")
			l_0_24 = ObjectNameToHashID("TRICH_TADGATES")

			repeat
			Wait(0)
			until PlayerIsInTrigger(TRIGGER._2_03_TADSBLOCK)
			PedSetActionNode(Tad, "/Global/Ambient/Sitting_Down/SitHigh", "Act/Anim/Ambient.act")
			AreaSetDoorLocked(l_0_24, false)
			AreaSetDoorLocked(l_0_23, false)
			AreaSetDoorOpen(l_0_23, true)
			PAnimOpenDoor(TRIGGER._TRICH_TADGATES01)

			repeat
			Wait(0)
			until PlayerIsInTrigger(TRIGGER._2_03_TADNIS)
			
			PedSetFlag(Tad, 17, false)
			PlayerSetControl(0)
			CameraFade(500, 0)
			PlayerUnequip()
	
		Wait(501)
			
			PlayCutsceneWithLoad("2-03b", true)
			PlayerSetPosPoint(POINTLIST._2_03_PLAYER_AFTER_EGGS)
			PedDestroyWeapon(gPlayer, 290)
			PedSetPosPoint(Tad, POINTLIST._2_03_TAD_AFTER_EGGS)
			
		Wait(2)
		
			PedFaceObject(Tad, gPlayer, 3, 0)
			PedSetPosPoint(Chad, POINTLIST._2_03_CHAD_AFTER_EGGS)
			
		Wait(2)
		
			PedFaceObject(Chad, gPlayer, 3, 0)
			PedSetPosPoint(Gord, POINTLIST._2_03_GORD_AFTER_EGGS)
			
		Wait(2)
			
			PedFaceObject(Gord, gPlayer, 3, 0)

		Wait(1000)

			AreaSetDoorOpen(l_0_24, false)
			AreaSetDoorLocked(l_0_23, true)
			AreaSetDoorLocked(l_0_24, true)
			AreaSetDoorLockedToPeds(l_0_23, true)
			AreaSetDoorLockedToPeds(l_0_24, true)
			CameraReturnToPlayer()
			SoundPlayInteractiveStreamLocked("MS_ActionHigh.rsm", MUSIC_DEFAULT_VOLUME)

		Wait(2000)

			CameraFade(500, 1)
			PlayerSetControl(1)
			AreaClearAllPeds()
			AreaClearAllVehicles()
			AreaClearSpawners()
			AreaOverridePopulation(0,0,0,0,0,0,0,0,0,0,0,0,0)
			SoundPlayScriptedSpeechEvent(Tad, "M_2_03", 11, "supersize")
			TextPrintString("Find a way out of Tad's yard.", 4, 1)
			PedSetTypeToTypeAttitude(5, 13, 0)
			Justin = PedCreatePoint(34, POINTLIST._2_03_FRONT_GATE_LOCKER)
			PedSetActionNode(Justin, "/Global/2_03Cnv/animations/Lock_Picking/Lock_Picking_Loop", "Act/Conv/2_03.act")
			CreateThread("T_MonitorJustin")

			repeat
			Wait(0)
			until PlayerIsInTrigger(TRIGGER._2_03_FRONTGATEAREA)
			
			PedSetActionNode(Justin, "/Global/2_03Cnv/animations/Lock_Picking/Lock_Picking_Loop_To_Idle", "Act/Conv/2_03.act")
			PlayerSetControl(0)
			--CameraSetXYZ(445.13, 504.63, 24.82, 444.99, 508.47, 23.72)
			PedMoveToXYZ(gPlayer, 1, 445.51, 507.89, 22.63)
			SoundPlayScriptedSpeechEvent(Justin, "M_2_03", 12, "supersize")
			--[[PedOverrideStat(Justin, 34, 15)
			PedOverrideStat(Justin, 13, 6)
			PedOverrideStat(Justin, 8, 90)
			PedOverrideStat(Justin, 6, 70)
			PedOverrideStat(Justin, 7, 0)]]
			PedOverrideStat(Justin, 20, 135)
			PedSetInfiniteSprint(Justin, true)
			PlayerSocialDisableActionAgainstPed(Justin, 28, true)
			PlayerSocialDisableActionAgainstPed(Justin, 29, true)
			PlayerSocialDisableActionAgainstPed(Justin, 35, true)
			PlayerSocialDisableActionAgainstPed(Justin, 23, true)
			
		Wait(700)
		
			PedFaceObject(Justin, gPlayer, 3, 1)
			--CameraReturnToPlayer()
			PlayerSetControl(1)
			TextPrintString("Retrieve the gate key.", 3, 1)
			
		Wait(250)

			PedStop(Justin)
			PedSetActionNode(Justin, "/Global/1_S01/ClearNode", "Act/Conv/1_S01.act")
	
		Wait(25)
			
			PedSetPedToTypeAttitude(Justin, 13, 4)
			PedClearObjectives(Justin)
			PedMoveToXYZ(Justin, 3, 427.09, 481.64, 23.42)
			PedSetFlag(Justin, 13, true)
			
		Wait(250)

			SoundPlayScriptedSpeechEvent(Justin, "M_2_03", 13, "supersize")
			Bryce = PedCreateXYZ(35, 443.56, 476.59, 24.69)

		Wait(5)
		
			PedAttack(Bryce, gPlayer, 1)

		Wait(1000)
		
			SoundPlayScriptedSpeechEvent(Bryce, "M_2_03", 14, "supersize")

			repeat
			Wait(0)
			until PedIsInAreaXYZ(Justin, 427.09, 481.64, 23.42, 1, 0)
		
			PedSetActionNode(Justin, "/Global/1_03/animations/DavisWaitTired/TiredLoop", "Act/Conv/1_03.act")
			
			repeat
			Wait(0)
			until PedIsDead(Bryce)

			PedSetActionNode(Justin, "/Global/1_03/animations/DavisWaitTired/Stop", "Act/Conv/1_03.act")
			PedSetPedToTypeAttitude(Justin, 13, 4)
			PedAttack(Justin, gPlayer, 1)
			PedOverrideStat(Justin, 20, 100)
			PedSetFlag(Justin, 13, false)
			
			repeat
			Wait(0)
			until PedGetHealth(Justin) < 70
			
			PedSetActionNode(Justin, "/Global/1_S01/ClearNode", "Act/Conv/1_S01.act")
			PedIgnoreStimuli(Justin, true)
			PedSetPedToTypeAttitude(Justin, 13, 4)
			PedClearObjectives(Justin)
			PedStop(Justin)
			
		Wait(5)

			PedMoveToXYZ(Justin, 3, 443.50, 447.87, 23.28)
			PedOverrideStat(Justin, 20, 135)
			PedSetFlag(Justin, 13, true)
			SoundPlayScriptedSpeechEvent(Justin, "M_2_03", 13, "jumbo")

			Wait(1550)

			Parker = PedCreateXYZ(40, 442.35, 456.10, 24.71)

		Wait(5)
		
			PedAttack(Parker, gPlayer, 1)

		Wait(1500)
		
			SoundPlayScriptedSpeechEvent(Parker, "M_2_03", 15, "supersize")

			repeat
			Wait(0)
			until PedIsInAreaXYZ(Justin, 443.50, 447.87, 23.28, 1, 0)

			PedSetActionNode(Justin, "/Global/1_03/animations/DavisWaitTired/TiredLoop", "Act/Conv/1_03.act")
			
			repeat
			Wait(0)
			until PedIsDead(Parker) and PlayerIsInAreaXYZ(431.70, 450.89, 23.28, 2, 0)

			PedSetPedToTypeAttitude(Justin, 13, 3)
			PedSetActionNode(Justin, "/Global/1_03/animations/DavisWaitTired/Stop", "Act/Conv/1_03.act")
			PedMoveToXYZ(Justin, 2, 464.85, 472.94, 23.21)
			SoundPlayScriptedSpeechEvent(Justin, "M_2_03", 13, "supersize")
			
			repeat
			Wait(0)
			until PedIsInAreaXYZ(Justin, 464.85, 472.94, 23.21, 1, 0)
			
			ExecuteActionNode(Justin, "/Global/Player/JumpActions/Jump", "Act/Anim/Player.act")
			PedOverrideStat(Justin, 20, 100)
			PedMoveToXYZ(Justin, 2, 449.47, 489.24, 23.44)
			
			repeat
			Wait(0)
			until PedIsInAreaXYZ(Justin, 449.47, 489.24, 23.44, 1, 0)
			
			PedAttack(Justin, gPlayer, 1)
			Gord = PedCreateXYZ(30, 441.93, 478.15, 26.40, 24.69)
			PedAttack(Gord, gPlayer, 1)
			
		Wait(500)

			SoundPlayScriptedSpeechEvent(Gord, "M_2_03", 16, "supersize")
			
			repeat
			Wait(0)
			until PedIsDead(Justin) and PlayerHasItem(460)
			
		Wait(25)

			SoundPlayScriptedSpeechEvent(gPlayer, "M_2_03", 18, "supersize")
			
		Wait(100)

			AreaSetDoorLocked(l_0_23, false)
			
		Wait(100)
		
			AreaSetDoorLockedToPeds(l_0_23, false)
			
		Wait(100)
			
			AreaSetDoorLocked(l_0_24, false)
			
		Wait(100)
		
			AreaSetDoorLockedToPeds(l_0_24, false)
			
			repeat
			Wait(0)
			until PlayerIsInAreaXYZ(443.95, 507.70, 22.65, 1, 0)

			TextPrintString("Get out of Tad's yard.", 3, 1)
			
			repeat
			Wait(0)
			until PlayerIsInAreaXYZ(443.49, 513.91, 22.12, 1, 0)
			
			AreaRevertToDefaultPopulation()
			PlayerSetControl(0)
			CameraFade(500, 0)
			
		Wait(501)
			
			CameraFade(500, 1)
			CameraSetXYZ(433.89, 517.63, 23.14, 437.65, 516.27, 23.14)
			PedMoveToXYZ(gPlayer, 2, 432.75, 516.71, 22.12)
			
		Wait(2500)
		
			CameraSetXYZ(436.12, 516.92, 23.24, 439.78, 515.33, 23.58)
			PedDelete(Gord)
			Gord2 = PedCreateXYZ(30, 443.56, 509.07, 22.43)
			PedMoveToXYZ(Gord2, 2, 437.64, 515.76, 22.00)
			PedSetPedToTypeAttitude(Gord2, 13, 4)
			
		Wait(2000)
		
			PedSetActionNode(Gord2, "/Global/1_08/CafeteriaLady/Point/Point", "Act/Conv/1_08.act")
			SoundPlayScriptedSpeechEvent(Gord2, "M_2_03", 19, "supersize")
			
		Wait(2500)
		
			CameraFade(500, 0)
			
		Wait(1601)

			PedDelete(Gord2)			
			Gord3 = PedCreateXYZ(30, 439.50, 516.27, 22.00)
			GordVehicle = VehicleCreateXYZ(249, 439.44, 517.30, 22.00)
			Justin2 = PedCreateXYZ(34, 444.99, 519.00, 21.95)
			JustinVehicle = VehicleCreateXYZ(250, 444.92, 520.32, 21.95)
			Parker2 = PedCreateXYZ(40, 446.25, 512.82, 21.95)
			ParkerVehicle = VehicleCreateXYZ(249, 446.19, 514.67, 21.95)
			Bryce2 = PedCreateXYZ(35, 445.32, 522.02, 21.95)
			BryceVehicle = VehicleCreateXYZ(249, 445.15, 525.07, 21.95)
			Chad2 = PedCreateXYZ(32, 449.11, 522.47, 21.95)
			ChadVehicle = VehicleCreateXYZ(250, 449.05, 523.41, 21.95)
			
		Wait(50)

			VehicleFaceHeading(GordVehicle, 90)
			VehicleFaceHeading(JustinVehicle, 90)
			VehicleFaceHeading(ParkerVehicle, 90)
			VehicleFaceHeading(BryceVehicle, 90)
			VehicleFaceHeading(ChadVehicle, 90)

		Wait(500)

			PedPutOnBike(Gord3, GordVehicle)
			PedPutOnBike(Justin2, JustinVehicle)
			PedPutOnBike(Parker2, ParkerVehicle)
			PedPutOnBike(Bryce2, BryceVehicle)
			PedPutOnBike(Chad2, ChadVehicle)
			PedPutOnBike(gPlayer, JimmyVehicle)
			AreaClearAllPeds()
			AreaClearAllVehicles()
			UnLoadAnimationGroup("TadGates")
			UnLoadAnimationGroup("NIS_2_03")
			UnLoadAnimationGroup("MINI_Lock")

		Wait(500)

			PedAttack(Gord3, gPlayer, 1)
			PedAttack(Justin2, gPlayer, 1)
			PedAttack(Parker2, gPlayer, 1)
			PedAttack(Bryce2, gPlayer, 1)
			PedAttack(Chad2, gPlayer, 1)
			CameraReturnToPlayer()
			PlayerSetControl(1)
			CameraFade(500, 1)
			TextPrintString("Defeat the preppies.", 3, 1)
			
		Wait(2500)
		
			SoundPlayScriptedSpeechEvent(Justin, "M_2_03", 20, "supersize")
			
		Wait(7500)
		
			SoundPlayScriptedSpeechEvent(Parker2, "M_2_03", 21, "supersize")
			
		Wait(5500)

			SoundPlayScriptedSpeechEvent(Bryce2, "M_2_03", 22, "supersize")
			
			repeat
			Wait(0)
			until PlayerIsInAreaXYZ(513.05, 506.96, 19.70, 2, 0)

		Wait(1500)
		
			SoundPlayScriptedSpeechEvent(Chad2, "M_2_03", 23, "supersize")
		
			repeat
			Wait(0)
			until PedIsDead(Gord3) and PedIsDead(Justin2) and PedIsDead(Parker2) and PedIsDead(Bryce2) and PedIsDead(Chad2)
			
		Wait(1000)
		
			PlayerSetControl(0)

			local X1, Y1, Z1 = PedGetOffsetInWorldCoords(gPlayer, -0.45, 1.35, 1.5000000476837)
			local X2, Y2, Z2 = PedGetOffsetInWorldCoords(gPlayer, 0.45, -0.69999998807907, 1.3000000476837)
			
		Wait(5)

			CameraSetXYZ(X1, Y1, Z1, X2, Y2, Z2)
			TextPrintString("", 1, 1)
			MinigameSetCompletion("M_PASS", true, 0, "2_03_UNLOCK")
			SoundPlayMissionEndMusic(true, 10)
			
		Wait(500)
			
			MinigameAddCompletionMsg("MRESPECT_PM10", 1)
			repeat
			Wait(0)
			until not MinigameIsShowingCompletion()

			MissionSucceed(false, false, false)
			
			
end

T_MonitorJustin = function()

			repeat
			Wait(0)
			until PedIsDead(Justin)
			
			X, Y, Z = PedGetPosXYZ(Justin)
			Key = PickupCreateXYZ(460, X + 0.5, Y + 0.5, Z + 0.25, "PermanentButes")
			KeyPickup = AddBlipForPickup(Key, 0, 4)

end