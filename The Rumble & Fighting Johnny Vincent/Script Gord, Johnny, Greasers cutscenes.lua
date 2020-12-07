function main()

		ToggleHUDComponentVisibility(11, false)
	ToggleHUDComponentVisibility(4, false)
	ToggleHUDComponentVisibility(0, false)
	ClockSet(19)
	CreateThread("StopMusic")
		SoundDisableSpeech_ActionTree()
		PedSetInvulnerable(gPlayer, true)
		SoundStopStream()
		SoundStopInteractiveStream()
		AreaTransitionXYZ(43, -749.07, -606.74, 3.51)
		LoadActionTree("Act/Conv/2_S06.act")
		LoadAnimationGroup("Px_RedButton")
		Button1, Button2 = CreatePersistentEntity("DPE_buttonOFF", -753.79699707031, -606.43902587891, 7.7574000358582, -113.70700073242, 43)
		Light1, Light2 = CreatePersistentEntity("JY1d_animlight", -749.92199707031, -608.28698730469, 8.5170202255249, 0, 43)

		repeat
		Wait(0)
		until IsButtonBeingPressed(7, 0)
		
		CameraSetXYZ(-752.21, -607.72, 8.41, -754.25, -604.34, 7.80)
		Hal = PedCreateXYZ(22, -752.70, -605.42, 6.84)
		Wait(1)
		PedFaceXYZ(Hal, -753.38, -606.45, 6.85)
		Wait(2000)
		SoundPlayScriptedSpeechEvent(Hal, "M_3_B", 17, "supersize")
		repeat
		Wait(0)
		until not SoundSpeechPlaying(Hal)
		
		PedMoveToXYZ(Hal, 1, -753.63, -606.25, 6.85)
		Wait(1050)
		PedFaceHeading(Hal, 90)
		Wait(10)
		PedSetActionNode(Hal, "/Global/2_S06/Anims/HitFireAlarm02", "Act/Conv/2_S06.act")
		Wait(500)
		DeletePersistentEntity(Button1, Button2)
		DeletePersistentEntity(Light1, Light2)
		--[[Saving Gord Cut
		SoundFadeWithCamera(true)
		MusicFadeWithCamera(true)
		PlayerSetControl(0)
		Wait(250)
		CameraFade(500, 0)
		Wait(1001)
		Wait(500)
		AreaClearAllPeds()
		Wait(500)
		PlayerSetPosXYZ(506.14, -433.73, 4.09)
		Gord2 = PedCreateXYZ(30, 504.93, -435.41, 4.09)
		PedSetStationary(Gord2, true)
		GameSetPedStat(Gord2, 7, 200)
		Wait(50)
		PedFaceXYZ(gPlayer, 504.93, -435.41, 4.09)
		PedFaceXYZ(Gord2, 506.14, -433.73, 4.09)
		Wait(50)
		CameraFade(500, 1)
		CameraSetXYZ(505.52, -432.64, 5.63, 505.83, -436.58, 5.04)
		SoundPlayScriptedSpeechEvent(Gord2, "M_3_06", 30, "supersize")
		Wait(1600)
		CameraSetXYZ(503.80, -435.03, 5.73, 507.66, -434.57, 4.77)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_3_06", 31, "supersize")
		Wait(2200)
		CameraSetXYZ(505.52, -432.64, 5.63, 505.83, -436.58, 5.04)
		SoundPlayScriptedSpeechEvent(Gord2, "M_3_06", 32, "supersize")
		Wait(2500)]]

		--[[Johnny Ending Cut
		Wait(3501)
		JohnnyFinalNIS = PedCreateXYZ(23, -742.67, -614.64, 3.01)
		PedSetPedToTypeAttitude(JohnnyFinalNIS, 13, 4)
		AreaTransitionXYZ(43, -740.93, -613.32, 3.02)
		Wait(5)
		PedFaceXYZ(gPlayer, -742.67, -614.64, 3.01)
		Wait(1000)
		PedSetActionNode(JohnnyFinalNIS, "/Global/4_B2/ReactionAnims/GetUpEasy", "Act/Conv/4_B2.act")
		CameraSetXYZ(-742.75, -616.55, 3.49, -741.48, -612.76, 3.39)
		Wait(100)
		CameraFade(500, 1)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_3_B", 23, "supersize")
		Wait(2600)
		CameraSetXYZ(-738.59, -612.93, 4.92, -741.99, -614.50, 3.53)
		SoundPlayScriptedSpeechEvent(JohnnyFinalNIS, "M_3_B", 24, "supersize")
		Wait(3000)
		CameraSetXYZ(-742.75, -616.55, 3.49, -741.48, -612.76, 3.39)
		SoundPlayScriptedSpeechEvent(gPlayer, "M_3_B", 25, "supersize")
		Wait(4100)]]
	
end

StopMusic = function()

		while true do
		SoundStopStream()
		Wait(0)
		end

end