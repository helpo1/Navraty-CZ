
instance DIA_THORUS_NW_EXIT(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 999;
	condition = dia_thorus_nw_exit_condition;
	information = dia_thorus_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_thorus_nw_exit_condition()
{
	return TRUE;
};

func void dia_thorus_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THORUS_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 900;
	condition = dia_thorus_nw_pickpocket_condition;
	information = dia_thorus_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_thorus_nw_pickpocket_condition()
{
	return C_Beklauen(100,200);
};

func void dia_thorus_nw_pickpocket_info()
{
	Info_ClearChoices(dia_thorus_nw_pickpocket);
	Info_AddChoice(dia_thorus_nw_pickpocket,Dialog_Back,dia_thorus_nw_pickpocket_back);
	Info_AddChoice(dia_thorus_nw_pickpocket,DIALOG_PICKPOCKET,dia_thorus_nw_pickpocket_doit);
};

func void dia_thorus_nw_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_thorus_nw_pickpocket);
};

func void dia_thorus_nw_pickpocket_back()
{
	Info_ClearChoices(dia_thorus_nw_pickpocket);
};


instance DIA_THORUS_NW_HI(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_hi_condition;
	information = dia_thorus_nw_hi_info;
	important = TRUE;
};


func int dia_thorus_nw_hi_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_thorus_nw_hi_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Thorus_NW_Hi_01_00");	//Эй, парень, я, кажется, тебя знаю!
	AI_Output(other,self,"DIA_Thorus_NW_Hi_01_01");	//Торус? Это ты?
	AI_Output(self,other,"DIA_Thorus_NW_Hi_01_02");	//Да. Вот мы и опять встретились! Мир тесен...
	AI_Output(other,self,"DIA_Thorus_NW_Hi_01_03");	//Что ты тут делаешь?!
	AI_Output(self,other,"DIA_Thorus_NW_Hi_01_04");	//Это я тебя должен спросить, что ТЫ тут делаешь. И почему ты так странно выглядишь...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Thorus_NW_Hi_01_05");	//Когда это ты успел стать магом Огня?
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Thorus_NW_Hi_01_06");	//Когда это ты успел стать паладином?
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Thorus_NW_Hi_01_07");	//Когда это ты успел стать наемником?
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Thorus_NW_Hi_01_0A");	//Когда это ты успел стать магом Воды?
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Thorus_NW_Hi_01_0B");	//Когда это ты успел стать... да еще и кем, темным магом?!
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Thorus_NW_Hi_01_0C");	//Когда это ты успел вступить в Братство?
	};
	AI_Output(other,self,"DIA_Thorus_NW_Hi_01_08");	//Как-бы тебе сказать. В общем, я не совсем тот, за кого себя выдавал там на болотах.
	AI_Output(self,other,"DIA_Thorus_NW_Hi_01_09");	//Да, на тебя это похоже! Никогда не знаешь, что ты на самом деле из себя представляешь.
	AI_Output(other,self,"DIA_Thorus_NW_Hi_01_10");	//А я вижу, ты присоединился к городской страже? Как тебе это удалось?
	AI_Output(self,other,"DIA_Thorus_NW_Hi_01_11");	//Да все просто. Видишь ли, малыш, все, что я умею - это драться. А как я понимаю, городу сейчас просто позарез нужны такие люди, как я.
	AI_Output(self,other,"DIA_Thorus_NW_Hi_01_12");	//Ну я и набрался наглости! Пришел к лорду Андрэ и высказал желание вступить в ополчение.
	AI_Output(self,other,"DIA_Thorus_NW_Hi_01_13");	//Он, конечно, сначала отказал мне, но потом, увидев, как я сражаюсь, быстро изменил свою точку зрения на положительную.
	AI_Output(self,other,"DIA_Thorus_NW_Hi_01_17");	//Работа не пыльная. Стою тут весь день - слежу за порядком. Лучше, по крайней мере, чем там, на болотах.
	AI_Output(other,self,"DIA_Thorus_NW_Hi_01_18");	//Лорду Андрэ действительно повезло с тобой. Боец ты что надо!
};


instance DIA_THORUS_NW_CITY(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 2;
	condition = dia_thorus_nw_city_condition;
	information = dia_thorus_nw_city_info;
	permanent = TRUE;
	description = "Как продвигается борьба с преступностью?";
};


func int dia_thorus_nw_city_condition()
{
	if(Npc_KnowsInfo(other,dia_thorus_nw_hi) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_thorus_nw_city_info()
{
	AI_Output(other,self,"DIA_Thorus_NW_City_01_00");	//Как продвигается борьба с преступностью?
	AI_Output(self,other,"DIA_Thorus_NW_City_01_01");	//Пока все тихо и спокойно.
};

instance DIA_THORUS_NW_ESCAPEFROMTOWN(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_escapefromtown_condition;
	information = dia_thorus_nw_escapefromtown_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_thorus_nw_escapefromtown_condition()
{
	if(KAPITELORCATC == TRUE)
	{
		return TRUE;
	};
};

func void dia_thorus_nw_escapefromtown_info()
{
	AI_Output(self,other,"DIA_Thorus_NW_EscapeFromTown_01_00");	//Вот уж не думал, что тебя тут встречу!
	AI_Output(self,other,"DIA_Thorus_NW_EscapeFromTown_01_01");	//Мне казалось, что ты уже должен быть далеко от этих мест.
	AI_Output(other,self,"DIA_Thorus_NW_EscapeFromTown_01_02");	//Представь, я удивлен не меньше твоего. Как тебе удалось выбраться из города?
	AI_Output(self,other,"DIA_Thorus_NW_EscapeFromTown_01_03");	//Мне помог Кавалорн. Если бы не он, я был бы уже мертв!
	AI_Output(self,other,"DIA_Thorus_NW_EscapeFromTown_01_04");	//Когда всем стало ясно, что город уже не удержать, он повел нас тайной тропой, ведущей из города через побережье.
	AI_Output(self,other,"DIA_Thorus_NW_EscapeFromTown_01_05");	//И вот теперь мы здесь, на ферме Акила! Орки сюда еще не добрались.

	if(MEETCAVALORNAGAIN == FALSE)
	{
		AI_Output(other,self,"DIA_Thorus_NW_EscapeFromTown_01_06");	//Выходит, что Кавалорн тоже выжил. Ну, что же, это хорошая новость.
		AI_Output(self,other,"DIA_Thorus_NW_EscapeFromTown_01_07");	//Ты найдешь его недалеко от моста, ведущего по направлению к таверне.
		AI_Output(self,other,"DIA_Thorus_NW_EscapeFromTown_01_08");	//Оттуда он наблюдает за орочьим патрулем, что расположился на другой стороне.
	};

	THORUSHERE = TRUE;
};


instance DIA_THORUS_NW_WHATNEXT(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_whatnext_condition;
	information = dia_thorus_nw_whatnext_info;
	permanent = TRUE;
	description = "Что будешь делать дальше?";
};

func int dia_thorus_nw_whatnext_condition()
{
	if(Npc_KnowsInfo(hero,dia_thorus_nw_escapefromtown) && (MIS_OLDGUARDGOWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_thorus_nw_whatnext_info()
{
	AI_Output(other,self,"DIA_Thorus_NW_WhatNext_01_00");	//Что будешь делать дальше?
	AI_Output(self,other,"DIA_Thorus_NW_WhatNext_01_01");	//Пока не знаю. Но, думаю, что для начала хорошенько отдохну.
	AI_Output(self,other,"DIA_Thorus_NW_WhatNext_01_02");	//А то последние деньки выдались крайне нервными.
	AI_Output(other,self,"DIA_Thorus_NW_WhatNext_01_03");	//Это и понятно.
};

instance DIA_THORUS_NW_OLDGUARDGOWAR(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_oldguardgowar_condition;
	information = dia_thorus_nw_oldguardgowar_info;
	permanent = FALSE;
	description = "Идем! Я отведу тебя на ферму Онара.";
};

func int dia_thorus_nw_oldguardgowar_condition()
{
	if((MIS_OLDGUARDGOWAR == LOG_Running) && (THORUSHERE == TRUE))
	{
		return TRUE;
	};
};

func void dia_thorus_nw_oldguardgowar_info()
{
	AI_Output(other,self,"DIA_Thorus_NW_OldGuardGoWar_01_00");	//Идем! Я отведу тебя на ферму Онара.
	AI_Output(self,other,"DIA_Thorus_NW_OldGuardGoWar_01_01");	//Ладно, веди. Надеюсь, ты знаешь, что делаешь!
	THORUSJOINME = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
};

instance DIA_THORUS_NW_OLDGUARDGOWAR_DONE(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = DIA_THORUS_NW_OLDGUARDGOWAR_DONE_condition;
	information = DIA_THORUS_NW_OLDGUARDGOWAR_DONE_info;
	permanent = FALSE;
	description = "Мы на месте!";
};

func int DIA_THORUS_NW_OLDGUARDGOWAR_DONE_condition()
{
	if((THORUSJOINME == TRUE) && (Npc_GetDistToWP(self,"NW_BIGFARM_PATH_04") <= 2000))
	{
		return TRUE;
	};
};

func void DIA_THORUS_NW_OLDGUARDGOWAR_DONE_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_THORUS_NW_OLDGUARDGOWAR_DONE_01_00");	//Мы на месте!
	AI_Output(self,other,"DIA_THORUS_NW_OLDGUARDGOWAR_DONE_01_01");	//Хорошо...(вздыхая) По крайней мере, орков тут не видно.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	THORUSINSAFE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FarmRest");
};

instance DIA_THORUS_NW_WHEREPEASANT(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_wherepeasant_condition;
	information = dia_thorus_nw_wherepeasant_info;
	permanent = FALSE;
	description = "А где все крестьяне со двора?";
};

func int dia_thorus_nw_wherepeasant_condition()
{
	if((THORUSHERE == TRUE) && (KNOWWHEREAKIL == FALSE) && (MIS_OLDGUARDGOWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_thorus_nw_wherepeasant_info()
{
	AI_Output(other,self,"DIA_Thorus_NW_WherePeasant_01_00");	//А где все крестьяне со двора?
	AI_Output(self,other,"DIA_Thorus_NW_WherePeasant_01_01");	//Понятия не имею. Разбежались, наверное, кто куда!
	AI_Output(self,other,"DIA_Thorus_NW_WherePeasant_01_02");	//Ведь здесь сейчас оставаться слишком опасно. Эта ферма слишком заметное место, чтобы орки оставили ее без внимания!
	AI_Output(other,self,"DIA_Thorus_NW_WherePeasant_01_03");	//Ясно.
	KNOWWHEREAKIL = TRUE;
};

instance DIA_THORUS_NW_TRAVELONBIGLAND(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_travelonbigland_condition;
	information = dia_thorus_nw_travelonbigland_info;
	permanent = FALSE;
	description = "Мой корабль плывет на материк.";
};

func int dia_thorus_nw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_thorus_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Thorus_NW_TravelOnBigLand_01_00");	//Мой корабль плывет на материк.
	AI_Output(other,self,"DIA_Thorus_NW_TravelOnBigLand_01_01");	//Тебе на нем тоже найдется местечко!
	AI_Output(self,other,"DIA_Thorus_NW_TravelOnBigLand_01_02");	//Хе, приятель...(радостно) Спасибо, что не забыл про меня!
	AI_Output(self,other,"DIA_Thorus_NW_TravelOnBigLand_01_03");	//Я с радостью отправлюсь на большую землю и попробую начать там новую жизнь.
	AI_Output(self,other,"DIA_Thorus_NW_TravelOnBigLand_01_04");	//Здесь все равно прошлое слишком сильно давит на меня.
	AI_Output(other,self,"DIA_Thorus_NW_TravelOnBigLand_01_05");	//Тогда поднимайся на борт!
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	THORUSTOBIGLAND = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Я предожил Торусу отправиться вместе со мной. Он согласился.");
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};