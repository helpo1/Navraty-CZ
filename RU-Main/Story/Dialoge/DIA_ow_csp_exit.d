
instance DIA_OW_CSP_EXIT(C_Info)
{
	nr = 999;
	condition = dia_ow_csp_exit_condition;
	information = dia_ow_csp_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_ow_csp_exit_condition()
{
	return TRUE;
};

func void dia_ow_csp_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OW_CSP_PEOPLE(C_Info)
{
	nr = 3;
	condition = dia_ow_csp_people_condition;
	information = dia_ow_csp_people_info;
	permanent = TRUE;
	description = "Кто у вас командир?";
};


func int dia_ow_csp_people_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_ow_csp_people_info()
{
	AI_Output(other,self,"DIA_OW_CSP_People_15_00");	//Кто у вас командир?
	AI_Output(self,other,"DIA_OW_CSP_People_04_01");	//Нашим отрядом сейчас командует паладин Альберт.
	if(Npc_GetDistToWP(self,"WP_COAST_FOREST_126") > 1000)
	{
		AI_Output(self,other,"DIA_OW_CSP_People_04_02");	//Ты найдешь его в глубине этой пещеры.
	}
	else
	{
		AI_Output(self,other,"DIA_OW_CSP_People_04_03");	//Ты найдешь его в пещере, где мы расположились.
	};
};


instance DIA_OW_CSP_LOCATION(C_Info)
{
	nr = 2;
	condition = dia_ow_csp_location_condition;
	information = dia_ow_csp_location_info;
	permanent = TRUE;
	description = "Что ты можешь рассказать о местности?";
};


func int dia_ow_csp_location_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_ow_csp_location_info()
{
	AI_Output(other,self,"DIA_OW_CSP_Location_15_00");	//Что ты можешь рассказать о местности?
	if(Npc_GetDistToWP(self,"WP_COAST_FOREST_126") > 1000)
	{
		AI_Output(self,other,"DIA_OW_CSP_Location_04_01");	//Наверху над нами находится лагерь бывших каторжников.
		AI_Output(self,other,"DIA_OW_CSP_Location_04_02");	//Хотя они и не почитают Инноса, но однако с ними все же можно иметь дело.
		AI_Output(self,other,"DIA_OW_CSP_Location_04_03");	//За рекой достаточно опасный лес, но орков в нем нет.
		AI_Output(self,other,"DIA_OW_CSP_Location_04_04");	//Все они внизу, на побережье - у них там вроде лагеря.
	}
	else
	{
		AI_Output(self,other,"DIA_OW_CSP_Location_04_05");	//На востоке за забором - орки. На западе тоже опасно - там тролли, множество кровожадных тварей!
		AI_Output(self,other,"DIA_OW_CSP_Location_04_06");	//На юге проход за забор - его тоже охраняют орки.
		AI_Output(self,other,"DIA_OW_CSP_Location_04_07");	//А на севере в скале - пещера, в которой расположена наша группа.
		AI_Output(self,other,"DIA_OW_CSP_Location_04_08");	//Ты всегда можешь найти там защиту.
	};
};


instance DIA_OW_CSP_LOCATION2(C_Info)
{
	nr = 2;
	condition = dia_ow_csp_location2_condition;
	information = dia_ow_csp_location2_info;
	permanent = TRUE;
	description = "Что ты можешь рассказать о местности?";
};


func int dia_ow_csp_location2_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_ow_csp_location2_info()
{
	AI_Output(other,self,"DIA_OW_CSP_Location2_15_00");	//Что ты можешь рассказать о местности?
	if(Npc_GetDistToWP(self,"WP_COAST_FOREST_126") > 1000)
	{
		AI_Output(self,other,"DIA_OW_CSP_Location2_04_01");	//Наверху над нами находится лагерь бывших каторжников.
		AI_Output(self,other,"DIA_OW_CSP_Location2_04_02");	//За рекой довольно опасный лес, но орков там нет.
		AI_Output(self,other,"DIA_OW_CSP_Location2_04_03");	//Все они внизу, на побережье - у них там вроде лагеря.
	}
	else
	{
		AI_Output(self,other,"DIA_OW_CSP_Location2_04_05");	//На востоке, за забором - орки. На западе тоже опасно - там тролли, множество кровожадных тварей!
		AI_Output(self,other,"DIA_OW_CSP_Location2_04_06");	//На юге проход за забор - его тоже охраняют орки.
		AI_Output(self,other,"DIA_OW_CSP_Location2_04_07");	//А на севере в скале - пещера, в которой расположена наша группа.
		AI_Output(self,other,"DIA_OW_CSP_Location2_04_08");	//Ты всегда можешь найти там защиту.
	};
};


instance DIA_OW_CSP_STANDARD(C_Info)
{
	nr = 1;
	condition = dia_ow_csp_standard_condition;
	information = dia_ow_csp_standard_info;
	permanent = TRUE;
	description = "Как обстановка?";
};


func int dia_ow_csp_standard_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_ow_csp_standard_info()
{
	AI_Output(other,self,"DIA_OW_CSP_Standard_15_00");	//Как обстановка?
	if(Kapitel <= 3)
	{
		AI_Output(self,other,"DIA_OW_CSP_Standard_04_01");	//Пока все тихо! Но наши мысли сейчас с теми, кто остался в крепости.
	};
	if(Kapitel == 4)
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other,"DIA_OW_CSP_Standard_04_02");	//Драконы почти перестали тут летать, зато орков стало еще больше.
		}
		else
		{
			AI_Output(self,other,"DIA_OW_CSP_Standard_04_05");	//Теперь эти огнедышащие бестии больше не будут угрожать замку! Это хорошие новости.
		};
	};
	if(Kapitel >= 5)
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other,"DIA_OW_CSP_Standard_04_06");	//Кажется, смерть драконов не слишком впечатлила орков.
		}
		else
		{
			AI_Output(self,other,"DIA_OW_CSP_Standard_04_07");	//Почему-то стало особенно тревожно за паладинов в замке.
		};
	};
};


instance DIA_OW_CSP_SEAPOST(C_Info)
{
	nr = 1;
	condition = dia_ow_csp_seapost_condition;
	information = dia_ow_csp_seapost_info;
	permanent = TRUE;
	description = "Что ты здесь делаешь?";
};


func int dia_ow_csp_seapost_condition()
{
	if(Npc_GetDistToWP(self,"WP_COAST_FOREST_126") < 1000)
	{
		return TRUE;
	};
};

func void dia_ow_csp_seapost_info()
{
	AI_Output(other,self,"DIA_OW_CSP_SeaPost_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_OW_CSP_SeaPost_04_01");	//Но, похоже, сейчас мы их интересуем меньше всего.
};

func void b_assignambientinfos_csp(var C_Npc slf)
{
	dia_ow_csp_exit.npc = Hlp_GetInstanceID(slf);
	dia_ow_csp_people.npc = Hlp_GetInstanceID(slf);
	dia_ow_csp_location.npc = Hlp_GetInstanceID(slf);
	dia_ow_csp_standard.npc = Hlp_GetInstanceID(slf);
	dia_ow_csp_seapost.npc = Hlp_GetInstanceID(slf);
};

