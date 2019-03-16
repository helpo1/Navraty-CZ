
instance DIA_VLK_6133_MAXI_EXIT(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 999;
	condition = dia_vlk_6133_maxi_exit_condition;
	information = dia_vlk_6133_maxi_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6133_maxi_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6133_maxi_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_HALLO(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_hallo_condition;
	information = dia_vlk_6133_maxi_hallo_info;
	permanent = FALSE;
	description = "Привет!";
};


func int dia_vlk_6133_maxi_hallo_condition()
{
	return TRUE;
};

func void dia_vlk_6133_maxi_hallo_info()
{
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hallo_01_00");	//Привет!
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hallo_01_01");	//Эй! Что тебе от меня нужно? У тебя есть для меня работа?
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hallo_01_02");	//Нет, у меня ее нет для тебя.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hallo_01_03");	//(сердито) Тогда зачем ты меня отвлекаешь? Не видишь - я занят!
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hallo_01_04");	//А чем ты занят?
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hallo_01_05");	//Я тут стою и стараюсь не упустить момент, когда какому-нибудь из торговцев понадобится помощь такого человека, как я.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hallo_01_06");	//А ты начинаешь спрашивать меня про всякую ерунду, и тем самым отвлекаешь!
};


instance DIA_VLK_6133_MAXI_WHATDO(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_whatdo_condition;
	information = dia_vlk_6133_maxi_whatdo_info;
	permanent = FALSE;
	description = "А чего ты, собственно, ждешь?";
};


func int dia_vlk_6133_maxi_whatdo_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6133_maxi_hallo))
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_whatdo_info()
{
	AI_Output(other,self,"DIA_VLK_6133_Maxi_WhatDo_01_00");	//Я немного не понял - а чего ты, собственно, ждешь?
	AI_Output(self,other,"DIA_VLK_6133_Maxi_WhatDo_01_01");	//Я жду, когда одному из торговцев понадобится какая-нибудь помощь.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_WhatDo_01_03");	//Я готов взяться за их любую грязную работу. Я хорошо понимаю в этом деле.
	AI_Output(other,self,"DIA_VLK_6133_Maxi_WhatDo_01_04");	//Ты разбираешься в торговле?
	AI_Output(self,other,"DIA_VLK_6133_Maxi_WhatDo_01_05");	//Конечно! Я даже умею немного читать и писать.
	AI_Output(other,self,"DIA_VLK_6133_Maxi_WhatDo_01_06");	//Просто по тебе этого никак не скажешь.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_WhatDo_01_08");	//Да, я уже работал на одного торговца, но, правда, он недавно подчистую разорился, а я остался без дела.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_WhatDo_01_10");	//Вот сейчас ищу нового нанимателя.
	AI_Output(other,self,"DIA_VLK_6133_Maxi_WhatDo_01_11");	//Все с тобой понятно. Мне кажется, ты будешь еще долго тут стоять.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_WhatDo_01_12");	//Что? Пошел вон отсюда! Еще накаркаешь, не дай Аданос.
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_PERM(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_perm_condition;
	information = dia_vlk_6133_maxi_perm_info;
	permanent = TRUE;
	description = "Как жизнь?";
};


func int dia_vlk_6133_maxi_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6133_maxi_whatdo) && (FINDPERSONTWO == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_perm_info()
{
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Perm_01_00");	//Как жизнь?
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Perm_01_01");	//А тебе не все равно?
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Perm_01_02");	//Может, у меня есть для тебя работа.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Perm_01_03");	//В самом деле? И какая же?
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Perm_01_04");	//Хороший вопрос. Я подумаю об этом...
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Perm_01_05");	//Отвали от меня! Что я тебе сделал, что ты постоянно треплешь мне нервы?
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_HIRE(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_hire_condition;
	information = dia_vlk_6133_maxi_hire_info;
	permanent = FALSE;
	description = "У меня есть для тебя работа.";
};


func int dia_vlk_6133_maxi_hire_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6133_maxi_whatdo) && (MIS_TRADEHELPER == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_hire_info()
{
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hire_01_00");	//У меня есть для тебя работа.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hire_01_01");	//Да? И что ты можешь предложить?
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hire_01_03");	//Один крупный торговец из верхнего квартала города ищет человека на место своего помощника.
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hire_01_04");	//Работа заключается в том, чтобы выполнять за него всякую пыльную работенку и помогать ему вести торговые дела.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hire_01_05");	//Ого! Звучит совсем неплохо!
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hire_01_06");	//Я подумал, что твои услуги вполне бы могли ему пригодиться.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hire_01_07");	//Это отличное предложение! Можешь считать, что мое согласие у тебя в кармане.
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hire_01_08");	//Хорошо. Но для начала скажи мне, что ты умеешь делать?
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hire_01_09");	//Как я тебе уже говорил, раньше я работал на одного торговца, и, в общем, он был доволен моей работой.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hire_01_10");	//Я умею немного читать и писать, а в таком деле это очень много значит!
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hire_01_11");	//К тому же я не чураюсь и пыльной работенки грузчика или посыльного. Я все могу делать!
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hire_01_12");	//Что же, совсем неплохо.
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hire_01_14");	//Я еще подумаю, и, скорее всего, обращусь к тебе.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hire_01_15");	//Хорошо, - подумай, но только недолго. Такие работники, как я, на дороге не валяются.
	B_LogEntry(TOPIC_TRADEHELPER,"Макси согласен работать помощником у Лютеро. Хотя, возможно, кто-нибудь еще согласится на эту работенку.");
	MAXIAGREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_HIREOK(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_hireok_condition;
	information = dia_vlk_6133_maxi_hireok_info;
	permanent = FALSE;
	description = "Идем к торговцу.";
};


func int dia_vlk_6133_maxi_hireok_condition()
{
	if((MAXIAGREE == TRUE) && (MIS_TRADEHELPER == LOG_Running) && (FINDPERSONONE == FALSE) && (FINDPERSONTWO == FALSE) && (FINDPERSONTHREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_hireok_info()
{
	AI_Output(other,self,"DIA_VLK_6133_Maxi_HireOk_01_00");	//Идем к торговцу.
	AI_Output(other,self,"DIA_VLK_6133_Maxi_HireOk_01_01");	//Думаю, ты именно тот человек, который ему нужен.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_HireOk_01_02");	//Отлично! Пошли.
	B_LogEntry(TOPIC_TRADEHELPER,"Я решил остановить свой выбор на Макси. Этот парень немного разбирается в той работе, которую ему хотят предложить. Надеюсь, Лютеро оценит мой выбор.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	FINDPERSONTWO = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_VLK_6133_MAXI_THANKS(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_thanks_condition;
	information = dia_vlk_6133_maxi_thanks_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vlk_6133_maxi_thanks_condition()
{
	if(MAXIHIRED == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_thanks_info()
{
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Thanks_01_00");	//Хочу сказать тебе спасибо, что помог мне получить это место!
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Thanks_01_01");	//Надеюсь, ты не заставишь меня думать о том, что я сделал ошибку, предложив Лютеро твою кандидатуру?
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Thanks_01_02");	//Нет, что ты! Я буду выполнять свою работу так хорошо, как только смогу...
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_NEWLIFE(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_newlife_condition;
	information = dia_vlk_6133_maxi_newlife_info;
	permanent = TRUE;
	description = "Жалобы есть?";
};


func int dia_vlk_6133_maxi_newlife_condition()
{
	if(MAXIHIRED == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_newlife_info()
{
	AI_Output(other,self,"DIA_VLK_6133_Maxi_NewLife_01_00");	//Жалобы есть?
	AI_Output(self,other,"DIA_VLK_6133_Maxi_NewLife_01_01");	//Нет! Все довольны.
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_PICKPOCKET(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 900;
	condition = dia_vlk_6133_maxi_pickpocket_condition;
	information = dia_vlk_6133_maxi_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_vlk_6133_maxi_pickpocket_condition()
{
	return C_Beklauen(60,90);
};

func void dia_vlk_6133_maxi_pickpocket_info()
{
	Info_ClearChoices(dia_vlk_6133_maxi_pickpocket);
	Info_AddChoice(dia_vlk_6133_maxi_pickpocket,Dialog_Back,dia_vlk_6133_maxi_pickpocket_back);
	Info_AddChoice(dia_vlk_6133_maxi_pickpocket,DIALOG_PICKPOCKET,dia_vlk_6133_maxi_pickpocket_doit);
};

func void dia_vlk_6133_maxi_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_vlk_6133_maxi_pickpocket);
};

func void dia_vlk_6133_maxi_pickpocket_back()
{
	Info_ClearChoices(dia_vlk_6133_maxi_pickpocket);
};

