
instance DIA_SCATTY_NW_EXIT(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 999;
	condition = dia_scatty_nw_exit_condition;
	information = dia_scatty_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_scatty_nw_exit_condition()
{
	return TRUE;
};

func void dia_scatty_nw_exit_info()
{
	AI_StopProcessInfos(self);

	if((MIS_OLDGUARDGOWAR == LOG_SUCCESS) && (ALLGUARDIANSKILLED == FALSE))
	{
		if(SCATTYINSAFE == TRUE)
		{
			Npc_ExchangeRoutine(self,"FarmRest");
			b_removefromparty(vlk_6024_scatty);
		}
		else
		{
			Npc_ExchangeRoutine(self,"KillHim");
			b_removefromparty(vlk_6024_scatty);
		};
	};
};


instance DIA_SCATTY_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 900;
	condition = dia_scatty_nw_pickpocket_condition;
	information = dia_scatty_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_scatty_nw_pickpocket_condition()
{
	return C_Beklauen(110,250);
};

func void dia_scatty_nw_pickpocket_info()
{
	Info_ClearChoices(dia_scatty_nw_pickpocket);
	Info_AddChoice(dia_scatty_nw_pickpocket,Dialog_Back,dia_scatty_nw_pickpocket_back);
	Info_AddChoice(dia_scatty_nw_pickpocket,DIALOG_PICKPOCKET,dia_scatty_nw_pickpocket_doit);
};

func void dia_scatty_nw_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_scatty_nw_pickpocket);
};

func void dia_scatty_nw_pickpocket_back()
{
	Info_ClearChoices(dia_scatty_nw_pickpocket);
};


instance DIA_SCATTY_NW_HI(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = dia_scatty_nw_hi_condition;
	information = dia_scatty_nw_hi_info;
	important = TRUE;
};


func int dia_scatty_nw_hi_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_scatty_nw_hi_info()
{
	B_GivePlayerXP(500);

	if((SCATTYCHEST == TRUE) && (SCATTYCHESTDONE == FALSE))
	{
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_17");	//Эй, парень! Твое лицо мне кажется знакомым.
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_18");	//Ну точно! Ты тот парень, что...
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_19");	//...ГДЕ МОЕ ЗОЛОТО?!
		AI_Output(other,self,"DIA_Scatty_NW_Hi_01_20");	//Какое золото? О чем ты?
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_21");	//Ты что, меня за идиота принимаешь? Где золото, я спрашиваю?!
		AI_Output(other,self,"DIA_Scatty_NW_Hi_01_22");	//Не понимаю, о чем ты говоришь.
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_23");	//Ах, не понимаешь... Сейчас поймешь!
		SCATTYCHESTDONE = TRUE;
		SCATTY_SUCKED = TRUE;
		B_LogEntry_Failed(TOPIC_SCATTYCHEST);
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_00");	//Эй, парень! Твое лицо мне кажется знакомым.
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_01");	//Ну, точно! Ты тот парень, что...
		AI_Output(other,self,"DIA_Scatty_NW_Hi_01_02");	//Рад тебя видеть, Скатти. Как ты оказался здесь?
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_03");	//Как, как. Так же, как и ты. Вообще не стоит об этом. Сам понимаешь, почему.
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_04");	//Не ожидал от тебя такой прыти.
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Scatty_NW_Hi_01_05");	//Вы только посмотрите - маг Огня! Да уж, ты зря времени не терял.
		}
		else if(other.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Scatty_NW_Hi_01_06");	//Вы только посмотрите - паладин короля! Да уж, ты зря времени не терял.
		}
		else if(other.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_Scatty_NW_Hi_01_07");	//Вы только посмотрите - наемник! Да уж, ты зря времени не терял.
		}
		else if(other.guild == GIL_KDW)
		{
			AI_Output(self,other,"DIA_Scatty_NW_Hi_01_0A");	//Вы только посмотрите - маг Воды! Да уж, ты зря времени не терял.
		}
		else if(other.guild == GIL_KDM)
		{
			AI_Output(self,other,"DIA_Scatty_NW_Hi_01_0B");	//Вы только посмотрите - некромант! Да уж, ты зря времени не терял.
		}
		else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
		{
			AI_Output(self,other,"DIA_Scatty_NW_Hi_01_0C");	//Вы только посмотрите - сектант! Да уж, ты зря времени не терял.
		};
		AI_Output(other,self,"DIA_Scatty_NW_Hi_01_08");	//А что ты здесь делаешь?
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_09");	//Что, что. Работаю, конечно! Тренирую вместе с Вульфгаром этих парней-новобранцев, что ты видишь перед собой.
		AI_Output(other,self,"DIA_Scatty_NW_Hi_01_10");	//Вульфгар взял тебя тренировать новобранцев?
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_11");	//Ну да, я продемонстрировал ему парочку своих коронных приемов. В общем, я произвел на него впечатление!
		AI_Output(other,self,"DIA_Scatty_NW_Hi_01_12");	//Да, учитель, как я помню, из тебя совсем неплохой. Твои уроки там... ты знаешь где... не прошли для меня даром.
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_13");	//Рад, что ты не забыл те времена. Хорошее было время!
	};
};


instance DIA_SCATTY_NW_CITY(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 2;
	condition = dia_scatty_nw_city_condition;
	information = dia_scatty_nw_city_info;
	permanent = TRUE;
	description = "Как продвигается обучение новобранцев?";
};


func int dia_scatty_nw_city_condition()
{
	if(Npc_KnowsInfo(other,dia_scatty_nw_hi) && (SCATTY_SUCKED == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_scatty_nw_city_info()
{
	AI_Output(other,self,"DIA_Scatty_NW_City_01_00");	//Как продвигается обучение новобранцев?
	AI_Output(self,other,"DIA_Scatty_NW_City_01_01");	//Так себе! Большинство из них никуда не годится.
	AI_Output(self,other,"DIA_Scatty_NW_City_01_05");	//(решительно) Ничего. Мы еще сделаем из них настоящих солдат!
	if((Npc_IsDead(Mil_330_Miliz) == FALSE) && Wld_IsTime(8,0,20,20))
	{
		AI_Standup(self);
		B_TurnToNpc(self,Mil_330_Miliz);
		AI_Output(self,other,"DIA_Scatty_NW_City_01_02");	//(зовет) Эй, парень, - это совсем никуда не годится!
		AI_Output(self,other,"DIA_Scatty_NW_City_01_03");	//Возьмись за рукоять одной рукой. Лезвие вверх, и не держи его неподвижно.
		AI_Output(self,other,"DIA_Scatty_NW_City_01_04");	//Оружие должно стать продолжением твоей руки, вписываться в твои движения. Это поможет ускорить атаку!
		B_TurnToNpc(self,other);
	};
};


instance DIA_SCATTY_ANGREE(C_Info)
{
	npc = vlk_6024_scatty;
	condition = dia_scatty_angree_condition;
	information = dia_scatty_angree_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_scatty_angree_condition()
{
	if((SCATTY_SUCKED == TRUE) && (MIS_OLDGUARDGOWAR == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_scatty_angree_info()
{
	AI_Output(self,other,"DIA_Scatty_Angree_01_00");	//Убирайся прочь, маленький обманщик!
	AI_StopProcessInfos(self);
	SCATTY_SUCKED = TRUE;
};

instance DIA_SCATTY_NW_ESCAPEFROMTOWN(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = dia_scatty_nw_escapefromtown_condition;
	information = dia_scatty_nw_escapefromtown_info;
	permanent = FALSE;
	description = "Как дела?";
};

func int dia_scatty_nw_escapefromtown_condition()
{
	if(KAPITELORCATC == TRUE)
	{
		return TRUE;
	};
};

func void dia_scatty_nw_escapefromtown_info()
{
	AI_Output(other,self,"DIA_Scatty_NW_EscapeFromTown_01_00");	//Как дела?
	AI_Output(self,other,"DIA_Scatty_NW_EscapeFromTown_01_01");	//(угрюмо) Могло быть и лучше. Хотя одно то, что я до сих пор жив, уже радует.
	AI_Output(self,other,"DIA_Scatty_NW_EscapeFromTown_01_03");	//Если бы ты только видел, что тогда творилось в городе!
	AI_Output(self,other,"DIA_Scatty_NW_EscapeFromTown_01_05");	//Да и сейчас не лучше! Кругом одни орки, и никакой надежды на то, что вскоре это все закончится.
	SCATTYHERE = TRUE;
};

instance DIA_SCATTY_NW_WHATNEXT(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = dia_scatty_nw_whatnext_condition;
	information = dia_scatty_nw_whatnext_info;
	permanent = TRUE;
	description = "Останешься пока тут?";
};

func int dia_scatty_nw_whatnext_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_nw_escapefromtown) && (MIS_OLDGUARDGOWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_scatty_nw_whatnext_info()
{
	AI_Output(other,self,"DIA_Scatty_NW_WhatNext_01_00");	//Останешься тут?
	AI_Output(self,other,"DIA_Scatty_NW_WhatNext_01_01");	//Полагаю, что да. По крайней мере, орки сюда еще не добрались.
};

instance DIA_SCATTY_NW_OLDGUARDGOWAR(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = dia_scatty_nw_oldguardgowar_condition;
	information = dia_scatty_nw_oldguardgowar_info;
	permanent = FALSE;
	description = "Пошли!";
};

func int dia_scatty_nw_oldguardgowar_condition()
{
	if((MIS_OLDGUARDGOWAR == LOG_Running) && (SCATTYHERE == TRUE))
	{
		return TRUE;
	};
};

func void dia_scatty_nw_oldguardgowar_info()
{
	AI_Output(other,self,"DIA_Scatty_NW_OldGuardGoWar_01_00");	//Пошли! Надо выбираться отсюда.
	AI_Output(self,other,"DIA_Scatty_NW_OldGuardGoWar_01_01");	//(решительно) Давно бы так! Я уже устал сидеть на одном месте.
	AI_Output(self,other,"DIA_Scatty_NW_OldGuardGoWar_01_02");	//Ну, что стоишь, - вперед!
	SCATTYJOINME = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
};

instance DIA_SCATTY_NW_OLDGUARDGOWAR_DONE(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_condition;
	information = DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_info;
	permanent = FALSE;
	description = "Мы пришли.";
};

func int DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_condition()
{
	if((SCATTYJOINME == TRUE) && (Npc_GetDistToWP(self,"NW_BIGFARM_PATH_04") <= 2000))
	{
		return TRUE;
	};
};

func void DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_01_00");	//Мы пришли.
	AI_Output(self,other,"DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_01_01");	//Спасибо, приятель. Мне уже тут нравится!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	SCATTYINSAFE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FarmRest");
};

instance DIA_SCATTY_NW_WHEREPEASANT(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = dia_scatty_nw_wherepeasant_condition;
	information = dia_scatty_nw_wherepeasant_info;
	permanent = FALSE;
	description = "А где все крестьяне со двора?";
};


func int dia_scatty_nw_wherepeasant_condition()
{
	if((SCATTYHERE == TRUE) && (KNOWWHEREAKIL == FALSE) && (MIS_OLDGUARDGOWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_scatty_nw_wherepeasant_info()
{
	AI_Output(other,self,"DIA_Scatty_NW_WherePeasant_01_00");	//А где все крестьяне со двора?
	AI_Output(self,other,"DIA_Scatty_NW_WherePeasant_01_01");	//Понятия не имею. Разбежались, наверное, кто куда.
	AI_Output(self,other,"DIA_Scatty_NW_WherePeasant_01_02");	//Ведь здесь сейчас оставаться слишком опасно. Эта ферма - слишком заметное место, чтобы орки ее оставили без внимания.
	AI_Output(other,self,"DIA_Scatty_NW_WherePeasant_01_03");	//Ясно.
	KNOWWHEREAKIL = TRUE;
};