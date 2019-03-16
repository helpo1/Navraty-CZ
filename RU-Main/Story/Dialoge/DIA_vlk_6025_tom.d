
instance DIA_TOM_NW_EXIT(C_Info)
{
	npc = vlk_6025_tom;
	nr = 999;
	condition = dia_tom_nw_exit_condition;
	information = dia_tom_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_tom_nw_exit_condition()
{
	return TRUE;
};

func void dia_tom_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TOM_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6025_tom;
	nr = 900;
	condition = dia_tom_nw_pickpocket_condition;
	information = dia_tom_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_tom_nw_pickpocket_condition()
{
	return C_Beklauen(60,90);
};

func void dia_tom_nw_pickpocket_info()
{
	Info_ClearChoices(dia_tom_nw_pickpocket);
	Info_AddChoice(dia_tom_nw_pickpocket,Dialog_Back,dia_tom_nw_pickpocket_back);
	Info_AddChoice(dia_tom_nw_pickpocket,DIALOG_PICKPOCKET,dia_tom_nw_pickpocket_doit);
};

func void dia_tom_nw_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_tom_nw_pickpocket);
};

func void dia_tom_nw_pickpocket_back()
{
	Info_ClearChoices(dia_tom_nw_pickpocket);
};


instance DIA_TOM_NW_HI(C_Info)
{
	npc = vlk_6025_tom;
	nr = 1;
	condition = dia_tom_nw_hi_condition;
	information = dia_tom_nw_hi_info;
	permanent = FALSE;
	description = "Привет.";
};


func int dia_tom_nw_hi_condition()
{
	return TRUE;
};

func void dia_tom_nw_hi_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Tom_NW_Hi_01_00");	//Привет.
	AI_Output(self,other,"DIA_Tom_NW_Hi_01_01");	//О! А ты откуда здесь?
	AI_Output(other,self,"DIA_Tom_NW_Hi_01_02");	//Вопрос не в том, откуда я. Вопрос в том - как ты тут оказался?!
	AI_Output(other,self,"DIA_Tom_NW_Hi_01_03");	//Ты как и другие парни - приплыл сюда с пиратами?
	AI_Output(self,other,"DIA_Tom_NW_Hi_01_04");	//Да, если сам все знаешь, зачем спрашиваешь?
	AI_Output(other,self,"DIA_Tom_NW_Hi_01_06");	//Ну и как тебе Хоринис?
	AI_Output(self,other,"DIA_Tom_NW_Hi_01_07");	//Получше того места, где я раньше торчал. По крайне мере, тут тебя не жрет мошкара каждый день, да и работенка всегда найдется, чтобы не помереть от скуки...
	AI_Output(other,self,"DIA_Tom_NW_Hi_01_08");	//А что за работа?
	AI_Output(self,other,"DIA_Tom_NW_Hi_01_09");	//Я работаю у Маттео, местного торговца.
	AI_Output(other,self,"DIA_Tom_NW_Hi_01_10");	//У Маттео?! Ты работаешь у Маттео? А как он вообще взял тебя?!
	AI_Output(self,other,"DIA_Tom_NW_Hi_01_11");	//Ну, я неплохо разбираюсь в ведении бухгалтерских книг и всего прочего. А ему как раз нужен был такой человек.
	AI_Output(self,other,"DIA_Tom_NW_Hi_01_12");	//А теперь хватит болтать, мне пора.
};


instance DIA_TOM_NW_CITY(C_Info)
{
	npc = vlk_6025_tom;
	nr = 2;
	condition = dia_tom_nw_city_condition;
	information = dia_tom_nw_city_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_tom_nw_city_condition()
{
	if(Npc_KnowsInfo(other,dia_tom_nw_hi))
	{
		return TRUE;
	};
};

func void dia_tom_nw_city_info()
{
	AI_Output(other,self,"DIA_Tom_NW_City_01_00");	//Как дела?
	AI_Output(self,other,"DIA_Tom_NW_City_01_01");	//Все хорошо! Жаловаться мне не на что.
};

