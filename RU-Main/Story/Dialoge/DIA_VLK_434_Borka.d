
instance DIA_Borka_EXIT(C_Info)
{
	npc = VLK_434_Borka;
	nr = 999;
	condition = DIA_Borka_EXIT_Condition;
	information = DIA_Borka_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Borka_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Borka_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Borka_PICKPOCKET(C_Info)
{
	npc = VLK_434_Borka;
	nr = 900;
	condition = DIA_Borka_PICKPOCKET_Condition;
	information = DIA_Borka_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Borka_PICKPOCKET_Condition()
{
	return C_Beklauen(80,120);
};

func void DIA_Borka_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Borka_PICKPOCKET);
	Info_AddChoice(DIA_Borka_PICKPOCKET,Dialog_Back,DIA_Borka_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Borka_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Borka_PICKPOCKET_DoIt);
};

func void DIA_Borka_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Borka_PICKPOCKET);
};

func void DIA_Borka_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Borka_PICKPOCKET);
};


instance DIA_Borka_PISSOFF(C_Info)
{
	npc = VLK_434_Borka;
	condition = DIA_Borka_PISSOFF_Condition;
	information = DIA_Borka_PISSOFF_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Borka_PISSOFF_Condition()
{
	if((Knows_Borka_Dealer != TRUE) && (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) && (Wld_IsTime(17,0,9,0) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Borka_PISSOFF_Info()
{
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_00");	//Эй ты! Куда ты идешь? Не важно, какие у тебя планы - они могут подождать.
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_01");	//Ты стоишь перед входом в жемчужину Хориниса - КРАСНЫЙ ФОНАРЬ. Это самый шикарный бордель во всей Миртане, будь я проклят!
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_02");	//Моряки из самых дальних уголков света приплывают сюда, чтобы провести несколько незабываемых ночей в Красном Фонаре.
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_03");	//А теперь и у тебя появился такой шанс - нет, честь - провести ночь с Надей, самым страстным цветком богов!
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_04");	//Заходи же, и ты познаешь наслаждение, о котором другие не могут даже и мечтать!
};


instance DIA_Borka_TROUBLE(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = DIA_Borka_TROUBLE_Condition;
	information = DIA_Borka_TROUBLE_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Borka_TROUBLE_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Andre_REDLIGHT != LOG_SUCCESS) && (Wld_IsTime(17,0,9,0) == TRUE) && (Npc_IsDead(Nadja) == FALSE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_ENTRANCE") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Borka_TROUBLE_Info()
{
	AI_Output(self,other,"DIA_Borka_TROUBLE_11_00");	//Что ты стоишь здесь и колеблешься? Заходи внутрь и познакомься с нашей любвеобильной Надей.
	AI_Output(self,other,"DIA_Borka_TROUBLE_11_01");	//Это страстное создание ночи придаст твоей жизни новый смысл!
};


instance DIA_BORKA_HELLO(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = dia_borka_hello_condition;
	information = dia_borka_hello_info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int dia_borka_hello_condition()
{
	return TRUE;
};

func void dia_borka_hello_info()
{
	AI_Output(other,self,"DIA_Borka_Hello_01_00");	//Кто ты?
	AI_Output(self,other,"DIA_Borka_Hello_01_01");	//Я - Борка, работаю зазывалой в этом борделе. Еще вопросы есть?
	AI_Output(other,self,"DIA_Borka_Hello_01_02");	//Думаю, нет.
	AI_Output(self,other,"DIA_Borka_Hello_01_03");	//Тогда либо входи, либо проваливай - у меня нет времени на пустые разговоры.
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_WHATNEW(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = dia_borka_whatnew_condition;
	information = dia_borka_whatnew_info;
	permanent = TRUE;
	description = "Как жизнь?";
};


func int dia_borka_whatnew_condition()
{
	if(Npc_KnowsInfo(hero,dia_borka_hello))
	{
		return TRUE;
	};
};

func void dia_borka_whatnew_info()
{
	AI_Output(other,self,"DIA_Borka_WhatNew_01_00");	//Как жизнь?
	AI_Output(self,other,"DIA_Borka_WhatNew_01_01");	//(раздраженно) Отстань от меня...
	AI_StopProcessInfos(self);
};


instance DIA_Borka_Smoke(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = DIA_Borka_Smoke_Condition;
	information = DIA_Borka_Smoke_Info;
	permanent = TRUE;
	description = "Ты не знаешь, где можно купить травки?";
};


func int DIA_Borka_Smoke_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Borka_Smoke_Info()
{
	AI_Output(other,self,"DIA_Borka_Smoke_15_00");	//Ты не знаешь, где можно купить травки?
	AI_Output(self,other,"DIA_Borka_Smoke_11_01");	//Нет, проваливай!
	AI_StopProcessInfos(self);
};


instance DIA_Borka_BUYHERB(C_Info)
{
	npc = VLK_434_Borka;
	nr = 2;
	condition = DIA_Borka_BUYHERB_Condition;
	information = DIA_Borka_BUYHERB_Info;
	permanent = TRUE;
	description = "Я слышал, ты продаешь травку.";
};


func int DIA_Borka_BUYHERB_Condition()
{
	if((Knows_Borka_Dealer == TRUE) && (MIS_Andre_REDLIGHT == LOG_Running) && (Borka_Deal == FALSE) && (Undercover_Failed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Borka_BUYHERB_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Borka_BUYHERB_15_00");	//Я слышал, ты продаешь травку.

	if((Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE) || (Hlp_IsItem(heroArmor,ITAR_TOWNGUARD) == TRUE))
	{
		AI_Output(self,other,"DIA_Borka_BUYHERB_11_01");	//Извините, господин стражник. Это, должно быть, какая-то ошибка! Я ничего не знаю ни о какой травке.
	}
	else
	{
		AI_Output(self,other,"DIA_Borka_BUYHERB_11_02");	//Кто это сказал?
		Info_ClearChoices(DIA_Borka_BUYHERB);
		Info_AddChoice(DIA_Borka_BUYHERB,"Я думаю, это не важно.",DIA_Borka_BUYHERB_Egal);
		Info_AddChoice(DIA_Borka_BUYHERB,"Надя сказала.",DIA_Borka_BUYHERB_Nadja);
	};
};

func void DIA_Borka_BUYHERB_Egal()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_Egal_15_00");	//Я думаю, это не важно.
	AI_Output(self,other,"DIA_Borka_BUYHERB_Egal_11_01");	//Я просто хочу знать, кто прислал тебя, чтобы удостовериться, что тебе можно доверять.
	Info_ClearChoices(DIA_Borka_BUYHERB);
	Info_AddChoice(DIA_Borka_BUYHERB,"Надя сказала.",DIA_Borka_BUYHERB_Nadja);
	Info_AddChoice(DIA_Borka_BUYHERB,"Так мы с тобой договоримся или нет?",DIA_Borka_BUYHERB_Deal);
};

func void DIA_Borka_BUYHERB_Nadja()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_NADJA_15_00");	//Надя сказала.
	AI_Output(self,other,"DIA_Borka_BUYHERB_NADJA_11_01");	//Ну, эта пташка еще и не такое напоет. Знаешь, тебе не стоит верить всему, что болтает эта девка.
	Nadja_Victim = TRUE;
	Undercover_Failed = TRUE;
	Info_ClearChoices(DIA_Borka_BUYHERB);
};

func void DIA_Borka_BUYHERB_Deal()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_Deal_15_00");	//Так мы с тобой договоримся или нет?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Borka_BUYHERB_Deal_11_01");	//Хорошо... договоримся. Ты даешь мне пятьдесят золотых монет, и получаешь свою травку. Никакой торговли!
	Info_ClearChoices(DIA_Borka_BUYHERB);
	Borka_Deal = TRUE;
};


instance DIA_Borka_SECOND_CHANCE(C_Info)
{
	npc = VLK_434_Borka;
	nr = 2;
	condition = DIA_Borka_SECOND_CHANCE_Condition;
	information = DIA_Borka_SECOND_CHANCE_Info;
	permanent = TRUE;
	description = "Договорились! Вот твое золото.";
};

func int DIA_Borka_SECOND_CHANCE_Condition()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	if((Borka_Deal == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 50) && (Hlp_IsItem(heroArmor,ITAR_Mil_L) == FALSE) && (Hlp_IsItem(heroArmor,ITAR_TOWNGUARD) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Borka_SECOND_CHANCE_Info()
{
	AI_Output(other,self,"DIA_Borka_SECOND_CHANCE_15_00");	//Договорились! Вот твое золото.
	B_GiveInvItems(hero,self,ItMi_Gold,50);
	AI_Output(self,other,"DIA_Borka_SECOND_CHANCE_11_01");	//Хорошо...
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Borka_SECOND_CHANCE_11_02");	//... вот, держи свежий, смолистый косячок.
	B_GiveInvItems(self,hero,ItMi_Joint,1);
	Borka_Deal = 2;
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_FUCKOFF(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = dia_borka_fuckoff_condition;
	information = dia_borka_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_borka_fuckoff_condition()
{
	if((MIS_Andre_REDLIGHT == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_borka_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

