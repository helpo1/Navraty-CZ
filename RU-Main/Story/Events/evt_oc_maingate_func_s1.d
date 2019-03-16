
func void evt_oc_maingate_func_s1()
{
	if((MIS_OCGateOpen == FALSE) && (KAPITELORCATC == FALSE))
	{
		Wld_InsertNpc(OrcWarrior_Roam,"OC_TO_GUARD");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_TRAIN_03");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_TRAIN_04");
		Wld_InsertNpc(orkelite_addon1,"OC_RAMP_16");
		Wld_InsertNpc(orkelite_addon3_chk_gate,"OC_RAMP_17");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_CENTER_02");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_CENTER_03");
		Garond.flags = 0;
		Parcival.flags = 0;
		PlayVideo("ORCATTACK.BIK");
		MIS_OCGateOpen = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 5;
	};
};

func int EVT_CANFIREPAL()
{
	if((MIS_PaladinGoods == LOG_Running) && (TorchIsOn == TRUE) && (PaladinGoodsBurned == FALSE))
	{
		return TRUE;
	};

	return FALSE;
};

func void EVT_PALADINSTORE_INFIRE_FUNC_s1()
{
	if(PaladinGoodsBurned == FALSE)
	{
		B_LogEntry(TOPIC_PaladinGoods,"Я поджег продовольственный склад паладинов в крепости! Скоро тут начнется настоящий ад.");
		PaladinGoodsBurned = TRUE;

	 	if(Wld_IsTime(5,0,22,0))
		{
			PaladinKnowWhoBurn = TRUE;		
		};
		if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 25;
		};
	};
};

func void evt_oc_gate_checkalive()
{
	var C_Npc dead01;
	var C_Npc dead02;
	var C_Npc dead03;
	var C_Npc dead04;
	var C_Npc dead05;
	var C_Npc dead06;
	var C_Npc dead07;
	var C_Npc dead08;
	var C_Npc dead09;
	var C_Npc dead10;
	var C_Npc alive01;
	var C_Npc alive02;
	var C_Npc alive03;
	var C_Npc alive04;
	var C_Npc alive05;
	var C_Npc alive06;
	var C_Npc alive07;
	var C_Npc alive08;
	var C_Npc alive09;
	var C_Npc alive10;
	var C_Npc alive11;
	var C_Npc alive12;
	var C_Npc alive13;
	var C_Npc alive14;
	var C_Npc alive15;
	dead01 = Hlp_GetNpc(VLK_4142_Waffenknecht);
	dead02 = Hlp_GetNpc(VLK_4144_Waffenknecht);
	dead03 = Hlp_GetNpc(PAL_262_Wache);
	dead04 = Hlp_GetNpc(PAL_263_Wache);
	dead05 = Hlp_GetNpc(VLK_4140_Waffenknecht);
	dead06 = Hlp_GetNpc(VLK_4141_Waffenknecht);
	dead07 = Hlp_GetNpc(PAL_265_Ritter);
	dead08 = Hlp_GetNpc(PAL_261_Gerold);
	dead09 = Hlp_GetNpc(VLK_4104_Waffenknecht);
	dead10 = Hlp_GetNpc(VLK_4105_Waffenknecht);
	alive01 = Hlp_GetNpc(VLK_4101_Waffenknecht);
	alive02 = Hlp_GetNpc(PAL_273_Ritter);
	alive03 = Hlp_GetNpc(PAL_274_Ritter);
	alive04 = Hlp_GetNpc(PAL_264_Ritter);
	alive05 = Hlp_GetNpc(VLK_4143_HaupttorWache);
	alive06 = Hlp_GetNpc(VLK_4145_Waffenknecht);
	alive07 = Hlp_GetNpc(VLK_4146_Waffenknecht);
	alive08 = Hlp_GetNpc(PAL_260_Tandor);
	alive09 = Hlp_GetNpc(PAL_255_Ritter);
	alive10 = Hlp_GetNpc(PAL_256_Ritter);
	alive11 = Hlp_GetNpc(PAL_272_Ritter);
	alive12 = Hlp_GetNpc(PAL_270_Ritter);
	alive13 = Hlp_GetNpc(PAL_251_Oric);
	alive14 = Hlp_GetNpc(PAL_252_Parcival);
	alive15 = Hlp_GetNpc(PAL_259_Wache);
	if(!Hlp_IsValidNpc(dead08) || Npc_IsDead(dead08))
	{
		if(Hlp_IsValidNpc(alive02) && !Npc_IsDead(alive02))
		{
			B_StartOtherRoutine(alive02,"Attack");
			B_StartOtherRoutine(alive03,"Wall");
		}
		else if(Hlp_IsValidNpc(alive03) && !Npc_IsDead(alive03))
		{
			B_StartOtherRoutine(alive03,"Attack");
		}
		else
		{
			B_StartOtherRoutine(alive08,"Attack");
		};
	};
	if(!(Hlp_IsValidNpc(dead01) || Npc_IsDead(dead01)) && !(Hlp_IsValidNpc(dead02) || Npc_IsDead(dead02)))
	{
		B_StartOtherRoutine(alive13,"Attack");
		B_StartOtherRoutine(alive14,"Attack");
		B_StartOtherRoutine(alive04,"Camp");
	}
	else
	{
		B_StartOtherRoutine(alive04,"Attack");
	};
	if(!Hlp_IsValidNpc(dead07) || Npc_IsDead(dead07))
	{
		if(Hlp_IsValidNpc(alive11) && !Npc_IsDead(alive11))
		{
			B_StartOtherRoutine(alive11,"Attack");
		}
		else
		{
			B_StartOtherRoutine(alive12,"Attack");
		};
	};
	if(!Hlp_IsValidNpc(dead05) || Npc_IsDead(dead05))
	{
		B_StartOtherRoutine(alive05,"Attack");
	};
	if(!Hlp_IsValidNpc(dead06) || Npc_IsDead(dead06))
	{
		B_StartOtherRoutine(alive06,"Attack");
	};
	if(!Hlp_IsValidNpc(dead03) || Npc_IsDead(dead03))
	{
		if(Hlp_IsValidNpc(alive07) && !Npc_IsDead(alive07))
		{
			B_StartOtherRoutine(alive07,"Attack");
		}
		else
		{
			B_StartOtherRoutine(alive10,"AttackA");
		};
	};
	if(!Hlp_IsValidNpc(dead04) || Npc_IsDead(dead04))
	{
		if(Hlp_IsValidNpc(alive01) && !Npc_IsDead(alive01))
		{
			B_StartOtherRoutine(alive01,"Attack");
		}
		else
		{
			B_StartOtherRoutine(alive10,"AttackB");
		};
	};
	if(!Hlp_IsValidNpc(dead10) || Npc_IsDead(dead10))
	{
		B_StartOtherRoutine(alive15,"Attack");
	};
	if(!Hlp_IsValidNpc(dead09) || Npc_IsDead(dead09))
	{
		B_StartOtherRoutine(alive09,"Attack");
	};
};

