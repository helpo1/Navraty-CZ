
func void checkritualstatue()
{
	if((LEFTINSERTED == TRUE) && (MIDDLEINSERTED == TRUE) && (RIGHTINSERTED == TRUE))
	{
		Wld_SendTrigger("LEFTSTATUEMOVER");
		Wld_SendTrigger("MIDDLESTATUEMOVER");
		Wld_SendTrigger("RIGHTSTATUEMOVER");
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
		Snd_Play("MFX_DestroyUndead_Cast");
		B_GivePlayerXP(200);
		Wld_InsertNpc(orc_6666_xash_gor,"FP_ROAM_GARSH");
		ORCTELEPORTSTATUS = FALSE;
	};
};

func void on_insertleftstatue()
{
	if((LEFTINSERTED == FALSE) && (Npc_HasItems(hero,itmi_orcring) >= 1))
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		LEFTINSERTED = TRUE;
		Wld_SendTrigger("LEFTSTATUEMOVER");
		Npc_RemoveInvItems(hero,itmi_orcring,1);
		checkritualstatue();
	};
};

func void on_insertmiddlestatue()
{
	if((MIDDLEINSERTED == FALSE) && (Npc_HasItems(hero,itmi_orcstaff) >= 1))
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		MIDDLEINSERTED = TRUE;
		Wld_SendTrigger("MIDDLESTATUEMOVER");
		Npc_RemoveInvItems(hero,itmi_orcstaff,1);
		checkritualstatue();
	};
};

func void on_insertrightstatue()
{
	if((RIGHTINSERTED == FALSE) && (Npc_HasItems(hero,itmi_orcamulet) >= 1))
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		RIGHTINSERTED = TRUE;
		Wld_SendTrigger("RIGHTSTATUEMOVER");
		Npc_RemoveInvItems(hero,itmi_orcamulet,1);
		checkritualstatue();
	};
};

