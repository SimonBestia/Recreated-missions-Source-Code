ImportScript("Library/LibTagging.lua")
PedSetUniqueModelStatus(7, -1)
PedSetUniqueModelStatus(14, -1)

F_TableStuff = function()
tblSchoolTags = {
    {
      id = TRIGGER._4_G4_SCHOOLTAG2,
      poster = TRIGGER._4_G4_SCHOOLPOSTER02,
      bCheckTag = true,
      tagName = "SchoolTagEntranceA",
      startNode = "/Global/TagSmall/Useable",
      startFile = "TagSmall.act"
    },
	{
      id = TRIGGER._4_G4_SCHOOLTAG1,
      poster = TRIGGER._4_G4_SCHOOLPOSTER01,
      bCheckTag = true,
      tagName = "SchoolTagGym",
      startNode = "/Global/TagSmall/Useable",
      startFile = "TagSmall.act"
    },
	{
      id = TRIGGER._4_G4_SCHOOLTAG5,
      poster = TRIGGER._4_G4_SCHOOLPOSTER05,
      bCheckTag = true,
      tagName = "SchoolTagGym",
      startNode = "/Global/TagSmall/Useable",
      startFile = "TagSmall.act"
    },
    {
      id = TRIGGER._4_G4_SCHOOLTAG3,
      poster = TRIGGER._4_G4_SCHOOLPOSTER03,
      bCheckTag = true,
      tagName = "SchoolTagMain",
      startNode = "/Global/TagSmall/Useable",
      startFile = "TagSmall.act"
    },
    {
      id = TRIGGER._4_G4_TILTTAG1,
      poster = TRIGGER._4_G4_TILTPOST1,
      bCheckTag = true,
      OnTag = nil,
      OnClean = nil,
      bIsTagged = true,
      bIsTagDone = true,
      tagName = "BusinessTaggedComics",
      startNode = "/Global/TagSmall/NotUseable/Tagged/Executes/SetTagDone",
      startFile = "TagSmall.act"
    }
  }
  gSchoolTagCount = table.getn(tblSchoolTags) - 1
  tblBusinessTags = {
    {
      id = TRIGGER._4_G4_BUSTAG2,
      poster = TRIGGER._4_G4_BUSPOSTER02,
      bCheckTag = true,
      tagName = "BusinessTagCinema",
      startNode = "/Global/TagSmall/Useable",
      startFile = "TagSmall.act"
    },
    {
      id = TRIGGER._4_G4_BUSTAG8,
      poster = TRIGGER._4_G4_BUSPOSTER08,
      bCheckTag = true,
      tagName = "BusinessTagStatue",
      startNode = "/Global/TagSmall/Useable",
      startFile = "TagSmall.act"
    }
  }
  gBusTagCount = table.getn(tblBusinessTags)
  gTblComicBookTag = {
    {
      id = TRIGGER._4_G4_SCHOOLTAG4,
      poster = TRIGGER._4_G4_SCHOOLPOSTER04,
      bCheckTag = true,
      bIsTagged = false,
      bIsTagDone = false,
      tagName = "BusinessTagComics",
      startNode = "/Global/TagSmall/Useable",
      startFile = "TagSmall.act"
    }
  }
  gTotalTags = gSchoolTagCount
  tblAlgieTags = {
    {
      poster = TRIGGER._4_G4_BUSPOSTER08,
      id = TRIGGER._4_G4_BUSTAG8,
      path = PATH._4G4_COMICTOBACKALLEY,
      tagName = "BusinessTagStatue",
      bCheckTag = true
    },
    {
      poster = TRIGGER._4_G4_BUSPOSTER02,
      id = TRIGGER._4_G4_BUSTAG2,
      path = PATH._4G4_PITTOALLEY,
      tagName = "BusinessTagCinema",
      bCheckTag = true
    },
    {
      poster = TRIGGER._4_G4_BUSPOSTER04,
      id = TRIGGER._4_G4_BUSTAG4,
      path = PATH._4G4_CINEMATOMEX,
      tagName = "BusinessTagComics",
      bCheckTag = true
    }
  }
  gMaxNerdTrigs = table.getn(tblAlgieTags)
end

function MissionSetup()

		SkipDialogue = false
		PauseGameClock()
		ClockSet(17)
		MissionSurpressMissionNameText()
		MissionDontFadeIn()
		AreaDisableCameraControlForTransition(true)
		TaggingOnlyShowMissionTags(true)
		SoundPlayInteractiveStream("MS_SearchingLow.rsm", MUSIC_DEFAULT_VOLUME)
		SoundSetMidIntensityStream("MS_SearchingMid.rsm", 0.6)
		SoundSetHighIntensityStream("MS_SearchingHigh.rsm", 0.7)
		DATLoad("4_G4.DAT", 2)
		DATLoad("4_G4c.DAT", 2)
		DATInit()

end

F_MissionSetup = function()

	--WeaponRequestModel(299)
	AnimsTable = {
	"MINIGraf",
	"Hang_Jock",
	"Hang_Talking",
	"NPC_Love",
	"NPC_NeedsResolving",
	"POI_Smoking",
	"GEN_Socia",
	"IDLE_SEXY_C",
	"SGIRL_F"
	}
	for i, Anim in AnimsTable do
		LoadAnimationGroup(Anim)
	end
	LoadActionTree("4_G4.act")
	LoadPAnims({
		TRIGGER._4_G4_SCHOOLPOSTER01,
		TRIGGER._4_G4_SCHOOLPOSTER02,
		TRIGGER._4_G4_SCHOOLPOSTER03,
		TRIGGER._4_G4_SCHOOLPOSTER04,
		TRIGGER._4_G4_SCHOOLPOSTER05,
		TRIGGER._4_G4_BUSPOSTER02,
		TRIGGER._4_G4_BUSPOSTER08
	})
	F_TableStuff()

end

function F_CreateSchoolPosters()
  for i, Tag in tblSchoolTags do
    if Tag.id then
      PAnimCreate(Tag.id, false)
    end
    if Tag.poster then
      PAnimCreate(Tag.poster, false)
    end
  end
end

function F_CreateBusinessPosters()
  for i, Tag in tblBusinessTags do
    if Tag.id then
      PAnimCreate(Tag.id, false)
    end
    if Tag.poster and Tag.bCheckTag then
      PAnimCreate(Tag.poster, false)
    elseif not Tag.bCheckTag and PAnimExists(Tag.poster) then
      PAnimDelete(Tag.poster)
    end
  end
end

function main()

		F_MissionSetup()
		F_Intro()
		F_WaitUntilPlayerIsInArea(49.82, -54.92, 5.08, 5)
		F_CreateSchoolPosters()
		F_CreateBusinessPosters()
		TaggingStartPersistentTag()
		F_PopulateJockTag()
		LoadAnimationGroup("NIS_5_05")
		F_WaitUntilPlayerIsInArea(47.57, -65.71, 5.05, 2)
		F_KirbyDanCut()
		F_WaitUntilPlayerIsInArea(2.67, -78.19, 0.91, 2)
		F_BleachPervCut()
		F_WaitUntilPlayerIsInArea(135.89, -71.46, 6.03, 4)
		F_EthanCut1()
		F_WaitUntilPlayerIsInArea(177.60, -116.31, 6.27, 2)
		F_NerdsLibrary()
		F_WaitUntilPlayerIsInArea(516.88, -79.64, 4.42, 2)
		F_HalNortonCut()
		F_WaitUntilPlayerIsInArea(525.19, -131.29, 5.61, 3)
		F_CinemaTagAndThadCut()
		F_ThadCut2()
		F_ThadCut3()
		F_WaitUntilPlayerIsInArea(630.35, -89.64, 8.25, 4)
		F_HallTagCut()
		F_WaitUntilPlayerIsInArea(47.76, -54.07, 5.08, 1)
		if PedIsValid(Mandy) then
			PedDelete(Mandy)
		end
		F_Outro()

end

F_Intro = function()

		InCutscene = true
		F_InCutscene()
		Wait(1000)
		AreaTransitionPoint(13, POINTLIST._4_G4_GymStart)
		Mandy = PedCreatePoint(14, POINTLIST._4_G4_MandySit)
		PedFaceXYZ(gPlayer, -634.455017, -72.934700, 66.879601)
		PedFaceXYZ(Mandy, -627.088989, -69.285500, 59.916199)
		CameraSetXYZ(-623.76, -69.94, 60.01, -627.61, -70.62, 60.81)
		CameraFade(500, 1)
		Wait(500)
		AreaDisableCameraControlForTransition(false)
		SoundPlayScriptedSpeechEvent(Mandy, "M_4_G4", 1, "large")
		F_WaitForSpeech(Mandy)
		CameraReturnToPlayer()
		AreaTransitionPoint(13, POINTLIST._4_G4_GymStart)
		TextPrint("4_G4_OBJ1", 3, 1)
		CounterSetCurrent(0)
		CounterSetMax(4)
		CounterSetIcon("MandPost", "MandPost_x")
		CounterMakeHUDVisible(true, true)
		InCutscene = false
		F_InCutscene()

end

function F_PopulateJockTag()

			Kirby = PedCreatePoint(13, POINTLIST._4_G4_SchoolTag1a, 1)
			Dan = PedCreatePoint(15, POINTLIST._4_G4_SchoolTag1a, 2)
			F_SetupPervert(Kirby)
			F_SetupPervert(Dan)

end

function F_PopulateBleachPervTag()

		Gord = PedCreateXYZ(30, 6.715760, -87.029198, 0.170730, 1)
		F_SetupPervert(Gord)
		PedSetPedToTypeAttitude(Gord, 13, 2)

end

function F_PopulateBullyTag()

			Trent = PedCreatePoint(85, POINTLIST._4_G4_SchoolTag3a, 1)
			Ethan = PedCreatePoint(145, POINTLIST._4_G4_SchoolTag3a, 2)
			Davis = PedCreatePoint(99, POINTLIST._4_G4_SchoolTag3a, 3)
			F_SetupPervert(Trent)
			F_SetupPervert(Ethan)
			F_SetupPervert(Davis)

end

function F_PopulateNerdTag()

			Algie = PedCreatePoint(4, POINTLIST._4G4_NERDLIBRARY, 1)
			Donald = PedCreatePoint(11, POINTLIST._4G4_NERDLIBRARY, 2)
			F_SetupPervert(Algie)
			F_SetupPervert(Donald)

end

function T_PopulateComicTag()

			Norton = PedCreatePoint(29, POINTLIST._4_G4_ALGIECUT, 1)
			Hal = PedCreatePoint(22, POINTLIST._4_G4_ALGIECUT, 2)
			Wait(1)
			PedFollowPath(Norton, PATH._4G4_PERV1, 0, 0, F_ReachedPathEnd)
			PedFollowPath(Hal, PATH._4G4_PERV2, 0, 0, F_ReachedPathEnd)
			PedSetPedToTypeAttitude(Norton, 13, 2)
			PedSetPedToTypeAttitude(Hal, 13, 2)
			repeat
			Wait(0)
			until bReachedPathEnd
			F_SetupPervert(Norton)
			F_SetupPervert(Hal)

end

function F_ReachedPathEnd(Ped, Path, Node)
  if Node == PathGetLastNode(Path) then
    bReachedPathEnd = true
  end
end

function F_PopulateBTTag1()

		Bambillo = PedCreatePoint(76, POINTLIST._4_G4_BUSTAG2A, 1)
		Chad = PedCreatePoint(32, POINTLIST._4_G4_BUSTAG2A, 2)
		Martin = PedCreatePoint(144, POINTLIST._4_G4_BUSTAG2A, 3)
		PedSetPedToTypeAttitude(Chad, 13, 2)
		F_SetupPervert(Bambillo)
		F_SetupPervert(Chad)
		F_SetupPervert(Martin)

end

function F_PopulateBTTag2()

		Huntingdon = PedCreatePoint(149, POINTLIST._4_G4_BusTag8a, 1)
		F_SetupPervert(Huntingdon)

end

function F_SetupPervert(ped)

		PedSetUniqueModelStatus(ped, -1)
		PedSetActionNode(ped, "/Global/4_G4/Animations/GenStandTalking/TalkingLoops", "4_G4.act")
		PedSetStationary(ped, true)
		PedClearAllWeapons(ped)
		PedIgnoreStimuli(ped, true)
		

end

function F_PervertLeave(ped)

		PedSetStationary(ped, false)
		PedMakeAmbient(ped)
		PedWander(ped)
		PedIgnoreStimuli(ped, false)

end

function F_PervertAttack(ped)

		PedSetStationary(ped, false)
		PedAttack(ped, gPlayer, 3)
		PedIgnoreStimuli(ped, false)

end

function F_TagPosterStuff()

		if not GordCutscene then
			if not PostThadCutscene then
				SoundPlayScriptedSpeechEvent(gPlayer, "M_4_G4", 2, "large")
			end
		end
		repeat
		Wait(0)
		until PedIsPlaying(gPlayer, "/Global/TagSmall/PedPropsActions/IsPlayer/DrawVandalTag/ParametricTagging", true)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_4_G4", 3, "large")
		repeat
		Wait(0)
		until PedIsPlaying(gPlayer, "/Global/TagSmall/PedPropsActions/IsPlayer/DrawVandalTag/ParametricTagging/Finished", true)
		CounterIncrementCurrent(1)
		PedSetWeapon(gPlayer, -1, 0)
		PedSetWeaponNow(gPlayer, -1, 0)
		PlayerUnequip()

end

F_KirbyDanCut = function()

		CameraFade(500, 0)
		Wait(500)
		F_PopulateBleachPervTag()
		CameraSetXYZ(42.21, -69.54, 6.53, 42.91, -65.64, 6.03)
		InCutscene = true
		F_InCutscene()
		CameraFade(500, 1)
		Wait(200)
		SoundPlayScriptedSpeechEvent(Kirby, "M_4_G4", 4, "large")
		F_WaitForSpeech(Kirby)
		SoundPlayScriptedSpeechEvent(Dan, "M_4_G4", 6, "large")
		F_WaitForSpeech(Dan)
		CameraFade(500, 0)
		Wait(500)
		InCutscene = false
		F_InCutscene()
		AreaTransitionXYZ(0, 42.02, -69.04, 5.03)
		PedFaceXYZ(gPlayer, 42.16, -68.47, 5.17)
		Wait(1)
		CameraReturnToPlayer()
		Wait(100)
		NonMissionPedGenerationDisable()
		CameraFade(500, 1)
		F_TagPosterStuff()
		SoundPlayScriptedSpeechEvent(Kirby, "M_4_G4", 5, "large")
		PedSetTypeToTypeAttitude()
		F_PervertAttack(Kirby)
		F_PervertAttack(Dan)
		repeat
		Wait(0)
		until PedIsDead(Kirby) and PedIsDead(Dan)
		NonMissionPedGenerationEnable()

end

F_BleachPervCut = function()

		CameraFade(500, 0)
		Wait(500)
		PedSetActionNode(Gord, "/Global/4_G4/Animations/GenStandTalking/TalkingLoops", "4_G4.act")
		if PedIsValid(Kirby) then
			PedDelete(Kirby)
		end
		if PedIsValid(Dan) then
			PedDelete(Dan)
		end
		PedFaceXYZ(Gord, 4.78, -86.00, 1.76)
		F_PopulateBullyTag()
		CameraSetXYZ(6.15, -83.20, 2.37, 5.53, -87.12, 1.97)
		InCutscene = true
		F_InCutscene()
		GordCutscene = true
		CameraFade(500, 1)
		Wait(200)
		SoundPlayScriptedSpeechEvent(Gord, "M_4_G4", 17, "large")
		F_WaitForSpeech(Gord)
		CameraFade(500, 0)
		Wait(500)
		InCutscene = false
		F_InCutscene()
		CameraReturnToPlayer()
		Wait(100)
		CameraFade(500, 1)
		Wait(500)
		F_WaitUntilPlayerIsInArea(6.315760, -82.029198, 0.870730, 3)
		PedSetActionNode(Gord, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Ambient.act")
		SoundPlayScriptedSpeechEvent(Gord, "M_4_G4", 18, "large")
		F_PervertAttack(Gord)
		F_TagPosterStuff()
		GordCutscene = false

end

F_EthanCut1 = function()

		CameraFade(500, 0)
		Wait(500)
		if PedIsValid(Gord) then
			PedDelete(Gord)
		end
		CameraSetXYZ(159.89, -71.48, 8.03, 157.52, -68.34, 7.34)
		InCutscene = true
		F_InCutscene()
		F_PopulateNerdTag()
		CameraFade(500, 1)
		Wait(200)
		local RNG = math.random(2)
		if RNG == 1 then
			SoundPlayScriptedSpeechEvent(Ethan, "M_4_G4", 12, "large")
		else
			SoundPlayScriptedSpeechEvent(Ethan, "M_4_G4", 21, "large")
		end
		F_WaitForSpeech(Ethan)
		CameraFade(500, 0)
		Wait(500)
		InCutscene = false
		F_InCutscene()
		CameraReturnToPlayer()
		AreaTransitionXYZ(0, 156.17, -69.08, 6.33)
		Wait(100)
		CameraFade(500, 1)
		F_TagPosterStuff()
		AreaClearAllPeds()
		F_PervertLeave(Trent)
		F_PervertLeave(Ethan)
		F_PervertLeave(Davis)

end

F_NerdsLibrary = function()

		F_TagPosterStuff()
		AreaRevertToDefaultPopulation()
		TextPrintString("Tag over the posters of Mandy in Bullworth Town.", 3, 1)
		CounterSetMax(6)
		F_PervertLeave(Algie)
		F_PervertLeave(Donald)
		Wait(6000)
		PedSetEffectedByGravity(gPlayer, false)
		AreaTransitionXYZ(0, 475.90, -84.09, 5.53)
		Wait(4500)
		T_PopulateComicTag()
		PedSetEffectedByGravity(gPlayer, true)

end

F_HalNortonCut = function()

		CameraFade(500, 0)
		Wait(500)
		if PedIsValid(Algie) then
			PedDelete(Algie)
		end
		if PedIsValid(Donald) then
			PedDelete(Donald)
		end
		PedSetActionNode(Norton, "/Global/4_G4/Animations/GenStandTalking/TalkingLoops", "4_G4.act")
		PedSetActionNode(Hal, "/Global/4_G4/Animations/GenStandTalking/TalkingLoops", "4_G4.act")
		CameraSetXYZ(511.52, -64.23, 6.65, 515.23, -62.88, 6.05)
		InCutscene = true
		F_InCutscene()
		F_PopulateBTTag1()
		CameraFade(500, 1)
		Wait(200)
		SoundPlayScriptedSpeechEvent(Norton, "M_4_G4", 7, "large")
		F_WaitForSpeech(Norton)
		SoundPlayScriptedSpeechEvent(Hal, "M_4_G4", 8, "large")
		F_WaitForSpeech(Hal)
		CameraFade(500, 0)
		Wait(500)
		InCutscene = false
		F_InCutscene()
		CameraReturnToPlayer()
		AreaTransitionXYZ(0, 516.83, -67.49, 4.85)
		Wait(50)
		PedFaceXYZ(gPlayer, 513.632996, -62.874599, 5.245860)
		Wait(50)
		CameraFade(500, 1)
		F_TagPosterStuff()
		SoundPlayScriptedSpeechEvent(Hal, "M_4_G4", 9, "large")
		PedSetTypeToTypeAttitude()
		AreaClearAllPeds()
		F_PervertAttack(Norton)
		F_PervertAttack(Hal)

end

F_CinemaTagAndThadCut = function()

		CameraFade(500, 0)
		Wait(501)
		AreaTransitionXYZ(0, 520.79, -141.74, 5.56)
		Wait(9)
		PedFaceXYZ(gPlayer, 526.98, -149.27, 5.36)
		if PedIsValid(Hal) then
			PedDelete(Hal)
		end
		if PedIsValid(Norton) then
			PedDelete(Norton)
		end
		PedSetActionNode(Martin, "/Global/4_G4/Animations/GenStandTalking/TalkingLoops", "4_G4.act")
		PedSetActionNode(Chad, "/Global/4_G4/Animations/GenStandTalking/TalkingLoops", "4_G4.act")
		PedSetActionNode(Bambillo, "/Global/4_G4/Animations/GenStandTalking/TalkingLoops", "4_G4.act")
		CameraSetXYZ(525.38, -147.73, 6.91, 527.89, -144.66, 6.46)
		InCutscene = true
		F_InCutscene()
		CameraFade(500, 1)
		Wait(200)
		SoundPlayScriptedSpeechEvent(Chad, "M_4_G4", 10, "large")
		F_WaitForSpeech(Chad)
		CameraSetXYZ(529.18, -145.52, 7.21, 528.25, -149.39, 6.91)
		SoundPlayScriptedSpeechEvent(Martin, "M_4_G4", 13, "large")
		F_WaitForSpeech(Martin)
		CameraFade(500, 0)
		Wait(500)
		F_ThadCut1()
		InCutscene = false
		F_InCutscene()
		CameraReturnToPlayer()
		Wait(100)
		CameraFade(500, 1)
		Wait(500)
		F_TagPosterStuff()
		F_PervertLeave(Martin)
		F_PervertLeave(Bambillo)
		SoundPlayScriptedSpeechEvent(Martin, "M_4_G4", 14, "large")
		SoundPlayScriptedSpeechEvent(Chad, "M_4_G4", 11, "large")
		PedSetActionNode(Martin, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Ambient.act")
		PedSetActionNode(Bambillo, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Ambient.act")
		PedSetActionNode(Chad, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Ambient.act")
		F_PervertAttack(Chad)
		repeat
		Wait(0)
		until PedIsDead(Chad)
		Wait(500)
		CameraFade(500, 0)
		Wait(500)
		InCutscene = true
		F_InCutscene()

end

F_ThadCut1 = function()

		Thad = PedCreateXYZ(7, 643.37, -88.44, 9.76)
		PedClearAllWeapons(Thad)
		PedFaceXYZ(Thad, 645.13, -88.54, 9.76)
		CameraSetXYZ(641.50, -90.19, 10.77, 644.73, -87.84, 10.69)
		PedSetActionNode(Thad, "/Global/4_G4/Animations/SetupPoster/PlaceIt", "Act/Conv/4_G4.act")
		CameraFade(500, 1)
		SoundPlayScriptedSpeechEvent(Thad, "M_4_G4", 19, "large")
		F_WaitForSpeech(Thad)
		PedMoveToXYZ(Thad, 1, 636.81, -88.28, 8.41)
		Wait(500)
		CameraFade(500, 0)
		Wait(500)

end

F_ThadCut2 = function()

		PedSetPosPoint(Thad, POINTLIST._4_G4_PEDALGIESTART)
		CameraSetFOV(70)
	  CameraSetXYZ(512.32794, -64.18165, 6.174207, 513.1554, -63.620415, 6.186368)
	  Wait(10)
	  CameraFade(500, 1)
	  Wait(500)
	  PedFollowPath(Thad, PATH._4G4_ALGIEPATH, 0, 1)
	  SoundPlayScriptedSpeechEvent(Thad, "M_4_G4", 22, "large")
	  Wait(3000)
	  PedStop(Thad)
	  F_WaitForSpeech(Thad)
	  PedSetActionNode(Thad, "/Global/4_G4/Animations/SetupPoster/PlaceIt", "Act/Conv/4_G4.act")
	  while PedIsPlaying(Thad, "/Global/4_G4/Animations/SetupPoster/PlaceIt", false) do
		Wait(0)
	  end
	  for i, Tag in gTblComicBookTag do
		PAnimCreate(Tag.id)
		PAnimCreate(Tag.poster)
	  end
		PedMoveToXYZ(Thad, 1, 542.73, -83.46, 5.30)
		Wait(500)
		CounterSetCurrent(4)
		CameraFade(500, 0)
		Wait(500)
		CameraReset()
		InCutscene = false
		F_InCutscene()
		CameraReturnToPlayer()
		Wait(10)
		CameraFade(500, 1)

end

F_ThadCut3 = function()

		repeat
		Wait(0)
		until PedIsDead(Thad)
		Wait(500)
		CameraFade(500, 0)
		LoadAnimationGroup("NIS_5_05")
		Wait(1500)
		PedDelete(Thad)
		if PedIsValid(Chad) then
			PedDelete(Chad)
		end
		InCutscene = true
		F_InCutscene()
		AreaTransitionXYZ(0, 535.18, -83.93, 4.65)
		Thad = PedCreateXYZ(7, 536.76, -83.97, 4.73)
		CameraSetXYZ(534.28, -84.95, 5.96, 537.73, -82.94, 5.87)
		Wait(10)
		PedClearAllWeapons(Thad)
		PedFaceXYZ(gPlayer, 536.76, -83.97, 4.73)
		PedFaceXYZ(Thad, 535.18, -83.93, 4.65)
		CameraFade(500, 1)
		Wait(200)
		SoundPlayScriptedSpeechEvent(Thad, "M_4_G4", 23, "large")
		F_WaitForSpeech(Thad)
		CameraSetXYZ(537.45, -85.29, 6.23, 534.15, -83.12, 5.58)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_4_G4", 24, "large")
		PedSetActionNode(gPlayer, "/Global/5_05/NIS/Player/Player01", "5_05.act")
		F_WaitForSpeech(gPlayer)
		PedMoveToXYZ(Thad, 2, 516.35, -84.36, 4.20)
		Wait(500)
		CameraFade(500, 0)
		Wait(501)
		F_PopulateBTTag2()
		PedDelete(Thad)
		InCutscene = false
		PostThadCutscene = true
		F_InCutscene()
		CameraReturnToPlayer()
		CameraFade(500, 1)
		F_TagPosterStuff()
		PostThadCutscene = false

end

F_HallTagCut = function()

		CameraFade(500, 0)
		Wait(500)
		InCutscene = true
		F_InCutscene()
		CameraSetXYZ(638.97, -90.55, 11.41, 642.51, -89.34, 10.79)
		CameraFade(500, 1)
		Wait(200)
		SoundPlayScriptedSpeechEvent(Huntingdon, "M_4_G4", 15, "large")
		F_WaitForSpeech(Huntingdon)
		Wait(700)
		CameraFade(500, 0)
		Wait(500)
		InCutscene = false
		F_InCutscene()
		CameraReturnToPlayer()
		CameraFade(500, 1)
		Wait(1000)
		F_TagPosterStuff()
		F_PervertLeave(Huntingdon)
		PedSetActionNode(Huntingdon, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Ambient.act")
		SoundPlayScriptedSpeechEvent(Huntingdon, "M_4_G4", 16, "large")
		TextPrintString("Meet Mandy in the Gym.", 3, 1)
		CounterClearIcon()
		CounterMakeHUDVisible(false, false)

end

F_Outro = function()

		InCutscene = true
		F_InCutscene()
		AreaDisableCameraControlForTransition(true)
		CameraFade(900, 0)
		Wait(900)
		AreaTransitionXYZ(13, -625.27, -71.21, 59.60)
		Mandy = PedCreateXYZ(14, -626.260986, -71.695801, 59.611099)
		Wait(1)
		PedFaceXYZ(Mandy, -625.27, -71.21, 59.60)
		PedFaceXYZ(gPlayer, -626.260986, -71.695801, 59.611099)
		AreaDisableCameraControlForTransition(false)
		Wait(100)
		CameraFade(500, 1)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_4_G4", 26, "large")
		F_PedSetCameraOffsetXYZ(gPlayer, 1, -1, 1.4, 0.5, -0.5, 1.4, Mandy)
		F_WaitForSpeech(gPlayer)
		PedSetActionNode(Mandy, "/Global/4_G4/4_G4_Hello", "Act/Conv/4_G4.act")
		SoundPlayScriptedSpeechEvent(Mandy, "M_4_G4", 27, "large")
		F_WaitForSpeech(Mandy)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_4_G4", 28, "large")
		F_WaitForSpeech(gPlayer)
		SoundPlayScriptedSpeechEvent(Mandy, "M_4_G4", 29, "large")
		F_WaitForSpeech(Mandy)
		PedLockTarget(Mandy, gPlayer, 3)
		PedLockTarget(gPlayer, Mandy, 3)
		PedSetActionNode(gPlayer, "/Global/Player/Social_Actions/MakeOut/Makeout/GrappleAttempt", "Act/Player.act")
		Wait(100)
		SoundDisableSpeech()
		repeat
		Wait(0)
		until PedIsPlaying(gPlayer, "/Global/Player/Social_Actions/MakeOut/Makeout/GrappleAttempt/Kisses", true) or PedIsPlaying(Mandy, "/Global/Player/Social_Actions/MakeOut/Makeout/GrappleAttempt/Kisses", true)
		Wait(800)
		SoundEnableSpeech()
		SoundPlayScriptedSpeechEvent(Mandy, "M_4_G4", 30, "large")
		F_WaitForSpeech(Mandy)
		SoundPlayScriptedSpeechEvent(Mandy, "M_4_G4", 31, "large")
		F_WaitForSpeech(Mandy)
		SoundPlayScriptedSpeechEvent(Mandy, "M_4_G4", 32, "large")
		PedSetActionNode(Mandy, "/Global/4_G4/4_G4_Hello", "Act/Conv/4_G4.act")
		F_WaitForSpeech(Mandy)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_4_G4", 33, "large")
		PedSetActionNode(gPlayer, "/Global/5_05/NIS/Player/Player02", "Act/Conv/5_05.act")
		F_WaitForSpeech(gPlayer)
		SoundPlayScriptedSpeechEvent(Mandy, "M_4_G4", 34, "large")
		F_WaitForSpeech(Mandy)
		SoundStopInteractiveStream()
		MinigameSetCompletion("M_PASS", true, 0, "4_G4_RESPECT")
		MinigameAddCompletionMsg("MRESPECT_JP5", 2)
		MinigameAddCompletionMsg("MRESPECT_NM5", 1)
		SoundPlayMissionEndMusic(true, 4)
		--PedLockTarget(gPlayer, -1)
		PedLockTarget(Mandy, -1)
		PedSetActionNode(Mandy, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Ambient.act")
		Wait(10)
		PedFollowPath(Mandy, PATH._4_G4_MandPath, 0, 0)
		CameraSetXYZ(-625.22, -72.79, 60.81, -625.07, -68.80, 60.96)
		Wait(8500)
		CameraFade(500, 0)
		Wait(3501)
		CameraFade(500, 1)
		PedLockTarget(gPlayer, -1)
		CameraReset()
		CameraReturnToPlayer()
		InCutscene = false
		F_InCutscene()

end

--Other Custom functions
F_InCutscene = function()

		if InCutscene then
			SoundSetAudioFocusCamera()
			DoublePedShadowDistance(true)
			PedSetWeaponNow(gPlayer, -1, 0)
			SoundDisableSpeech_ActionTree()
			PlayerSetControl(0)
			PedStop(gPlayer)
			NonMissionPedGenerationDisable()
			ToggleHUDComponentVisibility(0, false)
			ToggleHUDComponentVisibility(4, false)
			ToggleHUDComponentVisibility(5, false)
			ToggleHUDComponentVisibility(8, false)
			ToggleHUDComponentVisibility(11, false)
			EnterNIS()
		end
		if not InCutscene then
			SoundSetAudioFocusPlayer()
			DoublePedShadowDistance(false)
			ToggleHUDComponentVisibility(5, true)
			ToggleHUDComponentVisibility(8, true)
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