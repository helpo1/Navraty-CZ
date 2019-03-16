func void woodchoop_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MEMORIES;
		AI_ProcessInfos(her);
	};
};

instance PC_WOODCHOOP_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_WOODCHOOP_END_condition;
	information = PC_WOODCHOOP_END_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_WOODCHOOP_END_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MEMORIES) && ((Npc_GetDistToWP(hero,"NW_FARM3_RUMBOLD_CHOOP_01") < 500) || (Npc_GetDistToWP(hero,"NW_FARM2_BENCH_02") < 500) || (Npc_GetDistToWP(hero,"NW_FARM1_OUT_CHOOP_01") < 500) || (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_OUT_CHOOP_01") < 500) || (Npc_GetDistToWP(hero,"NW_TAVERNE_CHOOP_05") < 500)))
	{
		return TRUE;
	};
};

func void PC_WOODCHOOP_END_info()
{
	b_endproductiondialog();
};

func void makegold_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MEMORIES;
		AI_ProcessInfos(her);
	};
};

instance PC_MAKEGOLD_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_MAKEGOLD_end_condition;
	information = PC_MAKEGOLD_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_MAKEGOLD_end_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MEMORIES) && (Npc_GetDistToWP(hero,"ADW_MINE_HOEHLE_03") < 500))
	{
		return TRUE;
	};
};

func void PC_MAKEGOLD_end_info()
{
	if(Npc_HasItems(self,ItMi_Pliers) < 1)
	{
		CreateInvItems(self,ItMi_Pliers,1);
	};

	b_endproductiondialog();
};

instance PC_MAKEGOLD_ADDON_UNHOUR(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_MAKEGOLD_addon_UNHOUR_condition;
	information = PC_MAKEGOLD_addon_UNHOUR_info;
	permanent = TRUE;
	description = "Отлить золотые монеты (Требуется: золотой слиток x1)";
};

func int PC_MAKEGOLD_addon_UNHOUR_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MEMORIES) && (Npc_GetDistToWP(hero,"ADW_MINE_HOEHLE_03") < 500))
	{
		return TRUE;
	};
};

func void PC_MAKEGOLD_addon_UNHOUR_info()
{
	if(Npc_HasItems(self,ItMi_StuckGold) >= 1)
	{
		AI_Wait(self,1);
		B_GivePlayerXP(15);
		Npc_RemoveInvItems(self,ItMi_StuckGold,1);
		CreateInvItems(self,ItMi_Gold,500);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Отлито пятьсот золотых монет!",83,152,48);
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_MAKEGOLD_ADDON_UNHOUR_X5(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_MAKEGOLD_addon_UNHOUR_X5_condition;
	information = PC_MAKEGOLD_addon_UNHOUR_X5_info;
	permanent = TRUE;
	description = "Отлить золотые монеты (Требуется: золотой слиток x5)";
};

func int PC_MAKEGOLD_addon_UNHOUR_X5_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MEMORIES) && (Npc_GetDistToWP(hero,"ADW_MINE_HOEHLE_03") < 500) && (Npc_HasItems(self,ItMi_StuckGold) >= 5))
	{
		return TRUE;
	};
};

func void PC_MAKEGOLD_addon_UNHOUR_X5_info()
{
	if(Npc_HasItems(self,ItMi_StuckGold) >= 5)
	{
		AI_Wait(self,1);
		B_GivePlayerXP(10);
		Npc_RemoveInvItems(self,ItMi_StuckGold,5);
		CreateInvItems(self,ItMi_Gold,2500);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Отлито две тысячи пятьсот золотых монет!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_MAKEGOLD_ADDON_UNHOUR_X10(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_MAKEGOLD_addon_UNHOUR_X10_condition;
	information = PC_MAKEGOLD_addon_UNHOUR_X10_info;
	permanent = TRUE;
	description = "Отлить золотые монеты (Требуется: золотой слиток x10)";
};

func int PC_MAKEGOLD_addon_UNHOUR_X10_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MEMORIES) && (Npc_GetDistToWP(hero,"ADW_MINE_HOEHLE_03") < 500) && (Npc_HasItems(self,ItMi_StuckGold) >= 10))
	{
		return TRUE;
	};
};

func void PC_MAKEGOLD_addon_UNHOUR_X10_info()
{
	if(Npc_HasItems(self,ItMi_StuckGold) >= 10)
	{
		AI_Wait(self,1);
		B_GivePlayerXP(5);
		Npc_RemoveInvItems(self,ItMi_StuckGold,10);
		CreateInvItems(self,ItMi_Gold,5000);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Отлито пять тысяч золотых монет!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_MAKEGOLD_ADDON_UNHOUR_XALL(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_MAKEGOLD_addon_UNHOUR_XALL_condition;
	information = PC_MAKEGOLD_addon_UNHOUR_XALL_info;
	permanent = TRUE;
	description = "Переплавить все золотые слитки в монеты";
};

func int PC_MAKEGOLD_addon_UNHOUR_XALL_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MEMORIES) && (Npc_GetDistToWP(hero,"ADW_MINE_HOEHLE_03") < 500) && (Npc_HasItems(self,ItMi_StuckGold) >= 1))
	{
		return TRUE;
	};
};

func void PC_MAKEGOLD_addon_UNHOUR_XALL_info()
{
	var int AllStuckGold;
	var int AllStuckCoin;
	var string concatText;

	AllStuckGold = Npc_HasItems(self,ItMi_StuckGold);
	AllStuckCoin = AllStuckGold * 500;
	AI_Wait(self,1);
	Npc_RemoveInvItems(self,ItMi_StuckGold,AllStuckGold);
	CreateInvItems(self,ItMi_Gold,AllStuckCoin);
	RankPoints = RankPoints + 1;
	concatText = "Отлито ";
	concatText = ConcatStrings(concatText,IntToString(AllStuckCoin));
	concatText = ConcatStrings(concatText," золотых монет!");
	AI_PrintClr(concatText,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
};

//------------------------Бревно----------------------

func void makearrows_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MAKEARROWS;
		AI_ProcessInfos(her);
	};
};

instance PC_MAKEARROWS_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_makearrows_end_condition;
	information = pc_makearrows_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int pc_makearrows_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEARROWS)
	{
		return TRUE;
	};
};

func void pc_makearrows_end_info()
{
	b_endproductiondialog();
};

instance PC_MAKEARROWS_JustTree(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_MAKEARROWS_JustTree_condition;
	information = PC_MAKEARROWS_JustTree_info;
	permanent = TRUE;
	description = "Изготовить древесную заготовку";
};

func int PC_MAKEARROWS_JustTree_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEARROWS) && (KNOWHOWTOMAKEARROWS == TRUE))
	{
		return TRUE;
	};
};

func void PC_MAKEARROWS_JustTree_info()
{
	AI_Wait(self,1);
	CreateInvItems(self,ItMi_JustTree,1);
	AI_PrintClr("Изготовлена древесная заготовка!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_MAKEARROWS_JustTreeX10(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_MAKEARROWS_JustTreeX10_condition;
	information = PC_MAKEARROWS_JustTreeX10_info;
	permanent = TRUE;
	description = "Изготовить древесную заготовку - x10";
};

func int PC_MAKEARROWS_JustTreeX10_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEARROWS) && (KNOWHOWTOMAKEARROWS == TRUE))
	{
		return TRUE;
	};
};

func void PC_MAKEARROWS_JustTreeX10_info()
{
	AI_Wait(self,2);
	CreateInvItems(self,ItMi_JustTree,10);
	AI_PrintClr("Изготовлено 10 древесных заготовок!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_MAKEARROWS_JustTreeX50(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_MAKEARROWS_JustTreeX50_condition;
	information = PC_MAKEARROWS_JustTreeX50_info;
	permanent = TRUE;
	description = "Изготовить древесную заготовку - x50";
};

func int PC_MAKEARROWS_JustTreeX50_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEARROWS) && (KNOWHOWTOMAKEARROWS == TRUE))
	{
		return TRUE;
	};
};

func void PC_MAKEARROWS_JustTreeX50_info()
{
	AI_Wait(self,3);
	CreateInvItems(self,ItMi_JustTree,50);
	AI_PrintClr("Изготовлено 50 древесных заготовок!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
};

//---------------------Стол для сборки стрел----------------------------

var int DoArrows;
var int DoBolts;

func void MAKEARROWSANDBOLTS_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MAKEBOWS;
		ArrowTableOn = TRUE;
		AI_ProcessInfos(her);
	};
};

instance PC_MAKEARROWSANDBOLTS_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_MAKEARROWSANDBOLTS_end_condition;
	information = PC_MAKEARROWSANDBOLTS_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_MAKEARROWSANDBOLTS_end_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (ArrowTableOn == TRUE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") < 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") < 500) || (Npc_GetDistToWP(hero,"OW_SAWHUT_SLEEP_01") < 1000) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") < 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEARROWSANDBOLTS_end_info()
{
	b_endproductiondialog();
	CreateInvItems(self,ItRw_Arrow,1);
	DoArrows = FALSE;
	DoBolts = FALSE;
	ArrowTableOn = FALSE;
};

instance PC_MAKEARROWSANDBOLTS_ARROWS(C_Info)
{
	npc = PC_Hero;
	condition = PC_MAKEARROWSANDBOLTS_ARROWS_condition;
	information = PC_MAKEARROWSANDBOLTS_ARROWS_info;
	permanent = TRUE;
	description = "Изготовить стрелы";
};

func int PC_MAKEARROWSANDBOLTS_ARROWS_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (ArrowTableOn == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (DoArrows == FALSE) && (DoBolts == FALSE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") < 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") < 500) || (Npc_GetDistToWP(hero,"OW_SAWHUT_SLEEP_01") < 1000) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") < 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEARROWSANDBOLTS_ARROWS_info()
{
	DoArrows = TRUE;
};

instance PC_MAKEARROWSANDBOLTS_BOLTS(C_Info)
{
	npc = PC_Hero;
	condition = PC_MAKEARROWSANDBOLTS_BOLTS_condition;
	information = PC_MAKEARROWSANDBOLTS_BOLTS_info;
	permanent = TRUE;
	description = "Изготовить болты";
};

func int PC_MAKEARROWSANDBOLTS_BOLTS_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (ArrowTableOn == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (DoArrows == FALSE) && (DoBolts == FALSE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") < 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") < 500) || (Npc_GetDistToWP(hero,"OW_SAWHUT_SLEEP_01") < 1000) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") < 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEARROWSANDBOLTS_BOLTS_info()
{
	DoBolts = TRUE;
};

instance PC_MAKEARROWSANDBOLTS_ARROWS_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_MAKEARROWSANDBOLTS_ARROWS_BACK_Condition;
	information = PC_MAKEARROWSANDBOLTS_ARROWS_BACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_MAKEARROWSANDBOLTS_ARROWS_BACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (ArrowTableOn == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (DoArrows == TRUE) && (DoBolts == FALSE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") < 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") < 500) || (Npc_GetDistToWP(hero,"OW_SAWHUT_SLEEP_01") < 1000) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") < 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEARROWSANDBOLTS_ARROWS_BACK_Info()
{
	DoArrows = FALSE;
};

instance PC_MAKEARROWSANDBOLTS_BOLTS_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_MAKEARROWSANDBOLTS_BOLTS_BACK_Condition;
	information = PC_MAKEARROWSANDBOLTS_BOLTS_BACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_MAKEARROWSANDBOLTS_BOLTS_BACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (ArrowTableOn == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (DoArrows == FALSE) && (DoBolts == TRUE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") < 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") < 500) || (Npc_GetDistToWP(hero,"OW_SAWHUT_SLEEP_01") < 1000) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") < 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEARROWSANDBOLTS_BOLTS_BACK_Info()
{
	DoBolts = FALSE;
};

instance PC_MAKEARROWSANDBOLTS_ItMi_Arrow(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_MAKEARROWSANDBOLTS_ItMi_Arrow_condition;
	information = PC_MAKEARROWSANDBOLTS_ItMi_Arrow_info;
	permanent = TRUE;
	description = "Обычные стрелы";
};

func int PC_MAKEARROWSANDBOLTS_ItMi_Arrow_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (ArrowTableOn == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (DoArrows == TRUE) && (DoBolts == FALSE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") < 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") < 500) || (Npc_GetDistToWP(hero,"OW_SAWHUT_SLEEP_01") < 1000) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") < 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEARROWSANDBOLTS_ItMi_Arrow_info()
{
	var int sum_amount;
	var int ing_amount_1;
	var int ing_amount_2;
	var string concatText;

	if((Npc_HasItems(self,ItMi_ArrowShaft) >= 1) && (Npc_HasItems(self,ItMi_ArrowTip) >= 1))
	{
		ing_amount_1 = Npc_HasItems(other,ItMi_ArrowShaft);
		ing_amount_2 = Npc_HasItems(other,ItMi_ArrowTip);

		if(ing_amount_1 > ing_amount_2)
		{
			sum_amount = ing_amount_2 + 1;
		}
		else
		{
			sum_amount = ing_amount_1 + 1;
		};

		AI_Wait(self,1);
		Npc_RemoveInvItems(self,ItMi_ArrowShaft,sum_amount);
		Npc_RemoveInvItems(self,ItMi_ArrowTip,sum_amount);
		CreateInvItems(self,ItRw_Arrow,sum_amount);
		RankPoints = RankPoints + 1;
		concatText = "Изготовлены стрелы! (";
		concatText = ConcatStrings(concatText,IntToString(sum_amount));
		concatText = ConcatStrings(concatText," штук)");
		AI_PrintClr(concatText,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		CreateInvItems(self,ItRw_Arrow,1);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};

	b_endproductiondialog();
	DoArrows = FALSE;
	ArrowTableOn = FALSE;
};

instance PC_MAKEARROWSANDBOLTS_ItMi_Arrow_Ker(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_MAKEARROWSANDBOLTS_ItMi_Arrow_Ker_condition;
	information = PC_MAKEARROWSANDBOLTS_ItMi_Arrow_Ker_info;
	permanent = TRUE;
	description = "Кереновые стрелы (Количество: 50 штук)";
};

func int PC_MAKEARROWSANDBOLTS_ItMi_Arrow_Ker_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (ArrowTableOn == TRUE) && (KNOWHOWTOMAKEARROWSKER == TRUE) && (DoArrows == TRUE) && (DoBolts == FALSE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") < 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") < 500) || (Npc_GetDistToWP(hero,"OW_SAWHUT_SLEEP_01") < 1000) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") < 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEARROWSANDBOLTS_ItMi_Arrow_Ker_info()
{
	var string concatText;

	if((Npc_HasItems(self,ItMi_ArrowShaft) >= 50) && (Npc_HasItems(self,ItMi_KerArrowTip) >= 50) && (Npc_HasItems(self,ItMi_HarpyFeder) >= 1))
	{
		AI_Wait(self,1);
		Npc_RemoveInvItems(self,ItMi_ArrowShaft,50);
		Npc_RemoveInvItems(self,ItMi_KerArrowTip,50);
		Npc_RemoveInvItems(self,ItMi_HarpyFeder,1);
		CreateInvItems(self,ITRW_MYHUNTARROW,50);
		RankPoints = RankPoints + 1;
		concatText = "Изготовлены кереновые стрелы! (";
		concatText = ConcatStrings(concatText,IntToString(50));
		concatText = ConcatStrings(concatText," штук)");
		AI_PrintClr(concatText,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_MAKEARROWSANDBOLTS_ItRw_Bolt(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_MAKEARROWSANDBOLTS_ItRw_Bolt_condition;
	information = PC_MAKEARROWSANDBOLTS_ItRw_Bolt_info;
	permanent = TRUE;
	description = "Обычные болты";
};

func int PC_MAKEARROWSANDBOLTS_ItRw_Bolt_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (ArrowTableOn == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (DoArrows == FALSE) && (DoBolts == TRUE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") < 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") < 500) || (Npc_GetDistToWP(hero,"OW_SAWHUT_SLEEP_01") < 1000) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") < 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEARROWSANDBOLTS_ItRw_Bolt_info()
{
	var int sum_amount;
	var int ing_amount_1;
	var int ing_amount_2;
	var string concatText;

	if((Npc_HasItems(self,ItMi_BoltShaft) >= 1) && (Npc_HasItems(self,ItMi_BoltTip) >= 1))
	{
		ing_amount_1 = Npc_HasItems(other,ItMi_BoltShaft);
		ing_amount_2 = Npc_HasItems(other,ItMi_BoltTip);

		if(ing_amount_1 > ing_amount_2)
		{
			sum_amount = ing_amount_2;
		}
		else
		{
			sum_amount = ing_amount_1;
		};

		AI_Wait(self,1);
		Npc_RemoveInvItems(self,ItMi_BoltShaft,sum_amount);
		Npc_RemoveInvItems(self,ItMi_BoltTip,sum_amount);
		CreateInvItems(self,ItRw_Bolt,sum_amount);
		RankPoints = RankPoints + 1;
		concatText = "Изготовлены арбалетные болты! (";
		concatText = ConcatStrings(concatText,IntToString(sum_amount));
		concatText = ConcatStrings(concatText," штук)");
		AI_PrintClr(concatText,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_MAKEARROWSANDBOLTS_ItMi_FireArrow(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_MAKEARROWSANDBOLTS_ItMi_FireArrow_condition;
	information = PC_MAKEARROWSANDBOLTS_ItMi_FireArrow_info;
	permanent = TRUE;
	description = "Огненные стрелы (Количество: 50 штук)";
};

func int PC_MAKEARROWSANDBOLTS_ItMi_FireArrow_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (ArrowTableOn == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEFIREARROWS == TRUE) && (DoArrows == TRUE) && (DoBolts == FALSE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") < 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") < 500) || (Npc_GetDistToWP(hero,"OW_SAWHUT_SLEEP_01") < 1000) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") < 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEARROWSANDBOLTS_ItMi_FireArrow_info()
{
	if((Npc_HasItems(self,ItMi_ArrowShaft) >= 50) && (Npc_HasItems(self,ItMi_ArrowTip) >= 50) && (Npc_HasItems(self,ItMi_Sulfur) >= 10))
	{
		AI_Wait(self,1);
		Npc_RemoveInvItems(self,ItMi_ArrowShaft,50);
		Npc_RemoveInvItems(self,ItMi_ArrowTip,50);
		Npc_RemoveInvItems(self,ItMi_Sulfur,10);
		CreateInvItems(self,ItRw_Addon_FireArrow,50);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Изготовлены огненные стрелы!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_MAKEARROWSANDBOLTS_ItMi_HolyArrow(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_MAKEARROWSANDBOLTS_ItMi_HolyArrow_condition;
	information = PC_MAKEARROWSANDBOLTS_ItMi_HolyArrow_info;
	permanent = TRUE;
	description = "Освященные стрелы (Количество: 50 штук)";
};

func int PC_MAKEARROWSANDBOLTS_ItMi_HolyArrow_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (ArrowTableOn == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (MAKEHOLYARROWS == TRUE) && (DoArrows == TRUE) && (DoBolts == FALSE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") < 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") < 500) || (Npc_GetDistToWP(hero,"OW_SAWHUT_SLEEP_01") < 1000) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") < 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEARROWSANDBOLTS_ItMi_HolyArrow_info()
{
	if((Npc_HasItems(self,ItMi_ArrowShaft) >= 50) && (Npc_HasItems(self,ItMi_ArrowTip) >= 50) && (Npc_HasItems(self,ItMi_HolyWater) >= 10))
	{
		AI_Wait(self,1);
		Npc_RemoveInvItems(self,ItMi_ArrowShaft,50);
		Npc_RemoveInvItems(self,ItMi_ArrowTip,50);
		Npc_RemoveInvItems(self,ItMi_HolyWater,10);
		CreateInvItems(self,itrw_holyarrow,50);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Изготовлены освященные стрелы!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};


instance PC_MAKEARROWSANDBOLTS_ItRw_Addon_MagicArrow(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_MAKEARROWSANDBOLTS_ItRw_Addon_MagicArrow_condition;
	information = PC_MAKEARROWSANDBOLTS_ItRw_Addon_MagicArrow_info;
	permanent = TRUE;
	description = "Магические стрелы (Количество: 50 штук)";
};

func int PC_MAKEARROWSANDBOLTS_ItRw_Addon_MagicArrow_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (ArrowTableOn == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEMAGICARROWS == TRUE) && (DoArrows == TRUE) && (DoBolts == FALSE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") < 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") < 500) || (Npc_GetDistToWP(hero,"OW_SAWHUT_SLEEP_01") < 1000) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") < 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEARROWSANDBOLTS_ItRw_Addon_MagicArrow_info()
{
	if((Npc_HasItems(self,ItMi_ArrowShaft) >= 50) && (Npc_HasItems(self,ItMi_ArrowTip) >= 50) && (Npc_HasItems(self,ItMi_Quartz) >= 10))
	{
		AI_Wait(self,1);
		Npc_RemoveInvItems(self,ItMi_ArrowShaft,50);
		Npc_RemoveInvItems(self,ItMi_ArrowTip,50);
		Npc_RemoveInvItems(self,ItMi_Quartz,10);
		CreateInvItems(self,ItRw_Addon_MagicArrow,50);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Изготовлены магические стрелы!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_MAKEARROWSANDBOLTS_ItRw_Addon_MagicBolt(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_MAKEARROWSANDBOLTS_ItRw_Addon_MagicBolt_condition;
	information = PC_MAKEARROWSANDBOLTS_ItRw_Addon_MagicBolt_info;
	permanent = TRUE;
	description = "Магические болты (Количество: 50 штук)";
};

func int PC_MAKEARROWSANDBOLTS_ItRw_Addon_MagicBolt_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (ArrowTableOn == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEMAGICBOLT == TRUE) && (DoArrows == FALSE) && (DoBolts == TRUE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") < 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") < 500) || (Npc_GetDistToWP(hero,"OW_SAWHUT_SLEEP_01") < 1000) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") < 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEARROWSANDBOLTS_ItRw_Addon_MagicBolt_info()
{
	if((Npc_HasItems(self,ItMi_BoltShaft) >= 50) && (Npc_HasItems(self,ItMi_BoltTip) >= 50) && (Npc_HasItems(self,ItMi_Quartz) >= 10))
	{
		AI_Wait(self,1);
		Npc_RemoveInvItems(self,ItMi_BoltShaft,50);
		Npc_RemoveInvItems(self,ItMi_BoltTip,50);
		Npc_RemoveInvItems(self,ItMi_Quartz,10);
		CreateInvItems(self,ItRw_Addon_MagicBolt,50);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Изготовлены магические болты!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_MAKEARROWSANDBOLTS_ItMi_HolyBolt(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_MAKEARROWSANDBOLTS_ItMi_HolyBolt_condition;
	information = PC_MAKEARROWSANDBOLTS_ItMi_HolyBolt_info;
	permanent = TRUE;
	description = "Освященные болты (Количество: 50 штук)";
};

func int PC_MAKEARROWSANDBOLTS_ItMi_HolyBolt_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (ArrowTableOn == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (MAKEHOLYARROWS == TRUE) && (DoArrows == FALSE) && (DoBolts == TRUE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") < 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") < 500) || (Npc_GetDistToWP(hero,"OW_SAWHUT_SLEEP_01") < 1000) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") < 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEARROWSANDBOLTS_ItMi_HolyBolt_info()
{
	if((Npc_HasItems(self,ItMi_BoltShaft) >= 50) && (Npc_HasItems(self,ItMi_BoltTip) >= 50) && (Npc_HasItems(self,ItMi_HolyWater) >= 10))
	{
		AI_Wait(self,1);
		Npc_RemoveInvItems(self,ItMi_BoltShaft,50);
		Npc_RemoveInvItems(self,ItMi_BoltTip,50);
		Npc_RemoveInvItems(self,ItMi_HolyWater,10);
		CreateInvItems(self,ItRw_HolyBolt,50);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Изготовлены освященные болты!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

//------------разогрев стальной заготовки-------------------------

var int MakeRawSmith;
var int WarmUpSmith;
var int MakeIronSmith;
var int MakeGoldSmith;
var int MakeOreSmith;

func void smithfire_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SMITHFIRE;
		AI_ProcessInfos(her);
	};
};

instance PC_SMITHFIRE_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_smithfire_end_condition;
	information = pc_smithfire_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int pc_smithfire_end_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (SharpMiscWeapon == FALSE) && (MakeRawSmith == FALSE) && (WarmUpSmith == FALSE) && (MakeIronSmith == FALSE) && (MakeGoldSmith == FALSE) && (MakeOreSmith == FALSE))
	{
		return TRUE;
	};
};

func void pc_smithfire_end_info()
{
	if(Npc_HasItems(self,ItMi_AnvilPliers) < 1)
	{
		CreateInvItems(self,ItMi_AnvilPliers,1);
	};

	b_endproductiondialog();
	MakeRawSmith = FALSE;
	WarmUpSmith = FALSE;
	MakeIronSmith = FALSE;
	MakeGoldSmith = FALSE;
	MakeOreSmith = FALSE;
	SharpMiscWeapon = FALSE;
};

instance PC_SMITHFIRE_ADDON_MakeRaw(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_SMITHFIRE_ADDON_MakeRaw_condition;
	information = PC_SMITHFIRE_ADDON_MakeRaw_info;
	permanent = TRUE;
	description = "Изготовление стальных заготовок";
};

func int PC_SMITHFIRE_ADDON_MakeRaw_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (SharpMiscWeapon == FALSE) && (MakeRawSmith == FALSE) && (WarmUpSmith == FALSE) && (MakeIronSmith == FALSE) && (MakeGoldSmith == FALSE) && (MakeOreSmith == FALSE))
	{
		return TRUE;
	};
};

func void PC_SMITHFIRE_ADDON_MakeRaw_info()
{
	MakeRawSmith = TRUE;
};

instance PC_SMITHFIRE_ADDON_MakeRaw_Back(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_SMITHFIRE_ADDON_MakeRaw_Back_condition;
	information = PC_SMITHFIRE_ADDON_MakeRaw_Back_info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_SMITHFIRE_ADDON_MakeRaw_Back_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (SharpMiscWeapon == FALSE) && (MakeRawSmith == TRUE) && (WarmUpSmith == FALSE) && (MakeIronSmith == FALSE) && (MakeGoldSmith == FALSE) && (MakeOreSmith == FALSE))
	{
		return TRUE;
	};
};

func void PC_SMITHFIRE_ADDON_MakeRaw_Back_info()
{
	MakeRawSmith = FALSE;
};

instance PC_SMITHFIRE_ADDON_WarmUpSmith(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_SMITHFIRE_ADDON_WarmUpSmith_condition;
	information = PC_SMITHFIRE_ADDON_WarmUpSmith_info;
	permanent = TRUE;
	description = "Разогрев стальных заготовок";
};

func int PC_SMITHFIRE_ADDON_WarmUpSmith_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (SharpMiscWeapon == FALSE) && (MakeRawSmith == FALSE) && (WarmUpSmith == FALSE) && (MakeIronSmith == FALSE) && (MakeGoldSmith == FALSE) && (MakeOreSmith == FALSE))
	{
		return TRUE;
	};
};

func void PC_SMITHFIRE_ADDON_WarmUpSmith_info()
{
	WarmUpSmith = TRUE;
};

instance PC_SMITHFIRE_ADDON_WarmUpSmith_Back(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_SMITHFIRE_ADDON_WarmUpSmith_Back_condition;
	information = PC_SMITHFIRE_ADDON_WarmUpSmith_Back_info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_SMITHFIRE_ADDON_WarmUpSmith_Back_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (SharpMiscWeapon == FALSE) && (MakeRawSmith == FALSE) && (WarmUpSmith == TRUE) && (MakeIronSmith == FALSE) && (MakeGoldSmith == FALSE) && (MakeOreSmith == FALSE))
	{
		return TRUE;
	};
};

func void PC_SMITHFIRE_ADDON_WarmUpSmith_Back_info()
{
	WarmUpSmith = FALSE;
};

instance PC_SMITHFIRE_ADDON_MakeIronSmith(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_SMITHFIRE_ADDON_MakeIronSmith_condition;
	information = PC_SMITHFIRE_ADDON_MakeIronSmith_info;
	permanent = TRUE;
	description = "Плавка железной руды";
};

func int PC_SMITHFIRE_ADDON_MakeIronSmith_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (SharpMiscWeapon == FALSE) && (MakeRawSmith == FALSE) && (WarmUpSmith == FALSE) && (MakeIronSmith == FALSE) && (MakeGoldSmith == FALSE) && (MakeOreSmith == FALSE))
	{
		return TRUE;
	};
};

func void PC_SMITHFIRE_ADDON_MakeIronSmith_info()
{
	MakeIronSmith = TRUE;
};

instance PC_SMITHFIRE_ADDON_MakeIronSmith_Back(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_SMITHFIRE_ADDON_MakeIronSmith_Back_condition;
	information = PC_SMITHFIRE_ADDON_MakeIronSmith_Back_info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_SMITHFIRE_ADDON_MakeIronSmith_Back_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (SharpMiscWeapon == FALSE) && (MakeRawSmith == FALSE) && (WarmUpSmith == FALSE) && (MakeIronSmith == TRUE) && (MakeGoldSmith == FALSE) && (MakeOreSmith == FALSE))
	{
		return TRUE;
	};
};

func void PC_SMITHFIRE_ADDON_MakeIronSmith_Back_info()
{
	MakeIronSmith = FALSE;
};

instance PC_SMITHFIRE_ADDON_MakeGoldSmith(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_SMITHFIRE_ADDON_MakeGoldSmith_condition;
	information = PC_SMITHFIRE_ADDON_MakeGoldSmith_info;
	permanent = TRUE;
	description = "Плавка золотых самородков";
};

func int PC_SMITHFIRE_ADDON_MakeGoldSmith_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (SharpMiscWeapon == FALSE) && (MakeRawSmith == FALSE) && (WarmUpSmith == FALSE) && (MakeIronSmith == FALSE) && (MakeGoldSmith == FALSE) && (MakeOreSmith == FALSE))
	{
		return TRUE;
	};
};

func void PC_SMITHFIRE_ADDON_MakeGoldSmith_info()
{
	MakeGoldSmith = TRUE;
};

instance PC_SMITHFIRE_ADDON_MakeGoldSmith_Back(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_SMITHFIRE_ADDON_MakeGoldSmith_Back_condition;
	information = PC_SMITHFIRE_ADDON_MakeGoldSmith_Back_info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_SMITHFIRE_ADDON_MakeGoldSmith_Back_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (SharpMiscWeapon == FALSE) && (MakeRawSmith == FALSE) && (WarmUpSmith == FALSE) && (MakeIronSmith == FALSE) && (MakeGoldSmith == TRUE) && (MakeOreSmith == FALSE))
	{
		return TRUE;
	};
};

func void PC_SMITHFIRE_ADDON_MakeGoldSmith_Back_info()
{
	MakeGoldSmith = FALSE;
};


instance PC_SMITHFIRE_ADDON_MakeOreSmith(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = PC_SMITHFIRE_ADDON_MakeOreSmith_condition;
	information = PC_SMITHFIRE_ADDON_MakeOreSmith_info;
	permanent = TRUE;
	description = "Плавка магической руды";
};

func int PC_SMITHFIRE_ADDON_MakeOreSmith_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (SharpMiscWeapon == FALSE) && (MakeRawSmith == FALSE) && (WarmUpSmith == FALSE) && (MakeIronSmith == FALSE) && (MakeGoldSmith == FALSE) && (MakeOreSmith == FALSE))
	{
		return TRUE;
	};
};

func void PC_SMITHFIRE_ADDON_MakeOreSmith_info()
{
	MakeOreSmith = TRUE;
};

instance PC_SMITHFIRE_ADDON_MakeOreSmith_Back(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_SMITHFIRE_ADDON_MakeOreSmith_Back_condition;
	information = PC_SMITHFIRE_ADDON_MakeOreSmith_Back_info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_SMITHFIRE_ADDON_MakeOreSmith_Back_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (SharpMiscWeapon == FALSE) && (MakeRawSmith == FALSE) && (WarmUpSmith == FALSE) && (MakeIronSmith == FALSE) && (MakeGoldSmith == FALSE) && (MakeOreSmith == TRUE))
	{
		return TRUE;
	};
};

func void PC_SMITHFIRE_ADDON_MakeOreSmith_Back_info()
{
	MakeOreSmith = FALSE;
};

instance PC_SMITHFIRE_ADDON_UNHOUR(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_smithfire_addon_UNHOUR_condition;
	information = pc_smithfire_addon_UNHOUR_info;
	permanent = TRUE;
	description = "Изготовить стальную заготовку (железный слиток x1)";
};

func int pc_smithfire_addon_UNHOUR_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (MakeRawSmith == TRUE) && (Npc_HasItems(self,ItMi_IronStuck) >= 1))
	{
		return TRUE;
	};
};

func void pc_smithfire_addon_UNHOUR_info()
{
	if(Npc_HasItems(self,ItMi_IronStuck) >= 1)
	{
		AI_Wait(self,1);
		Npc_RemoveInvItems(self,ItMi_IronStuck,1);
		CreateInvItems(self,ItMiSwordraw,1);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Изготовлена стальная заготовка!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_SMITHFIRE_ADDON_ANHOUR(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_smithfire_addon_ANHOUR_condition;
	information = pc_smithfire_addon_ANHOUR_info;
	permanent = TRUE;
	description = "Изготовить пять стальных заготовок (железный слиток x5)";
};

func int pc_smithfire_addon_ANHOUR_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (MakeRawSmith == TRUE) && (Npc_HasItems(self,ItMi_IronStuck) >= 5))
	{
		return TRUE;
	};
};

func void pc_smithfire_addon_ANHOUR_info()
{
	if(Npc_HasItems(self,ItMi_IronStuck) >= 5)
	{
		AI_Wait(self,1);
		Npc_RemoveInvItems(self,ItMi_IronStuck,5);
		CreateInvItems(self,ItMiSwordraw,5);
		AI_PrintClr("Изготовлено пять стальных заготовок!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_SMITHFIRE_ADDON_ANHOURALL(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = pc_smithfire_addon_ANHOURALL_condition;
	information = pc_smithfire_addon_ANHOURALL_info;
	permanent = TRUE;
	description = "Переработать все железные слитки в стальные заготовки";
};

func int pc_smithfire_addon_ANHOURALL_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (MakeRawSmith == TRUE) && (Npc_HasItems(self,ItMi_IronStuck) >= 1))
	{
		return TRUE;
	};
};

func void pc_smithfire_addon_ANHOURALL_info()
{
	var string concatText;
	var int CountDraw;

	AI_Wait(self,1);
	CountDraw = Npc_HasItems(self,ItMi_IronStuck);
	Npc_RemoveInvItems(self,ItMi_IronStuck,Npc_HasItems(self,ItMi_IronStuck));
	CreateInvItems(self,ItMiSwordraw,CountDraw);
	RankPoints = RankPoints + 1;
	concatText = ConcatStrings("Изготовлено ",IntToString(CountDraw));

	if(CountDraw == 1)
	{
		concatText = ConcatStrings(concatText," стальная заготовка!");
	}
	else if((CountDraw > 1) && (CountDraw < 5))
	{
		concatText = ConcatStrings(concatText," стальных заготовки!");
	}
	else if(CountDraw >= 5)
	{
		concatText = ConcatStrings(concatText," стальных заготовок!");
	};

	AI_PrintClr(concatText,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_SMITHFIRE_ADDON_HOUR(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_smithfire_addon_hour_condition;
	information = pc_smithfire_addon_hour_info;
	permanent = TRUE;
	description = "Разогреть стальную заготовку";
};

func int pc_smithfire_addon_hour_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (WarmUpSmith == TRUE) && (Npc_HasItems(self,ItMiSwordraw) >= 1))
	{
		return TRUE;
	};
};

func void pc_smithfire_addon_hour_info()
{
	if(Npc_HasItems(self,ItMiSwordraw) >= 1)
	{
		AI_Wait(self,1);
		Npc_RemoveInvItems(self,ItMiSwordraw,1);
		CreateInvItems(self,itmiswordrawhot_1,1);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Вы разогрели стальную заготовку!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_SMITHFIRE_ADDON_HOUR_X5(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_smithfire_addon_hour_x5_condition;
	information = pc_smithfire_addon_hour_x5_info;
	permanent = TRUE;
	description = "Разогреть стальную заготовку - x5";
};

func int pc_smithfire_addon_hour_x5_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (WarmUpSmith == TRUE) && (Npc_HasItems(self,ItMiSwordraw) >= 5))
	{
		return TRUE;
	};
};

func void pc_smithfire_addon_hour_x5_info()
{
	if(Npc_HasItems(self,ItMiSwordraw) >= 5)
	{
		AI_Wait(self,1);
		Npc_RemoveInvItems(self,ItMiSwordraw,5);
		CreateInvItems(self,itmiswordrawhot_1,5);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Вы разогрели стальные заготовки!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_SMITHFIRE_ADDON_HOUR_XALL(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_SMITHFIRE_ADDON_HOUR_XALL_condition;
	information = PC_SMITHFIRE_ADDON_HOUR_XALL_info;
	permanent = TRUE;
	description = "Разогреть все стальные заготовки";
};

func int PC_SMITHFIRE_ADDON_HOUR_XALL_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (WarmUpSmith == TRUE) && (Npc_HasItems(self,ItMiSwordraw) >= 1))
	{
		return TRUE;
	};
};

func void PC_SMITHFIRE_ADDON_HOUR_XALL_info()
{
	var int CountDraw;

	AI_Wait(self,1);
	CountDraw = Npc_HasItems(self,ItMiSwordraw);
	Npc_RemoveInvItems(self,ItMiSwordraw,Npc_HasItems(self,ItMiSwordraw));
	CreateInvItems(self,itmiswordrawhot_1,CountDraw);
	RankPoints = RankPoints + 1;
	AI_PrintClr("Вы разогрели все стальные заготовки!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_SMITHFIRE_ADDON_HOUR2(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_smithfire_addon_hour2_condition;
	information = pc_smithfire_addon_hour2_info;
	permanent = TRUE;
	description = "Выплавить железный слиток";
};

func int pc_smithfire_addon_hour2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (MakeIronSmith == TRUE) && (KNOWHOWTOOREFUS == TRUE) && (Npc_HasItems(self,itmi_snugget) >= 50))
	{
		return TRUE;
	};
};

func void pc_smithfire_addon_hour2_info()
{
	if(Npc_HasItems(self,itmi_snugget) >= 50)
	{
		AI_Wait(self,1);
		Npc_RemoveInvItems(self,itmi_snugget,50);
		CreateInvItems(self,ItMi_IronStuck,1);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Изготовлен железный слиток!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_SMITHFIRE_ADDON_HOUR2X5(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_smithfire_addon_hour2X5_condition;
	information = pc_smithfire_addon_hour2X5_info;
	permanent = TRUE;
	description = "Выплавить железный слиток - x5";
};

func int pc_smithfire_addon_hour2X5_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (MakeIronSmith == TRUE) && (KNOWHOWTOOREFUS == TRUE) && (Npc_HasItems(self,itmi_snugget) >= 250))
	{
		return TRUE;
	};
};

func void pc_smithfire_addon_hour2X5_info()
{
	if(Npc_HasItems(self,itmi_snugget) >= 250)
	{
		AI_Wait(self,1);
		Npc_RemoveInvItems(self,itmi_snugget,250);
		CreateInvItems(self,ItMi_IronStuck,5);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Изготовлено пять железных слитков!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_SMITHFIRE_ADDON_IRONALL(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = pc_smithfire_addon_IRONALL_condition;
	information = pc_smithfire_addon_IRONALL_info;
	permanent = TRUE;
	description = "Переплавить всю железную руду в слитки";
};

func int pc_smithfire_addon_IRONALL_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (MakeIronSmith == TRUE) && (KNOWHOWTOOREFUS == TRUE) && (Npc_HasItems(self,itmi_snugget) >= 50))
	{
		return TRUE;
	};
};

func void pc_smithfire_addon_IRONALL_info()
{
	var string concatText;
	var int CountIronOre;
	var int CountIronOreStucks;

	AI_Wait(self,1);
	CountIronOre = Npc_HasItems(self,itmi_snugget);
	CountIronOreStucks = CountIronOre / 50;
	Npc_RemoveInvItems(self,itmi_snugget,Npc_HasItems(self,itmi_snugget));
	CreateInvItems(self,ItMi_IronStuck,CountIronOreStucks);
	RankPoints = RankPoints + 1;
	concatText = ConcatStrings("Изготовлено ",IntToString(CountIronOreStucks));

	if(CountIronOreStucks == 1)
	{
		concatText = ConcatStrings(concatText," железный слиток!");
	}
	else if((CountIronOreStucks > 1) && (CountIronOreStucks < 5))
	{
		concatText = ConcatStrings(concatText," железных слитка!");
	}
	else if(CountIronOreStucks >= 5)
	{
		concatText = ConcatStrings(concatText," железных слитков!");
	};

	AI_PrintClr(concatText,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_SMITHFIRE_ADDON_GOLD(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_smithfire_addon_gold_condition;
	information = pc_smithfire_addon_gold_info;
	permanent = TRUE;
	description = "Выплавить золотой слиток";
};

func int pc_smithfire_addon_gold_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (MakeGoldSmith == TRUE) && (KNOWHOWTOOREFUSGOLD == TRUE) && (Npc_HasItems(self,ItMi_Addon_GoldNugget) >= 25))
	{
		return TRUE;
	};
};

func void pc_smithfire_addon_gold_info()
{
	if(Npc_HasItems(self,ItMi_Addon_GoldNugget) >= 25)
	{
		AI_Wait(self,1);
		Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,25);
		CreateInvItems(self,ItMi_StuckGold,1);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Изготовлен золотой слиток!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_SMITHFIRE_ADDON_GOLDX5(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_smithfire_addon_goldX5_condition;
	information = pc_smithfire_addon_goldX5_info;
	permanent = TRUE;
	description = "Выплавить золотой слиток - x5";
};

func int pc_smithfire_addon_goldX5_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (MakeGoldSmith == TRUE) && (KNOWHOWTOOREFUSGOLD == TRUE) && (Npc_HasItems(self,ItMi_Addon_GoldNugget) >= 125))
	{
		return TRUE;
	};
};

func void pc_smithfire_addon_goldX5_info()
{
	if(Npc_HasItems(self,ItMi_Addon_GoldNugget) >= 125)
	{
		AI_Wait(self,1);
		Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,125);
		CreateInvItems(self,ItMi_StuckGold,5);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Изготовлено пять золотых слитков!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_SMITHFIRE_ADDON_GOLDALL(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = pc_smithfire_addon_GOLDALL_condition;
	information = pc_smithfire_addon_GOLDALL_info;
	permanent = TRUE;
	description = "Переплавить все золотые самородки в слитки";
};

func int pc_smithfire_addon_GOLDALL_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (MakeGoldSmith == TRUE) && (KNOWHOWTOOREFUSGOLD == TRUE) && (Npc_HasItems(self,ItMi_Addon_GoldNugget) >= 25))
	{
		return TRUE;
	};
};

func void pc_smithfire_addon_GOLDALL_info()
{
	var string concatText;
	var int CountGoldOre;
	var int CountGoldOreStucks;

	AI_Wait(self,1);
	CountGoldOre = Npc_HasItems(self,ItMi_Addon_GoldNugget);
	CountGoldOreStucks = CountGoldOre / 25;
	Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,Npc_HasItems(self,ItMi_Addon_GoldNugget));
	CreateInvItems(self,ItMi_StuckGold,CountGoldOreStucks);
	RankPoints = RankPoints + 1;
	concatText = ConcatStrings("Изготовлено ",IntToString(CountGoldOreStucks));

	if(CountGoldOreStucks == 1)
	{
		concatText = ConcatStrings(concatText," золотой слиток!");
	}
	else if((CountGoldOreStucks > 1) && (CountGoldOreStucks < 5))
	{
		concatText = ConcatStrings(concatText," золотых слитка!");
	}
	else if(CountGoldOreStucks >= 5)
	{
		concatText = ConcatStrings(concatText," золотых слитков!");
	};

	AI_PrintClr(concatText,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_SMITHFIRE_ADDON_OREDO(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_smithfire_addon_OREDO_condition;
	information = pc_smithfire_addon_OREDO_info;
	permanent = TRUE;
	description = "Выплавить рудный слиток";
};

func int pc_smithfire_addon_OREDO_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (MakeOreSmith == TRUE) && (PlayerRudoplav == TRUE) && (Npc_HasItems(self,itmi_nugget) >= 50))
	{
		return TRUE;
	};
};

func void pc_smithfire_addon_OREDO_info()
{
	if(Npc_HasItems(self,itmi_nugget) >= 50)
	{
		AI_Wait(self,1);
		Npc_RemoveInvItems(self,itmi_nugget,50);
		CreateInvItems(self,ItMi_OreStuck,1);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Изготовлен рудный слиток!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_SMITHFIRE_ADDON_OREDOX5(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_smithfire_addon_OREDOX5_condition;
	information = pc_smithfire_addon_OREDOX5_info;
	permanent = TRUE;
	description = "Выплавить рудный слиток - x5";
};

func int pc_smithfire_addon_OREDOX5_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (MakeOreSmith == TRUE) && (PlayerRudoplav == TRUE) && (Npc_HasItems(self,itmi_nugget) >= 250))
	{
		return TRUE;
	};
};

func void pc_smithfire_addon_OREDOX5_info()
{
	if(Npc_HasItems(self,itmi_nugget) >= 250)
	{
		AI_Wait(self,1);
		Npc_RemoveInvItems(self,itmi_nugget,250);
		CreateInvItems(self,ItMi_OreStuck,5);
		RankPoints = RankPoints + 1;
		AI_PrintClr("Изготовлено пять рудных слитков!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_SMITHFIRE_ADDON_OREDOALL(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = pc_smithfire_addon_OREDOALL_condition;
	information = pc_smithfire_addon_OREDOALL_info;
	permanent = TRUE;
	description = "Переплавить всю магическую руду в слитки";
};

func int pc_smithfire_addon_OREDOALL_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (MakeOreSmith == TRUE) && (PlayerRudoplav == TRUE) && (Npc_HasItems(self,itmi_nugget) >= 50))
	{
		return TRUE;
	};
};

func void pc_smithfire_addon_OREDOALL_info()
{
	var string concatText;
	var int CountMagicOre;
	var int CountMagicOreStucks;

	AI_Wait(self,1);
	CountMagicOre = Npc_HasItems(self,itmi_nugget);
	CountMagicOreStucks = CountMagicOre / 50;
	Npc_RemoveInvItems(self,itmi_nugget,Npc_HasItems(self,itmi_nugget));
	CreateInvItems(self,ItMi_OreStuck,CountMagicOreStucks);
	RankPoints = RankPoints + 1;
	concatText = ConcatStrings("Изготовлено ",IntToString(CountMagicOreStucks));

	if(CountMagicOreStucks == 1)
	{
		concatText = ConcatStrings(concatText," рудный слиток!");
	}
	else if((CountMagicOreStucks > 1) && (CountMagicOreStucks < 5))
	{
		concatText = ConcatStrings(concatText," рудных слитка!");
	}
	else if(CountMagicOreStucks >= 5)
	{
		concatText = ConcatStrings(concatText," рудных слитков!");
	};

	AI_PrintClr(concatText,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_SMITHFIRE_ADDON_ORCWEAPON(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = pc_smithfire_addon_ORCWEAPON_condition;
	information = pc_smithfire_addon_ORCWEAPON_info;
	permanent = TRUE;
	description = "Переплавить оружие орков";
};

func int pc_smithfire_addon_ORCWEAPON_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (MakeRawSmith == FALSE) && (WarmUpSmith == FALSE) && (MakeIronSmith == FALSE) && (MakeGoldSmith == FALSE) && (MakeOreSmith == FALSE) && (OrcsWeaponSteel == TRUE) && ((Npc_HasItems(hero,ItMw_2H_OrcAxe_01) > 0) || (Npc_HasItems(hero,ItMw_2H_OrcAxe_02) > 0) || (Npc_HasItems(hero,ItMw_2H_OrcAxe_03) > 0) || (Npc_HasItems(hero,ItMw_2H_OrcAxe_04) > 0) || (Npc_HasItems(hero,ItMw_2H_OrcSword_01) > 0) || (Npc_HasItems(hero,ItMw_2H_OrcSword_02) > 0) || (Npc_HasItems(hero,ItMw_2H_OrcSword_03) > 0) || (Npc_HasItems(hero,ItMw_2H_OrcSword_04) > 0) || (Npc_HasItems(hero,ITMW_2H_ORCMACE_01) > 0) || (Npc_HasItems(hero,ITMW_2H_ORCMACE_02) > 0) || (Npc_HasItems(hero,ITMW_2H_DRACONSWORD_01) > 0)))
	{
		return TRUE;
	};
};

func void pc_smithfire_addon_ORCWEAPON_info()
{
	var int CountOrcWeapons;
	var int CountOrcWeapons1;
	var int CountOrcWeapons2;
	var int CountOrcWeapons3;
	var int CountOrcWeapons4;
	var int CountOrcWeapons5;
	var int CountOrcWeapons6;
	var int CountOrcWeapons7;
	var int CountOrcWeapons8;
	var int CountOrcWeapons9;
	var int CountOrcWeapons10;
	var int CountOrcWeapons11;
	var int CountSteel;
	var string concatText;

	CountOrcWeapons = FALSE;
	CountSteel = FALSE;
	CountOrcWeapons1 = FALSE;
	CountOrcWeapons2 = FALSE;
	CountOrcWeapons3 = FALSE;
	CountOrcWeapons4 = FALSE;
	CountOrcWeapons5 = FALSE;
	CountOrcWeapons6 = FALSE;
	CountOrcWeapons7 = FALSE;
	CountOrcWeapons8 = FALSE;
	CountOrcWeapons9 = FALSE;
	CountOrcWeapons10 = FALSE;
	CountOrcWeapons11 = FALSE;

	if(Npc_HasItems(hero,ItMw_2H_OrcAxe_01) > 0)
	{
		CountOrcWeapons1 = Npc_HasItems(hero,ItMw_2H_OrcAxe_01);
	};
	if(Npc_HasItems(hero,ItMw_2H_OrcAxe_02) > 0)
	{
		CountOrcWeapons2 = Npc_HasItems(hero,ItMw_2H_OrcAxe_02);
	};
	if(Npc_HasItems(hero,ItMw_2H_OrcAxe_03) > 0)
	{
		CountOrcWeapons3 = Npc_HasItems(hero,ItMw_2H_OrcAxe_03);
	};
	if(Npc_HasItems(hero,ItMw_2H_OrcAxe_04) > 0)
	{
		CountOrcWeapons4 = Npc_HasItems(hero,ItMw_2H_OrcAxe_04);
	};
	if(Npc_HasItems(hero,ItMw_2H_OrcSword_01) > 0)
	{
		CountOrcWeapons5 = Npc_HasItems(hero,ItMw_2H_OrcSword_01);
	};
	if(Npc_HasItems(hero,ItMw_2H_OrcSword_02) > 0)
	{
		CountOrcWeapons6 = Npc_HasItems(hero,ItMw_2H_OrcSword_02);
	};
	if(Npc_HasItems(hero,ItMw_2H_OrcSword_03) > 0)
	{
		CountOrcWeapons7 = Npc_HasItems(hero,ItMw_2H_OrcSword_03);
	};
	if(Npc_HasItems(hero,ItMw_2H_OrcSword_04) > 0)
	{
		CountOrcWeapons8 = Npc_HasItems(hero,ItMw_2H_OrcSword_04);
	};
	if(Npc_HasItems(hero,ITMW_2H_ORCMACE_01) > 0)
	{
		CountOrcWeapons9 = Npc_HasItems(hero,ITMW_2H_ORCMACE_01);
	};
	if(Npc_HasItems(hero,ITMW_2H_ORCMACE_02) > 0)
	{
		CountOrcWeapons10 = Npc_HasItems(hero,ITMW_2H_ORCMACE_02);
	};
	if(Npc_HasItems(hero,ITMW_2H_DRACONSWORD_01) > 0)
	{
		CountOrcWeapons11 = Npc_HasItems(hero,ITMW_2H_DRACONSWORD_01);
	};

	CountOrcWeapons = CountOrcWeapons1 + CountOrcWeapons2 + CountOrcWeapons3 + CountOrcWeapons4 + CountOrcWeapons5 + CountOrcWeapons6 + CountOrcWeapons7 + CountOrcWeapons8 + CountOrcWeapons9 + CountOrcWeapons10 + CountOrcWeapons11;

	if(CountOrcWeapons >= 10)
	{
		Npc_RemoveInvItems(hero,ItMw_2H_OrcAxe_01,Npc_HasItems(hero,ItMw_2H_OrcAxe_01));
		Npc_RemoveInvItems(hero,ItMw_2H_OrcAxe_02,Npc_HasItems(hero,ItMw_2H_OrcAxe_02));
		Npc_RemoveInvItems(hero,ItMw_2H_OrcAxe_03,Npc_HasItems(hero,ItMw_2H_OrcAxe_03));
		Npc_RemoveInvItems(hero,ItMw_2H_OrcAxe_04,Npc_HasItems(hero,ItMw_2H_OrcAxe_04));
		Npc_RemoveInvItems(hero,ItMw_2H_OrcSword_01,Npc_HasItems(hero,ItMw_2H_OrcSword_01));
		Npc_RemoveInvItems(hero,ItMw_2H_OrcSword_02,Npc_HasItems(hero,ItMw_2H_OrcSword_02));
		Npc_RemoveInvItems(hero,ItMw_2H_OrcSword_03,Npc_HasItems(hero,ItMw_2H_OrcSword_03));
		Npc_RemoveInvItems(hero,ItMw_2H_OrcSword_04,Npc_HasItems(hero,ItMw_2H_OrcSword_04));
		Npc_RemoveInvItems(hero,ITMW_2H_ORCMACE_01,Npc_HasItems(hero,ITMW_2H_ORCMACE_01));
		Npc_RemoveInvItems(hero,ITMW_2H_ORCMACE_02,Npc_HasItems(hero,ITMW_2H_ORCMACE_02));
		Npc_RemoveInvItems(hero,ITMW_2H_DRACONSWORD_01,Npc_HasItems(hero,ITMW_2H_DRACONSWORD_01));
		CountSteel = CountOrcWeapons / 10;
		AI_Wait(hero,2);

		RankPoints = RankPoints + 1;
		CreateInvItems(hero,ItMi_IronStuck,CountSteel);
		concatText = ConcatStrings("Изготовлено ",IntToString(CountSteel));
		concatText = ConcatStrings(concatText," железных слитков...");
		AI_PrintClr(concatText,83,152,48);
		B_Say(hero,hero,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr("Не хватает орочей стали!",177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_SharpMiscWeapon(C_Info)
{
	npc = PC_Hero;
	nr = 7;
	condition = PC_SharpMiscWeapon_condition;
	information = PC_SharpMiscWeapon_info;
	permanent = TRUE;
	description = "Переплавка ржавого оружия";
};

func int PC_SharpMiscWeapon_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (KNOWHOWTOOREFUS == TRUE) && (SharpMiscWeapon == FALSE) && (MakeRawSmith == FALSE) && (WarmUpSmith == FALSE) && (MakeIronSmith == FALSE) && (MakeGoldSmith == FALSE) && (MakeOreSmith == FALSE))
	{
		return TRUE;
	};
};

func void PC_SharpMiscWeapon_info()
{
	SharpMiscWeapon = TRUE;
};

instance PC_SharpMiscWeapon_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_SharpMiscWeapon_BACK_Condition;
	information = PC_SharpMiscWeapon_BACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_SharpMiscWeapon_BACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (KNOWHOWTOOREFUS == TRUE) && (SharpMiscWeapon == TRUE) && (MakeRawSmith == FALSE) && (WarmUpSmith == FALSE) && (MakeIronSmith == FALSE) && (MakeGoldSmith == FALSE) && (MakeOreSmith == FALSE))
	{
		return TRUE;
	};
};

func void PC_SharpMiscWeapon_BACK_Info()
{
	SharpMiscWeapon = FALSE;
};

instance PC_SHARPMISC_1(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_sharpmisc_1_condition;
	information = pc_sharpmisc_1_info;
	permanent = TRUE;
	description = "Переплавить ржавые мечи - (требуется 10 шт.)";
};

func int pc_sharpmisc_1_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (KNOWHOWTOOREFUS == TRUE) && (SharpMiscWeapon == TRUE) && (Npc_HasItems(hero,ItMw_1h_MISC_Sword) >= 1))
	{
		return TRUE;
	};
};

func void pc_sharpmisc_1_info()
{
	if(Npc_HasItems(hero,ItMw_1h_MISC_Sword) >= 10)
	{
		AI_Wait(self,1);
		B_GivePlayerXP(10);
		Npc_RemoveInvItems(hero,ItMw_1h_MISC_Sword,10);
		RankPoints = RankPoints + 1;
		CreateInvItems(hero,ItMi_IronStuck,1);
		AI_PrintClr("Изготовлен железный слиток!",83,152,48);
		B_Say(hero,hero,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr("Для изготовления не хватает ржавой стали!",177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_SHARPMISC_2(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_sharpmisc_2_condition;
	information = pc_sharpmisc_2_info;
	permanent = TRUE;
	description = "Переплавить ржавые двуручные мечи - (требуется 6 шт.)";
};

func int pc_sharpmisc_2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (KNOWHOWTOOREFUS == TRUE) && (SharpMiscWeapon == TRUE) && (Npc_HasItems(hero,ItMw_2H_Sword_M_01) >= 1))
	{
		return TRUE;
	};
};

func void pc_sharpmisc_2_info()
{
	if(Npc_HasItems(hero,ItMw_2H_Sword_M_01) >= 6)
	{
		AI_Wait(self,1);
		B_GivePlayerXP(10);
		Npc_RemoveInvItems(hero,ItMw_2H_Sword_M_01,6);
		RankPoints = RankPoints + 1;
		CreateInvItems(hero,ItMi_IronStuck,1);
		AI_PrintClr("Изготовлен железный слиток!",83,152,48);
		B_Say(hero,hero,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr("Для изготовления не хватает ржавой стали!",177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_SHARPMISC_3(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = pc_sharpmisc_3_condition;
	information = pc_sharpmisc_3_info;
	permanent = TRUE;
	description = "Переплавить ржавые топоры - (требуется 8 шт.)";
};

func int pc_sharpmisc_3_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHFIRE) && (KNOWHOWTOOREFUS == TRUE) && (SharpMiscWeapon == TRUE) && (Npc_HasItems(hero,ItMw_1h_Misc_Axe) >= 1))
	{
		return TRUE;
	};
};

func void pc_sharpmisc_3_info()
{
	var int ShWeap;
	var int IronSt;
	var string concatText;

	if(Npc_HasItems(hero,ItMw_1h_Misc_Axe) >= 8)
	{
		AI_Wait(self,1);
		B_GivePlayerXP(10);
		Npc_RemoveInvItems(hero,ItMw_1h_Misc_Axe,8);
		RankPoints = RankPoints + 1;
		CreateInvItems(hero,ItMi_IronStuck,1);
		AI_PrintClr("Изготовлен железный слиток!",83,152,48);
		B_Say(hero,hero,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr("Для изготовления не хватает ржавой стали!",177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

//-------------------------------магическая кузня --------------------------------------------------------

var int ProcessResult;

func void MagicOreFireGorn_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MagicOreFireGorn;
		AI_ProcessInfos(her);
	};
};

instance PC_MagicOreFireGorn_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_MagicOreFireGorn_end_condition;
	information = pc_MagicOreFireGorn_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int pc_MagicOreFireGorn_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_MagicOreFireGorn)
	{
		return TRUE;
	};
};

func void pc_MagicOreFireGorn_end_info()
{
	if(Npc_HasItems(self,ItMi_MagicOrePliers) < 1)
	{
		CreateInvItems(self,ItMi_MagicOrePliers,1);
	};
	b_endproductiondialog();
};

instance PC_MagicOreFireGorn_Nimrod(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_MagicOreFireGorn_Nimrod_condition;
	information = pc_MagicOreFireGorn_Nimrod_info;
	permanent = TRUE;
	description = "Изготовить 'ЧИСТУЮ' болванку из магической руды";
};

func int pc_MagicOreFireGorn_Nimrod_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MagicOreFireGorn) && (ClearPlayerRudoplav == TRUE))
	{
		return TRUE;
	};
};

func void pc_MagicOreFireGorn_Nimrod_info()
{
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,DIALOG_ENDE_WORK,pc_MagicOreFireGorn_end_info);

	if(Npc_HasItems(self,ItMi_Nugget) >= 100)
	{	
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Приступить к изготовлению.",pc_MagicOreFireGorn_Nimrod_Begin);
	};
};

func void pc_MagicOreFireGorn_Nimrod_Begin()
{
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Быстро плавить магическую руду",pc_MagicOreFireGorn_Nimrod_Process_Hot_5);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Плавить магическую руду",pc_MagicOreFireGorn_Nimrod_Process_Hot_10);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Медленно плавить магическую руду",pc_MagicOreFireGorn_Nimrod_Process_Hot_15);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Очень медленно плавить магическую руду",pc_MagicOreFireGorn_Nimrod_Process_Hot_20);
};

func void pc_MagicOreFireGorn_Nimrod_Process_Hot_5()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,1);
	ProcessResult = 1;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Очень быстро выпарить примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_5);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Быстро выпарить примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_10);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Выпаривать примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_15);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Медленно выпаривать примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_20);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Очень медленно выпаривать примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_25);
};

func void pc_MagicOreFireGorn_Nimrod_Process_Hot_10()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	ProcessResult = 2;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Очень быстро выпарить примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_5);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Быстро выпарить примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_10);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Выпаривать примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_15);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Медленно выпаривать примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_20);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Очень медленно выпаривать примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_25);
};

func void pc_MagicOreFireGorn_Nimrod_Process_Hot_15()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	ProcessResult = 3;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Очень быстро выпарить примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_5);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Быстро выпарить примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_10);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Выпаривать примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_15);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Медленно выпаривать примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_20);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Очень медленно выпаривать примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_25);
};

func void pc_MagicOreFireGorn_Nimrod_Process_Hot_20()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	ProcessResult = 1;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Очень быстро выпарить примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_5);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Быстро выпарить примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_10);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Выпаривать примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_15);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Медленно выпаривать примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_20);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Очень медленно выпаривать примеси",pc_MagicOreFireGorn_Nimrod_Process_Clear_25);
};

func void pc_MagicOreFireGorn_Nimrod_Process_Clear_5()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,1);
	ProcessResult = ProcessResult + 0;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Продолжить изготовление...",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_0);

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 1)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав один кусок черной руды - х1",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_1);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 2)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав два куска черной руды - х2",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_2);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 3)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав три куска черной руды - х3",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_3);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 4)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав четыре куска черной руды - х4",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_4);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 5)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав пять кусков черной руды - х5",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_5);
	};
};

func void pc_MagicOreFireGorn_Nimrod_Process_Clear_10()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	ProcessResult = ProcessResult + 1;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Продолжить изготовление...",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_0);

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 1)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав один кусок черной руды - х1",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_1);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 2)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав два куска черной руды - х2",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_2);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 3)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав три куска черной руды - х3",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_3);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 4)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав четыре куска черной руды - х4",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_4);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 5)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав пять кусков черной руды - х5",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_5);
	};
};

func void pc_MagicOreFireGorn_Nimrod_Process_Clear_15()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	ProcessResult = ProcessResult + 2;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Продолжить изготовление...",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_0);

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 1)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав один кусок черной руды - х1",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_1);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 2)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав два куска черной руды - х2",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_2);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 3)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав три куска черной руды - х3",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_3);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 4)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав четыре куска черной руды - х4",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_4);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 5)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав пять кусков черной руды - х5",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_5);
	};
};

func void pc_MagicOreFireGorn_Nimrod_Process_Clear_20()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	ProcessResult = ProcessResult + 3;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Продолжить изготовление...",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_0);

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 1)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав один кусок черной руды - х1",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_1);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 2)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав два куска черной руды - х2",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_2);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 3)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав три куска черной руды - х3",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_3);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 4)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав четыре куска черной руды - х4",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_4);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 5)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав пять кусков черной руды - х5",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_5);
	};
};

func void pc_MagicOreFireGorn_Nimrod_Process_Clear_25()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	ProcessResult = ProcessResult + 4;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Продолжить изготовление...",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_0);

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 1)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав один кусок черной руды - х1",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_1);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 2)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав два куска черной руды - х2",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_2);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 3)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав три куска черной руды - х3",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_3);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 4)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав четыре куска черной руды - х4",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_4);
	};

	if(Npc_HasItems(self,ItMi_Zeitspalt_Addon) >= 5)
	{
		Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Добавить в сплав пять кусков черной руды - х5",pc_MagicOreFireGorn_Nimrod_Process_BlackOre_5);
	};
};

func void pc_MagicOreFireGorn_Nimrod_Process_BlackOre_0()
{
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Слить сплав в литейную форму...",pc_MagicOreFireGorn_Nimrod_Process_Forma);
};

func void pc_MagicOreFireGorn_Nimrod_Process_BlackOre_1()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	AI_Wait(self,1);
	Npc_RemoveInvItems(self,ItMi_Zeitspalt_Addon,1);
	ProcessResult = ProcessResult + 5;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Слить сплав в литейную форму...",pc_MagicOreFireGorn_Nimrod_Process_Forma);
};

func void pc_MagicOreFireGorn_Nimrod_Process_BlackOre_2()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	AI_Wait(self,1);
	Npc_RemoveInvItems(self,ItMi_Zeitspalt_Addon,2);
	ProcessResult = ProcessResult + 6;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Слить сплав в литейную форму...",pc_MagicOreFireGorn_Nimrod_Process_Forma);
};

func void pc_MagicOreFireGorn_Nimrod_Process_BlackOre_3()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	AI_Wait(self,1);
	Npc_RemoveInvItems(self,ItMi_Zeitspalt_Addon,3);
	ProcessResult = ProcessResult + 7;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Слить сплав в литейную форму...",pc_MagicOreFireGorn_Nimrod_Process_Forma);
};

func void pc_MagicOreFireGorn_Nimrod_Process_BlackOre_4()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	AI_Wait(self,1);
	Npc_RemoveInvItems(self,ItMi_Zeitspalt_Addon,4);
	ProcessResult = ProcessResult + 10;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Слить сплав в литейную форму...",pc_MagicOreFireGorn_Nimrod_Process_Forma);
};

func void pc_MagicOreFireGorn_Nimrod_Process_BlackOre_5()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	AI_Wait(self,1);
	Npc_RemoveInvItems(self,ItMi_Zeitspalt_Addon,5);
	ProcessResult = ProcessResult + 8;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Слить сплав в литейную форму...",pc_MagicOreFireGorn_Nimrod_Process_Forma);
};


func void pc_MagicOreFireGorn_Nimrod_Process_Forma()
{
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	AI_Wait(self,1);
	ProcessResult = ProcessResult + 1;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Быстро охладить болванку",pc_MagicOreFireGorn_Nimrod_Process_Hlad_1);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Охладить болванку",pc_MagicOreFireGorn_Nimrod_Process_Hlad_2);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Медленно охладить болванку",pc_MagicOreFireGorn_Nimrod_Process_Hlad_3);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Очень медленно охладить болванку",pc_MagicOreFireGorn_Nimrod_Process_Hlad_4);
};

func void pc_MagicOreFireGorn_Nimrod_Process_Hlad_1()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,1);
	ProcessResult = ProcessResult + 1;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Завершить изготовление...",pc_MagicOreFireGorn_Nimrod_Process_Finish);
};

func void pc_MagicOreFireGorn_Nimrod_Process_Hlad_2()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	ProcessResult = ProcessResult + 3;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Завершить изготовление...",pc_MagicOreFireGorn_Nimrod_Process_Finish);
};

func void pc_MagicOreFireGorn_Nimrod_Process_Hlad_3()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	ProcessResult = ProcessResult + 2;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Завершить изготовление...",pc_MagicOreFireGorn_Nimrod_Process_Finish);
};

func void pc_MagicOreFireGorn_Nimrod_Process_Hlad_4()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
	AI_Wait(self,5);
	Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
	ProcessResult = ProcessResult + 1;
	Info_ClearChoices(pc_MagicOreFireGorn_Nimrod);
	Info_AddChoice(pc_MagicOreFireGorn_Nimrod,"Завершить изготовление...",pc_MagicOreFireGorn_Nimrod_Process_Finish);
};

func void pc_MagicOreFireGorn_Nimrod_Process_Finish()
{
	if(ProcessResult >= 20)
	{
		CreateInvItems(self,ItMi_MagicOreRaw_5,1);
	}
	else if(ProcessResult >= 15)
	{
		CreateInvItems(self,ItMi_MagicOreRaw_4,1);
	}
	else if(ProcessResult >= 10)
	{
		CreateInvItems(self,ItMi_MagicOreRaw_3,1);
	}
	else if(ProcessResult >= 5)
	{
		CreateInvItems(self,ItMi_MagicOreRaw_2,1);
	}
	else if(ProcessResult >= 0)
	{
		CreateInvItems(self,ItMi_MagicOreRaw_1,1);
	};

	Npc_RemoveInvItems(self,ItMi_Nugget,100);
	if(Npc_HasItems(self,ItMi_MagicOrePliers) < 1)
	{
		CreateInvItems(self,ItMi_MagicOrePliers,1);
	};

	RankPoints = RankPoints + 10;
	//Print("Вы изготовили заготовку из магической руды!");
	AI_PrintClr("Вы изготовили заготовку из магической руды!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	b_endproductiondialog();
};

func void MagicSmithWeapon_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MagicSmithWeapon;
		AI_ProcessInfos(her);
	};
};

instance PC_MagicSmithWeapon_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_MagicSmithWeapon_end_condition;
	information = pc_MagicSmithWeapon_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int pc_MagicSmithWeapon_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_MagicSmithWeapon)
	{
		return TRUE;
	};
};

func void pc_MagicSmithWeapon_end_info()
{
	if(Npc_HasItems(self,ItMi_MagicOrePliers) < 1)
	{
		CreateInvItems(self,ItMi_MagicOrePliers,1);
	};
	b_endproductiondialog();
};

instance PC_MagicSmithWeapon_Nimrod(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_MagicSmithWeapon_Nimrod_condition;
	information = PC_MagicSmithWeapon_Nimrod_info;
	permanent = TRUE;
	description = "Изготовить арбалет великих охотников";
};

func int pc_MagicSmithWeapon_Nimrod_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAGICSmithWeapon) && (PlayerTeachCrBowMade == TRUE) && (KNOW_NIMROD_MAKE == TRUE) && (Npc_HasItems(self,ItAt_BlackTrollHorn) >= 1) && (Npc_HasItems(self,ItMi_HuntSign) >= 1) && (Npc_HasItems(self,ItMi_Buk_Arbalet) >= 1) && (Npc_HasItems(self,ItAt_PumaMuscle_Jir) >= 1) && ((Npc_HasItems(self,ItMi_MagicOreRaw_5) >= 1) || (Npc_HasItems(self,ItMi_MagicOreRaw_4) >= 1) || (Npc_HasItems(self,ItMi_MagicOreRaw_3) >= 1) || (Npc_HasItems(self,ItMi_MagicOreRaw_2) >= 1) || (Npc_HasItems(self,ItMi_MagicOreRaw_1) >= 1)))
	{
		return TRUE;
	};
};

func void pc_MagicSmithWeapon_Nimrod_info()
{
	if(Npc_HasItems(self,ItMi_MagicOreRaw_5) >= 1)
	{	
		AI_Wait(self,5);
		RankPoints = RankPoints + 5;
		Npc_RemoveInvItems(self,ItMi_MagicOreRaw_5,1);
		Npc_RemoveInvItems(self,ItMi_Buk_Arbalet,1);
		Npc_RemoveInvItems(self,ItAt_BlackTrollHorn,1);
		Npc_RemoveInvItems(self,ItAt_PumaMuscle_Jir,1);
		Npc_RemoveInvItems(self,ItMi_HuntSign,1);
		CreateInvItems(hero,ITRW_GREATARBALET_ORC_05,1);
		AI_PrintClr("Готово!",83,152,48);
		B_GivePlayerXP(3000);
		//B_Say(self,self,"$ITEMREADY");
		NimrodDone = TRUE;
	}
	else if(Npc_HasItems(self,ItMi_MagicOreRaw_4) >= 1)
	{	
		AI_Wait(self,5);
		RankPoints = RankPoints + 5;
		Npc_RemoveInvItems(self,ItMi_MagicOreRaw_4,1);
		Npc_RemoveInvItems(self,ItMi_Buk_Arbalet,1);
		Npc_RemoveInvItems(self,ItAt_BlackTrollHorn,1);
		Npc_RemoveInvItems(self,ItAt_PumaMuscle_Jir,1);
		Npc_RemoveInvItems(self,ItMi_HuntSign,1);
		CreateInvItems(hero,ITRW_GREATARBALET_ORC_04,1);
		AI_PrintClr("Готово!",83,152,48);
		B_GivePlayerXP(1500);
		//B_Say(self,self,"$ITEMREADY");
		NimrodDone = TRUE;
	}
	else if(Npc_HasItems(self,ItMi_MagicOreRaw_3) >= 1)
	{	
		AI_Wait(self,5);
		RankPoints = RankPoints + 5;
		Npc_RemoveInvItems(self,ItMi_MagicOreRaw_3,1);
		Npc_RemoveInvItems(self,ItMi_Buk_Arbalet,1);
		Npc_RemoveInvItems(self,ItAt_BlackTrollHorn,1);
		Npc_RemoveInvItems(self,ItAt_PumaMuscle_Jir,1);
		Npc_RemoveInvItems(self,ItMi_HuntSign,1);
		CreateInvItems(hero,ITRW_GREATARBALET_ORC_03,1);
		AI_PrintClr("Готово!",83,152,48);
		B_GivePlayerXP(1250);
		//B_Say(self,self,"$ITEMREADY");
		NimrodDone = TRUE;
	}
	else if(Npc_HasItems(self,ItMi_MagicOreRaw_2) >= 1)
	{	
		AI_Wait(self,5);
		RankPoints = RankPoints + 5;
		Npc_RemoveInvItems(self,ItMi_MagicOreRaw_2,1);
		Npc_RemoveInvItems(self,ItMi_Buk_Arbalet,1);
		Npc_RemoveInvItems(self,ItAt_BlackTrollHorn,1);
		Npc_RemoveInvItems(self,ItAt_PumaMuscle_Jir,1);
		Npc_RemoveInvItems(self,ItMi_HuntSign,1);
		CreateInvItems(hero,ITRW_GREATARBALET_ORC_02,1);
		AI_PrintClr("Готово!",83,152,48);
		B_GivePlayerXP(1000);
		//B_Say(self,self,"$ITEMREADY");
		NimrodDone = TRUE;
	}
	else if(Npc_HasItems(self,ItMi_MagicOreRaw_1) >= 1)
	{	
		AI_Wait(self,5);
		RankPoints = RankPoints + 5;
		Npc_RemoveInvItems(self,ItMi_MagicOreRaw_1,1);
		Npc_RemoveInvItems(self,ItMi_Buk_Arbalet,1);
		Npc_RemoveInvItems(self,ItAt_BlackTrollHorn,1);
		Npc_RemoveInvItems(self,ItAt_PumaMuscle_Jir,1);
		Npc_RemoveInvItems(self,ItMi_HuntSign,1);
		CreateInvItems(hero,ITRW_GREATARBALET_ORC_01,1);
		AI_PrintClr("Готово!",83,152,48);
		B_GivePlayerXP(500);
		//B_Say(self,self,"$ITEMREADY");
		NimrodDone = TRUE;
	}
	else
	{	
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};

	if(Npc_HasItems(self,ItMi_MagicOrePliers) < 1)
	{
		CreateInvItems(self,ItMi_MagicOrePliers,1);
	};

	b_endproductiondialog();
};


//-------------------------------Верстак--------------------------------------------------------

func void Makebows_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MAKEBOWS;
		VerstakOn = TRUE;
		AI_ProcessInfos(her);
	};
};

instance PC_MAKEBOWS_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_MAKEBOWS_end_condition;
	information = PC_MAKEBOWS_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_MAKEBOWS_end_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (VerstakOn == TRUE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") > 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") > 500) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") > 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEBOWS_end_info()
{
	CreateInvItems(self,ItMi_Pliers,1);
	b_endproductiondialog();
	DoArrows = FALSE;
	DoBolts = FALSE;
	VerstakOn = FALSE;
};

instance PC_MAKEBOWS_ArrowShaft(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_MAKEBOWS_ArrowShaft_condition;
	information = PC_MAKEBOWS_ArrowShaft_info;
	permanent = TRUE;
	description = "Изготовить древка для стрел (50 шт.)";
};

func int PC_MAKEBOWS_ArrowShaft_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (VerstakOn == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (Npc_HasItems(self,ItMi_JustTree) >= 1) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") > 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") > 500) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") > 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEBOWS_ArrowShaft_info()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(self,ItMi_JustTree,1);
	CreateInvItems(self,ItMi_ArrowShaft,50);
	AI_PrintClr("Изготовлены древка для стрел!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_MAKEBOWS_ArrowShaftX10(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_MAKEBOWS_ArrowShaftX10_condition;
	information = PC_MAKEBOWS_ArrowShaftX10_info;
	permanent = TRUE;
	description = "Изготовить древка для стрел - x10 (500 шт.)";
};

func int PC_MAKEBOWS_ArrowShaftX10_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (VerstakOn == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (Npc_HasItems(self,ItMi_JustTree) >= 10) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") > 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") > 500) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") > 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEBOWS_ArrowShaftX10_info()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(self,ItMi_JustTree,10);
	CreateInvItems(self,ItMi_ArrowShaft,500);
	AI_PrintClr("Изготовлены древка для стрел!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_MAKEBOWS_BoltShaft(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_MAKEBOWS_BoltShaft_condition;
	information = PC_MAKEBOWS_BoltShaft_info;
	permanent = TRUE;
	description = "Изготовить древка для арбалетных болтов (50 шт.)";
};

func int PC_MAKEBOWS_BoltShaft_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (VerstakOn == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (Npc_HasItems(self,ItMi_JustTree) >= 1) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") > 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") > 500) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") > 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEBOWS_BoltShaft_info()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(self,ItMi_JustTree,1);
	CreateInvItems(self,ItMi_BoltShaft,50);
	AI_PrintClr("Изготовлены древка для арбалетных болтов!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_MAKEBOWS_BoltShaftX10(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_MAKEBOWS_BoltShaftX10_condition;
	information = PC_MAKEBOWS_BoltShaftX10_info;
	permanent = TRUE;
	description = "Изготовить древка для арбалетных болтов - x10 (500 шт.)";
};

func int PC_MAKEBOWS_BoltShaftX10_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (VerstakOn == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (Npc_HasItems(self,ItMi_JustTree) >= 10) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") > 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") > 500) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") > 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEBOWS_BoltShaftX10_info()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(self,ItMi_JustTree,10);
	CreateInvItems(self,ItMi_BoltShaft,500);
	AI_PrintClr("Изготовлены древка для арбалетных болтов!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
};

var int CrBowMadeDone;

instance PC_MAKEBOWS_BukTree(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = PC_MAKEBOWS_BukTree_condition;
	information = PC_MAKEBOWS_BukTree_info;
	permanent = TRUE;
	description = "Изготовить упор для арбалета";
};

func int PC_MAKEBOWS_BukTree_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (VerstakOn == TRUE) && (PlayerTeachCrBowMade == TRUE) && (KNOW_NIMROD_MAKE == TRUE) && (CrBowMadeDone == FALSE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") > 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") > 500) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") > 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEBOWS_BukTree_info()
{
	if(Npc_HasItems(hero,ItMi_BukTree) >= 1)
	{
		AI_Wait(self,1);
		RankPoints = RankPoints + 1;
		Npc_RemoveInvItems(hero,ItMi_BukTree,1);
		CreateInvItems(hero,ItMi_Buk_Arbalet,1);
		CreateInvItems(hero,ItMi_Pliers,1);
		//Print("Готово!");
		AI_PrintClr("Готово!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		b_endproductiondialog();
		CrBowMadeDone = TRUE;
		DoArrows = FALSE;
		DoBolts = FALSE;
		VerstakOn = FALSE;
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_Pliers,1);
		b_endproductiondialog();
		DoArrows = FALSE;
		DoBolts = FALSE;
		VerstakOn = FALSE;
	};
};

instance PC_MAKEBOWS_BowCorpse(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = PC_MAKEBOWS_BowCorpse_condition;
	information = PC_MAKEBOWS_BowCorpse_info;
	permanent = TRUE;
	description = "Изготовить древко для лука";
};

func int PC_MAKEBOWS_BowCorpse_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (VerstakOn == TRUE) && (BowMake_01 == TRUE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") > 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") > 500) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") > 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEBOWS_BowCorpse_info()
{
	Info_ClearChoices(PC_MAKEBOWS_BowCorpse);
	Info_AddChoice(PC_MAKEBOWS_BowCorpse,Dialog_Back,PC_MAKEBOWS_BowCorpse_Back);

	if(Npc_HasItems(self,ItMi_JustTree) >= 1)
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко короткого лука",PC_MAKEBOWS_BowCorpse_JustTree);
	};
	if((Npc_HasItems(self,ItMi_EveTree) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко ивового лука",PC_MAKEBOWS_BowCorpse_EveTree);
	};
	if((Npc_HasItems(self,ItMi_VyzTree) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко вязового лука",PC_MAKEBOWS_BowCorpse_VyzTree);
	};
	if((Npc_HasItems(self,ItMi_YsuoTree) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко ясеневого лука",PC_MAKEBOWS_BowCorpse_YsuoTree);
	};
	if((Npc_HasItems(self,ItMi_BokTree) >= 1) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко букового лука",PC_MAKEBOWS_BowCorpse_BokTree);
	};
};

func void PC_MAKEBOWS_BowCorpse_Back()
{
	Info_ClearChoices(PC_MAKEBOWS_BowCorpse);
};

func void PC_MAKEBOWS_BowCorpse_JustTree()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(self,ItMi_JustTree,1);
	CreateInvItems(self,ItMi_JustBowCorpse,1);
	AI_PrintClr("Вы успешно изготовили древко лука!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(PC_MAKEBOWS_BowCorpse);
	Info_AddChoice(PC_MAKEBOWS_BowCorpse,Dialog_Back,PC_MAKEBOWS_BowCorpse_Back);

	if(Npc_HasItems(self,ItMi_JustTree) >= 1)
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко короткого лука",PC_MAKEBOWS_BowCorpse_JustTree);
	};
	if((Npc_HasItems(self,ItMi_EveTree) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко ивового лука",PC_MAKEBOWS_BowCorpse_EveTree);
	};
	if((Npc_HasItems(self,ItMi_VyzTree) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко вязового лука",PC_MAKEBOWS_BowCorpse_VyzTree);
	};
	if((Npc_HasItems(self,ItMi_YsuoTree) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко ясеневого лука",PC_MAKEBOWS_BowCorpse_YsuoTree);
	};
	if((Npc_HasItems(self,ItMi_BokTree) >= 1) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко букового лука",PC_MAKEBOWS_BowCorpse_BokTree);
	};
};

func void PC_MAKEBOWS_BowCorpse_EveTree()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(self,ItMi_EveTree,1);
	CreateInvItems(self,ItMi_EveCorpse,1);
	AI_PrintClr("Вы успешно изготовили древко лука!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(PC_MAKEBOWS_BowCorpse);
	Info_AddChoice(PC_MAKEBOWS_BowCorpse,Dialog_Back,PC_MAKEBOWS_BowCorpse_Back);

	if(Npc_HasItems(self,ItMi_JustTree) >= 1)
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко короткого лука",PC_MAKEBOWS_BowCorpse_JustTree);
	};
	if((Npc_HasItems(self,ItMi_EveTree) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко ивового лука",PC_MAKEBOWS_BowCorpse_EveTree);
	};
	if((Npc_HasItems(self,ItMi_VyzTree) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко вязового лука",PC_MAKEBOWS_BowCorpse_VyzTree);
	};
	if((Npc_HasItems(self,ItMi_YsuoTree) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко ясеневого лука",PC_MAKEBOWS_BowCorpse_YsuoTree);
	};
	if((Npc_HasItems(self,ItMi_BokTree) >= 1) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко букового лука",PC_MAKEBOWS_BowCorpse_BokTree);
	};
};

func void PC_MAKEBOWS_BowCorpse_VyzTree()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(self,ItMi_VyzTree,1);
	CreateInvItems(self,ItMi_VyzCorpse,1);
	AI_PrintClr("Вы успешно изготовили древко лука!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(PC_MAKEBOWS_BowCorpse);
	Info_AddChoice(PC_MAKEBOWS_BowCorpse,Dialog_Back,PC_MAKEBOWS_BowCorpse_Back);

	if(Npc_HasItems(self,ItMi_JustTree) >= 1)
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко короткого лука",PC_MAKEBOWS_BowCorpse_JustTree);
	};
	if((Npc_HasItems(self,ItMi_EveTree) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко ивового лука",PC_MAKEBOWS_BowCorpse_EveTree);
	};
	if((Npc_HasItems(self,ItMi_VyzTree) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко вязового лука",PC_MAKEBOWS_BowCorpse_VyzTree);
	};
	if((Npc_HasItems(self,ItMi_YsuoTree) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко ясеневого лука",PC_MAKEBOWS_BowCorpse_YsuoTree);
	};
	if((Npc_HasItems(self,ItMi_BokTree) >= 1) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко букового лука",PC_MAKEBOWS_BowCorpse_BokTree);
	};
};

func void PC_MAKEBOWS_BowCorpse_YsuoTree()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(self,ItMi_YsuoTree,1);
	CreateInvItems(self,ItMi_YsuoCorpse,1);
	AI_PrintClr("Вы успешно изготовили древко лука!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(PC_MAKEBOWS_BowCorpse);
	Info_AddChoice(PC_MAKEBOWS_BowCorpse,Dialog_Back,PC_MAKEBOWS_BowCorpse_Back);

	if(Npc_HasItems(self,ItMi_JustTree) >= 1)
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко короткого лука",PC_MAKEBOWS_BowCorpse_JustTree);
	};
	if((Npc_HasItems(self,ItMi_EveTree) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко ивового лука",PC_MAKEBOWS_BowCorpse_EveTree);
	};
	if((Npc_HasItems(self,ItMi_VyzTree) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко вязового лука",PC_MAKEBOWS_BowCorpse_VyzTree);
	};
	if((Npc_HasItems(self,ItMi_YsuoTree) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко ясеневого лука",PC_MAKEBOWS_BowCorpse_YsuoTree);
	};
	if((Npc_HasItems(self,ItMi_BokTree) >= 1) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко букового лука",PC_MAKEBOWS_BowCorpse_BokTree);
	};
};

func void PC_MAKEBOWS_BowCorpse_BokTree()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(self,ItMi_BokTree,1);
	CreateInvItems(self,ItMi_BokCorpse,1);
	AI_PrintClr("Вы успешно изготовили древко лука!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(PC_MAKEBOWS_BowCorpse);
	Info_AddChoice(PC_MAKEBOWS_BowCorpse,Dialog_Back,PC_MAKEBOWS_BowCorpse_Back);

	if(Npc_HasItems(self,ItMi_JustTree) >= 1)
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко короткого лука",PC_MAKEBOWS_BowCorpse_JustTree);
	};
	if((Npc_HasItems(self,ItMi_EveTree) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко ивового лука",PC_MAKEBOWS_BowCorpse_EveTree);
	};
	if((Npc_HasItems(self,ItMi_VyzTree) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко вязового лука",PC_MAKEBOWS_BowCorpse_VyzTree);
	};
	if((Npc_HasItems(self,ItMi_YsuoTree) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко ясеневого лука",PC_MAKEBOWS_BowCorpse_YsuoTree);
	};
	if((Npc_HasItems(self,ItMi_BokTree) >= 1) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowCorpse,"Древко букового лука",PC_MAKEBOWS_BowCorpse_BokTree);
	};
};

instance PC_MAKEBOWS_BowMake(C_Info)
{
	npc = PC_Hero;
	nr = 7;
	condition = PC_MAKEBOWS_BowMake_condition;
	information = PC_MAKEBOWS_BowMake_info;
	permanent = TRUE;
	description = "Изготовить лук";
};

func int PC_MAKEBOWS_BowMake_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (VerstakOn == TRUE) && (BowMake_01 == TRUE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") > 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") > 500) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") > 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEBOWS_BowMake_info()
{
	Info_ClearChoices(PC_MAKEBOWS_BowMake);
	Info_AddChoice(PC_MAKEBOWS_BowMake,Dialog_Back,PC_MAKEBOWS_BowMake_Back);

	if((Npc_HasItems(self,ItMi_JustBowCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_01) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Обычный короткий лук",PC_MAKEBOWS_BowMake_JustTree);
	};
	if((Npc_HasItems(self,ItMi_EveCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_02) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Ивовый лук",PC_MAKEBOWS_BowMake_EveTree);
	};
	if((Npc_HasItems(self,ItMi_VyzCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_03) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Вязовый лук",PC_MAKEBOWS_BowMake_VyzTree);
	};
	if((Npc_HasItems(self,ItMi_YsuoCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_04) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Ясеневый лук",PC_MAKEBOWS_BowMake_YsuoTree);
	};
	if((Npc_HasItems(self,ItMi_BokCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_05) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 2) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Буковый лук",PC_MAKEBOWS_BowMake_BokTree);
	};
};

func void PC_MAKEBOWS_BowMake_Back()
{
	Info_ClearChoices(PC_MAKEBOWS_BowMake);
};

func void PC_MAKEBOWS_BowMake_JustTree()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	B_GivePlayerXP(10);
	Npc_RemoveInvItems(self,ItMi_JustBowCorpse,1);
	Npc_RemoveInvItems(self,ItMi_BowRope_01,1);
	Npc_RemoveInvItems(self,ItMi_Pitch,1);
	CreateInvItems(self,ItRw_BowCraft_01,1);
	AI_PrintClr("Вы успешно изготовили короткий лук!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(PC_MAKEBOWS_BowMake);
	Info_AddChoice(PC_MAKEBOWS_BowMake,Dialog_Back,PC_MAKEBOWS_BowMake_Back);

	if((Npc_HasItems(self,ItMi_JustBowCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_01) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Обычный короткий лук",PC_MAKEBOWS_BowMake_JustTree);
	};
	if((Npc_HasItems(self,ItMi_EveCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_02) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Ивовый лук",PC_MAKEBOWS_BowMake_EveTree);
	};
	if((Npc_HasItems(self,ItMi_VyzCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_03) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Вязовый лук",PC_MAKEBOWS_BowMake_VyzTree);
	};
	if((Npc_HasItems(self,ItMi_YsuoCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_04) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Ясеневый лук",PC_MAKEBOWS_BowMake_YsuoTree);
	};
	if((Npc_HasItems(self,ItMi_BokCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_05) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 2) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Буковый лук",PC_MAKEBOWS_BowMake_BokTree);
	};
};

func void PC_MAKEBOWS_BowMake_EveTree()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	B_GivePlayerXP(10);
	Npc_RemoveInvItems(self,ItMi_EveCorpse,1);
	Npc_RemoveInvItems(self,ItMi_BowRope_02,1);
	Npc_RemoveInvItems(self,ItMi_Pitch,1);
	CreateInvItems(self,ItRw_BowCraft_02,1);
	AI_PrintClr("Вы успешно изготовили ивовый лук!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(PC_MAKEBOWS_BowMake);
	Info_AddChoice(PC_MAKEBOWS_BowMake,Dialog_Back,PC_MAKEBOWS_BowMake_Back);

	if((Npc_HasItems(self,ItMi_JustBowCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_01) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Обычный короткий лук",PC_MAKEBOWS_BowMake_JustTree);
	};
	if((Npc_HasItems(self,ItMi_EveCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_02) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Ивовый лук",PC_MAKEBOWS_BowMake_EveTree);
	};
	if((Npc_HasItems(self,ItMi_VyzCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_03) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Вязовый лук",PC_MAKEBOWS_BowMake_VyzTree);
	};
	if((Npc_HasItems(self,ItMi_YsuoCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_04) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Ясеневый лук",PC_MAKEBOWS_BowMake_YsuoTree);
	};
	if((Npc_HasItems(self,ItMi_BokCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_05) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 2) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Буковый лук",PC_MAKEBOWS_BowMake_BokTree);
	};
};

func void PC_MAKEBOWS_BowMake_VyzTree()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	B_GivePlayerXP(10);
	Npc_RemoveInvItems(self,ItMi_VyzCorpse,1);
	Npc_RemoveInvItems(self,ItMi_BowRope_03,1);
	Npc_RemoveInvItems(self,ItMi_Pitch,1);
	CreateInvItems(self,ItRw_BowCraft_03,1);
	AI_PrintClr("Вы успешно изготовили вязовый лук!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(PC_MAKEBOWS_BowMake);
	Info_AddChoice(PC_MAKEBOWS_BowMake,Dialog_Back,PC_MAKEBOWS_BowMake_Back);

	if((Npc_HasItems(self,ItMi_JustBowCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_01) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Обычный короткий лук",PC_MAKEBOWS_BowMake_JustTree);
	};
	if((Npc_HasItems(self,ItMi_EveCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_02) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Ивовый лук",PC_MAKEBOWS_BowMake_EveTree);
	};
	if((Npc_HasItems(self,ItMi_VyzCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_03) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Вязовый лук",PC_MAKEBOWS_BowMake_VyzTree);
	};
	if((Npc_HasItems(self,ItMi_YsuoCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_04) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Ясеневый лук",PC_MAKEBOWS_BowMake_YsuoTree);
	};
	if((Npc_HasItems(self,ItMi_BokCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_05) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 2) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Буковый лук",PC_MAKEBOWS_BowMake_BokTree);
	};
};

func void PC_MAKEBOWS_BowMake_YsuoTree()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	B_GivePlayerXP(10);
	Npc_RemoveInvItems(self,ItMi_YsuoCorpse,1);
	Npc_RemoveInvItems(self,ItMi_BowRope_04,1);
	Npc_RemoveInvItems(self,ItMi_Pitch,1);
	CreateInvItems(self,ItRw_BowCraft_04,1);
	AI_PrintClr("Вы успешно изготовили ясеневый лук!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(PC_MAKEBOWS_BowMake);
	Info_AddChoice(PC_MAKEBOWS_BowMake,Dialog_Back,PC_MAKEBOWS_BowMake_Back);

	if((Npc_HasItems(self,ItMi_JustBowCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_01) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Обычный короткий лук",PC_MAKEBOWS_BowMake_JustTree);
	};
	if((Npc_HasItems(self,ItMi_EveCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_02) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Ивовый лук",PC_MAKEBOWS_BowMake_EveTree);
	};
	if((Npc_HasItems(self,ItMi_VyzCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_03) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Вязовый лук",PC_MAKEBOWS_BowMake_VyzTree);
	};
	if((Npc_HasItems(self,ItMi_YsuoCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_04) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Ясеневый лук",PC_MAKEBOWS_BowMake_YsuoTree);
	};
	if((Npc_HasItems(self,ItMi_BokCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_05) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 2) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Буковый лук",PC_MAKEBOWS_BowMake_BokTree);
	};
};

func void PC_MAKEBOWS_BowMake_BokTree()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	B_GivePlayerXP(10);
	Npc_RemoveInvItems(self,ItMi_BokCorpse,1);
	Npc_RemoveInvItems(self,ItMi_BowRope_05,1);
	Npc_RemoveInvItems(self,ItMi_Pitch,2);
	CreateInvItems(self,ItRw_BowCraft_05,1);
	AI_PrintClr("Вы успешно изготовили буковый лук!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(PC_MAKEBOWS_BowMake);
	Info_AddChoice(PC_MAKEBOWS_BowMake,Dialog_Back,PC_MAKEBOWS_BowMake_Back);

	if((Npc_HasItems(self,ItMi_JustBowCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_01) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Обычный короткий лук",PC_MAKEBOWS_BowMake_JustTree);
	};
	if((Npc_HasItems(self,ItMi_EveCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_02) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Ивовый лук",PC_MAKEBOWS_BowMake_EveTree);
	};
	if((Npc_HasItems(self,ItMi_VyzCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_03) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Вязовый лук",PC_MAKEBOWS_BowMake_VyzTree);
	};
	if((Npc_HasItems(self,ItMi_YsuoCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_04) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Ясеневый лук",PC_MAKEBOWS_BowMake_YsuoTree);
	};
	if((Npc_HasItems(self,ItMi_BokCorpse) >= 1) && (Npc_HasItems(self,ItMi_BowRope_05) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 2) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_MAKEBOWS_BowMake,"Буковый лук",PC_MAKEBOWS_BowMake_BokTree);
	};
};

instance PC_MAKEBOWS_Torch(C_Info)
{
	npc = PC_Hero;
	nr = 8;
	condition = PC_MAKEBOWS_Torch_condition;
	information = PC_MAKEBOWS_Torch_info;
	permanent = TRUE;
	description = "Изготовить факелы (древесная заготовка х 10, смола х 1)";
};

func int PC_MAKEBOWS_Torch_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAKEBOWS) && (VerstakOn == TRUE) && ((Npc_GetDistToWP(hero,"NW_CASTLEMINE_HUT_08") > 500) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP01_IN_02") > 500) || (Npc_GetDistToWP(hero,"WP_NW_HUNTERCAMP_07") > 500)))
	{
		return TRUE;
	};
};

func void PC_MAKEBOWS_Torch_info()
{
	if((Npc_HasItems(hero,ItMi_JustTree) >= 10) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		AI_Wait(self,1);
		RankPoints = RankPoints + 1;
		Npc_RemoveInvItems(hero,ItMi_JustTree,10);
		Npc_RemoveInvItems(hero,ItMi_Pitch,1);
		CreateInvItems(hero,ItLsTorch,10);
		AI_PrintClr("Готово!",83,152,48);
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

//-------------------------------Ведро с водой--------------------------------------------------------

func void COOLBLADE_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_COOLBLADE;
		AI_ProcessInfos(her);
	};
};

instance PC_COOLBLADE_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_COOLBLADE_end_condition;
	information = PC_COOLBLADE_end_info;
	permanent = TRUE;
	description = "Закалить клинок.";
};

func int PC_COOLBLADE_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_COOLBLADE)
	{
		return TRUE;
	};
};

func void PC_COOLBLADE_end_info()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	CreateInvItems(hero,itmiswordblade_1,1);
	AI_PrintClr("Клинок закален!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	b_endproductiondialog();
};

//-------------------------------Шкуродер--------------------------------------------------------

func void SKINRAPE_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SKINRAPE;
		AI_ProcessInfos(her);
	};
};

instance PC_SKINRAPE_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_SKINRAPE_end_condition;
	information = PC_SKINRAPE_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_SKINRAPE_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SKINRAPE)
	{
		return TRUE;
	};
};

func void PC_SKINRAPE_end_info()
{
	b_endproductiondialog();
};


instance PC_SKINRAPE_ItAr_HuntArmor_01(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_SKINRAPE_ItAr_HuntArmor_01_condition;
	information = PC_SKINRAPE_ItAr_HuntArmor_01_info;
	permanent = TRUE;
	description = "Изготовить доспех из волчьих шкур";
};

func int PC_SKINRAPE_ItAr_HuntArmor_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SKINRAPE) && (Know_HuntArmor_01 == TRUE))
	{
		return TRUE;
	};
};

func void PC_SKINRAPE_ItAr_HuntArmor_01_info()
{
	if((Npc_HasItems(self,ItAt_WolfFur) >= 20) && (Npc_HasItems(self,ItAt_Claw) >= 2) && (Npc_HasItems(self,ItAt_Teeth) >= 10) && (Npc_HasItems(self,ItMiSwordraw) >= 1))
	{
		AI_Wait(self,1);
		RankPoints = RankPoints + 1;
		B_GivePlayerXP(50);
		Npc_RemoveInvItems(self,ItAt_WolfFur,20);
		Npc_RemoveInvItems(self,ItAt_Claw,2);
		Npc_RemoveInvItems(self,ItAt_Teeth,10);
		Npc_RemoveInvItems(self,ItMiSwordraw,1);
		CreateInvItems(self,ItAr_HuntArmor_01,1);
		AI_PrintClr("Вы успешно изготовили доспех!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};

	b_endproductiondialog();
};

instance PC_SKINRAPE_ItAr_HuntArmor_02(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_SKINRAPE_ItAr_HuntArmor_02_condition;
	information = PC_SKINRAPE_ItAr_HuntArmor_02_info;
	permanent = TRUE;
	description = "Изготовить доспех из шкур варгов";
};

func int PC_SKINRAPE_ItAr_HuntArmor_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SKINRAPE) && (Know_HuntArmor_02 == TRUE))
	{
		return TRUE;
	};
};

func void PC_SKINRAPE_ItAr_HuntArmor_02_info()
{
	if((Npc_HasItems(self,ItAt_WargFur) >= 10) && (Npc_HasItems(self,ItAt_Teeth) >= 12) && (Npc_HasItems(self,ItMiSwordraw) >= 2) && (Npc_HasItems(self,ItMi_Sulfur) >= 1) && (Npc_HasItems(self,ItMi_Pitch) >= 1))
	{
		AI_Wait(self,1);
		RankPoints = RankPoints + 1;
		B_GivePlayerXP(200);
		Npc_RemoveInvItems(self,ItAt_WargFur,10);
		Npc_RemoveInvItems(self,ItAt_Teeth,12);
		Npc_RemoveInvItems(self,ItMiSwordraw,2);
		Npc_RemoveInvItems(self,ItMi_Sulfur,1);
		Npc_RemoveInvItems(self,ItMi_Pitch,1);
		CreateInvItems(self,ItAr_HuntArmor_02,1);
		AI_PrintClr("Вы успешно изготовили доспех!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};

	b_endproductiondialog();
};

instance PC_SKINRAPE_ItAr_HuntArmor_03(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_SKINRAPE_ItAr_HuntArmor_03_condition;
	information = PC_SKINRAPE_ItAr_HuntArmor_03_info;
	permanent = TRUE;
	description = "Изготовить доспех из шкур тролля";
};

func int PC_SKINRAPE_ItAr_HuntArmor_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SKINRAPE) && (Know_HuntArmor_03 == TRUE))
	{
		return TRUE;
	};
};

func void PC_SKINRAPE_ItAr_HuntArmor_03_info()
{
	if((Npc_HasItems(self,ItAt_TrollFur) >= 5) && (Npc_HasItems(self,ItAt_TrollTooth) >= 4) && (Npc_HasItems(self,ItAt_Teeth) >= 20) && (Npc_HasItems(self,ItMiSwordraw) >= 6) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (Npc_HasItems(self,ItMi_Coal) >= 3))
	{
		AI_Wait(self,1);
		RankPoints = RankPoints + 1;
		B_GivePlayerXP(500);
		Npc_RemoveInvItems(self,ItAt_TrollFur,5);
		Npc_RemoveInvItems(self,ItAt_TrollTooth,4);
		Npc_RemoveInvItems(self,ItAt_Teeth,20);
		Npc_RemoveInvItems(self,ItMiSwordraw,6);
		Npc_RemoveInvItems(self,ItMi_Pitch,1);
		Npc_RemoveInvItems(self,ItMi_Coal,3);
		CreateInvItems(self,ItAr_HuntArmor_03,1);
		AI_PrintClr("Вы успешно изготовили доспех!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};

	b_endproductiondialog();
};

instance PC_SKINRAPE_ItAr_HuntArmor_04(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_SKINRAPE_ItAr_HuntArmor_04_condition;
	information = PC_SKINRAPE_ItAr_HuntArmor_04_info;
	permanent = TRUE;
	description = "Изготовить доспех из шкуры черного тролля";
};

func int PC_SKINRAPE_ItAr_HuntArmor_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SKINRAPE) && (Know_HuntArmor_04 == TRUE))
	{
		return TRUE;
	};
};

func void PC_SKINRAPE_ItAr_HuntArmor_04_info()
{
	if((Npc_HasItems(self,ItAt_BlackTrollHorn) >= 1) && (Npc_HasItems(self,ItAt_TrollBlackFur) >= 3) && (Npc_HasItems(self,ItAt_TrollTooth) >= 6) && (Npc_HasItems(self,ItAt_Teeth) >= 40) && (Npc_HasItems(self,ItMiSwordraw) >= 8) && (Npc_HasItems(self,ItMi_Sulfur) >= 3) && (Npc_HasItems(self,ItMi_Pitch) >= 1) && (Npc_HasItems(self,ItMi_Coal) >= 6) && (Npc_HasItems(self,ItMi_DarkPearl) >= 1))
	{
		AI_Wait(self,1);
		RankPoints = RankPoints + 1;
		B_GivePlayerXP(1000);
		Npc_RemoveInvItems(self,ItAt_TrollBlackFur,3);
		Npc_RemoveInvItems(self,ItAt_TrollTooth,6);
		Npc_RemoveInvItems(self,ItAt_BlackTrollHorn,1);
		Npc_RemoveInvItems(self,ItAt_Teeth,40);
		Npc_RemoveInvItems(self,ItMiSwordraw,8);
		Npc_RemoveInvItems(self,ItMi_Sulfur,3);
		Npc_RemoveInvItems(self,ItMi_Pitch,1);
		Npc_RemoveInvItems(self,ItMi_Coal,6);
		Npc_RemoveInvItems(self,ItMi_DarkPearl,1);
		CreateInvItems(self,ItAr_HuntArmor_04,1);
		AI_PrintClr("Вы успешно изготовили доспех!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};

	b_endproductiondialog();
};

instance PC_SKINRAPE_BowRope(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_SKINRAPE_BowRope_condition;
	information = PC_SKINRAPE_BowRope_info;
	permanent = TRUE;
	description = "Изготовить тетиву для лука";
};

func int PC_SKINRAPE_BowRope_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SKINRAPE) && (BowMake_01 == TRUE))
	{
		return TRUE;
	};
};

func void PC_SKINRAPE_BowRope_info()
{
	Info_ClearChoices(PC_SKINRAPE_BowRope);
	Info_AddChoice(PC_SKINRAPE_BowRope,Dialog_Back,PC_SKINRAPE_BowRope_Back);

	if(Npc_HasItems(self,ItAt_WolfFur) >= 1)
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры волка",PC_SKINRAPE_BowRope_WolfFur);
	};
	if((Npc_HasItems(self,ItAt_Addon_KeilerFur) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры кабана",PC_SKINRAPE_BowRope_KeilerFur);
	};
	if((Npc_HasItems(self,ItAt_WargFur) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры варга",PC_SKINRAPE_BowRope_WargFur);
	};
	if((Npc_HasItems(self,ItAt_ShadowFur) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры мракориса",PC_SKINRAPE_BowRope_ShadowFur);
	};
	if((Npc_HasItems(self,ItAt_TrollFur) >= 1) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры тролля",PC_SKINRAPE_BowRope_TrollFur);
	};
};

func void PC_SKINRAPE_BowRope_Back()
{
	Info_ClearChoices(PC_SKINRAPE_BowRope);
};

func void PC_SKINRAPE_BowRope_WolfFur()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	B_GivePlayerXP(10);
	Npc_RemoveInvItems(self,ItAt_WolfFur,1);
	CreateInvItems(self,ItMi_BowRope_01,5);
	AI_PrintClr("Вы успешно изготовили тетиву! (5 штук)",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(PC_SKINRAPE_BowRope);
	Info_AddChoice(PC_SKINRAPE_BowRope,Dialog_Back,PC_SKINRAPE_BowRope_Back);

	if(Npc_HasItems(self,ItAt_WolfFur) >= 1)
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры волка",PC_SKINRAPE_BowRope_WolfFur);
	};
	if((Npc_HasItems(self,ItAt_Addon_KeilerFur) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры кабана",PC_SKINRAPE_BowRope_KeilerFur);
	};
	if((Npc_HasItems(self,ItAt_WargFur) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры варга",PC_SKINRAPE_BowRope_WargFur);
	};
	if((Npc_HasItems(self,ItAt_ShadowFur) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры мракориса",PC_SKINRAPE_BowRope_ShadowFur);
	};
	if((Npc_HasItems(self,ItAt_TrollFur) >= 1) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры тролля",PC_SKINRAPE_BowRope_TrollFur);
	};
};

func void PC_SKINRAPE_BowRope_KeilerFur()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	B_GivePlayerXP(10);
	Npc_RemoveInvItems(self,ItAt_Addon_KeilerFur,1);
	CreateInvItems(self,ItMi_BowRope_02,5);
	AI_PrintClr("Вы успешно изготовили тетиву! (5 штук)",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(PC_SKINRAPE_BowRope);
	Info_AddChoice(PC_SKINRAPE_BowRope,Dialog_Back,PC_SKINRAPE_BowRope_Back);

	if(Npc_HasItems(self,ItAt_WolfFur) >= 1)
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры волка",PC_SKINRAPE_BowRope_WolfFur);
	};
	if((Npc_HasItems(self,ItAt_Addon_KeilerFur) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры кабана",PC_SKINRAPE_BowRope_KeilerFur);
	};
	if((Npc_HasItems(self,ItAt_WargFur) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры варга",PC_SKINRAPE_BowRope_WargFur);
	};
	if((Npc_HasItems(self,ItAt_ShadowFur) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры мракориса",PC_SKINRAPE_BowRope_ShadowFur);
	};
	if((Npc_HasItems(self,ItAt_TrollFur) >= 1) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры тролля",PC_SKINRAPE_BowRope_TrollFur);
	};
};

func void PC_SKINRAPE_BowRope_WargFur()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	B_GivePlayerXP(10);
	Npc_RemoveInvItems(self,ItAt_WargFur,1);
	CreateInvItems(self,ItMi_BowRope_03,5);
	AI_PrintClr("Вы успешно изготовили тетиву! (5 штук)",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(PC_SKINRAPE_BowRope);
	Info_AddChoice(PC_SKINRAPE_BowRope,Dialog_Back,PC_SKINRAPE_BowRope_Back);

	if(Npc_HasItems(self,ItAt_WolfFur) >= 1)
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры волка",PC_SKINRAPE_BowRope_WolfFur);
	};
	if((Npc_HasItems(self,ItAt_Addon_KeilerFur) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры кабана",PC_SKINRAPE_BowRope_KeilerFur);
	};
	if((Npc_HasItems(self,ItAt_WargFur) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры варга",PC_SKINRAPE_BowRope_WargFur);
	};
	if((Npc_HasItems(self,ItAt_ShadowFur) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры мракориса",PC_SKINRAPE_BowRope_ShadowFur);
	};
	if((Npc_HasItems(self,ItAt_TrollFur) >= 1) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры тролля",PC_SKINRAPE_BowRope_TrollFur);
	};
};

func void PC_SKINRAPE_BowRope_ShadowFur()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	B_GivePlayerXP(10);
	Npc_RemoveInvItems(self,ItAt_ShadowFur,1);
	CreateInvItems(self,ItMi_BowRope_04,5);
	AI_PrintClr("Вы успешно изготовили тетиву! (5 штук)",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(PC_SKINRAPE_BowRope);
	Info_AddChoice(PC_SKINRAPE_BowRope,Dialog_Back,PC_SKINRAPE_BowRope_Back);

	if(Npc_HasItems(self,ItAt_WolfFur) >= 1)
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры волка",PC_SKINRAPE_BowRope_WolfFur);
	};
	if((Npc_HasItems(self,ItAt_Addon_KeilerFur) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры кабана",PC_SKINRAPE_BowRope_KeilerFur);
	};
	if((Npc_HasItems(self,ItAt_WargFur) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры варга",PC_SKINRAPE_BowRope_WargFur);
	};
	if((Npc_HasItems(self,ItAt_ShadowFur) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры мракориса",PC_SKINRAPE_BowRope_ShadowFur);
	};
	if((Npc_HasItems(self,ItAt_TrollFur) >= 1) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры тролля",PC_SKINRAPE_BowRope_TrollFur);
	};
};

func void PC_SKINRAPE_BowRope_TrollFur()
{
	AI_Wait(self,1);
	RankPoints = RankPoints + 1;
	B_GivePlayerXP(10);
	Npc_RemoveInvItems(self,ItAt_TrollFur,1);
	CreateInvItems(self,ItMi_BowRope_05,5);
	AI_PrintClr("Вы успешно изготовили тетиву! (5 штук)",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Info_ClearChoices(PC_SKINRAPE_BowRope);
	Info_AddChoice(PC_SKINRAPE_BowRope,Dialog_Back,PC_SKINRAPE_BowRope_Back);

	if(Npc_HasItems(self,ItAt_WolfFur) >= 1)
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры волка",PC_SKINRAPE_BowRope_WolfFur);
	};
	if((Npc_HasItems(self,ItAt_Addon_KeilerFur) >= 1) && (BowMake_02 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры кабана",PC_SKINRAPE_BowRope_KeilerFur);
	};
	if((Npc_HasItems(self,ItAt_WargFur) >= 1) && (BowMake_03 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры варга",PC_SKINRAPE_BowRope_WargFur);
	};
	if((Npc_HasItems(self,ItAt_ShadowFur) >= 1) && (BowMake_04 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры мракориса",PC_SKINRAPE_BowRope_ShadowFur);
	};
	if((Npc_HasItems(self,ItAt_TrollFur) >= 1) && (BowMake_05 == TRUE))
	{
		Info_AddChoice(PC_SKINRAPE_BowRope,"Тетива из шкуры тролля",PC_SKINRAPE_BowRope_TrollFur);
	};
};

//-----------------------------------в шахте----------------

func int MEMORIES_CASE()
{
	if((ConvoyGoldShahtDone == FALSE) && (CurrentLevel == PRIORATWORLD_ZEN) && ((OsairWarriorWait == TRUE) || (PW_FollowGoldOre_OneTime == TRUE)))
	{
		return TRUE;
	};

	return FALSE;
};

func void MEMORIES_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MEMORIES;
		Snd_Play("Cave_Wait");
		Wld_SendTrigger("EVT_CAM_WAITCAVE");
		Wld_SendTrigger("EVT_CAVE_WAITEND");
		AI_Wait(her,49);
		b_endproductiondialog();
	};
};


//-----------------------------------отравить тушу----------------

func int POISONMOLERAT_CASE()
{
	if((MIS_PW_PoisonNrozas == LOG_Running) && (Npc_HasItems(hero,ItMi_NrozasPoison) >= 1) && (PoisonDoneFull == FALSE) && (PoisonDoneHalf == FALSE) && (PoisonDoneOneTear == FALSE))
	{
		return TRUE;
	};

	return FALSE;
};

func void POISONMOLERAT_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_POISONMOLERAT;
		AI_ProcessInfos(her);
	};
};

instance PC_POISONMOLERAT_FULL(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_POISONMOLERAT_FULL_condition;
	information = PC_POISONMOLERAT_FULL_info;
	permanent = TRUE;
	description = "Использовать весь пузырек с ядом.";
};

func int PC_POISONMOLERAT_FULL_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POISONMOLERAT) && (Npc_HasItems(hero,ItMi_NrozasPoison) >= 1))
	{
		return TRUE;
	};
};

func void PC_POISONMOLERAT_FULL_info()
{
	RankPoints = RankPoints + 1;
	B_GivePlayerXP(200);
	Npc_RemoveInvItems(hero,ItMi_NrozasPoison,1);
	AI_PlayAni(self,"T_PLUNDER");
	AI_Wait(hero,1);
	PoisonDoneFull = TRUE;
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Я использовал весь пузырек с ядом. Осталось только дождаться, когда тролль проглотит ядовитую наживку.");
	b_endproductiondialog();
};

instance PC_POISONMOLERAT_HALF(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_POISONMOLERAT_HALF_condition;
	information = PC_POISONMOLERAT_HALF_info;
	permanent = TRUE;
	description = "Использовать половину пузырька с ядом.";
};

func int PC_POISONMOLERAT_HALF_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POISONMOLERAT) && (Npc_HasItems(hero,ItMi_NrozasPoison) >= 1))
	{
		return TRUE;
	};
};

func void PC_POISONMOLERAT_HALF_info()
{
	RankPoints = RankPoints + 1;
	B_GivePlayerXP(200);
	Npc_RemoveInvItems(hero,ItMi_NrozasPoison,1);
	CreateInvItems(self,ItMi_NrozasPoisonHalf,1);
	AI_PlayAni(self,"T_PLUNDER");
	AI_Wait(hero,1);
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Я использовал половину пузырька с ядом. Осталось только дождаться, когда тролль проглотит ядовитую наживку.");
	PoisonDoneHalf = TRUE;
	b_endproductiondialog();
};

instance PC_POISONMOLERAT_ONETEAR(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_POISONMOLERAT_ONETEAR_condition;
	information = PC_POISONMOLERAT_ONETEAR_info;
	permanent = TRUE;
	description = "Использовать несколько капель яда.";
};

func int PC_POISONMOLERAT_ONETEAR_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POISONMOLERAT) && (Npc_HasItems(hero,ItMi_NrozasPoison) >= 1))
	{
		return TRUE;
	};
};

func void PC_POISONMOLERAT_ONETEAR_info()
{
	RankPoints = RankPoints + 1;
	B_GivePlayerXP(200);
	AI_PlayAni(self,"T_PLUNDER");
	AI_Wait(hero,1);
	PoisonDoneOneTear = TRUE;
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Я использовал несколько капель из пузырька с ядом. Осталось только дождаться, когда тролль проглотит ядовитую наживку.");
	b_endproductiondialog();
};


var int orehday;
var int oredayamount;
var int oredayamountmax;

func void b_checkliinpresence(var int level)
{
	if(level != CurrentLevel)
	{
		CHECKLI = FALSE;
	}
	else
	{
		CHECKLI = TRUE;
	};
};

func int OREHACKEN_COND()
{
	return TRUE;
};

var int WarnPerOnceOre;
var int WarnPerOnceIron;
var int TempCountFatigueOre;
var int TempCountFatigueIron;

func void orehacken_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		b_checkliinpresence(LOSTISLAND_ZEN);

		if(CHECKLI == FALSE)
		{
			//print_percent_bar_ore(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		WarnPerOnceOre = FALSE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_OREHACKEN;
		AI_ProcessInfos(her);
	};
};

instance PC_OREHACKEN_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_orehacken_end_condition;
	information = pc_orehacken_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};


func int pc_orehacken_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_OREHACKEN)
	{
		return TRUE;
	};
};

func void pc_orehacken_end_info()
{
	//print_percent_bar_ore_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);
	b_endproductiondialog();
};

instance PC_OREHACKEN_ADDON_HOUR(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_orehacken_addon_hour_condition;
	information = pc_orehacken_addon_hour_info;
	permanent = TRUE;
	description = "Добывать магическую руду.";
};

func int pc_orehacken_addon_hour_condition()
{
	b_checkliinpresence(LOSTISLAND_ZEN);

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_OREHACKEN) && (KNOWHOWPICKORE == TRUE) && (CHECKLI == FALSE))
	{
		return TRUE;
	};
};

func void pc_orehacken_addon_hour_info()
{
	var string concatText;
	var string textore;
	var int MultiNugget;
	var int OreDayStam;
	var int TempFatigueMark;

	if(HERO_HACKCHANCEORE >= 10)
	{
		OreDayStam = 15 - (HERO_HACKCHANCEORE / 10);
	}
	else
	{
		OreDayStam = 15;
	};
	if((SBMODE == TRUE) && (Hero_Fatigue == FALSE))
	{
		B_Say(hero,hero,"$NEEDSLEEP");
		AI_PrintClr("Вы утомлены! Пора отдохнуть...",177,58,17);
		Snd_Play("ORE_HACK");
		//print_percent_bar_ore_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);
		b_endproductiondialog();
	}
	else if(ATR_STAMINA[0] >= OreDayStam)
	{
		//print_percent_bar_ore(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(HERO_HACKCHANCEORE >= 100)
		{
			MultiNugget = Hlp_Random(10);
		}
		else if(HERO_HACKCHANCEORE >= 90)
		{
			MultiNugget = Hlp_Random(9);
		}
		else if(HERO_HACKCHANCEORE >= 80)
		{
			MultiNugget = Hlp_Random(8);
		}
		else if(HERO_HACKCHANCEORE >= 70)
		{
			MultiNugget = Hlp_Random(7);
		}
		else if(HERO_HACKCHANCEORE >= 60)
		{
			MultiNugget = Hlp_Random(6);
		}
		else if(HERO_HACKCHANCEORE >= 50)
		{
			MultiNugget = Hlp_Random(5);
		}
		else if(HERO_HACKCHANCEORE >= 40)
		{
			MultiNugget = Hlp_Random(4);
		}
		else if(HERO_HACKCHANCEORE >= 30)
		{
			MultiNugget = Hlp_Random(3);
		}
		else if(HERO_HACKCHANCEORE >= 20)
		{
			MultiNugget = Hlp_Random(2);
		}
		else if(HERO_HACKCHANCEORE >= 0)
		{
			MultiNugget = Hlp_Random(1);
		};

		if(MultiNugget > 0)
		{
			if(MultiNugget == 1)
			{
				textore = " кусок магической руды.";
			}
			else if((MultiNugget > 1) && (MultiNugget < 5))
			{
				textore = " куска магической руды.";
			}
			else if(MultiNugget >= 5)
			{
				textore = " кусков магической руды.";
			};

			CreateInvItems(hero,ItMi_Nugget,MultiNugget);
			concatText = "Вы добыли ";
			concatText = ConcatStrings(concatText,IntToString(MultiNugget));
			concatText = ConcatStrings(concatText,textore);
			concatText = ConcatStrings(concatText," (Всего: ");
			concatText = ConcatStrings(concatText,IntToString(Npc_HasItems(hero,ItMi_Nugget)));
			concatText = ConcatStrings(concatText,")");
			AI_PrintClr(concatText,83,152,48);
		}
		else
		{
			AI_PrintClr("Рудная крошка разлетелась во все стороны...",245,247,225);
		};

		ATR_STAMINA[0] = ATR_STAMINA[0] - OreDayStam;

		if(ATR_STAMINA[0] < 1)
		{
			ATR_STAMINA[0] = 0;
		};

		Snd_Play("ORE_HACK");

		if(SBMODE == TRUE)
		{
			TempCountFatigueOre += 1;

			if(HERO_HACKCHANCEORE >= 90)
			{
				TempFatigueMark = 10;
			}
			else if(HERO_HACKCHANCEORE >= 60)
			{
				TempFatigueMark = 8;
			}
			else if(HERO_HACKCHANCEORE >= 30)
			{
				TempFatigueMark = 6;
			}
			else if(HERO_HACKCHANCEORE >= 0)
			{
				TempFatigueMark = 4;
			};
			if(TempCountFatigueOre >= TempFatigueMark)
			{
				if(Hero_Fatigue > 1)
				{
					Hero_Fatigue -= 1;
					TempCountFatigueOre = FALSE;
				}
				else
				{
					Hero_Fatigue = FALSE;
					TempCountFatigueOre = FALSE;

					if(WarnPerOnceOre == FALSE)
					{
						B_Say(hero,hero,"$NEEDSLEEP");
						AI_PrintClr("Вы утомлены! Пора отдохнуть...",177,58,17);
						WarnPerOnceOre = TRUE;
					};
				};
			};
		};
	}
	else
	{
		AI_PrintClr(PRINT_NOMORESTAMINAFORHACKEN,177,58,17);
		B_Say(self,self,"$TOOHARD");
		Snd_Play("ORE_HACK");
		//print_percent_bar_ore_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);
		b_endproductiondialog();
	};
};

instance PC_OREHACKEN_LITEST(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_orehacken_litest_condition;
	information = pc_orehacken_litest_info;
	permanent = TRUE;
	description = "Отколоть кусок руды.";
};

func int pc_orehacken_litest_condition()
{
	b_checkliinpresence(LOSTISLAND_ZEN);
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_OREHACKEN) && (CHECKLI == TRUE) && (LITESTOK == TRUE) && (TESTNUGGETGAVE == FALSE))
	{
		return TRUE;
	};
};

func void pc_orehacken_litest_info()
{
	var int CurrentChance;
	CurrentChance = Hlp_Random(100);

	if(CurrentChance >= 75)
	{
		TESTNUGGETGAVE = TRUE;
		CreateInvItems(hero,itmi_testnugget,1);
		AI_PrintClr("Вы откололи от породы большой кусок руды!",83,152,48);
		Snd_Play("ORE_HACK");
		b_endproductiondialog();
	}
	else
	{
		AI_PrintClr("Рудная крошка разлетелась во все стороны...",245,247,225);
		Snd_Play("ORE_HACK");
	};
};

func void ironhacken_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		WarnPerOnceIron = FALSE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_IRONHACKEN;
		AI_ProcessInfos(her);
	};
};

instance PC_IRONHACKEN_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_IRONHACKEN_end_condition;
	information = PC_IRONHACKEN_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_IRONHACKEN_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_IRONHACKEN)
	{
		return TRUE;
	};
};

func void PC_IRONHACKEN_end_info()
{
	//print_percent_bar_ore_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);
	b_endproductiondialog();
};


instance PC_IRONHACKEN_ADDON_HOUR(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_IRONHACKEN_addon_hour_condition;
	information = PC_IRONHACKEN_addon_hour_info;
	permanent = TRUE;
	description = "Добывать железную руду.";
};

func int PC_IRONHACKEN_addon_hour_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_IRONHACKEN) && (KNOWHOWPICKORE == TRUE))
	{
		return TRUE;
	};
};

func void PC_IRONHACKEN_addon_hour_info()
{
	var string concatText;
	var string textore;
	var int MultiNugget;
	var int IronDayStam;
	var int TempFatigueMark;

	if(HERO_HACKCHANCEORE >= 10)
	{
		IronDayStam = 15 - (HERO_HACKCHANCEORE / 10);
	}
	else
	{
		IronDayStam = 15;
	};
	if((SBMODE == TRUE) && (Hero_Fatigue == FALSE))
	{
		B_Say(hero,hero,"$NEEDSLEEP");
		AI_PrintClr("Вы утомлены! Пора отдохнуть...",177,58,17);
		Snd_Play("ORE_HACK");
		//print_percent_bar_ore_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);
		b_endproductiondialog();
	}
	else if(ATR_STAMINA[0] >= IronDayStam)
	{
		//print_percent_bar_ore(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(HERO_HACKCHANCEORE >= 100)
		{
			MultiNugget = Hlp_Random(10);
		}
		else if(HERO_HACKCHANCEORE >= 90)
		{
			MultiNugget = Hlp_Random(9);
		}
		else if(HERO_HACKCHANCEORE >= 80)
		{
			MultiNugget = Hlp_Random(8);
		}
		else if(HERO_HACKCHANCEORE >= 70)
		{
			MultiNugget = Hlp_Random(7);
		}
		else if(HERO_HACKCHANCEORE >= 60)
		{
			MultiNugget = Hlp_Random(6);
		}
		else if(HERO_HACKCHANCEORE >= 50)
		{
			MultiNugget = Hlp_Random(5);
		}
		else if(HERO_HACKCHANCEORE >= 40)
		{
			MultiNugget = Hlp_Random(4);
		}
		else if(HERO_HACKCHANCEORE >= 30)
		{
			MultiNugget = Hlp_Random(3);
		}
		else if(HERO_HACKCHANCEORE >= 20)
		{
			MultiNugget = Hlp_Random(2);
		}
		else if(HERO_HACKCHANCEORE >= 0)
		{
			MultiNugget = Hlp_Random(1);
		};

		if(MultiNugget > 0)
		{
			if(MultiNugget == 1)
			{
				textore = " кусок железной руды.";
			}
			else if((MultiNugget > 1) && (MultiNugget < 5))
			{
				textore = " куска железной руды.";
			}
			else if(MultiNugget >= 5)
			{
				textore = " кусков железной руды.";
			};

			CreateInvItems(hero,ItMi_snugget,MultiNugget);
			concatText = "Вы добыли ";
			concatText = ConcatStrings(concatText,IntToString(MultiNugget));
			concatText = ConcatStrings(concatText,textore);
			concatText = ConcatStrings(concatText," (Всего: ");
			concatText = ConcatStrings(concatText,IntToString(Npc_HasItems(hero,ItMi_snugget)));
			concatText = ConcatStrings(concatText,")");
			AI_PrintClr(concatText,83,152,48);
		}
		else
		{
			AI_PrintClr("Железная крошка разлетелась во все стороны...",245,247,225);
		};

		ATR_STAMINA[0] = ATR_STAMINA[0] - IronDayStam;

		if(ATR_STAMINA[0] < 1)
		{
			ATR_STAMINA[0] = 0;
		};

		Snd_Play("ORE_HACK");

		if(SBMODE == TRUE)
		{
			TempCountFatigueIron += 1;

			if(HERO_HACKCHANCEORE >= 90)
			{
				TempFatigueMark = 10;
			}
			else if(HERO_HACKCHANCEORE >= 60)
			{
				TempFatigueMark = 8;
			}
			else if(HERO_HACKCHANCEORE >= 30)
			{
				TempFatigueMark = 6;
			}
			else if(HERO_HACKCHANCEORE >= 0)
			{
				TempFatigueMark = 4;
			};
			if(TempCountFatigueIron >= TempFatigueMark)
			{
				if(Hero_Fatigue > 1)
				{
					Hero_Fatigue -= 1;
					TempCountFatigueIron = FALSE;
				}
				else
				{
					Hero_Fatigue = FALSE;
					TempCountFatigueIron = FALSE;

					if(WarnPerOnceIron == FALSE)
					{
						B_Say(hero,hero,"$NEEDSLEEP");
						AI_PrintClr("Вы утомлены! Пора отдохнуть...",177,58,17);
						WarnPerOnceIron = TRUE;
					};
				};
			};
		};
	}
	else
	{
		AI_PrintClr(PRINT_NOMORESTAMINAFORHACKEN,177,58,17);
		B_Say(self,self,"$TOOHARD");
		Snd_Play("ORE_HACK");
		//print_percent_bar_ore_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);
		b_endproductiondialog();
	};
};