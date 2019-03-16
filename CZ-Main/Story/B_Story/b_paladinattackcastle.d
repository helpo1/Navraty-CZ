
func void b_paladinattackcastle()
{
	natan.aivar[AIV_PARTYMEMBER] = TRUE;
	marcos.aivar[AIV_PARTYMEMBER] = TRUE;
	albert.aivar[AIV_PARTYMEMBER] = TRUE;
	albert_guard1.aivar[AIV_PARTYMEMBER] = TRUE;
	albert_guard2.aivar[AIV_PARTYMEMBER] = TRUE;
	albert_guard3.aivar[AIV_PARTYMEMBER] = TRUE;
	albert_guard4.aivar[AIV_PARTYMEMBER] = TRUE;
	albert_guard5.aivar[AIV_PARTYMEMBER] = TRUE;
	albert_guard6.aivar[AIV_PARTYMEMBER] = TRUE;
	B_StartOtherRoutine(marcos,"Follow");
	B_StartOtherRoutine(albert,"Follow");
	B_StartOtherRoutine(albert_guard1,"FollowEx");
	B_StartOtherRoutine(albert_guard2,"FollowEx");
	B_StartOtherRoutine(albert_guard3,"Follow");
	B_StartOtherRoutine(albert_guard4,"Follow");
	B_StartOtherRoutine(albert_guard5,"Follow");
	B_StartOtherRoutine(albert_guard6,"Follow");
	if(MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		Marcos_Guard1.aivar[AIV_PARTYMEMBER] = TRUE;
		Marcos_Guard2.aivar[AIV_PARTYMEMBER] = TRUE;
		B_StartOtherRoutine(Marcos_Guard1,"Follow");
		B_StartOtherRoutine(Marcos_Guard2,"Follow");
	};
	if(MIS_MADERZ == LOG_SUCCESS)
	{
		mud_guard1.aivar[AIV_PARTYMEMBER] = TRUE;
		mud_guard2.aivar[AIV_PARTYMEMBER] = TRUE;
		mud_guard3.aivar[AIV_PARTYMEMBER] = TRUE;
		B_StartOtherRoutine(mud_guard1,"Follow");
		B_StartOtherRoutine(mud_guard2,"Follow");
		B_StartOtherRoutine(mud_guard3,"Follow");
	};
	if(DGJJOINPALADIN == TRUE)
	{
		Kurgan.aivar[AIV_PARTYMEMBER] = TRUE;
		Kjorn.aivar[AIV_PARTYMEMBER] = TRUE;
		Godar.aivar[AIV_PARTYMEMBER] = TRUE;
		Hokurn.aivar[AIV_PARTYMEMBER] = TRUE;
		DJG_Rod.aivar[AIV_PARTYMEMBER] = TRUE;
		DJG_Cipher.aivar[AIV_PARTYMEMBER] = TRUE;
		B_StartOtherRoutine(Kurgan,"Follow");
		B_StartOtherRoutine(Kjorn,"Follow");
		B_StartOtherRoutine(Godar,"Follow");
		B_StartOtherRoutine(Hokurn,"Follow");
		B_StartOtherRoutine(DJG_Rod,"Follow");
		B_StartOtherRoutine(DJG_Cipher,"Follow");
		if((Biff_FollowsThroughPass != LOG_SUCCESS) || (Biff_FollowsThroughPass != LOG_Running))
		{
			Biff.aivar[AIV_PARTYMEMBER] = TRUE;
			B_StartOtherRoutine(Biff,"FollowSturm");
		};
	};
	if(!Npc_IsDead(NONE_110_Urshak) && (URSHAKBECOMESHAMAN == TRUE))
	{
		B_StartOtherRoutine(NONE_110_Urshak,"Start");
		AI_Teleport(NONE_110_Urshak,"OW_HOSHPAK_04");
	};
};

func void b_paladinattackcastledone()
{
	if(Npc_IsDead(natan) == FALSE)
	{	
		B_StartOtherRoutine(natan,"Castle");
	};
	if(Npc_IsDead(marcos) == FALSE)
	{	
		B_StartOtherRoutine(marcos,"Castle");
	};
	if(Npc_IsDead(albert) == FALSE)
	{	
		B_StartOtherRoutine(albert,"Castle");
	};
	if(Npc_IsDead(albert_guard1) == FALSE)
	{	
		B_StartOtherRoutine(albert_guard1,"Castle");
	};
	if(Npc_IsDead(albert_guard2) == FALSE)
	{	
		B_StartOtherRoutine(albert_guard2,"Castle");
	};
	if(Npc_IsDead(albert_guard3) == FALSE)
	{	
		B_StartOtherRoutine(albert_guard3,"Castle");
	};
	if(Npc_IsDead(albert_guard4) == FALSE)
	{	
		B_StartOtherRoutine(albert_guard4,"Castle");
	};
	if(Npc_IsDead(albert_guard5) == FALSE)
	{	
		B_StartOtherRoutine(albert_guard5,"Castle");
	};
	if(Npc_IsDead(albert_guard6) == FALSE)
	{	
		B_StartOtherRoutine(albert_guard6,"Castle");
	};

	if(MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		if(Npc_IsDead(Marcos_Guard1) == FALSE)
		{	
			B_StartOtherRoutine(Marcos_Guard1,"Castle");
		};
		if(Npc_IsDead(Marcos_Guard2) == FALSE)
		{
			B_StartOtherRoutine(Marcos_Guard2,"Castle");
		};
	};
	if(MIS_MADERZ == LOG_SUCCESS)
	{
		if(Npc_IsDead(mud_guard1) == FALSE)
		{
			B_StartOtherRoutine(mud_guard1,"Castle");
		};
		if(Npc_IsDead(mud_guard2) == FALSE)
		{
			B_StartOtherRoutine(mud_guard2,"Castle");
		};
		if(Npc_IsDead(mud_guard3) == FALSE)
		{
			B_StartOtherRoutine(mud_guard3,"Castle");
		};
	};
	if(DGJJOINPALADIN == TRUE)
	{
		if(Npc_IsDead(Kurgan) == FALSE)
		{
			B_StartOtherRoutine(Kurgan,"Castle");
		};
		if(Npc_IsDead(Kjorn) == FALSE)
		{
			B_StartOtherRoutine(Kjorn,"Castle");
		};
		if(Npc_IsDead(Godar) == FALSE)
		{
			B_StartOtherRoutine(Godar,"Castle");
		};
		if(Npc_IsDead(Hokurn) == FALSE)
		{
			B_StartOtherRoutine(Hokurn,"Castle");
		};
		if(Npc_IsDead(DJG_Rod) == FALSE)
		{
			B_StartOtherRoutine(DJG_Rod,"Castle");
		};
		if(Npc_IsDead(DJG_Cipher) == FALSE)
		{
			B_StartOtherRoutine(DJG_Cipher,"Castle");
		};
		if((Biff_FollowsThroughPass != LOG_SUCCESS) || (Biff_FollowsThroughPass != LOG_Running))
		{
			if(Npc_IsDead(Biff) == FALSE)
			{
				Biff.aivar[AIV_PARTYMEMBER] = TRUE;
				B_StartOtherRoutine(Biff,"Castle");
			};
		};
	};
};

func void b_paladinawayone()
{
	Garond.aivar[AIV_PARTYMEMBER] = TRUE;
	Oric.aivar[AIV_PARTYMEMBER] = TRUE;
	Parcival.aivar[AIV_PARTYMEMBER] = TRUE;
	udar.aivar[AIV_PARTYMEMBER] = TRUE;
	B_StartOtherRoutine(Garond,"Follow");
	B_StartOtherRoutine(Oric,"Follow");
	B_StartOtherRoutine(Parcival,"Follow");
	B_StartOtherRoutine(udar,"Follow");
	B_StartOtherRoutine(natan,"PalExit");
	B_StartOtherRoutine(marcos,"PalExit");
	B_StartOtherRoutine(albert,"PalExit");
	B_StartOtherRoutine(albert_guard1,"PalExit");
	B_StartOtherRoutine(albert_guard2,"PalExit");
	B_StartOtherRoutine(albert_guard3,"PalExit");
	B_StartOtherRoutine(albert_guard4,"PalExit");
	B_StartOtherRoutine(albert_guard5,"PalExit");
	B_StartOtherRoutine(albert_guard6,"PalExit");
	if(MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Marcos_Guard1,"PalExit");
		B_StartOtherRoutine(Marcos_Guard2,"PalExit");
	};
	if(MIS_MADERZ == LOG_SUCCESS)
	{
		B_StartOtherRoutine(mud_guard1,"PalExit");
		B_StartOtherRoutine(mud_guard2,"PalExit");
		B_StartOtherRoutine(mud_guard3,"PalExit");
	};
	if((DGJJOINPALADIN == TRUE) || (DGJMOVEPALADIN == TRUE))
	{
		B_StartOtherRoutine(Kurgan,"PalExit");
		B_StartOtherRoutine(Kjorn,"PalExit");
		B_StartOtherRoutine(Godar,"PalExit");
		B_StartOtherRoutine(Hokurn,"PalExit");
		B_StartOtherRoutine(DJG_Rod,"PalExit");
		B_StartOtherRoutine(DJG_Cipher,"PalExit");
		if((Biff_FollowsThroughPass != LOG_SUCCESS) || (Biff_FollowsThroughPass != LOG_Running))
		{
			B_StartOtherRoutine(Biff,"PalExit");
		};
	};
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_MEATBUG_02_06");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_MEATBUG_02_05");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_MEATBUG_02_07");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_BILGOT_OUT");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_MEATBUG_02_02");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_MEATBUG_02_04");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_MEATBUG_01_03");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_MEATBUG_01_05");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_MEATBUG_01_01");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SIEGEORCS_325");
};

func void b_paladinawaytwo()
{
	B_StartOtherRoutine(Garond,"PalExit");
	B_StartOtherRoutine(Oric,"PalExit");
	B_StartOtherRoutine(Parcival,"PalExit");
	B_StartOtherRoutine(udar,"PalExit");
};

