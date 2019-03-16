
var int trd_bennetli;

instance DIA_BENNET_LI_EXIT(C_Info)
{
	npc = sld_809_bennet_li;
	nr = 999;
	condition = dia_bennet_li_exit_condition;
	information = dia_bennet_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_bennet_li_exit_condition()
{
	return TRUE;
};

func void dia_bennet_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_LI_TRADE(C_Info)
{
	npc = sld_809_bennet_li;
	nr = 7;
	condition = dia_bennet_li_trade_condition;
	information = dia_bennet_li_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Какое оружие ты можешь мне продать?";
};


func int dia_bennet_li_trade_condition()
{
	return TRUE;
};

func void dia_bennet_li_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Bennet_DI_TRADE_15_00");	//Какое оружие ты можешь мне продать?
	AI_Output(self,other,"DIA_Bennet_DI_TRADE_06_01");	//Сам знаешь - только лучшее.

	if(TRD_BENNETLI != TRUE)
	{
		CreateInvItems(self,ItMiSwordraw,3);
		CreateInvItems(self,ItRw_Arrow,140);
		CreateInvItems(self,ItRw_Bolt,140);
		CreateInvItems(self,ItMw_ElBastardo,1);
		CreateInvItems(self,ItMw_Folteraxt,1);
		CreateInvItems(self,ItMw_Zweihaender4,1);
		CreateInvItems(self,ItMi_Nugget,4);
		TRD_BENNETLI = TRUE;
	};

	B_GiveTradeInv(self);
};


instance DIA_BENNET_LI_SMITH(C_Info)
{
	npc = sld_809_bennet_li;
	nr = 7;
	condition = dia_bennet_li_smith_condition;
	information = dia_bennet_li_smith_info;
	permanent = TRUE;
	description = "Ты сможешь научить меня ковать оружие?";
};


func int dia_bennet_li_smith_condition()
{
	if(Bennet_TeachSmith == TRUE)
	{
		return TRUE;
	};
};

func void dia_bennet_li_smith_info()
{
	AI_Output(other,self,"DIA_Bennet_DI_Smith_15_00");	//Ты можешь обучить меня своему мастерству?
	AI_Output(self,other,"DIA_Bennet_DI_Smith_06_01");	//Зависит от того, что ты хочешь уметь.
	Info_ClearChoices(dia_bennet_li_smith);
	Info_AddChoice(dia_bennet_li_smith,Dialog_Back,dia_bennet_li_smith_back);
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt("Научиться ковать ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),dia_bennet_li_smith_common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
		{
			Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),dia_bennet_li_smith_1hspecial1);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
		{
			Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),dia_bennet_li_smith_2hspecial1);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
		{
			Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),dia_bennet_li_smith_1hspecial2);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
		{
			Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),dia_bennet_li_smith_2hspecial2);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
		{
			Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_03)),dia_bennet_li_smith_1hspecial3);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
		{
			Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_03)),dia_bennet_li_smith_2hspecial3);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
		{
			Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_04)),dia_bennet_li_smith_1hspecial4);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
		{
			Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_04)),dia_bennet_li_smith_2hspecial4);
		};
	};
};

func void dia_bennet_li_smith_back()
{
	Info_ClearChoices(dia_bennet_li_smith);
};

func void dia_bennet_li_smith_common()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_Common);
};

func void dia_bennet_li_smith_1hspecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_01);
};

func void dia_bennet_li_smith_2hspecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_01);
};

func void dia_bennet_li_smith_1hspecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_02);
};

func void dia_bennet_li_smith_2hspecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_02);
};

func void dia_bennet_li_smith_1hspecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_03);
};

func void dia_bennet_li_smith_2hspecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_03);
};

func void dia_bennet_li_smith_1hspecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_04);
};

func void dia_bennet_li_smith_2hspecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_04);
};


instance DIA_BENNET_LI_PICKPOCKET(C_Info)
{
	npc = sld_809_bennet_li;
	nr = 900;
	condition = dia_bennet_li_pickpocket_condition;
	information = dia_bennet_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_bennet_li_pickpocket_condition()
{
	return C_Beklauen(35,65);
};

func void dia_bennet_li_pickpocket_info()
{
	Info_ClearChoices(dia_bennet_li_pickpocket);
	Info_AddChoice(dia_bennet_li_pickpocket,Dialog_Back,dia_bennet_li_pickpocket_back);
	Info_AddChoice(dia_bennet_li_pickpocket,DIALOG_PICKPOCKET,dia_bennet_li_pickpocket_doit);
};

func void dia_bennet_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_bennet_li_pickpocket);
};

func void dia_bennet_li_pickpocket_back()
{
	Info_ClearChoices(dia_bennet_li_pickpocket);
};


instance DIA_BENNET_LI_MISSMYGOLD(C_Info)
{
	npc = sld_809_bennet_li;
	nr = 2;
	condition = dia_bennet_li_missmygold_condition;
	information = dia_bennet_li_missmygold_info;
	permanent = FALSE;
	description = "Есть одно дело.";
};


func int dia_bennet_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_bennet_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Bennet_LI_MissMyGold_01_01");	//Есть одно дело.
	AI_Output(self,other,"DIA_Bennet_LI_MissMyGold_01_02");	//(ворчливо) Тогда говори, если есть...
	AI_Output(self,other,"DIA_Bennet_LI_MissMyGold_01_03");	//Только давай быстрее. А то, как ты видишь, я сейчас немного занят.
	AI_Output(other,self,"DIA_Bennet_LI_MissMyGold_01_04");	//Куда подевалось мое золото?
	AI_Output(self,other,"DIA_Bennet_LI_MissMyGold_01_05");	//Парень...(ворчливо) Я целыми днями торчу у своей кузницы.
	AI_Output(self,other,"DIA_Bennet_LI_MissMyGold_01_06");	//Откуда, по-твоему, мне знать, куда оно подевалось?
	B_LogEntry(TOPIC_MISSMYGOLD,"Беннет тоже не в курсе, куда подевалось мое золото.");
};


instance DIA_BENNET_LI_FINDMAGICORECAVE(C_Info)
{
	npc = sld_809_bennet_li;
	nr = 2;
	condition = dia_bennet_li_findmagicorecave_condition;
	information = dia_bennet_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Я нашел пещеру с залежами магической руды.";
};


func int dia_bennet_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Bennet_LI_FindMagicOreCave_01_01");	//Я нашел пещеру с залежами магической руды.
	AI_Output(self,other,"DIA_Bennet_LI_FindMagicOreCave_01_02");	//Правда? Тогда тебе стоит поговорить об этом с нашим капитаном.
	AI_Output(self,other,"DIA_Bennet_LI_FindMagicOreCave_01_03");	//Думаю, ему будет интересно услышать эту новость.
	GOTOORECAPITAN = TRUE;
};


instance DIA_BENNET_LI_CHANGECOURSE(C_Info)
{
	npc = sld_809_bennet_li;
	nr = 2;
	condition = dia_bennet_li_changecourse_condition;
	information = dia_bennet_li_changecourse_info;
	permanent = FALSE;
	description = "Ты не хотел бы вернуться обратно в Хоринис?";
};


func int dia_bennet_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_bennet_li_changecourse_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Bennet_LI_ChangeCourse_01_00");	//Нам надо вернуться в Хоринис.
	AI_Output(self,other,"DIA_Bennet_LI_ChangeCourse_01_07");	//Конечно, приятель! Я и не хотел плыть на материк.
	AI_Output(self,other,"DIA_Bennet_LI_ChangeCourse_01_08");	//Сейчас я больше всего хочу вернуться на ферму Онара к своей старой кузнице.
	AI_Output(other,self,"DIA_Bennet_LI_ChangeCourse_01_12");	//Понятно.
	B_LogEntry(TOPIC_CHANGECOURSE,"Кузнец Беннет только и ждет того момента, когда мы вернемся обратно в Хоринис.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
};

instance DIA_Bennet_LI_BetterArmor_Done(C_Info)
{
	npc = SLD_809_Bennet_LI;
	nr = 8;
	condition = DIA_Bennet_LI_BetterArmor_Done_Condition;
	information = DIA_Bennet_LI_BetterArmor_Done_Info;
	permanent = FALSE;
	description = "У меня есть все, что ты просил.";
};

func int DIA_Bennet_LI_BetterArmor_Done_Condition()
{
	if((MIS_BetterArmor == LOG_Running) && (DayStartArmor == FALSE) && (Npc_HasItems(other,ItAt_DragonScale) >= 50) && (Npc_HasItems(other,ItAt_XragonSkull) >= 4) && (Npc_HasItems(other,ItMi_Nugget) >= 20) && (Npc_HasItems(other,ItMi_Sulfur) >= 10) && (Npc_HasItems(other,ItMi_Pitch) >= 2) && (Npc_HasItems(other,ItMi_DarkPearl) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Bennet_LI_BetterArmor_Done_Info()
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

	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Done_01_01");	//Хорошо. Тогда я немедленно принимаюсь за работу.
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_02");	//Сколько тебе понадобится времени, чтобы их изготовить?
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Done_01_03");	//Трудно сказать. Но я дам тебе знать, как только они будут готовы.
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_04");	//Хорошо.
	DayStartArmor = TRUE;
	DayStartArmorCount = Wld_GetDay();
	B_LogEntry(TOPIC_BetterArmor,"Я отдал Беннету все необходимые материалы для доспехов, и он немедленно принялся за работу. Правда, он не знает, сколько времени займет их изготовление.");
	AI_StopProcessInfos(self);
};

instance DIA_Bennet_LI_BetterArmor_Finish(C_Info)
{
	npc = SLD_809_Bennet_LI;
	nr = 8;
	condition = DIA_Bennet_LI_BetterArmor_Finish_Condition;
	information = DIA_Bennet_LI_BetterArmor_Finish_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bennet_LI_BetterArmor_Finish_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_BetterArmor == LOG_Running) && (DayStartArmor == TRUE) && (OberDementorIsDead == TRUE) && (DayStartArmorCount < daynow))
	{
		return TRUE;
	};
};

func void DIA_Bennet_LI_BetterArmor_Finish_Info()
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