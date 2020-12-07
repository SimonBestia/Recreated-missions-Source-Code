function MissionSetup()

		ChapterSet(4)
		ClockSet(14)
		PauseGameClock()
		WeatherRelease()
		AreaDisableCameraControlForTransition(true)
		MissionSurpressMissionNameText()
		if ClothingGetPlayerOutfit() ~= "Uniform" then
			ClothingBackup()
			Wait(1)
			ClothingSetPlayerOutfit("Uniform")
			ClothingBuildPlayer()
		end
		SoundPlayInteractiveStream("MS_WIldstyleLow.rsm", MUSIC_DEFAULT_VOLUME)
		SoundSetMidIntensityStream("MS_WIldstyleMid.rsm", MUSIC_DEFAULT_VOLUME)
		SoundSetHighIntensityStream("MS_WIldstyleHigh.rsm", MUSIC_DEFAULT_VOLUME)
		DATLoad("5_09.DAT", 2)
		DATInit()
		LoadAnimationGroup("W_SprayCan")
		LoadAnimationGroup("NPC_Adult")
		LoadAnimationGroup("NPC_AggroTaunt")
		LoadAnimationGroup("5_09MakingAMark")
		LoadActionTree("Act/Conv/5_09.act")
		if PlayerGetMoney() < 100 then
			PlayerSetMoney(100)
		end
		SkipDialogue = false
		TaggingStopPersistentTag()
end

F_MissionSetup = function()

		RequestModel(45)
		RequestModel(255)
		RequestModel(256)
		RequestModel(257)

end

function main()

		--F_MissionSetup()
		--Intro()
		--GetToClint()
		ClintCutscene()
		--ChaseLefty()
		--ClintCutscene2()
		--GetPaint()
		--DropOutConfrontation()
		--MeetEarnestCutscene()
		--GoToTownHall()
		--TakePicture()
		--ReturnToDorm()

end


Intro = function()

		--AreaTransitionPoint(14, POINTLIST._5_09_Player_Intro)
		InCutscene = true
		F_InCutscene()
		LoadAnimationGroup("NIS_3_R09_N")
		LoadAnimationGroup("NIS_3_05")
		AreaTransitionXYZ(14, -501.9210, 317.8271, 31.4111)
		CameraSetXYZ(-499.51, 317.82, 33.29, -503.17, 318.75, 31.92)
		Pete = PedCreateXYZ(134, -502.7617, 319.1191, 31.4111)
		PedFaceXYZ(gPlayer, -502.7617, 319.1191, 31.4111)
		PedFaceXYZ(Pete, -501.9210, 317.8271, 31.4111)
		Wait(500)
		CameraFade(500, 1)
		Wait(2501)
		SoundPlayScriptedSpeechEvent(Pete, "M_5_09", 1, "large")
		F_WaitForSpeech(Pete)
		ExecuteActionNode(gPlayer, "/Global/3_R09/Animations/Player/Comic/Player01", "Act/Conv/3_R09.act")
		CameraSetXYZ(-501.13, 320.70, 33.29, -503.22, 317.60, 31.88)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_5_09", 2, "large")
		F_WaitForSpeech(gPlayer)
		CameraSetXYZ(-499.51, 317.82, 33.29, -503.17, 318.75, 31.92)
		SoundPlayScriptedSpeechEvent(Pete, "M_5_09", 3, "large")
		F_WaitForSpeech(Pete)
		CameraSetXYZ(-501.13, 320.70, 33.29, -503.22, 317.60, 31.88)
		ExecuteActionNode(gPlayer, "/Global/3_05/Animations/Player/Player01", "Act/Conv/3_05.act")
		SoundPlayScriptedSpeechEvent(gPlayer, "M_5_09", 4, "large")
		F_WaitForSpeech(gPlayer)
		InCutscene = false
		F_InCutscene()
		CameraReset()
		CameraReturnToPlayer()
		PedMakeAmbient(Pete)
		PedWander(Pete)
		AreaDisableCameraControlForTransition(false)

end

GetToClint = function()

		if PedIsValid(Pete) then
			TextPrintString("Find Clint.", 2, 1)
			repeat
			Wait(0)
			until AreaGetVisible() == 0
			--Wait(1000)
			--AreaTransitionPoint(0, POINTLIST._5_09_Transport, 1)
			UnLoadAnimationGroup("NIS_3_05")
			UnLoadAnimationGroup("NIS_3_R09_N")
		else
			AreaTransitionPoint(0, POINTLIST._5_09_Player_Start)
			TextPrintString("Find Clint.", 2, 1)
		end

		Wait(1500)
		PedSetUniqueModelStatus(45, -1)
		Clint = PedCreatePoint(45, POINTLIST._5_09_Dropout_Contact)
		PedSetPedToTypeAttitude(Clint, 13, 3)
		PedClearAllWeapons(Clint)
		PedSetAsleep(Clint, true)
		PedSetStationary(Clint, true)
		ClintBike = VehicleCreatePoint(256, POINTLIST._5_09_Dropout_Bike)
		Test1 = VehicleCreatePoint(257, POINTLIST._5_09_Transport, 1)
		Test2 = VehicleCreatePoint(255, POINTLIST._5_09_Transport, 2)
		F_WaitUntilPlayerIsInArea(309.535004, -428.075012, 2.900750, 5, 0)

end

ClintCutscene = function()

		CameraFade(500, 0)
		Wait(501)
		InCutscene = true
		F_InCutscene()
		Wait(3500)
		LoadActionTree("Act/Conv/1_08.act")
		LoadAnimationGroup("NIS_1_07")
		LoadAnimationGroup("NIS_5_01")
		if AreaGetVisible() ~= 0 then
			AreaTransitionPoint(0, POINTLIST._5_09_Player_Dropout_Cut)
			Clint = PedCreatePoint(45, POINTLIST._5_09_Dropout_Contact)
			PedSetPedToTypeAttitude(Clint, 13, 3)
			PedClearAllWeapons(Clint)
			PedSetAsleep(Clint, true)
			PedSetStationary(Clint, true)
			ClintBike = VehicleCreatePoint(256, POINTLIST._5_09_Dropout_Bike)
			JimmyBike = VehicleCreatePoint(257, POINTLIST._5_09_Players_Bike, 1)
		else
			PedStop(gPlayer)
			Wait(1)
			VehicleStop(JimmyBike)
			Wait(1)
			PlayerDismountBike()
			Wait(50)
			PlayerStopAllActionControllers()
			Wait(100)
			PlayerSetPosPoint(POINTLIST._5_09_Player_Dropout_Cut)
			JimmyBike = PedGetLastVehicle(gPlayer)
			VehicleDelete(ClintBike)
			Wait(1)
			ClintBike = VehicleCreatePoint(256, POINTLIST._5_09_Dropout_Bike)
			local RNG = math.random(2)
			Wait(1)
			VehicleSetPosPoint(JimmyBike, POINTLIST._5_09_Players_Bike, RNG)
		end
		Lefty = PedCreatePoint(24, POINTLIST._5_09_GREASER_THIEF, 1)
		PedFaceXYZ(Clint, 309.535004, -428.075012, 2.900750)
		PedAddPedToIgnoreList(Clint, Lefty)
		PedSetTypeToTypeAttitude(3, 4, 2)
		CameraSetXYZ(306.03, -429.79, 4.46, 308.82, -426.96, 4.04)
		CameraFade(500, 1)
		Wait(501)
		PedSetActionNode(Clint, "/Global/1_07/DontMess", "Act/Conv/1_07.act")
		SoundPlayScriptedSpeechEvent(Clint, "M_5_09", 5, "large")
		F_WaitForSpeech(Clint)
		PedSetActionNode(gPlayer, "/Global/5_01/NIS/Player/Player_02", "Act/Conv/5_01.act")
		SoundPlayScriptedSpeechEvent(gPlayer, "M_5_09", 6, "large")
		F_WaitForSpeech(gPlayer)
		SoundPlayScriptedSpeechEvent(Clint, "M_5_09", 7, "large")
		CreateThread("T_LeftyGetsOnBike")
		Wait(1600)
		CameraSetXYZ(296.82, -427.70, 4.76, 300.37, -426.13, 3.83)
		PlayerFaceHeading(60, 1)
		PedFaceXYZ(Clint, 300.592987, -425.740997, 2.769340)
		Wait(1)
		ExecuteActionNode(Clint, "/Global/1_08/CafeteriaLady/Point/Point", "Act/Anim/1_08.act")
		PedLockTarget(gPlayer, Lefty)
		F_WaitForSpeech(Clint)
		CameraSetXYZ(307.20, -428.53, 4.06, 311.08, -427.68, 3.64)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_5_09", 8, "large")
		F_WaitForSpeech(gPlayer)
		PedLockTarget(Clint, Lefty)
		CameraSetXYZ(307.85, -427.79, 4.96, 310.33, -424.69, 4.51)
		SoundPlayScriptedSpeechEvent(Clint, "M_5_09", 9, "large")
		F_WaitForSpeech(Clint)
		CameraFade(500, 0)
		Wait(501)
		UnLoadAnimationGroup("NIS_1_07")
		UnLoadAnimationGroup("NIS_5_01")
		PedDelete(Clint)
		Wait(1)
		Clint = PedCreatePoint(45, POINTLIST._5_09_Dropout_Contact)
		PedSetPedToTypeAttitude(Clint, 13, 3)
		PedClearAllWeapons(Clint)
		PedSetAsleep(Clint, true)
		PedSetStationary(Clint, true)
		Wait(1)
		InCutscene = false
		F_InCutscene()
		CameraReset()
		CameraReturnToPlayer()
		PedLockTarget(gPlayer, -1)
		Wait(2500)
		CameraFade(500, 1)

end

T_LeftyGetsOnBike = function()

		Wait(300)
		PedFollowPath(Lefty, PATH._5_09_Greaser_Thief, 0, 1)
		PedEnterVehicle(Lefty, ClintBike)

end


ChaseLefty = function()

		if AreaGetVisible() ~= 0 then
			MissionDontFadeIn()
			AreaTransitionPoint(0, POINTLIST._5_09_Player_Dropout_Cut)
			PlayerFaceHeadingNow(60, 1)
			Wait(50)
			CameraReset()
			CameraReturnToPlayer()
			Clint = PedCreatePoint(45, POINTLIST._5_09_Dropout_Contact)
			PedSetPedToTypeAttitude(Clint, 13, 3)
			PedAddPedToIgnoreList(Clint, Lefty)
			PedClearAllWeapons(Clint)
			PedSetAsleep(Clint, true)
			PedSetStationary(Clint, true)
			Wait(5)
			Lefty = PedCreateXYZ(24, 300.592987, -425.740997, 2.769340)
			Wait(50)
			ClintBike = VehicleCreatePoint(256, POINTLIST._5_09_Dropout_Bike)
			JimmyBike = VehicleCreatePoint(257, POINTLIST._5_09_Players_Bike, 2)
			PedPutOnBike(Lefty, ClintBike)
			CameraFade(500, 1)
		end
		PedSetTypeToTypeAttitude(3, 13, 2)
		F_CreateGreaserThugs()
		Wait(500)
		TextPrintString("Retrieve Clint's bike.", 3, 1)
		F_LeftyEscapes()
		TextPrintString("Get on Clint's bike.", 3, 1)
		F_WaitUntilPlayerIsInArea(309.535004, -428.075012, 2.900750, 5, 0)
		CameraFade(500, 0)
		Wait(501)

end

F_LeftyEscapes = function()

		PedFollowPath(Lefty, PATH._5_09_Greaser_Flee_Path, 0, 1)
		repeat
		Wait(0)
		until PedIsInAreaXYZ(Lefty, 430.8489, -459.6726, 2.9783, 6, 0)
		PedStop(Lefty)
		PedExitVehicle(Lefty)
		PedAttackPlayer(Lefty, 3)
		F_WhenGreasersAttack()
		NonMissionPedGenerationDisable()
		repeat
		Wait(0)
		until PedIsDead(Lefty) and PedIsDead(Ricky) and PedIsDead(Lucky) and PedIsDead(Norton) and PedIsDead(Hal)
		NonMissionPedGenerationEnable()

end

F_CreateGreaserThugs = function()
  Ricky = PedCreatePoint(28, POINTLIST._5_09_GREASER_THIEF, 2)
  Lucky = PedCreatePoint(26, POINTLIST._5_09_GREASER_THIEF, 3)
  Norton = PedCreatePoint(29, POINTLIST._5_09_GREASER_THIEF, 4)
  Hal = PedCreatePoint(22, POINTLIST._5_09_GREASER_THIEF, 5)
  PedSetAsleep(Ricky, true)
  PedSetAsleep(Lucky, true)
  PedSetAsleep(Norton, true)
  PedSetAsleep(Hal, true)
  PedSetInfiniteSprint(Ricky, true)
  PedSetInfiniteSprint(Lucky, true)
  PedSetInfiniteSprint(Norton, true)
  PedSetInfiniteSprint(Hal, true)
  PedSetUniqueModelStatus(24, -1)
  PedSetUniqueModelStatus(28, -1)
  PedSetUniqueModelStatus(26, -1)
  PedSetUniqueModelStatus(29, -1)
  PedSetUniqueModelStatus(22, -1)
end
 
F_WhenGreasersAttack = function()
  PedSetAsleep(Ricky, false)
  PedSetAsleep(Lucky, false)
  PedSetAsleep(Norton, false)
  PedSetAsleep(Hal, false)
  PedSetPedToTypeAttitude(Lefty, 13, 2)
  PedSetPedToTypeAttitude(Ricky, 13, 2)
  PedSetPedToTypeAttitude(Lucky, 13, 2)
  PedSetPedToTypeAttitude(Norton, 13, 2)
  PedSetPedToTypeAttitude(Hal, 13, 2)
  PedAttackPlayer(Ricky, 3)
  PedAttackPlayer(Lucky, 3)
  PedAttackPlayer(Norton, 3)
  PedAttackPlayer(Hal, 3)
end


ClintCutscene2 = function()

		if AreaGetVisible() ~= 0 then
			MissionDontFadeIn()
			AreaTransitionXYZ(0, 308.8587, -428.5117, 3.2597)
			PlayerFaceHeadingNow(80, 1)
			Wait(1)
			ClintBike = VehicleCreateXYZ(256, 308.8587, -428.5117, 3.2597)
			VehicleFaceHeading(ClintBike, 80)
			PedPutOnBike(gPlayer, ClintBike)
		else
			DeleteAllMissionPeds()
			AreaTransitionXYZ(0, 308.8587, -428.5117, 3.2597)
			PedStop(gPlayer)
			VehicleStop(ClintBike)
			PlayerStopAllActionControllers()
		end
		PedResetTypeAttitudesToDefault()
		LoadAnimationGroup("NIS_5_02")
		LoadAnimationGroup("NIS_5_03")
		LoadAnimationGroup("NIS_3_R09_D")
		PedSetUniqueModelStatus(24, 1)
		PedSetUniqueModelStatus(28, 1)
		PedSetUniqueModelStatus(26, 1)
		PedSetUniqueModelStatus(29, 1)
		PedSetUniqueModelStatus(22, 1)
		Clint = PedCreatePoint(45, POINTLIST._5_09_Dropout_Contact)
		PedSetPedToTypeAttitude(Clint, 13, 3)
		PedClearAllWeapons(Clint)
		InCutscene = true
		F_InCutscene()
		CameraSetXYZ(310.59, -431.45, 3.98, 309.33, -427.67, 3.68)
		Wait(5)
		PedLockTarget(gPlayer, Clint, 3)
		Wait(2500)
		CameraFade(500, 1)
		Wait(1000)
		SoundPlayScriptedSpeechEvent(Clint, "M_5_09", 10, "large")
		F_WaitForSpeech(Clint)
		PlayerDismountBike()
		PedLockTarget(gPlayer, -1)
		PedMoveToXYZ(Clint, 0, 308.6649, -427.5536, 2.6454)
		repeat
		Wait(0)
		until not PlayerIsInAnyVehicle()
		PedMoveToXYZ(gPlayer, 0, 310.4484, -427.4462, 2.6358)
		Wait(100)
		F_WaitForSpeech(Clint)
		SoundPlayScriptedSpeechEvent(Clint, "M_5_09", 11, "large")
		Wait(1000)
		PedLockTarget(gPlayer, Clint, 3)
		PedFaceObject(gPlayer, Clint, 2, 1)
		PedLockTarget(gPlayer, Clint, 3)
		F_WaitForSpeech(Clint)
		--PedFaceXYZ(Clint, 310.4484, -427.4462, 2.6358)
		PedLockTarget(Clint, gPlayer, 3)
		PedFaceObject(Clint, gPlayer, 2, 1)
		PedLockTarget(Clint, gPlayer, 3)
		CameraSetXYZ(310.79, -426.64, 4.13, 307.50, -428.82, 3.50)
		SoundPlayScriptedSpeechEvent(Clint, "M_5_09", 12, "large")
		Wait(600)
		PedSetActionNode(Clint, "/Global/404Conv/Threaten", "Act/Conv/4_04.act")
		F_WaitForSpeech(Clint)
		local CX, CY, CZ = PedGetPosXYZ(Clint)
		Wait(1)
		PedFaceXYZ(gPlayer, CX, CY, CZ)
		CameraSetXYZ(308.04, -426.27, 4.13, 310.86, -429.08, 3.81)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_5_09", 13, "large")
		F_WaitForSpeech(gPlayer)
		CameraSetXYZ(310.79, -426.64, 4.13, 307.50, -428.82, 3.50)
		SoundPlayScriptedSpeechEvent(Clint, "M_5_09", 14, "large")
		PedSetActionNode(Clint, "/Global/3_R09/Animations/Dropouts/Dropouts02", "Act/Conv/3_R09.act")
		F_WaitForSpeech(Clint)
		SoundPlayScriptedSpeechEvent(Clint, "M_5_09", 15, "large")
		F_WaitForSpeech(Clint)
		CameraSetXYZ(308.04, -426.27, 4.13, 310.86, -429.08, 3.81)
		PedSetActionNode(gPlayer, "/Global/5_03/5_03_NIS_Outro/Jimmy/Jimmy01", "Act/Conv/5_03.act")
		SoundPlayScriptedSpeechEvent(gPlayer, "M_5_09", 16, "large")
		F_WaitForSpeech(gPlayer)
		CameraSetXYZ(310.79, -426.64, 4.13, 307.50, -428.82, 3.50)
		SoundPlayScriptedSpeechEvent(Clint, "M_5_09", 17, "large")
		F_WaitForSpeech(Clint)
		CameraFade(500, 0)
		Wait(501)
		UnLoadAnimationGroup("NIS_5_02")
		UnLoadAnimationGroup("NIS_5_03")
		UnLoadAnimationGroup("NIS_3_R09_D")
		InCutscene = false
		F_InCutscene()
		VehicleDelete(ClintBike)

end

GetPaint = function()

		if AreaGetVisible() ~= 0 then
			MissionDontFadeIn()
			AreaTransitionXYZ(0, 310.4484, -427.4462, 2.6358)
			PedFaceXYZ(gPlayer, 308.6649, -427.5536, 2.6454)
			Clint = PedCreateXYZ(45, 308.6649, -427.5536, 2.6454)
			PedSetPedToTypeAttitude(Clint, 13, 3)
			PedFaceXYZ(Clint, 310.4484, -427.4462, 2.6358)
		end
		Wait(5)
		PedFollowPath(Clint, PATH._5_09_Dropout_Leave, 0, 0)
		CameraReset()
		CameraReturnToPlayer()
		PedLockTarget(gPlayer, -1)
		PedLockTarget(Clint, -1)
		F_CreateGuardDog()
		--F_CreatePaint()
		CreatePersistentEntity("Ladder_5M", 220.6611, -414.2706, 2.3951, 20, 0)
		CreatePersistentEntity("pxLad5M", 220.6611, -414.2706, 2.3951, 15, 0)
		CreatePersistentEntity("Ladder_4M", 227.6784, -416.5531, 2.4025, 17, 0)
		CreatePersistentEntity("pxLad4M", 227.6784, -416.5531, 2.4025, 200, 0)
		CreatePersistentEntity("Ladder_3M", 219.8766, -400.3448, 6.4028, 17, 0)
		CreatePersistentEntity("pxLad3M", 219.8766, -400.3448, 6.4028, 200, 0)
		CreatePersistentEntity("Ladder_4M", 226.6550, -365.9732, 2.6497, 103, 0)
		CreatePersistentEntity("pxLad4M", 226.6550, -365.9732, 2.6497, -79, 0)
		Wait(500)
		CameraFade(500, 1)
		Wait(501)
		TextPrintString("Go get the paint.", 2, 1)
		--CreateThread("T_MonitorDog")

end

F_CreateGuardDog = function()
  Dog = PedCreatePoint(141, POINTLIST._5_06_First_Guard_Dog)
  PedSetIsStealthMissionPed(Dog, true)
  PedSetPedToTypeAttitude(Dog, 13, 0)
  PedOverrideStat(Dog, 14, 100)
  PedOverrideStat(Dog, 6, 0)
  PedOverrideStat(Dog, 7, 0)
  Wait(100)
  PedSetActionNode(Dog, "/Global/5_09/Dog/Sleep", "Act/Conv/5_09.act")
  DogAwake = false
end

F_CreateMeat = function()
  TBone = PickupCreatePoint(397, POINTLIST._5_09_BBQ_MEAT, 1, 0, "PermanentMission")
  ChickenLeg = PickupCreatePoint(346, POINTLIST._5_09_BBQ_MEAT, 2, 0, "PermanentMission")
end

F_CreateDOThugs = function()

		Otto = PedCreatePoint(42, POINTLIST._5_09_Dropout_Thug_01, 1)
		Jerry = PedCreatePoint(41, POINTLIST._5_09_Dropout_Thug_02, 1)
		Leon = PedCreatePoint(43, POINTLIST._5_09_Dropout_Thug_01, 2)
		Gurney = PedCreatePoint(46, POINTLIST._5_09_Dropout_Thug_02, 2)
		PedSetPedToTypeAttitude(Otto, 13, 2)
		PedSetPedToTypeAttitude(Jerry, 13, 2)
		PedSetPedToTypeAttitude(Leon, 13, 2)
		PedSetPedToTypeAttitude(Gurney, 13, 2)

end

F_CreatePaint = function()
  PaintCan = PickupCreatePoint(299, POINTLIST._5_09_PAINT, 0, 0, "PermanentMission") --OG Model deleted
end

T_MonitorDog = function()

		while true do
			if PlayerIsInTrigger(TRIGGER._5_09_DogYard) then
				Wait(1000)
				DogAwake = true
				PedSetActionNode(Dog, "/Global/5_09/Dog/GetUp", "Act/Conv/5_09.act")
				--TextPrintString("DEBUG: Dog is waking up and ready to attack you.", 1, 1)
				PedAttackPlayer(Dog, 2)
			elseif not PlayerIsInTrigger(TRIGGER._5_09_DogYard) then
				if DogAwake then
					--TextPrintString("DEBUG: Dog has lost sight of you and is following path.", 1, 1)
					PedFollowPath(Dog, PATH._5_09_First_Guard_Dog, 0, 0)
				end
			end
		Wait(0)
		end

end


DropOutConfrontation = function()

		Wait(2100)
		CameraFade(500, 0)
		Wait(1501)
		LoadAnimationGroup("NIS_3_R09_J")
		Wait(300)
		if PedIsValid(Clint) then
			PedDelete(Clint)
			PedSetUniqueModelStatus(45, 1)
		end
		F_CreateDOThugs()
		Wait(250)
		AreaTransitionXYZ(0, 228.9842, -369.5971, 2.6335)
		PedFaceXYZ(gPlayer, 229.2437, -371.2637, 2.6307)
		CameraSetXYZ(230.31, -367.56, 4.73, 229.26, -371.34, 3.97)
		InCutscene = true
		F_InCutscene()
		Wait(1400)
		CameraFade(500, 1)
		Wait(500)
		SoundPlayScriptedSpeechEvent(Otto, "M_5_09", 18, "large")
		PedSetActionNode(Otto, "/Global/3_R09/Animations/Player/Jock/Player02", "Act/Conv/3_R09.act")
		F_WaitForSpeech(Otto)
		SoundPlayScriptedSpeechEvent(Jerry, "M_5_09", 19, "large")
		F_WaitForSpeech(Jerry)
		CameraSetXYZ(228.90, -371.85, 4.23, 230.05, -368.05, 3.80)
		PedSetFlag(gPlayer, 11, true)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_5_09", 20, "large")
		F_WaitForSpeech(gPlayer)
		PedSetFlag(gPlayer, 11, false)
		CameraReset()
		CameraReturnToPlayer()
		InCutscene = false
		Wait(1)
		F_InCutscene()
		Wait(1)
		NonMissionPedGenerationDisable()
		PedAttackPlayer(Otto, 3)
		PedAttackPlayer(Jerry, 3)
		PedAttackPlayer(Leon, 3)
		PedAttackPlayer(Gurney, 3)
		repeat
		Wait(0)
		until PedIsDead(Otto) and PedIsDead(Jerry) and PedIsDead(Leon) and PedIsDead(Gurney)
		CameraFade(500, 0)
		Wait(501)
		UnLoadAnimationGroup("NIS_3_R09_J")
		PedSetActionNode(gPlayer, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Act/Anim/Ambient.act")
		InCutscene = true
		F_InCutscene()
		DeleteAllMissionPeds()
		Wait(100)
		Otto = PedCreateXYZ(42, 229.8470, -378.1663, 2.6278)
		Jerry = PedCreateXYZ(41, 230.0172, -378.8155, 2.6278)
		Leon = PedCreateXYZ(43, 230.6624, -377.7062, 2.6278)
		Gurney = PedCreateXYZ(46, 231.1752, -379.6784, 2.6278)
		PedSetPedToTypeAttitude(Otto, 13, 2)
		PedSetPedToTypeAttitude(Jerry, 13, 2)
		PedSetPedToTypeAttitude(Leon, 13, 2)
		PedSetPedToTypeAttitude(Gurney, 13, 2)
		PedClearAllWeapons(Otto)
		PedClearAllWeapons(Jerry)
		PedClearAllWeapons(Leon)
		PedClearAllWeapons(Gurney)
		PedFaceXYZ(Otto, 236.1914, -376.7263, 2.6278)
		PedSetActionNode(Otto, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Act/Anim/Ambient.act")
		PedFaceXYZ(Jerry, 236.1914, -376.7263, 2.6278)
		PedSetActionNode(Jerry, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Act/Anim/Ambient.act")
		PedFaceXYZ(Leon, 236.1914, -376.7263, 2.6278)
		PedSetActionNode(Leon, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Act/Anim/Ambient.act")
		PedFaceXYZ(Gurney, 236.1914, -376.7263, 2.6278)
		PedSetActionNode(Gurney, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Act/Anim/Ambient.act")
		Wait(200)
		CameraSetXYZ(238.61, -378.17, 4.44, 234.81, -377.34, 3.51)
		PlayerSetPosXYZ(236.1914, -376.7263, 2.6278)
		PedStop(gPlayer)
		Wait(250)
		PedFaceXYZ(gPlayer, 229.8470, -378.1663, 2.6278)
		Wait(200)
		CameraFade(500, 1)
		Wait(500)
		SoundPlayScriptedSpeechEvent(Otto, "M_5_09", 21, "large")
		Wait(1200)
		PedMoveToXYZ(Otto, 0, 212.9931, -382.9818, 2.6278)
		Wait(650)
		PedMoveToXYZ(Jerry, 0, 212.9931, -382.9818, 2.6278)
		F_WaitForSpeech(Otto)
		Wait(250)
		PedMoveToXYZ(Leon, 0, 212.9931, -382.9818, 2.6278)
		Wait(150)
		PedMoveToXYZ(Gurney, 0, 212.9931, -382.9818, 2.6278)
		Wait(1000)
		CameraFade(500, 0)
		Wait(500)
		DeleteAllMissionPeds()
		CameraReset()
		CameraReturnToPlayer()
		InCutscene = false
		F_InCutscene()
		Earnest = PedCreatePoint(10, POINTLIST._5_09_Earnest_Outdoors)
		CameraFade(500, 1)
		Wait(500)
		

end

MeetEarnestCutscene = function()

		if AreaGetVisible() ~= 0 then
			MissionDontFadeIn()
			AreaTransitionXYZ(0, 496.1424, -233.6958, 1.9773)
			Earnest = PedCreatePoint(10, POINTLIST._5_09_Earnest_Outdoors)
		end
		TextPrintString("Travel to Bullworth Town City Hall.", 3, 1)
		repeat
		Wait(0)
		until PlayerIsInTrigger(TRIGGER._5_09_Earnest_Outdoors)
		CameraFade(500, 0)
		Wait(501)
		LoadAnimationGroup("NIS_1_09")
		LoadAnimationGroup("NIS_3_R09_N")
		LoadAnimationGroup("NIS_3_R09_D")
		LoadAnimationGroup("NIS_3_04")
		PlayerUnequip()
		if PlayerIsInAnyVehicle() then
			PlayerDismountBike()
			PlayerClearLastVehicle()
		end
		PedFollowPath(Earnest, PATH._5_09_Earnest, 0, 1)
		Wait(500)
		InCutscene = true
		F_InCutscene()
		AreaTransitionXYZ(0, 505.9642, -165.5303, 4.8823)
		--AreaTransitionXYZ(0, 505.6379, -161.3486, 4.9412)
		CameraSetXYZ(501.98, -162.34, 6.51, 504.52, -159.28, 6.15)
		PedMoveToXYZ(gPlayer, 1, 504.8130, -158.0850, 5.1318)
		Wait(100)
		CameraFade(500, 1)
		repeat
		Wait(0)
		until PedIsOnScreen(Earnest)
		SoundPlayScriptedSpeechEvent(Earnest, "M_5_09", 22, "large")
		Wait(1000)
		PedLockTarget(gPlayer, Earnest, 3)
		PedFaceObject(gPlayer, Earnest, 2, 1)
		PedLockTarget(gPlayer, Earnest, 3)
		CameraSetXYZ(505.61, -156.61, 6.61, 504.34, -160.34, 5.96)
		F_WaitForSpeech(Earnest)
		CameraSetXYZ(507.04, -160.87, 6.41, 504.21, -158.05, 6.21)
		PedSetActionNode(gPlayer, "/Global/3_R09/Animations/Player/Nerds/Player01", "Act/Conv/3_R09.act")
		SoundPlayScriptedSpeechEvent(gPlayer, "M_5_09", 23, "large")
		F_WaitForSpeech(gPlayer)
		PedSetActionNode(Earnest, "/Global/3_04/3_04_End/Nerds/Earnest01", "Act/Conv/3_04.act")
		CameraSetXYZ(505.61, -156.61, 6.61, 504.34, -160.34, 5.96)
		SoundPlayScriptedSpeechEvent(Earnest, "M_5_09", 24, "large")
		F_WaitForSpeech(Earnest)
		ExecuteActionNode(gPlayer, "/Global/3_04/3_04_Anim/AlgieOhFace/OhFace", "Act/Conv/3_04.act")
		CameraSetXYZ(507.04, -160.87, 6.41, 504.21, -158.05, 6.21)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_5_09", 25, "large")
		F_WaitForSpeech(gPlayer)
		CameraSetXYZ(505.61, -156.61, 6.61, 504.34, -160.34, 5.96)
		PedSetActionNode(gPlayer, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Act/Anim/Ambient.act")
		SoundPlayScriptedSpeechEvent(Earnest, "M_5_09", 26, "large")
		F_WaitForSpeech(Earnest)
		CameraSetXYZ(507.04, -160.87, 6.41, 504.21, -158.05, 6.21)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_5_09", 27, "large")
		F_WaitForSpeech(gPlayer)
		CameraSetXYZ(505.61, -156.61, 6.61, 504.34, -160.34, 5.96)
		SoundPlayScriptedSpeechEvent(Earnest, "M_5_09", 28, "large")
		Wait(5300)
		CameraSetXYZ(507.04, -160.87, 6.41, 504.21, -158.05, 6.21)
		ExecuteActionNode(gPlayer, "/Global/3_R09/Animations/Player/Dropouts/Dropouts01", "Act/Conv/3_R09.act")
		SoundPlayScriptedSpeechEvent(gPlayer, "M_5_09", 29, "large")
		F_WaitForSpeech(gPlayer)
		CameraSetXYZ(505.61, -156.61, 6.61, 504.34, -160.34, 5.96)
		SoundPlayScriptedSpeechEvent(Earnest, "M_5_09", 30, "large")
		PedSetActionNode(Earnest, "/Global/1_09/NIS/Earnest/Earnest02", "Act/Conv/1_09.act")
		F_WaitForSpeech(Earnest)
		CameraFade(500, 0)
		Wait(501)
		UnLoadAnimationGroup("NIS_1_09")
		UnLoadAnimationGroup("NIS_3_R09_N")
		UnLoadAnimationGroup("NIS_3_R09_D")
		UnLoadAnimationGroup("NIS_3_04")

end

GoToTownHall = function()

		if AreaGetVisible() ~= 0 then
			AreaTransitionXYZ(0, 504.8130, -158.0850, 5.1318)
			Earnest = PedCreateXYZ(10, 505.411987, -160.014008, 5.023990)
		end
		PAnimRequest(TRIGGER._5_09_CITYHALL_TAG)
		F_CreateDaPolice()
		InCutscene = true
		F_InCutscene()
		PedLockTarget(gPlayer, -1)
		PedFaceXYZ(gPlayer, 504.6029, -157.0115, 5.1700)
		CameraReset()
		CameraReturnToPlayer()
		InCutscene = false
		F_InCutscene()
		Wait(500)
		CameraFade(500, 1)
		PedMakeAmbient(Earnest)
		PedWander(Earnest)
		Wait(500)
		TextPrintString("Climb to the top of City Hall.", 3, 1)
		PlayerSetMinPunishmentPoints(200)
		repeat
		Wait(0)
		until PlayerIsInTrigger(TRIGGER._5_09_CITYHALL_GROUNDS)
		TextPrintString("Climb the side entrance wall without being spotted.", 4, 1)
		CreateThread("T_TowerCam")
		cbTagDone(Tags)
		F_CityHallTagsInit()
		--[[PAnimSetActionNode(TRIGGER._5_09_CITYHALL_TAG, "/Global/CityHallTag/BigTag/NotUseable/Tagged/Bull")
		repeat
		Wait(0)
		until PedIsPlaying(gPlayer, "/Global/CityHallTag/BigTag/PedPropsActions/PerformTag/DrawMedTag/ParametricTagging")
		TextPrintString("", 1, 1)
		repeat
		Wait(0)
		until not PedIsPlaying(gPlayer, "/Global/CityHallTag/BigTag/PedPropsActions/PerformTag/DrawMedTag/ParametricTagging")
		TextPrintString("", 1, 1)
		PAnimSetActionNode(TRIGGER._5_09_CityHallTag2, "/Global/CityHallTag/BigTag/NotUseable/Tagged/Worth")
		PAnimCreate(TRIGGER._5_09_CityHallTag2)
		repeat
		Wait(0)
		until PedIsPlaying(gPlayer, "/Global/CityHallTag/BigTag/PedPropsActions/PerformTag/DrawMedTag/ParametricTagging")
		TextPrintString("", 1, 1)
		repeat
		Wait(0)
		until not PedIsPlaying(gPlayer, "/Global/CityHallTag/BigTag/PedPropsActions/PerformTag/DrawMedTag/ParametricTagging")
		PAnimSetActionNode(TRIGGER._5_09_CityHallTag3, "/Global/CityHallTag/BigTag/NotUseable/Tagged/Less")
		PAnimCreate(TRIGGER._5_09_CityHallTag3)
		repeat
		Wait(0)
		until PedIsPlaying(gPlayer, "/Global/CityHallTag/BigTag/PedPropsActions/PerformTag/DrawMedTag/ParametricTagging")
		TextPrintString("", 1, 1)
		repeat
		Wait(0)
		until not PedIsPlaying(gPlayer, "/Global/CityHallTag/BigTag/PedPropsActions/PerformTag/DrawMedTag/ParametricTagging")]]
		repeat
		Wait(0)
		until PlayerIsInTrigger(TRIGGER._5_09_CITYHALLTAG2)
		TextPrintString("Lay a tag on City Hall.", 3, 1)
		repeat
		Wait(0)
		until Done
		CameraFade(1000, 0)
		PlayerSetControl(0)
		Wait(1001)
		PedRequestModel(134)
		InCutscene = true
		F_InCutscene()
		F_GawkersCutscene()

end

T_TowerCam = function()
  local l_44_0 = false
  while true do
    Wait(0)
    if not l_44_0 then
      if PlayerIsInTrigger(TRIGGER._5_09_TOWERTOP) then
        CameraSetSpeed(20, 20, 20)
        CameraLookAtPathSetSpeed(20, 20, 20)
        CameraSetPath(PATH._5_09_TowerCam, false)
        CameraLookAtPath(PATH._5_09_TowerCamLook, false)
        CameraAllowChange(false)
        l_44_0 = true
      end
    elseif not PlayerIsInTrigger(TRIGGER._5_09_TOWERTOP) then
      CameraAllowChange(true)
      CameraReturnToPlayer(false)
      l_44_0 = false
    end
  end
end

F_CreateDaPolice = function()

		Cop1 = PedCreatePoint(238, POINTLIST._5_09_Cityhall_Cop_01)
		PedSetIsStealthMissionPed(Cop1, true)
        PedSetStealthBehavior(Cop1, 1)
		Cop2 = PedCreatePoint(97, POINTLIST._5_09_Cityhall_Cop_02)
		PedSetIsStealthMissionPed(Cop2, true)
        PedSetStealthBehavior(Cop2, 1)
		CopCar1 = VehicleCreatePoint(271, POINTLIST._5_09_Patrol_Car, 1)
		VehicleEnableEngine(CopCar1, true)
		Wait(5)
		VehicleEnableSiren(CopCar1, true)
		Copcar2 = VehicleCreatePoint(271, POINTLIST._5_09_Patrol_Car, 2)
		VehicleEnableEngine(CopCar2, true)
		Wait(5)
		VehicleEnableSiren(CopCar2, true)
		Copcar3 = VehicleCreatePoint(271, POINTLIST._5_09_Patrol_Car, 3)
		VehicleEnableEngine(CopCar3, true)
		Wait(5)
		VehicleEnableSiren(CopCar3, true)

end

F_CityHallTagsInit = function()
	TaggingStartPersistentTag()
  PAnimCreate(TRIGGER._5_09_CityHall_Tag)
end

F_Tag1Ready = function()
if not Tag1 then
return 1
else
return 0
end
end

F_Tag2Ready = function()
if Tag1 then
return 1
else
return 0
end
end

F_Tag3Ready = function()
if Tag1 and Tag2 then
return 1
else
return 0
end
end

cbTagDone = function(CurrentTag)
if CurrentTag == TRIGGER._5_09_CITYHALL_TAG then
Tag1 = true
PAnimSetActionNode(TRIGGER._5_09_CITYHALL_TAG, "/Global/CityHallTag/BigTag/NotUseable/Tagged/Bull")
PAnimCreate(TRIGGER._5_09_CITYHALLTAG2)
elseif CurrentTag == TRIGGER._5_09_CITYHALLTAG2 then
Tag2 = true
PAnimSetActionNode(TRIGGER._5_09_CITYHALL_TAG2, "/Global/CityHallTag/BigTag/NotUseable/Tagged/Worth")
PAnimCreate(TRIGGER._5_09_CITYHALLTAG3)
elseif CurrentTag == TRIGGER._5_09_CITYHALLTAG3 then
PAnimSetActionNode(TRIGGER._5_09_CITYHALL_TAG3, "/Global/CityHallTag/BigTag/NotUseable/Tagged/Less")
Tag3 = true
end
if Tag1 and Tag2 and Tag3 then
Done = true
end
end

F_GawkersCutscene = function()
	PedSetUniqueModelStatus(81, -1)
	PedSetUniqueModelStatus(135, -1)
	PedSetUniqueModelStatus(131, -1)
	PedSetUniqueModelStatus(78, -1)
	PedSetUniqueModelStatus(80, -1)
	PedRequestModel(136)
	--VehicleDelete(CopCar1)
	--VehicleDelete(CopCar2)
  idCop = PedCreatePoint(83, POINTLIST._5_09_COPCAR, 2)
  idCopCar = VehicleCreatePoint(271, POINTLIST._5_09_COPCAR)
  VehicleFollowPath(idCopCar, PATH._5_09_COPCARNISPATH, false, false)
  VehicleEnableSiren(idCopCar, true)
  VehicleSirenAllwaysOn(idCopCar, true)
  PedWarpIntoCar(idCop, idCopCar)
  Gawker1 = PedCreatePoint(81, POINTLIST._5_09_Gawkers, 1)
  Gawker2 = PedCreatePoint(135, POINTLIST._5_09_Gawkers, 2)
  Gawker3 = PedCreatePoint(131, POINTLIST._5_09_Gawkers, 3)
  Gawker4 = PedCreatePoint(78, POINTLIST._5_09_Gawkers, 4)
  Gawker5 = PedCreatePoint(80, POINTLIST._5_09_Gawkers, 5)
  PedSetActionNode(Gawker1, "/Global/5_09/5_09_Cityhall_Cut", "Act/Conv/5_09.act")
  PedSetActionNode(Gawker2, "/Global/5_09/5_09_Cityhall_Cut", "Act/Conv/5_09.act")
  PedSetActionNode(Gawker3, "/Global/5_09/5_09_Cityhall_Cut", "Act/Conv/5_09.act")
  PedSetActionNode(Gawker4, "/Global/5_09/5_09_Cityhall_Cut", "Act/Conv/5_09.act")
  PedSetActionNode(Gawker5, "/Global/5_09/5_09_Cityhall_Cut", "Act/Conv/5_09.act")
  Wait(10)
  CameraFade(500, 1)
  SoundPlayAmbience("MS_5-09_CrowdNIS.rsm", 1)
  SoundSetAudioFocusCamera()
  CameraSetSpeed(12, 12, 12)
  CameraLookAtPathSetSpeed(15, 15, 15)
  CameraLookAtPath(PATH._5_09_AFTERTAGLOOK, true)
  CameraSetPath(PATH._5_09_AFTERTAGCAM, true)
  Wait(8000)
  SoundSetAudioFocusPlayer()
  SoundFadeWithCamera(false)
  MusicFadeWithCamera(false)
  SoundFadeoutAmbience(500)
  CameraFade(500, 0)
  Wait(505)
  CameraSetSpeed(20, 20, 20)
  CameraLookAtPathSetSpeed(20, 20, 20)
  CameraSetPath(PATH._5_09_TowerCam, true)
  CameraLookAtPath(PATH._5_09_TowerCamLook, true)
  CameraFade(500, 1)
  InCutscene = false
  F_InCutscene()
end


TakePicture = function()

		if AreaGetVisible() ~= 0 then
			MissionDontFadeIn()
			AreaTransitionXYZ(0, 650.1437, -92.2088, 32.8784)
			Wait(500)
			PedRequestModel(136)
			CreateThread("T_TowerCam")
			Wait(500)
			CameraFade(500, 1)
		end

		TextPrintString("You tagged City Hall.", 3, 1)
		Wait(3000)
		TextPrintString("Photograph the tag from the street.", 3, 1)
		repeat
		Wait(0)
		until PlayerIsInTrigger(TRIGGER._5_09_CITYHALL_WALL_CLIMBED)
		BWL1, BWL2 = CreatePersistentEntity("DL_BU1d_bWless", 650.22399902344, -90.37809753418, 34.516799926758, 0, 0)
		PAnimDelete(TRIGGER._5_09_CITYHALL_TAG)
		PAnimDelete(TRIGGER._5_09_CITYHALLTAG2)
		PAnimDelete(TRIGGER._5_09_CITYHALLTAG3)
		Rat = PedCreateXYZ(136, 648.1222, -89.8614, 33.3576)
		PedSetEffectedByGravity(Rat, false)
		PedSetStationary(Rat, true)
		PedSetAsleep(Rat, true)
		if PlayerHasItem(426) then
			WeaponSetRangeMultiplier(gPlayer, 426, 4)
		else
			WeaponSetRangeMultiplier(gPlayer, 328, 4)
		end
		CreateThread("T_Photography")
		l_0_47, l_0_46, l_0_45 = GetPointFromPointList(POINTLIST._5_09_CITYHALL_PHOTOOP, 1)
		F_WaitUntilPlayerIsInArea(597.4057, -89.5328, 6.0467, 20)
		PedSetWeaponNow(gPlayer, 404)
		TextPrintString("Take the photo from here.", 3, 1)
		repeat
		Wait(0)
		until PhotoTaken
		PlayerSetPunishmentPoints(0)
		PedSetUniqueModelStatus(81, 1)
		PedSetUniqueModelStatus(135, 1)
		PedSetUniqueModelStatus(131, 1)
		PedSetUniqueModelStatus(78, 1)
		PedSetUniqueModelStatus(80, 1)
		
end

T_Photography = function()

		--[[x1, y1, z1 = GetPointFromPointList(POINTLIST._5_09_CITYHALL_TAG, 1)
		x2, y2, z2 = GetPointFromPointList(POINTLIST._5_09_CITYHALL_TAG, 2)
		x3, y3, z3 = GetPointFromPointList(POINTLIST._5_09_CITYHALL_TAG, 3)
		x4, y4, z4 = GetPointFromPointList(POINTLIST._5_09_CITYHALL_TAG, 4)]]
		X,Y,Z = PedGetPosXYZ(Rat)

		PhotoTaken = false
		ValidTarget = false
		while true do
		if PhotoTargetInFrame(X, Y, Z + 4) then
			--TextPrintString("DEBUG: Photo will be valid.", 1, 1)
			ValidTarget = true
		else
			--TextPrintString("DEBUG: Photo won't be valid.", 1, 1)
		end
		if IsButtonPressed(12, 0) then
			if ValidTarget then
				PhotoSetValid(true, ValidTarget)
				PhotoTaken = true
			else
				PhotoSetValid(true, ValidTarget) --Cheat, lol
				PhotoTaken = true
			end
		end
		Wait(0)
		end
end


ReturnToDorm = function()

		if AreaGetVisible() ~= 0 then
			AreaTransitionXYZ(0, 597.4057, -89.5328, 6.0467)
		else
		PedSetWeaponNow(gPlayer, -1)
		end
		TextPrintString("Return to your dorm room.", 3, 1)
		repeat
		Wait(0)
		until AreaGetVisible() ~= 0
		Pete = PedCreatePoint(134, POINTLIST._5_09_Petey)
		Wait(1)
		PedSetActionNode(Pete, "/Global/5_09/Anims/PeteSit", "Act/Conv/5_09.act")
		repeat
		Wait(0)
		until PlayerIsInTrigger(TRIGGER._5_09_PLAYERS_ROOM)
		InCutscene = true
		F_InCutscene()
		PlayCutsceneWithLoad("5-09B", true, false)
		CameraReset()
		CameraReturnToPlayer()
		Wait(10)
		PlayerSetControl(0)
		PlayerSetPosPoint(POINTLIST._5_09_ENDPOINT, 1)
		PlayerSetControl(0)
		CameraSetXYZ(-496.31378173828, 312.60037231445, 32.444271087646, -495.61215209961, 311.88793945313, 32.43293762207)
		CameraSetWidescreen(true)
		SoundStopStream()
		Wait(500)
		CameraFade(500, 1)
		Wait(501)
		MinigameSetCompletion("M_PASS", true, 0)
		MinigameAddCompletionMsg("MRESPECT_NM75", 1)
		MinigameAddCompletionMsg("MRESPECT_PM75", 1)
		MinigameAddCompletionMsg("MRESPECT_GM75", 1)
		MinigameAddCompletionMsg("MRESPECT_JM75", 1)
		SoundPlayMissionEndMusic(true, 10)
		SetFactionRespect(1, 25)
		SetFactionRespect(5, 25)
		SetFactionRespect(4, 25)
		SetFactionRespect(2, 25)
		SetFactionRespect(3, 25)
		repeat
		Wait(0)
		until not MinigameIsShowingCompletion()
		CameraFade(500, 0)

end

--Other Custom functions
F_InCutscene = function()

		if InCutscene then
			DoublePedShadowDistance(true)
			PedSetWeaponNow(gPlayer, -1, 0)
			SoundDisableSpeech_ActionTree()
			PlayerSetControl(0)
			PedStop(gPlayer)
			NonMissionPedGenerationDisable()
			ToggleHUDComponentVisibility(0, false)
			ToggleHUDComponentVisibility(4, false)
			ToggleHUDComponentVisibility(5, false)
			ToggleHUDComponentVisibility(11, false)
			EnterNIS()
		end
		if not InCutscene then
			DoublePedShadowDistance(false)
			ToggleHUDComponentVisibility(5, true)
			SoundEnableSpeech_ActionTree()
			ExitNIS()
			PlayerSetControl(1)
			NonMissionPedGenerationEnable()
		end

end

F_WaitForSpeech = function(talkingped)

		repeat
		Wait(0)
		if SkipDialogue then
			break
		end
		until not SoundSpeechPlaying(talkingped)

end

F_WaitUntilPlayerIsInArea = function(X, Y, Z, Ra)

		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(X, Y, Z, Ra, 0)

end