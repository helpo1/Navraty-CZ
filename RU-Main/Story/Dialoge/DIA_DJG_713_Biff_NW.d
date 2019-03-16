
instance DIA_Biff_NW_EXIT(C_Info)
{
	npc = DJG_713_Biff_NW;
	nr = 999;
	condition = DIA_Biff_NW_EXIT_Condition;
	information = DIA_Biff_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Biff_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Biff_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Biff_NW_HAfen(C_Info)
{
	npc = DJG_713_Biff_NW;
	nr = 5;
	condition = DIA_Biff_NW_HAfen_Condition;
	information = DIA_Biff_NW_HAfen_Info;
	permanent = TRUE;
	description = "Хорошо. Осталось не долго.";
};


func int DIA_Biff_NW_HAfen_Condition()
{
	if(CAPITANORDERDIAWAY == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Biff_NW_HAfen_Info()
{
	AI_Output(other,self,"DIA_Biff_NW_HAfen_15_00");	//Хорошо. Осталось недолго.
	AI_Output(self,other,"DIA_Biff_NW_HAfen_07_01");	//Я не могу ждать.
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Biff_NW_PICKPOCKET(C_Info)
{
	npc = DJG_713_Biff_NW;
	nr = 900;
	condition = DIA_Biff_NW_PICKPOCKET_Condition;
	information = DIA_Biff_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Biff_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(92,250);
};

func void DIA_Biff_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Biff_NW_PICKPOCKET);
	Info_AddChoice(DIA_Biff_NW_PICKPOCKET,Dialog_Back,DIA_Biff_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Biff_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Biff_NW_PICKPOCKET_DoIt);
};

func void DIA_Biff_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Biff_NW_PICKPOCKET);
};

func void DIA_Biff_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Biff_NW_PICKPOCKET);
};


instance DIA_BIFF_NW_KAPITELORCATTACK(C_Info)
{
	npc = DJG_713_Biff_NW;
	nr = 1;
	condition = dia_biff_nw_kapitelorcattack_condition;
	information = dia_biff_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Какие у тебя планы?";
};


func int dia_biff_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (BIFFBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_biff_nw_kapitelorcattack_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Biff_NW_KapitelOrcAttack_01_00");	//Какие у тебя планы?
	AI_Output(self,other,"DIA_Biff_NW_KapitelOrcAttack_01_01");	//Я пока точно не могу сказать. Но, думаю, что останусь с теми, кто решит прорубать себе дорогу из города топором.
	AI_Output(other,self,"DIA_Biff_NW_KapitelOrcAttack_01_02");	//И тебя это не пугает?
	AI_Output(self,other,"DIA_Biff_NW_KapitelOrcAttack_01_03");	//Если бы я боялся, то не стал бы охотником на драконов! А эти твари будут куда пострашнее каких-то орков.
	AI_Output(other,self,"DIA_Biff_NW_KapitelOrcAttack_01_04");	//Ладно, дело твое. Тогда наши пути здесь пока расходятся.
	AI_Output(other,self,"DIA_Biff_NW_KapitelOrcAttack_01_05");	//Но надеюсь, что мы видимся не в последний раз.
	AI_Output(self,other,"DIA_Biff_NW_KapitelOrcAttack_01_06");	//Там будет видно.
	B_LogEntry(TOPIC_HELPCREW,"Бифф остается с теми, кто будет прорываться из города с боем. Думаю, у него есть шанс остаться в живых.");
	BIFFBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

