
var int jointmisc2count;
var int jointmisc3count;

func void potionjoint_s1()
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
		PLAYER_MOBSI_PRODUCTION = MOBSI_POTIONJOINT;
		AI_ProcessInfos(her);
	};
};

instance PC_POTIONJOINT_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_potionjoint_end_condition;
	information = pc_potionjoint_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int pc_potionjoint_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONJOINT)
	{
		return TRUE;
	};
};

func void pc_potionjoint_end_info()
{
	b_endproductiondialog();
};

instance PC_JOINTMISC1(C_Info)
{
	npc = PC_Hero;
	condition = pc_jointmisc1_condition;
	information = pc_jointmisc1_info;
	permanent = TRUE;
	description = "Ubalit trávu z bažin";
};

func int pc_jointmisc1_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONJOINT)
	{
		return TRUE;
	};
};

func void pc_jointmisc1_info()
{
	if(Npc_HasItems(hero,ItPl_SwampHerb) >= 1)
	{
		RankPoints = RankPoints + 1;
		Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
		CreateInvItems(hero,ItMi_Joint,1);
		//Print(PRINT_JointSuccess);
		AI_PrintClr(PRINT_JointSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
	b_endproductiondialog();
};

instance PC_JOINTMISC2(C_Info)
{
	npc = PC_Hero;
	condition = pc_jointmisc2_condition;
	information = pc_jointmisc2_info;
	permanent = TRUE;
	description = "Ubalit speciální trávu z bažin...";
};

func int pc_jointmisc2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONJOINT) && ((KNOW_JOINTRECIPE == TRUE) || (Green_Extrem == TRUE)))
	{
		return TRUE;
	};
};

func void pc_jointmisc2_info()
{
	Info_ClearChoices(pc_jointmisc2);

	if((KNOW_JOINTRECIPE == TRUE) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 8) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(pc_jointmisc2,"... ubalit 'Přivolávač snu'",pc_jointmisc2_Joint_03);
	};
	if((KNOW_JOINTRECIPE == TRUE) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 4) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(pc_jointmisc2,"... ubalit 'Severní soumrak'",pc_jointmisc2_Joint_02);
	};
	if((Green_Extrem == TRUE) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(pc_jointmisc2,"... ubalit 'Zeleného novice'",pc_jointmisc2_Joint_01);
	};

	Info_AddChoice(pc_jointmisc2,DIALOG_BACK,pc_jointmisc2_Back_Info);
};

func void pc_jointmisc2_Back_Info()
{
	Info_ClearChoices(pc_jointmisc2);
};

func void pc_jointmisc2_Joint_03()
{
	B_GivePlayerXP(XP_HandMade_Alchemy);
	Npc_RemoveInvItems(hero,ItPl_SwampHerb,8);
	Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
	CreateInvItems(hero,itmi_joint_03,1);
	//Print("Izgotovlen 'Zov Mechty'!");
	AI_PrintClr("Ubaleno 1x Přivolávač snu!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(pc_jointmisc2);

	if((KNOW_JOINTRECIPE == TRUE) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 8) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(pc_jointmisc2,"... ubalit 'Přivolávač snu'",pc_jointmisc2_Joint_03);
	};
	if((KNOW_JOINTRECIPE == TRUE) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 4) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(pc_jointmisc2,"... ubalit 'Severní soumrak'",pc_jointmisc2_Joint_02);
	};
	if((Green_Extrem == TRUE) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(pc_jointmisc2,"... ubalit 'Zeleného novice'",pc_jointmisc2_Joint_01);
	};

	Info_AddChoice(pc_jointmisc2,DIALOG_BACK,pc_jointmisc2_Back_Info);
};

func void pc_jointmisc2_Joint_02()
{
	B_GivePlayerXP(XP_HandMade_Alchemy);
	Npc_RemoveInvItems(hero,ItPl_SwampHerb,4);
	Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
	CreateInvItems(hero,itmi_joint_02,1);
	//Print("Izgotovlen 'Severnyy Temnyy'!");
	AI_PrintClr("Ubaleno 1x Severní soumrak!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(pc_jointmisc2);

	if((KNOW_JOINTRECIPE == TRUE) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 8) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(pc_jointmisc2,"... ubalit 'Přivolávač snu'",pc_jointmisc2_Joint_03);
	};
	if((KNOW_JOINTRECIPE == TRUE) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 4) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(pc_jointmisc2,"... ubalit 'Severní soumrak'",pc_jointmisc2_Joint_02);
	};
	if((Green_Extrem == TRUE) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(pc_jointmisc2,"... ubalit 'Zeleného novice'",pc_jointmisc2_Joint_01);
	};

	Info_AddChoice(pc_jointmisc2,DIALOG_BACK,pc_jointmisc2_Back_Info);
};

func void pc_jointmisc2_Joint_01()
{
	B_GivePlayerXP(XP_HandMade_Alchemy);
	Npc_RemoveInvItems(hero,ItPl_SwampHerb,2);
	Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
	CreateInvItems(hero,ItMi_Addon_Joint_01,1);
	//Print("Izgotovlen 'Zelenyy poslushnik'!");
	AI_PrintClr("Ubaleno 1x Zelený novic!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(pc_jointmisc2);

	if((KNOW_JOINTRECIPE == TRUE) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 8) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(pc_jointmisc2,"... ubalit 'Přivolávač snu'",pc_jointmisc2_Joint_03);
	};
	if((KNOW_JOINTRECIPE == TRUE) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 4) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(pc_jointmisc2,"... ubalit 'Severní soumrak'",pc_jointmisc2_Joint_02);
	};
	if((Green_Extrem == TRUE) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(pc_jointmisc2,"... ubalit 'Zeleného novice'",pc_jointmisc2_Joint_01);
	};

	Info_AddChoice(pc_jointmisc2,DIALOG_BACK,pc_jointmisc2_Back_Info);
};