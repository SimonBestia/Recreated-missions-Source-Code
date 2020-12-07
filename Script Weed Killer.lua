function MissionSetup()

		DATLoad("2_08.DAT", 2)
		DATInit()
		LoadAnimationGroup("Px_Urinal")
		LoadAnimationGroup("NPC_AggroTaunt")
		LoadAnimationGroup("2_08WeedKiller")
		LoadAnimationGroup("SGEN_S")
		LoadAnimationGroup("NPC_Chat_1")
		LoadAnimationGroup("Hang_Talking")
		LoadAnimationGroup("MINI_Lock")
		LoadAnimationGroup("Dodgeball")
		LoadAnimationGroup("Area_School")
		LoadAnimationGroup("NIS_3_R09_N")
		LoadActionTree("Act/Conv/2_08.act")
		AreaDisableCameraControlForTransition(true)
		Wait(100)

end

function F_MissionSetup()

		PlayerSetControl(0)
		ClockSet(11, 30)
		NonMissionPedGenerationDisable()
		SoundDisableSpeech_ActionTree()
		PAnimDelete(TRIGGER._2_08_PLANTTARGET)
        PAnimCreate(TRIGGER._2_08_PLANTTARGET)
		SkipDialogue = false --toggle speech with true/false

end

function main()

		F_MissionSetup()
		Intro()
		--IntimidateTad()
		GetToHarringtonHouse()
		InsideHarringtonHouse()

end

function Intro()

		ToggleHUDComponentVisibility(0, false)
		F_ToggleHudElements(false)
		AreaTransitionXYZ(2, -650.08, -292.87, 5.50)
		PedFaceXYZ(gPlayer, -650.17, -295.32, 5.50)
		Tad = PedCreateXYZ(31, -672.16, -312.23, 5.49)
		Pinky = PedCreateXYZ(38, -671.15, -310.76, 5.49)
		PedFaceXYZ(Pinky, -672.16, -312.23, 5.49)
		PedFaceXYZ(Tad, -671.15, -310.76, 5.49)
		Wait(1000)
		DoublePedShadowDistance(true)
		PauseGameClock()
		CameraSetXYZ(-651.33, -297.37, 6.60, -649.49, -293.82, 6.50)
		CameraFade(500, 1)
		Wait(3500)
		PedMoveToXYZ(gPlayer, 0, -650.17, -295.32, 5.50)
		AreaDisableCameraControlForTransition(false)
		MusicFadeWithCamera(false)
		Wait(250)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_08", 1, "large")
		F_WaitForSpeech(gPlayer)
		CameraSetXYZ(-650.92, -296.42, 6.80, -649.26, -294.17, 6.81)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_08", 2, "large")
		F_WaitForSpeech(gPlayer)
		CameraSetXYZ(-670.92, -314.12, 6.80, -671.66, -310.21, 6.45)
		SoundPlayScriptedSpeechEvent(Pinky, "M_2_08", 3, "large")
		F_WaitForSpeech(Pinky)
		CameraSetXYZ(-671.88, -308.71, 6.87, -671.83, -312.88, 6.39)
		SoundPlayScriptedSpeechEvent(Tad, "M_2_08", 4, "large")
		ExecuteActionNode(Tad, "/Global/Ambient/SocialAnims/SocialChitChat/PlayAnim", "Act/Conv/Ambient.act")
		F_WaitForSpeech(Tad)
		PedMoveToXYZ(Tad, 0, -670.85, -322.63, 5.49)
		Wait(1000)
		CameraSetXYZ(-670.60, -317.33, 6.60, -671.63, -313.46, 6.48)
		SoundPlayScriptedSpeechEvent(Tad, "M_2_08", 5, "large")
		PedFaceXYZ(Pinky, -670.85, -322.63, 5.49)
		F_WaitForSpeech(Tad)
		Wait(500)
		PedWander(Pinky)
		PedMakeAmbient(Pinky)
		CameraFade(500, 0)
		Wait(1500)
		DoublePedShadowDistance(false)

end

function IntimidateTad()

		CameraReset()
		CameraReturnToPlayer()
		PlayerSetControl(1)
		CameraFade(500, 1)
		SoundStopPA()
		Wait(250)
		TextPrintString("Find a way to get into Harrington House.", 3, 1)
		PedStop(Tad)
		PedSetPosXYZ(Tad, -668.65, -327.51, 5.49)
		PedFaceXYZ(Tad, -667.92, -327.55, 5.49)
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-670.79, -322.24, 5.49, 2, 0)
		PlayerSetControl(0)
		CameraFade(500, 0)
		Wait(501)
		DoublePedShadowDistance(true)
		F_MakePlayerSafeForNIS(true)
		CameraSetXYZ(-671.16, -326.33, 7.39, -667.67, -328.15, 6.70)
		ExecuteActionNode(Tad, "/Global/Toilet/PedPropsActions/Use", "Act/Anim/Toilet.act")
		CameraFade(500, 1)
		Wait(250)
		SoundPlayScriptedSpeechEvent(Tad, "M_2_08", 6, "large")
		F_WaitForSpeech(Tad)
		CameraSetXYZ(-671.12, -329.69, 6.99, -669.41, -326.11, 6.58)
		PedMoveToXYZ(gPlayer, 0, -670.13, -324.62, 5.49)
		Wait(1000)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_08", 7, "large")
		F_WaitForSpeech(gPlayer)
		PedMoveToXYZ(Tad, 0, -669.07, -326.78, 5.49)
		SoundPlayScriptedSpeechEvent(Tad, "M_2_08", 8, "large")
		F_WaitForSpeech(Tad)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_08", 9, "large")
		F_WaitForSpeech(gPlayer)
		Wait(500)
		SoundPlayScriptedSpeechEvent(Tad, "M_2_08", 10, "large")
		ExecuteActionNode(Tad, "/Global/C31Strt/FattyAvoid", "Act/Conv/C3_1.act")
		F_WaitForSpeech(Tad)
		PedSetFlag(gPlayer, 11, true)
		CameraSetXYZ(-670.01, -325.39, 6.89, -670.33, -321.40, 6.98)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_08", 11, "large")
		F_WaitForSpeech(gPlayer)
		CameraFade(500, 0)
		Wait(500)
		DoublePedShadowDistance(false)
		PedSetFlag(gPlayer, 11, false)
		CameraReset()
		CameraReturnToPlayer()
		F_MakePlayerSafeForNIS(false)
		CameraFade(500, 1)
		PlayerSetControl(1)
		PedMoveToXYZ(Tad, 0, -675.83, -327.48, 5.49)
		Wait(1000)
		SoundPlayScriptedSpeechEvent(Tad, "M_2_08", 12, "large")
		CreateThread("TadWashesHands")
		TextPrintString("Force Tad into giving the password.", 3, 1)
		repeat
		Wait(0)
		until PedIsHit(Tad)
		SoundPlayScriptedSpeechEvent(Tad, "M_2_08", 13, "large")
		F_WaitForSpeech(Tad)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_08", 14, "large")
		F_WaitForSpeech(gPlayer)
		repeat
		Wait(0)
		until PedIsPlaying(Tad, "/Global/Actions/Grapples/Front/Grapples/Hold_Idle/GrappleLoco/GrappleRotate", true) or PedIsPlaying(Tad, "/Global/Actions/Grapples/Front/Grapples/Hold_Idle/GrappleLoco/PushFwd/Rcv", true)
		SoundPlayScriptedSpeechEvent(Tad, "M_2_08", 15, "large")
		HUDSaveVisibility()
		repeat
		Wait(0)
		until PedIsPlaying(Tad, "/Global/Toilet/PedPropsActions/Use", true)
		HUDClearAllElements()
		CameraSetXYZ(-670.64, -333.36, 8.29, -672.31, -335.34, 5.25)
		CameraAllowChange(false)
		CameraAllowScriptedChange(false)
		--SoundPlayScriptedSpeechEvent(Tad, "M_2_08", 16, "large")
		F_WaitForSpeech(Tad)
		Wait(1800)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_08", 17, "large")
		repeat
		Wait(0)
		until not PedIsPlaying(gPlayer, "/Global/Toilet/PedPropsActions/Use", true)
		SoundPlayScriptedSpeechEvent(Tad, "M_2_08", 18, "large")
		F_WaitForSpeech(Tad)
		MusicFadeWithCamera(true)
		CameraAllowChange(true)
		CameraAllowScriptedChange(true)
		CameraReturnToPlayer()
		HUDRestoreVisibility()
		Wait(1)

end

TadWashesHands = function() --Broken, but don't touch, it doesn't matter anyways.

		--PerformedAnim = false
		while true do
		if PedIsInAreaXYZ(Tad, -675.83, -327.48, 5.49, 0.4, 0) then
				--ExecuteActionNode(Tad, "/Global/1_05/Anims/Handwash/WashHands", "Act/Conv/1_05.act")
				ExecuteActionNode(Tad, "/Global/WaterFaucet/PedPropsActions/Off/Idle", "Act/Conv/GenericSequences.act")
				--repeat
				--Wait(0)
				--until not PedIsPlaying(Tad, "/Global/WaterFaucet/PedPropsActions/Off/Idle", true)
				--PerfomedAnim = true
			if PedIsHit(Tad) then
				--if PedIsPlaying(Tad, "/Global/1_05/Anims/Handwash/WashHands", true) and not PedIsPlaying(Tad, "/Global/HitTree/Standing/Melee/Generic/Straight/HEADJAB/Rear/Rear", true) then
				if PedIsPlaying(Tad, "/Global/WaterFaucet/PedPropsActions/Off/Idle", true) and not PedIsPlaying(Tad, "/Global/HitTree/Standing/Melee/Generic/Straight/HEADJAB/Rear/Rear", true) then
					PedStop(Tad)
					ExecuteActionNode(Tad, "/Global/HitTree/Standing/Melee/Generic/Straight/HEADJAB/Rear/Rear", "Act/Anim/HitTree.act")
					--PedSetActionNode(Tad, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Act/Anim/Ambient.act")
				end
			break
			end
		end
		Wait(0)
		end

end

function GetToHarringtonHouse()

		MusicFadeWithCamera(true)
		SoundFadeWithCamera(true)
		CameraReset() --Enable these if you want to start from here via Main.
		CameraReturnToPlayer()
		PlayerSetControl(1)
		CameraFade(500, 1)
		TextPrintString("Go to Harrington House.", 3, 1)
		repeat
		Wait(0)
		until AreaGetVisible() == 0
		if PedIsValid(Tad) then
			PedDelete(Tad)
		end
		Gord = PedCreateXYZ(30, 105.04, -133.29, 6.79)
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(104.12, -127.02, 6.61, 2, 0)
		PlayerUnequip()
		CameraFade(500, 0)
		PlayerSetControl(0)
		Wait(500)
		DoublePedShadowDistance(true)
		PedSetPosXYZ(gPlayer, 104.96, -129.26, 6.61)
		CameraSetXYZ(106.88, -131.09, 7.80, 103.81, -133.65, 7.80)
		F_MakePlayerSafeForNIS(true)
		CameraFade(500, 1)
		PedMoveToXYZ(gPlayer, 0, 104.88, -131.64, 6.61)
		Wait(800)
		SoundPlayScriptedSpeechEvent(Gord, "M_2_08", 19, "large")
		ExecuteActionNode(Gord, "/Global/1_02/PointAtRussel", "Act/Conv/1_02.act")
		F_WaitForSpeech(Gord)
		CameraSetXYZ(103.60, -134.05, 8.21, 105.86, -130.80, 7.68)
		ExecuteActionNode(gPlayer, "/Global/3_R09/Animations/Player/Nerds/Player01", "Act/Conv/3_R09.act")
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_08", 20, "large")
		F_WaitForSpeech(gPlayer)
		CameraSetXYZ(106.88, -131.09, 7.80, 103.81, -133.65, 7.80)
		SoundPlayScriptedSpeechEvent(Gord, "M_2_08", 21, "large")
		ExecuteActionNode(Gord, "/Global/Ambient/MissionSpec/Prefect/PrefectChew", "Act/Anim/Ambient.act")
		F_WaitForSpeech(Gord)
		CameraSetXYZ(103.60, -134.05, 8.21, 105.86, -130.80, 7.68)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_08", 22, "large")
		F_WaitForSpeech(gPlayer)
		CameraSetXYZ(106.88, -131.09, 7.80, 103.81, -133.65, 7.80)
		SoundPlayScriptedSpeechEvent(Gord, "M_2_08", 23, "large")
		ExecuteActionNode(Gord, "/Global/1_07/DontMess", "Act/Conv/1_07.act")
		F_WaitForSpeech(Gord)
		CameraSetXYZ(103.60, -134.05, 8.21, 105.86, -130.80, 7.68)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_08", 24, "large")
		F_WaitForSpeech(gPlayer)
		CameraSetXYZ(106.88, -131.09, 7.80, 103.81, -133.65, 7.80)
		SoundPlayScriptedSpeechEvent(Gord, "M_2_08", 25, "large")
		F_WaitForSpeech(Gord)
		CameraFade(1300, 0)
		AreaDisableCameraControlForTransition(true)
		PedMoveToXYZ(gPlayer, 0, 103.72, -134.29, 6.82)
		Wait(1301)
		PedStop(gPlayer)
		Wait(150)
		AreaTransitionXYZ(32, -558.47, 133.37, 46.14)
		DeleteAllMissionPeds()
		Wait(50)

end

function InsideHarringtonHouse()

		--AreaTransitionXYZ(32, -558.47, 133.37, 46.14) --Enable this if you want to start from here via Main
		repeat
		Wait(0)
		until AreaGetVisible() == 32

		SoundDisableSpeech_ActionTree()
		AreaSetDoorLocked(TRIGGER._DOOR_PREPHOUSE_FOYER, false)
		PAnimOpenDoor(TRIGGER._DOOR_PREPHOUSE_FOYER)
		PAnimDoorStayOpen(TRIGGER._DOOR_PREPHOUSE_FOYER)
		Gord = PedCreateXYZ(30, -534.539001, 132.809006, 46.225899)
		Parker = PedCreateXYZ(40, -535.737000, 131.042007, 46.186001)
		PedFaceXYZ(Gord, -535.737000, 131.042007, 46.186001)
		PedFaceXYZ(Parker, -534.539001, 132.809006, 46.225899)
		Wait(5)
		ExecuteActionNode(Gord, "/Global/2_08Conv/Interruptable/TalkAnims", "Act/Conv/2_08.act")
		ExecuteActionNode(Parker, "/Global/2_08Conv/Interruptable/ListenAnims", "Act/Conv/2_08.act")
		CameraSetXYZ(-537.61, 131.47, 47.51, -533.73, 132.35, 47.13)
		if PedIsValid(shared.gBif) then
			PedDelete(shared.gBif)
		end
		CameraFade(500, 1)
		Wait(500)
		SoundPlayScriptedSpeechEvent(Gord, "M_2_08", 38, "large")
		F_WaitForSpeech(Gord)
		CameraSetXYZ(-535.56, 134.25, 47.51, -534.81, 130.35, 47.06)
		SoundPlayScriptedSpeechEvent(Parker, "M_2_08", 39, "large")
		F_WaitForSpeech(Parker)
		CameraSetXYZ(-537.61, 131.47, 47.51, -533.73, 132.35, 47.13)
		SoundPlayScriptedSpeechEvent(Gord, "M_2_08", 40, "large")
		F_WaitForSpeech(Gord)
		CameraSetXYZ(-535.56, 134.25, 47.51, -534.81, 130.35, 47.06)
		SoundPlayScriptedSpeechEvent(Parker, "M_2_08", 41, "large")
		F_WaitForSpeech(Parker)
		SoundPlayScriptedSpeechEvent(Parker, "M_2_08", 42, "large")
		F_WaitForSpeech(Parker)
		CameraSetXYZ(-537.61, 131.47, 47.51, -533.73, 132.35, 47.13)
		SoundPlayScriptedSpeechEvent(Gord, "M_2_08", 43, "large")
		F_WaitForSpeech(Gord)
		CameraSetXYZ(-535.56, 134.25, 47.51, -534.81, 130.35, 47.06)
		SoundPlayScriptedSpeechEvent(Parker, "M_2_08", 44, "large")
		F_WaitForSpeech(Parker)
		CameraSetXYZ(-537.61, 131.47, 47.51, -533.73, 132.35, 47.13)
		SoundPlayScriptedSpeechEvent(Gord, "M_2_08", 45, "large")
		PedFaceXYZ(gPlayer, -556.56, 133.38, 46.22)
		F_WaitForSpeech(Gord)
		Wait(500)
		CameraSetXYZ(-556.92, 133.77, 47.65, -560.79, 132.80, 47.32)
		ExecuteActionNode(gPlayer, "/Global/2_08Conv/ComeOn", "Act/Conv/2_08.act")
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_08", 26, "large")
		F_WaitForSpeech(gPlayer)
		PedFaceXYZ(Gord, -558.71, 133.32, 46.14)
		PedFaceXYZ(Parker, -558.71, 133.32, 46.14)
		CameraSetXYZ(-536.23, 133.12, 47.45, -532.51, 131.68, 47.25)
		PedSetActionNode(Parker, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Act/Anim/Ambient.act")
		ExecuteActionNode(Gord, "/Global/1_08/CafeteriaLady/PointWarn", "Act/Conv/1_08.act")
		SoundPlayScriptedSpeechEvent(Gord, "M_2_08", 27, "large")
		F_WaitForSpeech(Gord)
		PlayerSetControl(1)
		CameraReset()
		CameraReturnToPlayer()
		DoublePedShadowDistance(false)
		F_MakePlayerSafeForNIS(false)
		TextPrintString("Find the prized plant and destroy it.", 3, 1)
		PedAttack(Gord, gPlayer, 2)
		PedAttack(Parker, gPlayer, 2)
		SoundSetHighIntensityStream("MS_ActionHigh.rsm", 0.69999998807907, 500, 1000)
		PedSetTypeToTypeAttitude(5, 13, 0)
		Wait(500)
		SoundPlayScriptedSpeechEvent(Gord, "M_2_08", 48, "large")
		F_WaitForSpeech(Gord)
		Wait(500)
		SoundPlayScriptedSpeechEvent(Parker, "M_2_08", 53, "large")
		F_WaitForSpeech(Parker)

		repeat
		Wait(0)
		until PedIsDead(Gord) and PedIsDead(Parker) and PlayerIsInAreaXYZ(-544.54, 141.35, 50.72, 1, 0)
		
		PlayerSetControl(0)
		CameraFade(500, 0)
		Wait(500)
		DoublePedShadowDistance(true)
		Tad = PedCreateXYZ(31, -526.198975, 136.494003, 50.759201)
		Justin = PedCreateXYZ(34, -525.809998, 135.246002, 50.769199)
		PedFaceXYZ(Tad, -525.809998, 135.246002, 50.769199)
		PedFaceXYZ(Justin, -526.198975, 136.494003, 50.759201)
		Wait(5)
		ExecuteActionNode(Tad, "/Global/2_08Conv/Interruptable/TalkAnims", "Act/Conv/2_08.act")
		ExecuteActionNode(Justin, "/Global/2_08Conv/Interruptable/ListenAnims", "Act/Conv/2_08.act")
		CameraSetXYZ(-527.95, 137.17, 52.14, -524.83, 134.71, 51.69)
		CameraFade(500, 1)
		Wait(500)
		SoundPlayScriptedSpeechEvent(Justin, "M_2_08", 28, "large")
		F_WaitForSpeech(Justin)
		Wait(1900)
		CameraSetXYZ(-527.10, 134.28, 52.14, -524.80, 137.53, 51.75)
		SoundPlayScriptedSpeechEvent(Tad, "M_2_08", 29, "large")
		F_WaitForSpeech(Tad)
		CameraSetXYZ(-527.95, 137.17, 52.14, -524.83, 134.71, 51.69)
		SoundPlayScriptedSpeechEvent(Justin, "M_2_08", 30, "large")
		F_WaitForSpeech(Justin)
		SoundPlayScriptedSpeechEvent(Justin, "M_2_08", 31, "large")
		F_WaitForSpeech(Justin)
		PlayerSetControl(1)
		CameraReset()
		CameraReturnToPlayer()
		DoublePedShadowDistance(false)

		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-530.29, 142.56, 50.72, 2, 0)
		
		PedSetActionNode(Tad, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Act/Anim/Ambient.act")
		PedSetActionNode(Justin, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Act/Anim/Ambient.act")
		PedAttack(Tad, gPlayer, 2)
		PedAttack(Justin, gPlayer, 2)
		SoundPlayScriptedSpeechEvent(Justin, "M_2_08", 49, "large")
		F_WaitForSpeech(Justin)
		Wait(500)
		SoundPlayScriptedSpeechEvent(Tad, "M_2_08", 51, "large")
		F_WaitForSpeech(Tad)
		
		repeat
		Wait(0)
		until PedIsDead(Tad) and PedIsDead(Justin) and PlayerIsInAreaXYZ(-505.97, 122.26, 52.51, 2, 0)

		PAnimSetActionNode(TRIGGER._PANIM_FLYTRAP, "/Global/VFlyTrap/Idle", "Act/Props/VFlyTrap.act")
		PlayerSetControl(0)
		CameraFade(500, 0)
		Wait(500)
		DoublePedShadowDistance(true)
		Chad = PedCreateXYZ(32, -513.590027, 135.244995, 55.703098)
		Bryce = PedCreateXYZ(35, -512.758972, 136.516006, 55.703098)
		PedFaceXYZ(Chad, -512.758972, 136.516006, 55.703098)
		PedFaceXYZ(Bryce, -513.590027, 135.244995, 55.703098)
		Wait(5)
		ExecuteActionNode(Bryce, "/Global/2_08Conv/Interruptable/TalkAnims", "Act/Conv/2_08.act")
		ExecuteActionNode(Chad, "/Global/2_08Conv/Interruptable/ListenAnims", "Act/Conv/2_08.act")
		CameraSetXYZ(-511.23, 136.07, 57.32, -515.13, 135.68, 56.54)
		CameraFade(500, 1)
		Wait(500)
		SoundPlayScriptedSpeechEvent(Chad, "M_2_08", 32, "large")
		F_WaitForSpeech(Chad)
		CameraSetXYZ(-515.14, 135.41, 57.32, -511.27, 135.98, 56.49)
		SoundPlayScriptedSpeechEvent(Bryce, "M_2_08", 33, "large")
		F_WaitForSpeech(Bryce)
		CameraSetXYZ(-511.23, 136.07, 57.32, -515.13, 135.68, 56.54)
		SoundPlayScriptedSpeechEvent(Chad, "M_2_08", 34, "large")
		F_WaitForSpeech(Chad)
		CameraSetXYZ(-515.14, 135.41, 57.32, -511.27, 135.98, 56.49)
		--SoundPlayScriptedSpeechEvent(Bryce, "M_2_08", 35, "large")
		F_WaitForSpeech(Bryce)
		Wait(1600)
		CameraSetXYZ(-511.23, 136.07, 57.32, -515.13, 135.68, 56.54)
		SoundPlayScriptedSpeechEvent(Chad, "M_2_08", 36, "large")
		F_WaitForSpeech(Chad)
		CameraSetXYZ(-515.14, 135.41, 57.32, -511.27, 135.98, 56.49)
		SoundPlayScriptedSpeechEvent(Bryce, "M_2_08", 35, "large")
		F_WaitForSpeech(Bryce)
		PlayerSetControl(1)
		CameraReset()
		CameraReturnToPlayer()
		DoublePedShadowDistance(false)
		
		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-506.44, 129.53, 55.67, 2, 0)

		PedSetActionNode(Chad, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Act/Anim/Ambient.act")
		PedSetActionNode(Bryce, "/Global/Ambient/Scripted/Empty/EmptyNode/TrueEmptyNode", "Act/Anim/Ambient.act")
		PedAttack(Chad, gPlayer, 2)
		PedAttack(Bryce, gPlayer, 2)
		SoundPlayScriptedSpeechEvent(Bryce, "M_2_08", 46, "large")
		F_WaitForSpeech(Bryce)
		Wait(500)
		SoundPlayScriptedSpeechEvent(Chad, "M_2_08", 50, "large")
		F_WaitForSpeech(Chad)

		repeat
		Wait(0)
		until PedIsDead(Chad) and PedIsDead(Bryce) and PlayerIsInAreaXYZ(-536.58, 133.09, 55.67, 2, 0)

		PlayerSetWeapon(279, PedGetAmmoCount(gPlayer, 279))
		--PlayerSetWeapon(301, PedGetAmmoCount(gPlayer, 301))
		TextPrintString("Destroy the plant.", 3, 1)
		SoundPlayInteractiveStream("MS_ActionMid.rsm", 0.60000002384186, 500, 500)
		PAnimShowHealthBar(TRIGGER._PANIM_FLYTRAP, true, "2_08_PLANT", true)
		CreateThread("T_MonitorVenusFlyTrap")
		--CreateThread("T_Test")

		repeat
		Wait(0)
		until PAnimGetHealth(TRIGGER._PANIM_FLYTRAP) <= 0

		--until PAnimGetHealth(TRIGGER._PANIM_FLYTRAP) <= 0.15000000596046
		PAnimMakeTargetable(TRIGGER._2_08_PLANTTARGET, false)
		PAnimMakeTargetable(TRIGGER._2_08_PLANTTARGET, false)
		DestroyedPlantNIS()

end

--[[T_Test = function()

		while true do
		if PAnimIsPlaying(TRIGGER._PANIM_FLYTRAP, "/Global/VFlyTrap/Hit", true) then
			TextPrintString("Plant was hit.", 1, 1)
		elseif PAnimIsPlaying(TRIGGER._PANIM_FLYTRAP, "/Global/VFlyTrap/Damage", true) then
			TextPrintString("Plant was damaged.", 1, 1)
		end
		Wait(0)
		end

end]]

T_MonitorVenusFlyTrap = function()

		Loaded = true
		Dead = false
		LastHit = false

		while true do

		if Loaded then

            if not LastHit and PAnimIsPlaying(TRIGGER._PANIM_FLYTRAP, "/Global/VFlyTrap/Hit", true) then
                EffectCreate("WeedMelee", -549.218994, 133.317001, 59.317001)
                repeat
                    Wait(0)
                until not PAnimIsPlaying(TRIGGER._PANIM_FLYTRAP, "/Global/VFlyTrap/Hit", true)
            end

			if PAnimGetHealth(TRIGGER._PANIM_FLYTRAP) <= 0.30 and not Dead then
				--TextPrintString("plant died.", 1, 1)
                Dead = true
               --[[ repeat
                    Wait(0)
                until PAnimIsPlaying(TRIGGER._PANIM_FLYTRAP, "/Global/VFlyTrap/Idle", true)]]
                LastHit = true
            end

            if --[[(]]LastHit and PAnimIsPlaying(TRIGGER._PANIM_FLYTRAP, "/Global/VFlyTrap/Hit", true)--[[and not PAnimIsPlaying(TRIGGER._PANIM_FLYTRAP, "/Global/VFlyTrap/Idle", true)) or IsButtonBeingPressed(3, 0)]] then
                EffectCreate("WeedKiller", -549.218994, 133.317001, 59.317001)
                Wait(600)
                FlyTrapDead1, FlyTrapDead2 = CreatePersistentEntity("DPI_VFlytrapDMG", -549.125000, 133.436996, 58.405199, 0, 32)
                Wait(600)
                FlyTrap1, FlyTrap2 = PAnimGetPoolIndex("VFlyTrap", -549.218994, 133.317001, 59.317001, 5)
                DeletePersistentEntity(FlyTrap1, FlyTrap2)
                Wait(100000)
            end

        end

		Wait(0)
		end

end

function DestroyedPlantNIS()

		MusicFadeWithCamera(false)
		SoundFadeWithCamera(false)
		HUDSaveVisibility()
		Wait(5)
		CameraFade(500, 0)
		Wait(500)
		AreaClearAllExplosions()
		AreaClearAllProjectiles()
		PlayerSetControl(0)
		HUDClearAllElements()
		Wait(2000)
		--CameraSetXYZ(-543.90264892578, 136.86050415039, 59.507858276367, -544.71722412109, 136.30087280273, 59.355541229248)
		CameraSetXYZ(-543.88, 135.87, 58.82, -546.70, 133.07, 59.20)
		PlayerSetControl(1)
		CameraFade(500, 1)
		--AreaTransitionXYZ(32, -558.98, 133.32, 46.14) --Enable this if you want to start from here via Main (Add the function to Main, first), may cause issues with FX not spawning, or at least it did for all those that are commented. (Maybe the PS2 doesn't load them in time?)
		DoublePedShadowDistance(true)
		GeometryInstance("PH_OpenDoor02", true, -516.79699707031, 133.41400146484, 55.646301269531, false)
		GeometryInstance("DPI_pDoorBrk", false, -516.79699707031, 133.41400146484, 55.646301269531, true)
		GeometryInstance("PH_OpenDoor01", true, -524.291015625, 118.19999694824, 50.680000305176, false)
		GeometryInstance("DPI_pDoorBrk", false, -524.291015625, 118.19999694824, 50.680000305176, true)
		AreaSetPathableInRadius(-516.79699707031, 133.41400146484, 55.646301269531, 0.10000000149012, 0.5, false)
		AreaSetPathableInRadius(-524.291015625, 118.19999694824, 50.680000305176, 0.10000000149012, 0.5, false)
		repeat
		Wait(0)
		until PAnimIsPlaying(TRIGGER._PANIM_FLYTRAP, "/Global/VFlyTrap/Hit", true)
		PlayerSetControl(0)
		EffectCreate("CherryBombExplosion", -549.018994, 133.317001, 59.117001)
		EffectCreate("CherryBombExplosion", -549.018994, 133.317001, 59.117001)
		--EffectCreate("WeedKiller", -549.018994, 133.317001, 59.117001)
		EffectCreate("BigExplosion", -549.018994, 133.317001, 59.117001)
		--EffectCreate("WeedMelee", -549.218994, 133.317001, 59.317001)
		--Plant1, Plant2 = CreatePersistentEntity("DPI_VFlytrapDMG", -549.199001, 133.483005, 58.405199, 0, 32)
		--Wait(500)
		--PAnimDelete(TRIGGER._PANIM_FLYTRAP)
		--[[PAnimSetActionNode(TRIGGER._PANIM_FLYTRAP, "/Global/VFlyTrap/Death/Dead", "Act/Props/VFlyTrap.act")
		Wait(200)
		repeat
		Wait(0)
		until PAnimIsPlaying(TRIGGER._PANIM_FLYTRAP, "/Global/VFlyTrap/Death/Dead/DeadHold", false)]]
		Wait(1500)
		CameraFade(500, 0)
		Wait(501)
		if PedIsValid(Chad) then
			PedDelete(Chad)
		end
		if PedIsValid(Bryce) then
			PedDelete(Bryce)
		end
		Wait(100)
		Chad = PedCreatePoint(32, POINTLIST._2_08_SOLARIUMPEDS, 1)
        PedFaceHeading(Chad, 90, 0)
		Bryce = PedCreatePoint(35, POINTLIST._2_08_SOLARIUMPEDS, 2)
		Bryce2 = PedCreateXYZ(35, -545.37, 138.47, 46.19)
		PedFaceXYZ(Bryce2, -545.35, 137.05, 46.89)
		PedSetAsleep(Bryce2, true)
		PedSetPedToTypeAttitude(Bryce2, 13, 2)
		PedFaceHeading(Bryce, 270, 0)
		Wait(100)
		CameraSetXYZ(-525.70, 137.25, 57.45, -522.12, 135.55, 56.99)
		--CameraSetXYZ(-531.16906738281, 137.61204528809, 57.597053527832, -530.28039550781, 137.16061401367, 57.516857147217)
		CameraFade(500, 1)
		SoundSetAudioFocusCamera()
		Wait(501)
		ExecuteActionNode(Chad, "/Global/2_08Conv/Taunt/TauntPlayer", "Act/Conv/2_08.act")
		ExecuteActionNode(Bryce, "/Global/2_08Conv/Lock_Picking/Lock_Picking_Loop", "Act/Conv/2_08.act")
		SoundPlayScriptedSpeechEvent(Chad, "M_2_08", 62, "large")
		Wait(3000)
		PedMoveToObject(Chad, gPlayer, 2, 2)
		PedMoveToObject(Bryce, gPlayer, 2, 2)
		Wait(1200)
		CameraFade(500, 0)
		SoundSetAudioFocusPlayer()
		Wait(500)
		if PedIsValid(Tad) then
			PedDelete(Tad)
		end
		if PedIsValid(Justin) then
			PedDelete(Justin)
		end
		if PedIsValid(Gord) then
			PedDelete(Gord)
		end
		if PedIsValid(Parker) then
			PedDelete(Parker)
		end
		PlayerUnequip()
		PedDestroyWeapon(gPlayer, 279)
		PlayerUnequip()
		PedDestroyWeapon(gPlayer, 279)
		Wait(150)
		Gord = PedCreatePoint(30, POINTLIST._2_08_SecondFloorPed, 1)
		Parker = PedCreatePoint(40, POINTLIST._2_08_SecondFloorPed, 2)
		Tad = PedCreatePoint(31, POINTLIST._2_08_PedsOnStairs, 1)
		Justin = PedCreatePoint(34, POINTLIST._2_08_PedsOnStairs, 2)
		Chad2 = PedCreatePoint(32, POINTLIST._2_08_StairPreppy)
		Wait(100)
		HUDRestoreVisibility()
		PlayerSetControl(1)
		CameraReturnToPlayer()
		CameraReset()
		F_MakePlayerSafeForNIS(false)
		DoublePedShadowDistance(false)
		--[[if PAnimExists(TRIGGER._PANIM_FLYTRAP) then
			PAnimDelete(TRIGGER._PANIM_FLYTRAP)
			CreatePersistentEntity("DPI_VFlytrapDMG", -549.218994, 133.317001, 57.317001, 0, 32)
		end]]
		CameraFade(500, 1)
		Wait(500)
		MusicFadeWithCamera(true)
		SoundFadeWithCamera(true)
		PedAttack(Chad, gPlayer, 1)
		PedAttack(Bryce, gPlayer, 1)
		PAnimMakeTargetable(TRIGGER._2_08_PLANTTARGET, false)
		PAnimDelete(TRIGGER._2_08_PLANTTARGET)
		SoundPlayInteractiveStreamLocked("MS_ActionHigh.rsm", 0.69999998807907, 500, 500)
		AreaSetDoorLocked("DT_PREPTOMAIN", false)
		TextPrintString("Get out of Harrington House.", 3, 1)
		Wait(1000)
		SoundPlayScriptedSpeechEvent(Bryce, "M_2_08", 52, "large")
		F_WaitForSpeech(Bryce)
		Wait(500)
		SoundPlayScriptedSpeechEvent(Chad, "M_2_08", 54, "large")
		F_WaitForSpeech(Chad)
		SoundDisableSpeech()

		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-515.87, 133.56, 55.67, 1, 0)

		SoundEnableSpeech()
		PedAttack(Tad, gPlayer, 2)
		PedAttack(Justin, gPlayer, 2)
		Wait(1000)
		SoundPlayScriptedSpeechEvent(Tad, "M_2_08", 55, "large")
		F_WaitForSpeech(Tad)
		Wait(500)
		SoundPlayScriptedSpeechEvent(Justin, "M_2_08", 56, "large")
		F_WaitForSpeech(Justin)
		SoundDisableSpeech()

		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-525.52, 127.04, 50.71, 4, 0)
		
		AreaSetDoorLockedToPeds(TRIGGER._DOOR_PREPHOUSE_STAIRS_LOWER, false)
		PedAttack(Chad2, gPlayer, 2)

		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-534.76, 143.73, 50.72, 4, 0) and PedIsDead(Chad2)

		SoundEnableSpeech()
		PedAttack(Gord, gPlayer, 2)
		Wait(1500)
		SoundPlayScriptedSpeechEvent(Gord, "M_2_08", 57, "large")
		F_WaitForSpeech(Gord)
		SoundDisableSpeech()

		repeat
		Wait(0)
		until PlayerIsInAreaXYZ(-544.47, 140.36, 50.72, 2, 0)

		SoundEnableSpeech()
		PedAttack(Parker, gPlayer, 2)
		Wait(1000)
		SoundPlayScriptedSpeechEvent(Parker, "M_2_08", 53, "large")
		F_WaitForSpeech(Parker)
		SoundDisableSpeech()
		MusicFadeWithCamera(false)
		SoundFadeWithCamera(false)

		repeat
		Wait(0)
		until PedIsDead(Parker) and PlayerIsInAreaXYZ(-534.02, 135.98, 46.14, 2, 0)

		CameraFade(500, 0)
		PlayerSetControl(0)
		Wait(501)
		if PedIsValid(Parker) then
			PedDelete(Parker)
		end
		PedSetAsleep(Bryce2, false)
		AreaSetDoorLockedToPeds(TRIGGER._DOOR_PREPHOUSE_LOUNGE, false)
		DoublePedShadowDistance(true)
		PlayerSetPosXYZ(-534.02, 135.98, 46.14)
		CameraSetXYZ(-539.20, 134.72, 47.45, -535.56, 136.36, 47.31)
		Wait(5)
		PedFaceXYZ(gPlayer, -542.33, 135.12, 46.14)
		Wait(5)
		CameraFade(500, 1)
		PedMoveToXYZ(gPlayer, 2, -537.70, 135.26, 46.14)
		Wait(1400)
		CameraSetXYZ(-538.77, 134.87, 47.45, -542.57, 136.08, 47.57)
		PAnimOpenDoor(TRIGGER._DOOR_PREPHOUSE_LOUNGE)
		--PAnimDoorStayOpen(TRIGGER._DOOR_PREPHOUSE_LOUNGE)
		Wait(250)
		PedMoveToXYZ(Bryce2, 2, -545.07, 136.09, 46.14)
		Wait(700)
		SoundEnableSpeech()
		PedMoveToXYZ(Bryce2, 2, -541.54, 135.08, 46.14)
		PedSetFlag(gPlayer, 11, true)
		PedFaceXYZ(gPlayer, -542.33, 135.12, 46.14)
		Wait(700)
		SoundPlayScriptedSpeechEvent(Bryce2, "M_2_08", 58, "large")
		ExecuteActionNode(Bryce2, "/Global/1_08/CafeteriaLady/PointWarn", "Act/Conv/1_08.act")
		F_WaitForSpeech(Bryce2)
		Wait(2500)
		CameraSetXYZ(-539.20, 134.72, 47.45, -535.56, 136.36, 47.31)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_2_08", 59, "large")
		F_WaitForSpeech(gPlayer)
		PedSetFlag(gPlayer, 11, false)
		CameraReturnToPlayer()
		CameraReset()
		PlayerSetControl(1)
		MusicFadeWithCamera(true)
		SoundFadeWithCamera(true)
		SoundPlayScriptedSpeechEvent(Bryce2, "M_2_08", 63, "large")
		PedSetPedToTypeAttitude(Bryce2, 13, 0)
		PedAttack(Bryce2, gPlayer, 1)
		DoublePedShadowDistance(false)
		AreaDisableCameraControlForTransition(false)
		
		repeat
		Wait(0)
		until AreaGetVisible() == 0
		
		PlayerSetControl(0)
		PlayerSetPosPoint(POINTLIST._2_08_OUTHAR, 1)
		CameraSetXYZ(103.56771087646, -125.0239944458, 7.4587478637695, 103.49873352051, -126.01161956787, 7.599506855011)
		SoundEnableInteractiveMusic(false)
		CameraFade(500, 1)
		Wait(501)
		F_MakePlayerSafeForNIS(true)
		SoundStopInteractiveStream()
		MinigameSetCompletion("M_PASS", true, 3000)
		SoundPlayMissionEndMusic(true, 10)
		repeat
		Wait(0)
		until not MinigameIsShowingCompletion()
		CameraFade(500, 0)
		Wait(1001)
end

--Custom Functions:
F_ToggleHudElements = function(Boolean)

		ToggleHUDComponentVisibility(4, Boolean)
		ToggleHUDComponentVisibility(11, Boolean)

end

F_WaitForSpeech = function(talkingped)

		repeat
		Wait(0)
		if SkipDialogue then
			break
		end
		until not SoundSpeechPlaying(talkingped)

end