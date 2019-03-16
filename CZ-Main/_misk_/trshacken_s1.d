
func void trshacken_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Vynoslivost'",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_TRSHACKEN;
		AI_ProcessInfos(her);
	};
};


instance PC_TRSHACKEN_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_trshacken_end_condition;
	information = pc_trshacken_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};


func int pc_trshacken_end_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TRSHACKEN) && (OptionCheck == FALSE) && (TeleportCheck == FALSE))
	{
		return TRUE;
	};
};

func void pc_trshacken_end_info()
{
	b_endproductiondialog();
};


instance PC_TRSHACKEN_ADDON_HOUR(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_trshacken_addon_hour_condition;
	information = pc_trshacken_addon_hour_info;
	permanent = TRUE;
	description = "Kopat";
};

func int pc_trshacken_addon_hour_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TRSHACKEN) && (TREASURETAKE == FALSE) && (OptionCheck == FALSE) && (TeleportCheck == FALSE))
	{
		return TRUE;
	};
};

func void pc_trshacken_addon_hour_info()
{
	if(TREASURETAKE == FALSE)
	{
		RankPoints = RankPoints + 1;
		TREASURETAKE = TRUE;
		B_LogEntry(TOPIC_VIPERNUGGETS,"Našel jsem balík rudy!");
		Wld_InsertItem(itmi_alefnuggetsbag,"OW_ALEF_TRS");
		Wld_PlayEffect("spellFX_ItemAusbuddeln",itmi_alefnuggetsbag,itmi_alefnuggetsbag,0,0,0,FALSE);
		B_Say_Overlay(hero,hero,"$FOUNDTREASURE");
		Snd_Play("ORE_HACK");
		B_GivePlayerXP(100);
		b_endproductiondialog();
		Wld_SendTrigger("EVT_ALEFTREASUREAPPERS");
		Wld_InsertNpc(Skeleton_Shield,"OW_ALEF_TRS_GUARD");
	};
};