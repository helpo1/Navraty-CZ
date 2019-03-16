
instance DIA_ADDON_GREG_BF_EXIT(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 999;
	condition = dia_addon_greg_bf_exit_condition;
	information = dia_addon_greg_bf_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_greg_bf_exit_condition()
{
	return TRUE;
};

func void dia_addon_greg_bf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_BF_PICKPOCKET(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 900;
	condition = dia_addon_greg_bf_pickpocket_condition;
	information = dia_addon_greg_bf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_addon_greg_bf_pickpocket_condition()
{
	return C_Beklauen(111,666);
};

func void dia_addon_greg_bf_pickpocket_info()
{
	Info_ClearChoices(dia_addon_greg_bf_pickpocket);
	Info_AddChoice(dia_addon_greg_bf_pickpocket,Dialog_Back,dia_addon_greg_bf_pickpocket_back);
	Info_AddChoice(dia_addon_greg_bf_pickpocket,DIALOG_PICKPOCKET,dia_addon_greg_bf_pickpocket_doit);
};

func void dia_addon_greg_bf_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_addon_greg_bf_pickpocket);
};

func void dia_addon_greg_bf_pickpocket_back()
{
	Info_ClearChoices(dia_addon_greg_bf_pickpocket);
};


instance DIA_ADDON_GREG_BF_ARMOR(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 5;
	condition = dia_addon_greg_bf_armor_condition;
	information = dia_addon_greg_bf_armor_info;
	permanent = FALSE;
	description = "Ну как, доспехи не жмут?";
};


func int dia_addon_greg_bf_armor_condition()
{
	return TRUE;
};

func void dia_addon_greg_bf_armor_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BF_Armor_01_00");	//Ну что, доспехи не жмут?
	AI_Output(self,other,"DIA_Addon_Greg_BF_Armor_01_01");	//А ты все остришь, шутник...(ехидно) Нет, они мне в самый раз!
	AI_Output(self,other,"DIA_Addon_Greg_BF_Armor_01_02");	//И кстати, хочу поблагодарить тебя за то, что убедил меня тогда принять предложение паладинов.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Armor_01_03");	//Теперь у нас есть чем набить себе брюхо, а в наших карманах завелись звонкие монеты!
	AI_Output(self,other,"DIA_Addon_Greg_BF_Armor_01_04");	//Хотя, конечно... теперь нам всем в скором времени придется сражаться с орками.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Armor_01_05");	//Но, думаю, это мы как-нибудь переживем.
};


instance DIA_ADDON_GREG_BF_HOW(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 5;
	condition = dia_addon_greg_bf_how_condition;
	information = dia_addon_greg_bf_how_info;
	permanent = FALSE;
	description = "Как дела?";
};


func int dia_addon_greg_bf_how_condition()
{
	return TRUE;
};

func void dia_addon_greg_bf_how_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BF_How_01_00");	//Как дела?
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_ADDON_GREG_BF_CAPITAN(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 5;
	condition = dia_addon_greg_bf_capitan_condition;
	information = dia_addon_greg_bf_capitan_info;
	permanent = FALSE;
	description = "Так ты теперь капитан?";
};


func int dia_addon_greg_bf_capitan_condition()
{
	if((GREGISCAPITAN == TRUE) && (SHIPAGAINACCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_bf_capitan_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Greg_BF_Capitan_01_00");	//Так ты теперь капитан королевской галеры?
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_01");	//(важно) Да, лорд Хаген назначил меня на эту должность.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_02");	//Правда, у него не было выбора в этом вопросе. Ведь как ты помнишь, он обещал нам свой корабль.
	AI_Output(other,self,"DIA_Addon_Greg_BF_Capitan_01_03");	//И, судя по всему, он выполнил свое обещание.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_04");	//Ну да, как видишь...(ворчливо) Хотя, по правде говоря, это не совсем то, чего я ожидал на самом деле.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_05");	//А почему ты, собственно, спрашиваешь?
	AI_Output(other,self,"DIA_Addon_Greg_BF_Capitan_01_06");	//Мне нужно немедленно отплыть на материк. Приказ главы паладинов!
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_07");	//(облегченно) Ну наконец-то! А то я уж думал, что мне придется вечно торчать на этой ферме.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_08");	//И когда мы снимаемся с якоря?
	AI_Output(other,self,"DIA_Addon_Greg_BF_Capitan_01_09");	//Прямо сейчас.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_10");	//Хорошо. Тогда я отправляюсь в гавань, чтобы подготовить корабль к отплытию.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_11");	//Да, и не забудь. Мне понадобится еще несколько человек, чтобы каким-то образом управляться с этой посудиной.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_12");	//Полагаю, что пяти или шести человек будет вполне достаточно!
	AI_Output(other,self,"DIA_Addon_Greg_BF_Capitan_01_13");	//Ладно.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_14");	//Отлично! Тогда встретимся на корабле.
	B_LogEntry(TOPIC_SALETOBIGLAND,"Теперь Грэг мой капитан. Однако, чтобы отплыть, мне понадобятся еще несколько людей. По словам Грэга, пяти или шести человек будет достаточно.");
	WHOTRAVELONBIGLAND = TRUE;
	b_piratemoveonboard();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_BF_TRAVELONBIGLAND(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 1;
	condition = dia_addon_greg_bf_travelonbigland_condition;
	information = dia_addon_greg_bf_travelonbigland_info;
	permanent = TRUE;
	description = "Мой корабль готов?";
};


func int dia_addon_greg_bf_travelonbigland_condition()
{
	if((GREGISCAPITAN == TRUE) && (SHIPAGAINACCESS == TRUE) && (WHOTRAVELONBIGLAND == TRUE) && (COUNTTRAVELONBIGLAND > 0) && (ALLSAYGOODBUY == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_bf_travelonbigland_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BF_TravelOnBigLand_01_00");	//Мой корабль готов?

	if(COUNTTRAVELONBIGLAND >= 5)
	{
		B_GivePlayerXP(1000);
		AI_Output(self,other,"DIA_Addon_Greg_BF_TravelOnBigLand_01_01");	//Конечно. Все готово.
		AI_Output(other,self,"DIA_Addon_Greg_BF_TravelOnBigLand_01_02");	//Ну, раз так, тогда мы можем отплывать.
		AI_Output(self,other,"DIA_Addon_Greg_BF_TravelOnBigLand_01_03");	//Ты в этом полностью уверен?
		AI_Output(other,self,"DIA_Addon_Greg_BF_TravelOnBigLand_01_04");	//Да. Время не ждет.
		AI_Output(self,other,"DIA_Addon_Greg_BF_TravelOnBigLand_01_05");	//Хорошо. Будь по-твоему.
		AI_TurnToNPC(self,DiegoNW);
		AI_Output(self,other,"DIA_Addon_Greg_BF_TravelOnBigLand_01_06");	//...(кричит) Эй, вы все, крысы сухопутные! А ну по местам!
		AI_Output(self,other,"DIA_Addon_Greg_BF_TravelOnBigLand_01_07");	//...(кричит) Поднять якорь, отдать швартовые, ставить паруса!
		AI_Output(self,other,"DIA_Addon_Greg_BF_TravelOnBigLand_01_08");	//...(кричит) Закрепить узлы и лебедку! Держать нос по ветру!
		ALLSAYGOODBUY = TRUE;
		MIS_SALETOBIGLAND = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_SALETOBIGLAND,LOG_SUCCESS);
		B_LogEntry(TOPIC_SALETOBIGLAND,"Мы покидаем Хоринис и отправляемся на материк! Что нас там ждем, никто не знает...");
		Info_ClearChoices(dia_addon_greg_bf_travelonbigland);
		Info_AddChoice(dia_addon_greg_bf_travelonbigland,Dialog_Ende,dia_addon_greg_bf_travelonbigland_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_BF_TravelOnBigLand_01_09");	//Конечно... Все готово.
	};
};

func void dia_addon_greg_bf_travelonbigland_ok()
{
	//AI_StopProcessInfos(self);
	b_end_avi();
};

