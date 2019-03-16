
instance DIA_Joe_EXIT(C_Info)
{
	npc = VLK_448_Joe;
	nr = 999;
	condition = DIA_Joe_EXIT_Condition;
	information = DIA_Joe_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Joe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Joe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Joe_PICKPOCKET(C_Info)
{
	npc = VLK_448_Joe;
	nr = 900;
	condition = DIA_Joe_PICKPOCKET_Condition;
	information = DIA_Joe_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Joe_PICKPOCKET_Condition()
{
	return C_Beklauen(25,25);
};

func void DIA_Joe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Joe_PICKPOCKET);
	Info_AddChoice(DIA_Joe_PICKPOCKET,Dialog_Back,DIA_Joe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Joe_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Joe_PICKPOCKET_DoIt);
};

func void DIA_Joe_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,30);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Joe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Joe_PICKPOCKET);
};


instance DIA_Joe_Hallo(C_Info)
{
	npc = VLK_448_Joe;
	nr = 2;
	condition = DIA_Joe_Hallo_Condition;
	information = DIA_Joe_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Joe_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Joe_Hallo_Info()
{
	AI_Output(self,other,"DIA_Joe_Hallo_10_00");	//Эй, спасибо, парень. Действительно, огромное спасибо. Я уж думал, мне никогда не выбраться отсюда...
	TOPIC_END_Joe = TRUE;
	B_GivePlayerXP(XP_Ambient * 4);
	AI_Output(other,self,"DIA_Joe_Hallo_15_01");	//Что ты делаешь ЗДЕСЬ?
	AI_Output(self,other,"DIA_Joe_Hallo_10_02");	//Я оказался взаперти. Дверь была открыта, и я хотел просто пошарить там - но как только я зашел внутрь, пришел стражник и запер эту чертову дверь.
	AI_Output(self,other,"DIA_Joe_Hallo_10_03");	//Я попал в дурацкое положение - и был бы очень благодарен, если бы все это осталось между нами.
	AI_Output(other,self,"DIA_Joe_Hallo_15_04");	//Понимаю. Да уж, тут действительно нечем гордиться.
	AI_Output(self,other,"DIA_Joe_Hallo_10_05");	//Я сейчас был бы не прочь что-нибудь выпить.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Joe_Perm(C_Info)
{
	npc = VLK_448_Joe;
	nr = 2;
	condition = DIA_Joe_Perm_Condition;
	information = DIA_Joe_Perm_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Joe_Perm_Condition()
{
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Joe_Perm_Info()
{
	AI_Output(other,self,"DIA_Joe_Perm_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Joe_Perm_10_01");	//Спасибо, что освободил меня.
	AI_StopProcessInfos(self);
};


instance DIA_Joe_Sign(C_Info)
{
	npc = VLK_448_Joe;
	nr = 2;
	condition = DIA_Joe_Sign_Condition;
	information = DIA_Joe_Sign_Info;
	permanent = FALSE;
	description = "(Показать сигнал воров)";
};


func int DIA_Joe_Sign_Condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") <= 500) && (Knows_SecretSign == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Joe_Sign_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Joe_Sign_10_00");	//Эй, привет - у нас есть общие друзья. И я хотел бы выразить свою благодарность за спасение.
	AI_Output(self,other,"DIA_Joe_Sign_10_01");	//Вот, возьми эти отмычки - я уверен, они пригодятся тебе.
	B_GiveInvItems(self,other,ItKE_lockpick,5);
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	AI_StopProcessInfos(self);
};


instance DIA_JOE_INPRISOIN(C_Info)
{
	npc = VLK_448_Joe;
	nr = 2;
	condition = dia_joe_inprisoin_condition;
	information = dia_joe_inprisoin_info;
	permanent = TRUE;
	description = "Говорят, ты пытался расплатиться кольцом.";
};


func int dia_joe_inprisoin_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (CORAGONTELLJO == TRUE) && (JOTELLSGASPAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_joe_inprisoin_info()
{
	AI_Output(other,self,"DIA_Joe_InPrisoin_01_00");	//Говорят, ты пытался расплатиться кольцом.
	AI_Output(self,other,"DIA_Joe_InPrisoin_01_01");	//Каким кольцом?!
	if(Npc_HasItems(other,itri_hakonmissring) >= 1)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_02");	//Вот этим кольцом. Узнаешь?
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_03");	//Ну... ну да, я отдал его трактирщику Корагону за выпивку.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_04");	//А что в этом такого?
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_05");	//Откуда оно у тебя?
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_06");	//(нервничает) Я... я его нашел.
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_07");	//Ты врешь! Может, все-таки скажешь правду?
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_08");	//Какую еще правду? Я ничего не знаю. Мамой клянусь!
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_09");	//Послушай, парень, это кольцо было украдено у одного торговца.
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_10");	//И если ты не скажешь мне сейчас, откуда оно у тебя, я просто сдам тебя городскому ополчению.
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_12");	//Говорят, в последнее время некоторые охранники очень любят пытать людей.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_13");	//(в панике) Но... но я ничего не крал, честное слово! Я не крал этого кольца!
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_14");	//Тогда просто скажи, кто тебе его дал, - и я отпущу тебя.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_15");	//Черт! Хорошо, я все скажу.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_16");	//Мне его дал торговец по имени Гаспар.
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_97");	//Зачем?
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_18");	//Ну, я... я выполнил для него одно поручение, и он дал мне это кольцо в качестве оплаты.
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_19");	//Что ты для него сделал?
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_20");	//Он сказал, что ему надо попасть в гостиницу, но он не хочет, чтобы Ханна - тамошняя хозяйка - видела его.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_21");	//Еще он сказал, что тем самым, хочет сделать для нее один приятный сюрприз.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_22");	//Поэтому и попросил меня на время отвлечь ее разговором.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_23");	//Ну и пообещал, конечно, неплохо заплатить.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_25");	//Я все сделал, как он велел. А потом он отдал мне это кольцо в качестве оплаты.
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_26");	//Все ясно. Вскоре мне понадобятся твои показания, чтобы посадить этого ублюдка в тюрьму.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_27");	//Что?! Ты же обещал!
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_28");	//Ты меня не так понял - я не хочу тебя сдавать городскому ополчению.
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_29");	//Просто мне нужен свидетель, чтобы обвинить Гаспара в краже. Смекаешь?
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_30");	//Ну, я...(растерянно) хорошо, я сделаю это.
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_31");	//Вот и отлично! Можешь не волноваться, тебя не арестуют. Зато поможешь мне засадить этого ублюдка в тюрьму.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_33");	//Я понимаю... можешь на меня рассчитывать.
		JOTELLSGASPAR = TRUE;
		B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Я поговорил с Джо и он мне все рассказал. Гаспар использовал его, чтобы отвлечь Ханну, пока сам пробрался в гостиницу и обворовал торговца Хакона. Потом он подбросил вещи Ханне, а кольцом расплатился с Джо. Теперь надо пойти и сообщить об этом лорду Андрэ. Думаю, после этого, он снимет все обвинения с Ханны.");
	}
	else
	{
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_35");	//Какая разница, каким?
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_36");	//Не понимаю о чем ты, парень.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_37");	//Я никому не давал никакого кольца.
		AI_Output(self,other,"DIA_Joe_InPrisoin_01_38");	//Ты, наверное, ошибся. Так что оставь меня в покое.
		AI_StopProcessInfos(self);
	};
};

