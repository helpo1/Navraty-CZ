
instance DIA_Addon_Cronos_EXIT(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 999;
	condition = DIA_Addon_Cronos_EXIT_Condition;
	information = DIA_Addon_Cronos_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cronos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Cronos_PICKPOCKET(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 900;
	condition = DIA_Addon_Cronos_PICKPOCKET_Condition;
	information = DIA_Addon_Cronos_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Addon_Cronos_PICKPOCKET_Condition()
{
	return C_Beklauen(49,35);
};

func void DIA_Addon_Cronos_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Cronos_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Cronos_PICKPOCKET,Dialog_Back,DIA_Addon_Cronos_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Cronos_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Cronos_PICKPOCKET_DoIt);
};

func void DIA_Addon_Cronos_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Cronos_PICKPOCKET);
};

func void DIA_Addon_Cronos_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Cronos_PICKPOCKET);
};

instance DIA_Addon_Cronos_Hallo(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_Hallo_Condition;
	information = DIA_Addon_Cronos_Hallo_Info;
	description = "Я могу тебя побеспокоить?";
};


func int DIA_Addon_Cronos_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Hallo_15_00");	//Я могу тебя побеспокоить?
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_01");	//(удивленно) Это ТЫ? Не думал, что мне еще когда-нибудь доведется увидеть твое лицо.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_02");	//Ты храбрец, если решил здесь показаться. Некоторое время назад мы были готовы заживо содрать с тебя кожу.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_03");	//К счастью для тебя, с того времени прошло уже несколько недель, так что мы немного успокоились.
};


instance DIA_Addon_Cronos_WasMachstdu(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_WasMachstdu_Condition;
	information = DIA_Addon_Cronos_WasMachstdu_Info;
	description = "Что ты здесь делаешь?";
};


func int DIA_Addon_Cronos_WasMachstdu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Cronos_WasMachstdu_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WasMachstdu_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_01");	//Моя задача - выяснить как можно больше об охранниках храма.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_02");	//Непростая задача, скажу я тебе. Свойства этих каменных стражей мне совершенно незнакомы.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_03");	//Они могут стоять, совершенно не подавая признаков жизни, а через секунду уже нападать на тебя, как одержимые.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_04");	//Я еще не определил силу, которая приводит их в движение, но в одном у меня сомнений нет: природа этой силы магическая.
};


instance DIA_Addon_Cronos_Waechter(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_Waechter_Condition;
	information = DIA_Addon_Cronos_Waechter_Info;
	description = "Расскажи мне о каменных стражах.";
};


func int DIA_Addon_Cronos_Waechter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_WasMachstdu))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Cronos_Waechter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Waechter_15_00");	//Расскажи мне о каменных стражах.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_01");	//Многого я сказать пока не могу. К сожалению, нам пришлось их уничтожить. Теперь они не опасны.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_02");	//Когда мы только пришли сюда, они напали на нас.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_03");	//Лишь объединенными силами нам удалось их победить. Боюсь, за порталом нас ждут новые стражи.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_04");	//Должен быть способ закрыть источник их силы, чтобы они оставались лишь безжизненными статуями.
};


instance DIA_Addon_Cronos_NW_Trade(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_NW_Trade_Condition;
	information = DIA_Addon_Cronos_NW_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Ты можешь продать мне какие-нибудь припасы?";
};


func int DIA_Addon_Cronos_NW_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_WasMachstdu))
	{
		return TRUE;
	};
};


var int DIA_Addon_Cronos_NW_Trade_OneTime;

func void DIA_Addon_Cronos_NW_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	AI_Output(other,self,"DIA_Addon_Cronos_NW_Trade_15_00");	//Ты можешь продать мне какие-нибудь припасы?

	if(DIA_Addon_Cronos_NW_Trade_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_01");	//Почему бы и нет? Если я правильно помню, мы с тобой уже вели дела.
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
		Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
		B_LogEntry(Topic_OutTrader,LogText_Addon_CronosTrade);
	};

	AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_02");	//Скажи мне, что тебе нужно.
	B_GiveTradeInv(self);
};


instance DIA_ADDON_CRONOS_NW_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 1;
	condition = dia_addon_cronos_nw_prayforgomez_condition;
	information = dia_addon_cronos_nw_prayforgomez_info;
	permanent = FALSE;
	description = "Мне нужно благословение Аданоса.";
};


func int dia_addon_cronos_nw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_nw_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_NW_PrayForGomez_01_01");	//Мне нужно благословление Аданоса.
	AI_Output(self,other,"DIA_Addon_Cronos_NW_PrayForGomez_01_02");	//Поговори об этом с Сатурасом.
	AI_Output(self,other,"DIA_Addon_Cronos_NW_PrayForGomez_01_03");	//Думаю, он сможет помочь тебе.
	AI_Output(other,self,"DIA_Addon_Cronos_NW_PrayForGomez_01_04");	//Спасибо за совет.
	SENTTOSATURASGOMEZ = TRUE;
};


instance DIA_ADDON_CRONOS_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 1;
	condition = dia_addon_cronos_runemagicnotwork_condition;
	information = dia_addon_cronos_runemagicnotwork_info;
	permanent = FALSE;
	description = "Ты все еще можешь использовать свою рунную магию?";
};


func int dia_addon_cronos_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Cronos_RuneMagicNotWork_01_00");	//Ты все еще можешь использовать свою рунную магию?
	AI_Output(self,other,"DIA_Addon_Cronos_RuneMagicNotWork_01_01");	//Боюсь тебя огорчить, но все мои магические руны каким-то образом утратили свою силу.
	AI_Output(self,other,"DIA_Addon_Cronos_RuneMagicNotWork_01_02");	//Причем, не только у меня, но и остальных магов Воды! И я понятия не имею, как это могло произойти.
	AI_Output(self,other,"DIA_Addon_Cronos_RuneMagicNotWork_01_03");	//Возможно, в этом мире произошло нечто страшное и непоправимое, раз все мы вдруг утратили этот дар.
	AI_Output(other,self,"DIA_Addon_Cronos_RuneMagicNotWork_01_04");	//Хммм... все ясно.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Кажется, Маги Воды также потеряли свою способность использовать рунную магию.");
	WATERMAGERUNESNOT = TRUE;
};

