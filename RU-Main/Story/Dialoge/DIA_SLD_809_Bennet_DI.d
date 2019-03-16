
instance DIA_Bennet_DI_EXIT(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 999;
	condition = DIA_Bennet_DI_EXIT_Condition;
	information = DIA_Bennet_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bennet_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_DI_Hello(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 10;
	condition = DIA_Bennet_DI_Hello_Condition;
	information = DIA_Bennet_DI_Hello_Info;
	permanent = TRUE;
	description = "У тебя все в порядке?";
};


func int DIA_Bennet_DI_Hello_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_Hello_Info()
{
	AI_Output(other,self,"DIA_Bennet_DI_Hello_15_00");	//У тебя все в порядке?

	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DI_Hello_06_01");	//Кузница на корабле немного проржавела. Морская соль разъедает ее. Здесь будет непросто выковать что-нибудь приличное. Ну, а кроме этого...
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DI_Hello_06_02");	//Да. Если только орки не вернутся.
	};
};


instance DIA_Bennet_DI_TRADE(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 7;
	condition = DIA_Bennet_DI_TRADE_Condition;
	information = DIA_Bennet_DI_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Какое оружие ты можешь продать мне?";
};


func int DIA_Bennet_DI_TRADE_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Bennet_DI_TRADE_15_00");	//Какое оружие ты можешь мне продать?
	AI_Output(self,other,"DIA_Bennet_DI_TRADE_06_01");	//Сам знаешь - только лучшее.
	B_GiveTradeInv(self);
};


instance DIA_Bennet_DI_Smith(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 7;
	condition = DIA_Bennet_DI_Smith_Condition;
	information = DIA_Bennet_DI_Smith_Info;
	permanent = TRUE;
	description = "Ты сможешь научить меня ковать оружие? ";
};

func int DIA_Bennet_DI_Smith_Condition()
{
	if((Bennet_TeachSmith == TRUE) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_Smith_Info()
{
	AI_Output(other,self,"DIA_Bennet_DI_Smith_15_00");	//Ты можешь научить меня ковальному делу?
	AI_Output(self,other,"DIA_Bennet_DI_Smith_06_01");	//Зависит от того, что ты хочешь уметь.
	Info_ClearChoices(DIA_Bennet_DI_Smith);
	Info_AddChoice(DIA_Bennet_DI_Smith,Dialog_Back,DIA_Bennet_DI_Smith_BACK);

	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt("Научиться ковать ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),DIA_Bennet_DI_Smith_Common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),DIA_Bennet_DI_Smith_1hSpecial1);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),DIA_Bennet_DI_Smith_2hSpecial1);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),DIA_Bennet_DI_Smith_1hSpecial2);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),DIA_Bennet_DI_Smith_2hSpecial2);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_03)),DIA_Bennet_DI_Smith_1hSpecial3);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_03)),DIA_Bennet_DI_Smith_2hSpecial3);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_04)),DIA_Bennet_DI_Smith_1hSpecial4);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_04)),DIA_Bennet_DI_Smith_2hSpecial4);
		};
	};
};

func void DIA_Bennet_DI_Smith_BACK()
{
	Info_ClearChoices(DIA_Bennet_DI_Smith);
};

func void DIA_Bennet_DI_Smith_Common()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_Common);
};

func void DIA_Bennet_DI_Smith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_01);
};

func void DIA_Bennet_DI_Smith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_01);
};

func void DIA_Bennet_DI_Smith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_02);
};

func void DIA_Bennet_DI_Smith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_02);
};

func void DIA_Bennet_DI_Smith_1hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_03);
};

func void DIA_Bennet_DI_Smith_2hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_03);
};

func void DIA_Bennet_DI_Smith_1hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_04);
};

func void DIA_Bennet_DI_Smith_2hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_04);
};


instance DIA_Bennet_TeachSTR(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 150;
	condition = DIA_Bennet_TeachSTR_Condition;
	information = DIA_Bennet_TeachSTR_Info;
	permanent = TRUE;
	description = "Я хочу стать сильнее.";
};

func int DIA_Bennet_TeachSTR_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSTR_Info()
{
	AI_Output(other,self,"DIA_Bennet_TeachSTR_15_00");	//Я хочу стать сильнее.
	AI_Output(self,other,"DIA_Bennet_TeachSTR_06_01");	//В наше время твердая рука никогда не помешает.
	Info_ClearChoices(DIA_Bennet_TeachSTR);
	Info_AddChoice(DIA_Bennet_TeachSTR,Dialog_Back,DIA_Bennet_TeachSTR_Back);
	Info_AddChoice(DIA_Bennet_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Bennet_TeachSTR_STR_1);
	Info_AddChoice(DIA_Bennet_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Bennet_TeachSTR_STR_5);
};

func void DIA_Bennet_TeachSTR_Back()
{
	Info_ClearChoices(DIA_Bennet_TeachSTR);
};

func void DIA_Bennet_TeachSTR_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_AddChoice(DIA_Bennet_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Bennet_TeachSTR_STR_1);
};

func void DIA_Bennet_TeachSTR_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_AddChoice(DIA_Bennet_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Bennet_TeachSTR_STR_5);
};


instance DIA_Bennet_DI_DragonEgg(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 99;
	condition = DIA_Bennet_DI_DragonEgg_Condition;
	information = DIA_Bennet_DI_DragonEgg_Info;
	permanent = FALSE;
	description = "У меня есть драконье яйцо.";
};

func int DIA_Bennet_DI_DragonEgg_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_DragonEgg_Info()
{
	AI_Output(other,self,"DIA_Bennet_DI_DragonEgg_15_00");	//У меня есть драконье яйцо.
	AI_Output(self,other,"DIA_Bennet_DI_DragonEgg_06_01");	//И?
	AI_Output(other,self,"DIA_Bennet_DI_DragonEgg_15_02");	//Ну. Я подумал...
	AI_Output(self,other,"DIA_Bennet_DI_DragonEgg_06_03");	//Я знаю, о чем ты думаешь. Забудь об этом и оставь яйцо себе. Мне оно не нужно.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bennet_DI_UndeadDragonDead(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 7;
	condition = DIA_Bennet_DI_UndeadDragonDead_Condition;
	information = DIA_Bennet_DI_UndeadDragonDead_Info;
	permanent = FALSE;
	description = "Мы сделали все, что было нужно сделать.";
};

func int DIA_Bennet_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Bennet_DI_UndeadDragonDead_15_00");	//Мы сделали все, что было нужно сделать.
	AI_Output(self,other,"DIA_Bennet_DI_UndeadDragonDead_06_01");	//Рад слышать это. Мне уже успела надоесть эта старая кузница. Я хочу опять стоять на твердой земле.
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_DI_PICKPOCKET(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 900;
	condition = DIA_Bennet_DI_PICKPOCKET_Condition;
	information = DIA_Bennet_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bennet_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(35,65);
};

func void DIA_Bennet_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bennet_DI_PICKPOCKET);
	Info_AddChoice(DIA_Bennet_DI_PICKPOCKET,Dialog_Back,DIA_Bennet_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bennet_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bennet_DI_PICKPOCKET_DoIt);
};

func void DIA_Bennet_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bennet_DI_PICKPOCKET);
};

func void DIA_Bennet_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bennet_DI_PICKPOCKET);
};

instance DIA_Bennet_DI_BetterArmor(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 8;
	condition = DIA_Bennet_DI_BetterArmor_Condition;
	information = DIA_Bennet_DI_BetterArmor_Info;
	permanent = FALSE;
	description = "У тебя получше доспехов не найдется?";
};

func int DIA_Bennet_DI_BetterArmor_Condition()
{
	if((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL) || (hero.guild == GIL_TPL))
	{
		if((SBMode == TRUE) || (RealMode[2] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Bennet_DI_BetterArmor_Info()
{
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_01_00");	//У тебя получше доспехов не найдется?
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_01_01");	//Хммм...(задумчиво) Я могу сковать для тебя самые лучшие доспехи из тех, которые тебе только доводилось видеть.
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_01_02");	//Однако для их создания потребуется огромное количество разнообразного материала.
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_01_03");	//Какого именно?
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_01_04");	//Для начала это полсотни драконьих чешуек! Они послужат основой для создания нагрудника верхней части доспеха и ножных щитков.
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_01_05");	//Далее, чтобы придать доспеху надлежащую прочность, его придется покрыть магической рудой. А это как минимум два десятка кусков!
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_01_06");	//Так же в работу пойдут десять кусков серы, пять черных жемчужин, два горшка смолы и самое главное - четыре куска лобовой драконьей кости.
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_01_07");	//Если сможешь достать все это, будет тебе самый прочный доспех на всем белом свете!
	MIS_BetterArmor = LOG_Running;
	Log_CreateTopic(TOPIC_BetterArmor,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BetterArmor,LOG_Running);
	B_LogEntry(TOPIC_BetterArmor,"По словам Беннета, он сможет изготовить для меня доспехи исключительной прочности! Однако для этого ему понадобится огромное количество разнообразного материала, а именно - полсотни драконьих чешуек, два десятка кусков магической руды, десять кусков серы, пять черных жемчужин, два горшка смолы и самое главное - четыре куска лобовой драконьей кости. Если я достану ему все это - он сделает мне эти доспехи бесплатно.");
};

instance DIA_Bennet_DI_BetterArmor_Done(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 8;
	condition = DIA_Bennet_DI_BetterArmor_Done_Condition;
	information = DIA_Bennet_DI_BetterArmor_Done_Info;
	permanent = FALSE;
	description = "У меня есть все, что ты просил.";
};

func int DIA_Bennet_DI_BetterArmor_Done_Condition()
{
	if((MIS_BetterArmor == LOG_Running) && (DayStartArmor == FALSE) && (Npc_HasItems(other,ItAt_DragonScale) >= 50) && (Npc_HasItems(other,ItAt_XragonSkull) >= 4) && (Npc_HasItems(other,ItMi_Nugget) >= 20) && (Npc_HasItems(other,ItMi_Sulfur) >= 10) && (Npc_HasItems(other,ItMi_Pitch) >= 2) && (Npc_HasItems(other,ItMi_DarkPearl) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_BetterArmor_Done_Info()
{
	B_GivePlayerXP(2500);
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_00");	//У меня есть все, что ты просил.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItAt_DragonScale,50);
	Npc_RemoveInvItems(hero,ItAt_XragonSkull,4);
	Npc_RemoveInvItems(hero,ItMi_Nugget,20);
	Npc_RemoveInvItems(hero,ItMi_Pitch,2);
	Npc_RemoveInvItems(hero,ItMi_Sulfur,10);
	Npc_RemoveInvItems(hero,ItMi_DarkPearl,5);

	if(Trophy_DragonSkull  == TRUE)
	{
		if(Npc_HasItems(other,ItAt_XragonSkull) == FALSE)
		{
			Ext_RemoveFromSlot(other,"BIP01 PELVIS");
			Npc_RemoveInvItems(other,ItUt_DragonSkull,Npc_HasItems(other,ItUt_DragonSkull));
			Trophy_DragonSkull  = FALSE;
		};
	};

	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Done_01_01");	//Хорошо...(одобрительно) Тогда я немедленно принимаюсь за работу.
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_02");	//Сколько времени тебе надо, чтобы их изготовить?
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Done_01_03");	//Трудно сказать! Но я дам тебе знать, как только они будут готовы.
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_04");	//Хорошо.
	DayStartArmor = TRUE;
	DayStartArmorCount = Wld_GetDay();
	B_LogEntry(TOPIC_BetterArmor,"Я отдал Беннету все необходимые материалы для доспехов и он немедленно принялся за работу. Он не знает сколько времени займет их изготовление.");
	AI_StopProcessInfos(self);
};

instance DIA_Bennet_DI_BetterArmor_Finish(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 8;
	condition = DIA_Bennet_DI_BetterArmor_Finish_Condition;
	information = DIA_Bennet_DI_BetterArmor_Finish_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bennet_DI_BetterArmor_Finish_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_BetterArmor == LOG_Running) && (DayStartArmor == TRUE) && (OberDementorIsDead == TRUE) && (DayStartArmorCount < daynow))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_BetterArmor_Finish_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Finish_01_00");	//Насчет твоих доспехов...(устало) Они готовы!
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Finish_01_01");	//Вот, возьми их. Они надежно защитят тебя от любого врага.
	B_GiveInvItems(self,other,ItAr_DragonKiller,1);
	MIS_BetterArmor = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BetterArmor,LOG_SUCCESS);
	B_LogEntry(TOPIC_BetterArmor,"Беннет выковал доспехи и отдал их мне.");
	AI_StopProcessInfos(self);
};