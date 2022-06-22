--[[The Setup
	Special Thanks to deadpoolXYZ
]]


--Settings--
SkipDialogue = false
DebugOn = false -- Prints Debug text
DebugStartStage = 1
DebugTestStuff = false -- Depends on a Script-By-Script casis. Used for testing quotes
TroyFight = true -- Read video description for context

MissionSetup = function()

		ClockSet(12, 31)
		PauseGameClock()
		DisablePunishmentSystem(true)
		PlayerSetPunishmentPoints(0)
		F_ToggleHUDElements(false)
		MissionDontFadeIn()
		MissionSurpressMissionNameText()
		SoundPlayInteractiveStream('MS_BikeChaseLow.rsm', MUSIC_DEFAULT_VOLUME)
		SoundSetMidIntensityStream('MS_BikeChaseMid.rsm', 0.6)
		SoundSetHighIntensityStream('MS_BikeChaseHigh.rsm', 0.6)
		--SoundDisableSpeech_ActionTree()
		DATLoad('1_03.DAT', 2)
		DATLoad('tschool_garagedoors.DAT', 2)
		DATLoad('tbarrels.DAT', 2)
		DATInit()
		AnimGroupsTable = {'NPC_GENERIC', 'NPC_AggroTaunt', '1_03The Setup', 'NIS_1_03' ,'POI_Smoking', 'Hang_Talking', 'GEN_Social', 'Cheer_Cool2', 'NPC_Adult', 'TSGate', 'SCgrdoor', 'Sbarels1', 'Area_School', 'Px_Rail', 'DO_Grap'}
		ActTreeTable = {'SBarels1', 'barrelLad', '1_03', '1_03_Davis'}
		for i, AnimGroup in AnimGroupsTable do
			LoadAnimationGroup(AnimGroup)
		end
		for i, ActTree in ActTreeTable do
			LoadActionTree(ActTree..'.act')
		end
		F_SetCharacterModelsUnique(true, {99, 85, 102, 145, 146, 147})
		CharModels = {85, 102, 134, 145, 146, 147}
		LoadModels(CharModels)
		--WeapModels = {281, 289, 293, 340}
		--LoadModels(WeapModels)
		--LoadWeaponModels({281, 289, 293})
		SoundMusicJimmyComeToTheOfficePA(false)
		F_RainBeGone()

end

main = function()

		if DebugOn then
			if DebugStartStage == 1 then
				SchoolChase()
				if DebugTestStuff then
					DEBUG_QuoteTest()
				end
			end
			if DebugStartStage == 2 then
				AreaTransitionXYZ(0, 159.24, -94.78, 7.50)
				Davis = PedCreateXYZ(99, 152.39, -92.00, 6.37)
				SetupDavis()
				CameraFade(500, 1)
				OutsideChase()
			end
			if DebugStartStage == 3 then
				AreaTransitionPoint(0, POINTLIST._1_03_BULLY4)
				CameraFade(500, 1)
				Davis = PedCreatePoint(99, POINTLIST._1_03_BARRELSTOP)
				OutsideSetup()
				FinalBoss()
			end
		else
			SchoolChase()
		end

end

MissionCleanup = function()

		for i, AnimGroup in AnimGroupsTable do
			UnloadAnimationGroup(AnimGroup)
		end
		DATUnload(2)
		F_SetCharacterModelsUnique(false, {99, 85, 102, 145, 146, 147})
		AreaSetNodesSwitchedOffInTrigger(TRIGGER._1_03_AUTOSHOPAREA, false)
		AreaDeactivatePopulationTrigger(TRIGGER._1_03_AUTOSHOPAREA)
		AreaActivatePopulationTrigger(TRIGGER._GREASERS)
		AreaSetPathableInRadius(134.7, 27.6, 6.1, 0.2, 10, true)
		EnablePOI()
		AreaRevertToDefaultPopulation()
		WeatherRelease()
		shared.gTurnOff_SGD_PREFECT3 = false
		shared.gTurnOff_HALLSPATROL_1C = false
		F_ToggleHUDElements(true)
		DisablePunishmentSystem(false)

end

function DEBUG_QuoteTest()

		AudioNum = 0
		StopPedProduction(true)
		while true do
			F_DebugText('DEBUG Controller Inputs:\n~dleft~ and ~dright~ to cycle!\n~x~ to play!', 1, 2)
			TextPrintString('Current AudioNum: '..AudioNum, 1, 1)
			if F_IsButtonPressedWithDelayCheck(0, 1) then
				AudioNum = AudioNum - 1
				if AudioNum <= 0 then
					AudioNum = 0
				end
			end
			if F_IsButtonPressedWithDelayCheck(1, 1) then
				AudioNum = AudioNum + 1
			end
			if IsButtonPressed(7, 1) then
				SoundPlayScriptedSpeechEvent(PedGetTargetPed(gPlayer), 'M_1_03', AudioNum, 'jumbo')
			end
		Wait(0)
		end

end

SchoolChase = function()

		LoadWeaponModels({281})
		Davis = PedCreateXYZ(99, -640.81, -299.01, 5.50)
		PedFaceXYZ(Davis, -639.20, -299.06, 5.50)
		SetupDavis()
		AreaTransitionXYZ(2, -652.74, -296.78, 5.50, true)
		shared.gTurnOff_HALLSPATROL_1C = true
		F_PedFaceAnotherPed(gPlayer, Davis)
		CameraReturnToPlayer()
		CameraFade(500, 1)
		if not DebugTestStuff then
			TextPrint('1_03_INSTRUC02', 6, 1)
			F_DebugText('Spawn Setup Done!', 1, 1, 1000)
			PedMoveToXYZ(Davis, 2, -652.281982, -296.928986, 0.028509)
			SoundPlayScriptedSpeechEvent(Davis, 'M_1_03', 5, 'jumbo')
			F_DebugText('Davis should be moving!', 1, 1)
			repeat
			AreaClearPatrolPaths()
			Wait(0)
			until PedIsInAreaXYZ(Davis, -652.281982, -296.928986, 0.028509, 0.5, 0)
			PedClearObjectives(Davis)
			PedFollowPath(Davis, PATH._1_03_AlternateSchoolFlee, 0, 3)
			F_DebugText('Davis should go outside now!', 1, 1)
			repeat
			Wait(0)
			until PedIsInAreaXYZ(Davis, -661.010986, -281.187988, 0.000000, 1, 0)
			PedSetPosXYZ(Davis, 152.39, -92.00, 6.37)

			repeat
			Wait(0)
			until AreaGetVisible() == 0
			OutsideChase()
		end

end

function SetupDavis()

		PedSetInfiniteSprint(Davis, true)
		PedSetInvulnerable(Davis, true)
		PedIgnoreStimuli(Davis, true)
		PedSetMinHealth(Davis, 10)
		PedSetActionTree(Davis, '/Global/1_03_Davis/Default_KEY', '1_03_Davis.act')
		PedLockTarget(Davis, gPlayer, 3)
		PedSetFocus(Davis, gPlayer)
		PedOverrideStat(Davis, 1, 0)
		PedOverrideStat(Davis, 10, 90)
		PedOverrideStat(Davis, 11, 70)
		PedAddPedToIgnoreList(Davis, gPlayer)
		PedIgnoreAttacks(Davis, true)

end

OutsideChase = function()

		OutsideSetup()
		Peter = PedCreatePoint(134, POINTLIST._1_03_PETER)
		PedSetActionNode(Peter, '/Global/1_03/animations/PeterFistShake/Init', '1_03.act')
		PedFollowPath(Davis, PATH._1_03_FLEETOFOUNTAIN, 0, 3)
		F_DebugText('Davis should run towards Pete!', 1, 1)
		SoundPlayScriptedSpeechEvent(Davis, 'M_1_03', 5, 'jumbo')
		repeat
		Wait(0)
		until PedIsInAreaXYZ(Davis, 137.039993, -76.693901, 6.547210, 1.2, 0)
		F_DebugText('Davis should attack Pete!', 1, 1)
		PedSetActionNode(Davis, '/Global/1_03/animations/DavisShoulder/ShoulderSlam', '1_03.act')
		PedSetActionNode(Peter, '/Global/1_03/animations/PeterFistShake/PeterHit', '1_03.act')
		Wait(900)
		PedSetActionNode(Peter, '/Global/1_03/animations/PeterFistShake/FistShakeEnd', '1_03.act')
		PAnimSetActionNode(TRIGGER._TSCHOOL_AUTOSHOPFGATE, '/Global/1_03/ParametricDoor/POpenSide/Base', '1_03.act')
		PedWander(Peter, 0)
		PedMakeAmbient(Peter)
		F_DebugText('Davis should have attacked Pete!', 1, 1)
		repeat
		Wait(0)
		until not PedIsOnScreen(Peter)
		PedDelete(Peter)
		F_WaitUntilPlayerIsInArea(107.28, -64.69, 7.36, 3)
		F_DebugText('Triggering NIS 1!', 1, 1)

		NISWithWade()

end

function OutsideSetup()

		PAnimCreate(TRIGGER._1_03_BARELLAD)
		PAnimMakeTargetable(TRIGGER._1_03_BARELLAD, false)
		bLadderCreated = true
		PAnimCreate(TRIGGER._TBARRELS_SBARELS1)
		PAnimMakeTargetable(TRIGGER._TBARRELS_SBARELS1, false)
		shared.gTurnOff_SGD_PREFECT3 = true
		DisablePOI(true, true)
		AreaOverridePopulationPedType(11, 0)
		AreaActivatePopulationTrigger(TRIGGER._1_03_AUTOSHOPAREA)
		AreaDeactivatePopulationTrigger(TRIGGER._GREASERS)
		AreaSetNodesSwitchedOffInTrigger(TRIGGER._1_03_AUTOSHOPAREA, true)
		F_DebugText('Outside Setup Done!', 1, 1, 100)
		collectgarbage()
		F_DebugText('Garbage collected!', 1, 1, 100)
		SetupDoors()
		F_DebugText('Doors Created!', 1, 1, 100)
		CreateGarbageCans()
		F_DebugText('GarbCans Created!', 1, 1, 100)
		CreateWeaponPickups()
		F_DebugText('Weapon Pickups Created!', 1, 1, 100)
		CreateRespawnableBricks()
		F_DebugText('Respawnable Bricks Created!', 1, 1, 100)
		PickupSetIgnoreRespawnDistance(true)

end

function SetupDoors()

  TableDoors = {
    AutoShopGate = {
      ID = TRIGGER._TSCHOOL_AUTOSHOPFGATE,
      OpenAction = '/Global/1_03/ParametricDoor/POpenSide/Base',
    },
    Garage2 = {
      ID = TRIGGER._SCGRDOOR01,
      OpenAction = '/Global/1_03/ParametricDoor/POpenUp/Base',
    },
    Garage3 = {
      ID = TRIGGER._SCGRDOOR02,
      OpenAction = '/Global/1_03/ParametricDoor/POpenUp/BaseWithCollissionOn',
    }
  }

	PAnimCreate(TRIGGER._SCGRDOOR)
	if not TroyFight then
		PAnimCloseDoor(TRIGGER._SCGRDOOR)
		AreaSetDoorLockedToPeds(TRIGGER._SCGRDOOR, true)
		AreaSetDoorPathableToPeds(TRIGGER._SCGRDOOR, false)
	else
		PAnimSetActionNode(TRIGGER._SCGRDOOR, '/Global/1_03/ParametricDoor/POpenUp/Base', '1_03.act')
	end
	for i, Door in TableDoors do
		PAnimCreate(Door.ID)
		PAnimSetActionNode(Door.ID, Door.OpenAction, '1_03.act')
	end

end

function CreateGarbageCans()

		TableGarbCans = {TRIGGER._1_03_GARBAGECAN02, TRIGGER._1_03_GARBAGECAN05, TRIGGER._1_03_GARBAGECAN06, TRIGGER._1_03_GARBAGECAN07}
		for i, GarbCan in TableGarbCans do
			PAnimCreate(GarbCan)
			PAnimMakeTargetable(GarbCan, false)
		end

end

function CreateWeaponPickups()

		TableWeapons = {POINTLIST._1_03_TCLID02, POINTLIST._1_03_TCLID04, POINTLIST._1_03_TCLID05, POINTLIST._1_03_TCLID06}
		for i, Weapon in TableWeapons do
			X, Y, Z = GetPointFromPointList(Weapon, 1)
			PickupCreateXYZ(293, X, Y, Z, 'PermanentMission')
		end

end

function CreateRespawnableBricks()

		for i = 1, 3 do
			X, Y, Z = GetPointFromPointList(POINTLIST._1_03_PICKUPBRICKS, i)
			PickupCreateXYZ(289, X, Y, Z, 'BrickBute')
		end

end

NISWithWade = function()

		CameraFade(500, 0)
		Wait(500)
		InCutscene = true
		F_InCutscene()
		if not PedIsInAreaXYZ(Davis, 105.706001, -39.777500, 5.744980, 0.5, 0) then
			PedSetPosXYZ(Davis, 105.706001, -39.777500, 5.744980)
		end
		Wade = PedCreatePoint(146, POINTLIST._1_03_BULLY1)
		Wait(50)
		F_PedSetDropItem(Wade, 340)
		F_PedFaceAnotherPed(Davis, Wade)
		CameraSetXYZ(106.67, -42.41, 7.21, 106.10, -38.52, 6.53)
		Wait(500)
		CameraFade(500, 1)
		PedSetActionNode(Davis, '/Global/1_03/Conv/DavisLine', '1_03.act')
		F_WaitForSpeech(Davis)
		PedSetActionNode(Wade, '/Global/1_03/Conv/WadeLaugh', '1_03.act')
		CameraSetXYZ(103.87, -40.40, 7.05, 107.82, -40.89, 6.68)
		F_PlaySpeechAndWait(Wade, 'LAUGH_FRIENDLY', 0, 'jumbo', false, true) -- Can press Cross/A anytime during speech to skip if last arg is true
		PedSetActionNode(Davis, '/Global/1_03/animations/DavisBrag/caught', '1_03.act')
		CameraSetXYZ(106.32, -38.63, 7.06, 105.89, -42.60, 7.00)
		PedMoveToXYZ(gPlayer, 1, 105.23, -54.96, 5.69)
		--Missing Davis Audio--
		Wait(1150)
		PedSetActionNode(Wade, '/Global/1_03/Conv/WadeResponse', '1_03.act')
		F_WaitForSpeech(Wade)
		SoundPlayScriptedSpeechEvent(gPlayer, 'M_1_03', 4, 'jumbo')
		PedFaceObject(Wade, -1)
		InCutscene = false
		F_InCutscene()
		
		AutoShopStage()

end

AutoShopStage = function()

		CameraReturnToPlayer()
		PedAttackPlayer(Wade)
		SoundPlayInteractiveStreamLocked('MS_BikeChaseHigh.rsm', 0.6)
		PedSetActionNode(Davis, '/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode', 'Ambient.act')
		Wait(10)
		PedFollowPath(Davis, PATH._1_03_FLEEFROMFOUNTAIN, 0, 3, cbDoneFleeFountain)
		Wait(500)
		F_DebugText('Gate should close now!', 1, 1)
		PAnimSetActionNode(TRIGGER._TSCHOOL_AUTOSHOPFGATE, '/Global/1_03/ParametricDoor/POpenSide/Close', '1_03.act')
		while not PlayerIsInTrigger(TRIGGER._1_03_DAVISRUN) do
		Wait(0)
		end
		SoundPlayScriptedSpeechEvent(Davis, 'M_1_03', 5, 'jumbo')
		if TroyFight then
			F_DebugText('TroyFight detected!', 1, 1)
			PedMoveToXYZ(Davis, 3, 121.21, -13.08, 6.24)
			repeat
			Wait(0)
			until PedIsInAreaXYZ(Davis, 115.73, -9.58, 6.22, 3, 0)
			F_DebugText('Closing the damn door!', 1, 1)
			PAnimSetActionNode(TRIGGER._SCGRDOOR, '/Global/1_03/ParametricDoor/POpenUp/Close', '1_03.act')
			Troy = PedCreateXYZ(102, 120.04, -9.72, 6.22)
			F_WaitUntilPlayerIsInArea(112.84, -9.68, 6.21, 1)
			F_PedFaceAnotherPed(Davis, gPlayer)
			F_PedFaceAnotherPed(Troy, gPlayer)
			repeat
			Wait(0)
			until IsButtonPressed(9, 0)
			Wait(1000)
			F_DebugText('Garage open, Troy attack, Davis run!', 1, 1)
			SoundPlayScriptedSpeechEvent(Davis, 'M_1_03', 31, 'jumbo')
			PedFollowPath(Davis, PATH._1_03_FLEETOGARAGE, 0, 3)
			PedAttackPlayer(Troy, gPlayer)
			repeat
			Wait(0)
			until PedGetHealth(Troy) <= 0
		else
			PedFollowPath(Davis, PATH._1_03_FLEETOGARAGE, 0, 3)
		end
		Trent = PedCreatePoint(85, POINTLIST._1_03_BULLY3)
		while not PlayerIsInTrigger(TRIGGER._1_03_FIGHT3) do
		Wait(0)
		end
		PedSetPosPoint(Davis, POINTLIST._1_03_DAVISINGARAGE)
		F_DebugText('Garage close, Trent attack, Ethan spawned!', 1, 1)
		SoundPlayScriptedSpeechEvent(Davis, 'M_1_03', 32, 'jumbo')
		PedAttackPlayer(Trent)
		PAnimSetActionNode(TRIGGER._SCGRDOOR01, '/Global/1_03/ParametricDoor/POpenUp/Close', '1_03.act')
		Ethan = PedCreatePoint(145, POINTLIST._1_03_BULLY4)
		F_WaitUntilPlayerIsInArea(118.00, 3.69, 6.12, 0.9)
		repeat
		Wait(0)
		until IsButtonPressed(9, 0)
		Wait(1100)
		F_DebugText('Garage has been opened, Ethan attack, Davis run, other garage close!', 1, 1)
		Wait(10)
		PedAttackPlayer(Ethan)
		SoundPlayScriptedSpeechEvent(Davis, 'M_1_03', 33, 'jumbo')
		PedFollowPath(Davis, PATH._1_03_FLEEGARAGE, 0, 2)
		Wait(500)
		PAnimSetActionNode(TRIGGER._SCGRDOOR02, '/Global/1_03/ParametricDoor/POpenUp/Close', '1_03.act')
		repeat
		Wait(0)
		until PedIsDead(Ethan)
		
		FinalBoss()

end

FinalBoss = function()

		Wade = PedCreatePoint(146, POINTLIST._1_03_GUARD1)
		Tom = PedCreatePoint(147, POINTLIST._1_03_GUARD2)
		PedClearObjectives(Davis)
		PedSetPosPoint(Davis, POINTLIST._1_03_BARRELSTOP)
		PedFaceHeading(Davis, 180, 0)
		PAnimSetActionNode(TRIGGER._TBARRELS_SBARELS1, '/Global/sbarels1/InitCollisionOn', 'Act/Props/SBarels1.act')
		PAnimMakeTargetable(TRIGGER._TBARRELS_SBARELS1, false)
		F_WaitUntilPlayerIsInArea(124.01, 12.28, 6.10, 1.3)
		repeat
		Wait(0)
		until IsButtonPressed(9, 0)
		Wait(1100)
		CreateThread('T_Taunt')
		T_KickLadder = CreateThread('T_KickLadder')
		SoundPlayScriptedSpeechEvent(Davis, 'M_1_03', 22, 'jumbo')
		F_DebugText('Last garage has been opened, Tom & Wade attack, Davis Setup!', 1, 1)
		PedAttackPlayer(Wade)
		PedAttackPlayer(Tom)
		PAnimSetActionNode(TRIGGER._SCGRDOOR01, '/Global/1_03/ParametricDoor/POpenUp/Close/Closing/NotUseable/propClosed', '1_03.act')
		AreaSetDoorLockedToPeds(TRIGGER._SCGRDOOR01, true)
		AreaSetDoorPathableToPeds(TRIGGER._SCGRDOOR01, false)
		AreaSetDoorLockedToPeds(TRIGGER._SCGRDOOR02, false)
		AreaSetDoorPathableToPeds(TRIGGER._SCGRDOOR02, true)
		Wait(10)
		repeat
		Wait(0)
		until (PedGetHealth(Wade) <= 0 and PedGetHealth(Tom) <= 0)
		PedSetMinHealth(Davis, 0)
		PedSetInvulnerable(Davis, false)
		PedSetTetherToPoint(Davis, POINTLIST._1_03_BARRELSTOP, 1, 1)
        PedSetWeapon(Davis, 281, 6)
        PedSetFlag(Davis, 21, false)
        PedCoverSet(Davis, gPlayer, POINTLIST._1_03_BARRELSTOP, 1, 20, 1, 0, 0, 2, 1, 0, 0, 1, 1, true)
		PedShowHealthBar(Davis, true, 'N_DAVIS', true)
		repeat
		Wait(0)
		until PedGetHealth(Davis) <= 0

		FinalNIS()

end

T_Taunt = function()

		repeat
			Wait(7000)
			if not InCutscene then
				if not (PedIsDead(Wade) and PedIsDead(Tom)) then
					F_DebugText('Davis Not Scared Quote!', 3, 1)
					QuotePosRNG = math.random(2)
					if QuotePosRNG == 1 then
						SoundPlayScriptedSpeechEvent(Davis, 'M_1_03', 21, 'jumbo')
					elseif QuotePosRNG == 2 then
						SoundPlayScriptedSpeechEvent(Davis, 'M_1_03', 23, 'jumbo')
					end
				elseif (PedIsDead(Wade) and PedIsDead(Tom)) then
					F_DebugText('Davis Scared Quote!', 3, 1)
					QuoteNegRNG = math.random(2)
					if QuoteNegRNG == 1 then
						SoundPlayScriptedSpeechEvent(Davis, 'M_1_03', 41, 'jumbo')
					elseif QuoteNegRNG == 2 then
						SoundPlayScriptedSpeechEvent(Davis, 'M_1_03', 42, 'jumbo')
					end
				end
			end
		Wait(0)
		until InCutscene

		--[[F_DebugText('Davis Now Scared!', 1, 1)

		repeat
			Wait(7000)
			F_DebugText('Davis Scared Quote!', 3, 1)
			QuoteNegRNG = math.random(2)
			if QuoteNegRNG == 1 then
				SoundPlayScriptedSpeechEvent(Davis, 'M_1_03', 41, 'jumbo')
			elseif QuoteNegRNG == 2 then
				SoundPlayScriptedSpeechEvent(Davis, 'M_1_03', 42, 'jumbo')
			end
		Wait(0)
		until InCutscene]]
		TerminateThread(T_KickLadder)

end

T_KickLadder = function()

		while not PlayerIsInTrigger(TRIGGER._1_03_LADDER_DROP) do
		Wait(0)
		end
		F_DebugText('Davis should kick ladder and talk!', 1, 1)
		if SoundSpeechPlaying(Davis) then
			SoundStopCurrentSpeechEvent(Davis)
		end
		SoundPlayScriptedSpeechEvent(Davis, 'M_1_03', 8, 'jumbo')
		PedSetActionNode(Davis, '/Global/1_03/animations/DavisKickLadder', '1_03.act')
		PAnimSetActionNode(TRIGGER._1_03_BARELLAD, '/Global/BarellLadder/Destroyed', 'barrelLad.act')
		DavisKickedLadder = true

end

FinalNIS = function()

	InCutscene = true
	F_InCutscene()
	MusicFadeWithCamera(false)
	CameraSetFOV(90)
	CameraSetXYZ(127.90819, 24.97325, 7.055124, 128.21823, 25.78979, 7.541829)
	CameraLookAtObject(Davis, 2, true)
	PedSetPosPoint(Davis, POINTLIST._1_03_DAVISFALLFROM)
	PedClearTether(Davis)
	PedStop(Davis)
	X, Y, Z = GetPointFromPointList(POINTLIST._1_03_OFFBARRELS, 1)
	PedFaceXYZ(Davis, X, Y, Z, 0)
	if not DavisKickedLadder then
		PAnimSetActionNode(TRIGGER._1_03_BARELLAD, '/Global/BarellLadder/Destroyed', 'barrelLad.act')
	end
	if SoundSpeechPlaying(Davis) then
		SoundStopCurrentSpeechEvent(Davis)
	end
	SoundPlayScriptedSpeechEvent(Davis, 'M_1_03', 11, 'supersize')
	PedSetActionNode(Davis, '/Global/1_03/animations/FallOffBarrels/NewFall', '1_03.act')
	PAnimSetActionNode(TRIGGER._TBARRELS_SBARELS1, '/Global/sbarels1/Rumble', 'SBarels1.act')
	Wait(1000)
	PAnimSetActionNode(TRIGGER._TBARRELS_SBARELS1, '/Global/sbarels1/Destroy', 'SBarels1.act')
	Wait(2500)
	CameraFade(500, 0)
	Wait(750)
	PAnimSetActionNode(TRIGGER._SCGRDOOR01, '/Global/1_03/ParametricDoor/POpenUp/Base', '1_03.act')
	DeleteAllMissionPeds()
	SoundStopInteractiveStream(0)
	DavisNIS = PedCreatePoint(99, POINTLIST._1_03_PLAYERCS2)
	PedSetHealth(DavisNIS, 5)
	Wait(10)
	CameraDefaultFOV()
	CameraReturnToPlayer()
	CameraReset()
	PlayerSetPosSimple(130.22, 23.53, 6.09)
	Wait(10)
	F_PedFaceAnotherPed(gPlayer, DavisNIS)
	CameraSetXYZ(128.64, 24.82, 6.50, 131.44, 27.59, 7.17)
	Wait(700)
	PedSetActionNode(DavisNIS, '/Global/1_03/animations/FallOffBarrels/Bobble/FallOff/GetUp', '1_03.act')
	Wait(100)
	PedLockTarget(DavisNIS, gPlayer, 3)
	CameraFade(500, 1)
	F_PlaySpeechAndWait(DavisNIS, 'M_1_03', 12, 'supersize', false, true)
	CameraSetXYZ(132.04, 27.67, 7.60, 129.53, 24.60, 7.10)
	PedSetActionNode(gPlayer, '/Global/2_08Conv/ComeOn', '2_08.act')
	PedSetActionNode(DavisNIS, '/Global/6_02/BeScared/React1', '6_02.act')
	F_PlaySpeechAndWait(gPlayer, 'M_1_03', 13, 'supersize', false, true)
	CameraSetXYZ(127.60, 21.60, 7.60, 129.96, 24.85, 7.11)
	PedMoveToXYZ(DavisNIS, 3, 110.14, 1.27, 6.12)
	PickupCreateXYZ(281, 130.294998, 26.771400, 6.097920)
	F_PlaySpeechAndWait(DavisNIS, 'M_1_03', 14, 'supersize', false, true)
	repeat
	Wait(0)
	until not PedIsOnScreen(DavisNIS)
	--CameraSetXYZ(130.32, 24.70, 7.60, 128.16, 21.36, 7.14)
	--Wait(2000)
	PedMoveToXYZ(gPlayer, 0, 130.38, 25.62, 6.09)
	Wait(1550)
	SoundPlayScriptedSpeechEvent(gPlayer, 'M_1_03', 15, 'supersize')
	CameraSetXYZ(131.01, 25.36, 7.30, 128.23, 22.58, 7.97)
	CameraSetFOV(CameraGetFOV() - 5)
	PedSetActionNode(gPlayer, '/Global/1_03/animations/PlayerPickupSlingshot', '1_03.act')
	Wait(1000)
	PickupRemoveAll(281)
	PedSetActionNode(gPlayer, '/Global/NLockA/Unlocked/Default', 'NLockA.act')
	F_WaitForSpeech(gPlayer)
	PedSetActionNode(gPlayer, '/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode', 'Ambient.act')
	PedMoveToXYZ(gPlayer, 0, 110.14, 1.27, 6.12)
	CameraSetXYZ(141.82, 30.48, 7.60, 138.10, 29.02, 7.38)
	CameraDefaultFOV()
	PedSetWeaponNow(gPlayer, -1)
	F_PlaySpeechAndWait(gPlayer, 'M_1_03', 16, 'supersize', true, false)
	SoundPlayMissionEndMusic(true, 8)
	MinigameSetCompletion('M_PASS', true, 0, '1_03_SLINGSHOT')
	Wait(500)
	MinigameAddCompletionMsg('MRESPECT_BM5', 1)
	Wait(4000)
	while MinigameIsFadingCompletion() do
	Wait(0)
	end
	CameraFade(500, 0)
	Wait(501)
	MusicFadeWithCamera(true)

end

--Other custom functions
F_ToggleHUDElements = function(Boolean)

		ToggleHUDComponentVisibility(0, Boolean)
		ToggleHUDComponentVisibility(4, Boolean)
		ToggleHUDComponentVisibility(11, Boolean)
		--ToggleHUDComponentVisibility(40, Boolean)
		--ToggleHUDComponentVisibility(45, Boolean)

end

F_DebugText = function(InputText, Seconds, Type, WaitTime)

		if DebugOn then
			TextPrintString('-DEBUG-\n'..InputText, Seconds, Type)
			if WaitTime then
				Wait(WaitTime)
			end
		end

end

F_InCutscene = function()

		if InCutscene then
			SoundSetAudioFocusCamera()
			DoublePedShadowDistance(true)
			PedSetWeaponNow(gPlayer, -1, 0)
			SoundDisableSpeech_ActionTree()
			PlayerSetControl(0)
			PedStop(gPlayer)
			StopPedProduction(true)
			ToggleHUDComponentVisibility(0, false)
			ToggleHUDComponentVisibility(4, false)
			ToggleHUDComponentVisibility(5, false)
			ToggleHUDComponentVisibility(11, false)
			EnterNIS()
		end
		if not InCutscene then
			CameraReset()
			CameraReturnToPlayer()
			PedSetActionNode(gPlayer, '/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode', 'Ambient.act')
			SoundSetAudioFocusPlayer()
			DoublePedShadowDistance(false)
			ToggleHUDComponentVisibility(5, true)
			SoundEnableSpeech_ActionTree()
			ExitNIS()
			PlayerSetControl(1)
			StopPedProduction(false)
		end

end

F_WaitForSpeech = function(TalkingPed)

		repeat
		Wait(0)
		if SkipDialogue then
			SoundStopCurrentSpeechEvent(TalkingPed)
			break
		end
		until not SoundSpeechPlaying(TalkingPed)

end

F_WaitUntilPlayerIsInArea = function(X, Y, Z, Ra)

		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(X, Y, Z, Ra, 0)

end

F_PedFaceAnotherPed = function(Ped1, Ped2)

		Px2, Py2, Pz2 = PedGetPosXYZ(Ped2)
		PedFaceXYZ(Ped1, Px2, Py2, Pz2)

end
