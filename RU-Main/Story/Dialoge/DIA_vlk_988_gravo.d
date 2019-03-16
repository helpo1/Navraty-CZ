
instance DIA_GRAVO_EXIT(C_Info)
{
	npc = vlk_988_gravo;
	nr = 999;
	condition = dia_gravo_exit_condition;
	information = dia_gravo_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gravo_exit_condition()
{
	return TRUE;
};

func void dia_gravo_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GRAVO_PICKPOCKET(C_Info)
{
	npc = vlk_988_gravo;
	nr = 900;
	condition = DIA_GRAVO_PICKPOCKET_Condition;
	information = DIA_GRAVO_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_GRAVO_PICKPOCKET_Condition()
{
	return C_Beklauen(45,88);
};

func void DIA_GRAVO_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_GRAVO_PICKPOCKET);
	Info_AddChoice(DIA_GRAVO_PICKPOCKET,Dialog_Back,DIA_GRAVO_PICKPOCKET_BACK);
	Info_AddChoice(DIA_GRAVO_PICKPOCKET,DIALOG_PICKPOCKET,DIA_GRAVO_PICKPOCKET_DoIt);
};

func void DIA_GRAVO_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_GRAVO_PICKPOCKET);
};

func void DIA_GRAVO_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_GRAVO_PICKPOCKET);
};

instance DIA_GRAVO_FIRSTMEET(C_Info)
{
	npc = vlk_988_gravo;
	nr = 1;
	condition = dia_gravo_firstmeet_condition;
	information = dia_gravo_firstmeet_info;
	permanent = FALSE;
	description = "Кажется, мы знакомы?";
};


func int dia_gravo_firstmeet_condition()
{
	return TRUE;
};

func void dia_gravo_firstmeet_info()
{
	AI_Output(other,self,"DIA_Gravo_FirstMeet_01_00");	//Кажется, мы знакомы?
	AI_Output(self,other,"DIA_Gravo_FirstMeet_01_01");	//Да? Хммм...(вглядываясь) Возможно, ты и прав. Твое лицо мне действительно знакомо.
	AI_Output(self,other,"DIA_Gravo_FirstMeet_01_03");	//Ах, ну да, точно! Теперь я тебя вспомнил.
	AI_Output(self,other,"DIA_Gravo_FirstMeet_01_04");	//Ты ведь тот парень, который постоянно попадал в какие-нибудь неприятности. А я их помогал тебе улаживать!
	AI_Output(self,other,"DIA_Gravo_FirstMeet_01_06");	//Правда, не стоит об этом сильно распространяться. Иначе тебя запросто могут принять за бандита.
	AI_Output(self,other,"DIA_Gravo_FirstMeet_01_07");	//Беглых каторжников здесь не особенно жалуют.
};


instance DIA_GRAVO_HOWHERE(C_Info)
{
	npc = vlk_988_gravo;
	nr = 1;
	condition = dia_gravo_howhere_condition;
	information = dia_gravo_howhere_info;
	permanent = FALSE;
	description = "Как ты здесь очутился?";
};


func int dia_gravo_howhere_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_firstmeet))
	{
		return TRUE;
	};
};

func void dia_gravo_howhere_info()
{
	AI_Output(other,self,"DIA_Gravo_HowHere_01_00");	//Как ты здесь очутился?
	AI_Output(self,other,"DIA_Gravo_HowHere_01_01");	//Странный вопрос... Так же, как и все. Прошел через проход, ведущий из Долины.
	AI_Output(self,other,"DIA_Gravo_HowHere_01_02");	//После того, как этот магический барьер рухнул, меня вряд ли что-то могло удержать там.
};


instance DIA_GRAVO_HALLO(C_Info)
{
	npc = vlk_988_gravo;
	nr = 1;
	condition = dia_gravo_hallo_condition;
	information = dia_gravo_hallo_info;
	permanent = FALSE;
	description = "Как идут дела?";
};


func int dia_gravo_hallo_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_firstmeet))
	{
		return TRUE;
	};
};

func void dia_gravo_hallo_info()
{
	AI_Output(other,self,"DIA_Gravo_Hallo_01_00");	//Как идут дела?
	AI_Output(self,other,"DIA_Gravo_Hallo_01_01");	//С тех пор как я перестал гнуть спину на шахте, пожаловаться не на что.
	AI_Output(other,self,"DIA_Gravo_Hallo_01_02");	//На что же ты живешь?
	AI_Output(self,other,"DIA_Gravo_Hallo_01_03");	//Я все так же помогаю людям решать их проблемы.
	AI_Output(other,self,"DIA_Gravo_Hallo_01_05");	//И какие же проблемы ты можешь решить?
	AI_Output(self,other,"DIA_Gravo_Hallo_01_06");	//Ну, разного рода. Смотря что у тебя за проблема.
	AI_Output(self,other,"DIA_Gravo_Hallo_01_08");	//Допустим, ты где-то слегка перегнул палку и тебя стали считать преступником!
	AI_Output(self,other,"DIA_Gravo_Hallo_01_09");	//Я бы мог помочь тебе уладить это недоразумение, поговорив с нужными людьми. Замолвить за тебя словечко.
	AI_Output(self,other,"DIA_Gravo_Hallo_01_10");	//Поверь, всегда есть ниточки, за которые в случае надобности можно дернуть.
	AI_Output(self,other,"DIA_Gravo_Hallo_01_11");	//А там, глядишь, люди начнут относиться к тебе совсем по-другому. И ты снова уже в чести!
	AI_Output(self,other,"DIA_Gravo_Hallo_01_12");	//Разумеется, бесплатно этого делать я не буду.
	Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
	B_LogEntry(TOPIC_DIPLOM,"Если я попаду в неприятности, Граво поможет мне решить эти проблемы. Естественно, за определенную плату.");
};


instance DIA_GRAVO_HELPANGRYNOW(C_Info)
{
	npc = vlk_988_gravo;
	nr = 1;
	condition = dia_gravo_helpangrynow_condition;
	information = dia_gravo_helpangrynow_info;
	permanent = TRUE;
	description = "Кажется, у меня возникла проблема. Ты можешь мне помочь?";
};


func int dia_gravo_helpangrynow_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_hallo) && ((VatrasPissedOffForever == TRUE) || (GLOBAL_MAKE_BANDIT_FORCITY == TRUE) || (GLOBAL_MAKE_BANDIT_FORMON == TRUE) || (GLOBAL_MAKE_BANDIT_FORFARM == TRUE) || (GLOBAL_MAKE_BANDIT_FORCOAST == TRUE) || (GLOBAL_MAKE_BANDIT_FORPSICAMP == TRUE)))
	{
		return TRUE;
	};
};

func void dia_gravo_helpangrynow_info()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_15_00");	//Кажется, у меня возникла проблема. Ты можешь мне помочь?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_04_01");	//Думаю, что да! Но моя помощь стоит недешево.
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,Dialog_Back,dia_gravo_helpangrynow_back);

	if(GLOBAL_MAKE_BANDIT_FORFARM == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"У меня проблемы на ферме Онара.",dia_gravo_helpangrynow_bigfarm);
	};
	if(GLOBAL_MAKE_BANDIT_FORMON == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"У меня проблемы в монастыре.",dia_gravo_helpangrynow_kloster);
	};
	if(GLOBAL_MAKE_BANDIT_FORCITY == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"У меня проблемы с паладинами.",dia_gravo_helpangrynow_city);
	};
	if(GLOBAL_MAKE_BANDIT_FORPSICAMP == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"У меня проблемы в лагере Братства.",dia_gravo_helpangrynow_psicamp);
	};
	if(GLOBAL_MAKE_BANDIT_FORCOAST == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"У меня проблемы в лагере Нетбека.",dia_gravo_helpangrynow_netbek);
	};
	if(VatrasPissedOffForever == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"У меня проблемы c магом воды, Ватрасом.",dia_gravo_helpangrynow_vatras);
	};
};

func void dia_gravo_helpangrynow_back()
{
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_vatras()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Vatras_01_00");	//У меня проблемы c магом воды, Ватрасом.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_01_01");	//Хммм...(задумчиво) Полагаю, что их можно будет решить без особого труда.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_BigFarm_01_03");	//Сколько?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_01_04");	//Три тысячи золотых монет!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,"У меня столько нет.",dia_gravo_helpangrynow_nomoney);

	if(Npc_HasItems(other,ItMi_Gold) >= 3000)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Хорошо! Вот золото.",dia_gravo_helpangrynow_vatras_takeit);
	};
};

func void dia_gravo_helpangrynow_bigfarm()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_BigFarm_01_00");	//У меня проблемы на ферме Онара.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_01_01");	//Хммм...(задумчиво) Полагаю, что их можно будет решить без особого труда.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_01_02");	//Однако чтобы вернуть доверие этих людей, тебе придется мне заплатить.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_BigFarm_01_03");	//Сколько?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_01_04");	//Три тысячи золотых монет!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,"У меня столько нет.",dia_gravo_helpangrynow_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 3000)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Хорошо! Вот золото.",dia_gravo_helpangrynow_bigfarm_takeit);
	};
};

func void dia_gravo_helpangrynow_kloster()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Kloster_01_00");	//У меня проблемы в монастыре.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Kloster_01_01");	//С Магами Огня? Хммм...(задумчиво) Ну и влип же ты, приятель!
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Kloster_01_02");	//Маги крайне упрямы и горды. А потому уговорить их простить тебя будет сделать крайне тяжело.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Kloster_01_03");	//Тебе придется заплатить мне просто огромную кучу золота, чтобы я взялся за это дело.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Kloster_01_04");	//Сколько?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Kloster_01_05");	//Десять тысяч золотых монет!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,"У меня столько нет.",dia_gravo_helpangrynow_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 10000)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Вот, возьми свои деньги.",dia_gravo_helpangrynow_kloster_takeit);
	};
};

func void dia_gravo_helpangrynow_city()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_City_01_00");	//У меня проблемы с паладинами.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_City_01_01");	//Хммм...(задумчиво) Это уже серьезно! Мне будет нелегко их уговорить, чтобы они забыли свои старые обиды.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_City_01_02");	//Да и золота потребуется куда больше, чем обычно.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_City_01_03");	//Сколько?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_City_01_04");	//Пять тысяч золотых монет!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,"У меня столько нет.",dia_gravo_helpangrynow_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Хорошо! Вот золото.",dia_gravo_helpangrynow_city_takeit);
	};
};

func void dia_gravo_helpangrynow_psicamp()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Psicamp_01_00");	//У меня проблемы в лагере Братства.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Psicamp_01_01");	//Хммм...(задумчиво) Полагаю, что их можно будет решить без особого труда.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Psicamp_01_02");	//Однако чтобы вернуть доверие этих людей, тебе придется мне заплатить.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Psicamp_01_03");	//Сколько?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Psicamp_01_04");	//Четыре тысячи золотых монет!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,"У меня столько нет.",dia_gravo_helpangrynow_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 4000)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Хорошо! Вот золото.",dia_gravo_helpangrynow_psicamp_takeit);
	};
};

func void dia_gravo_helpangrynow_netbek()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_NetBek_01_00");	//У меня проблемы в лагере Нетбека.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_NetBek_01_01");	//Хммм...(задумчиво) Полагаю, что их можно будет решить без особого труда.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_NetBek_01_02");	//Однако чтобы вернуть доверие этих людей, тебе придется мне заплатить.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_NetBek_01_03");	//Сколько?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_NetBek_01_04");	//Две тысячи золотых монет!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,"У меня столько нет.",dia_gravo_helpangrynow_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Хорошо! Вот золото.",dia_gravo_helpangrynow_netbek_takeit);
	};
};

func void dia_gravo_helpangrynow_nomoney()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_NoMoney_01_00");	//У меня недостаточно золота.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_NoMoney_01_01");	//Мне очень жаль, парень...(пожимая плечами) Но тогда я ничего не смогу для тебя сделать!
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_vatras_takeit()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_00");	//Хорошо! Вот золото.
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	Npc_RemoveInvItems(self,ItMi_Gold,3000);
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_01");	//Можешь считать, что вопрос решен.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_02");	//И никому не говори об этом! Веди себя так, будто ничего не случилось.
	VatrasPissedOffForever = FALSE;
	B_LogEntry(TOPIC_DIPLOM,"Теперь Ватрас должен простить меня.");
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_bigfarm_takeit()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_00");	//Хорошо! Вот золото.
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	Npc_RemoveInvItems(self,ItMi_Gold,3000);
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_01");	//Можешь считать, что вопрос решен.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_02");	//И никому не говори об этом! Веди себя так, будто ничего не случилось.
	B_GrantAbsolution(LOC_FARM);
	ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
	PETZCOUNTER_BL_Murder = 0;
	PETZCOUNTER_BL_Theft = 0;
	PETZCOUNTER_BL_Attack = 0;
	ABSOLUTIONLEVEL_Farm = ABSOLUTIONLEVEL_Farm + 1;
	PETZCOUNTER_Farm_Murder = 0;
	PETZCOUNTER_Farm_Theft = 0;
	PETZCOUNTER_Farm_Attack = 0;
	PETZCOUNTER_Farm_Sheepkiller = 0;
	GLOBAL_FARM_MURDER = 0;
	GLOBAL_FARM_THEFT = 0;
	GLOBAL_FARM_ATTACK = 0;
	GLOBAL_MAKE_BANDIT_FORFARM = FALSE;
	B_LogEntry(TOPIC_DIPLOM,"Я восстановил свои отношения с наемниками.");
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_kloster_takeit()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Kloster_TakeIt_01_00");	//Хорошо! Вот золото.
	B_GiveInvItems(other,self,ItMi_Gold,10000);
	Npc_RemoveInvItems(self,ItMi_Gold,10000);
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Kloster_TakeIt_01_01");	//Можешь считать, что вопрос решен.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Kloster_TakeIt_01_02");	//И никому не говори об этом! Веди себя так, будто ничего не случилось.
	B_GrantAbsolution(LOC_MONASTERY);
	ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
	PETZCOUNTER_BL_Murder = 0;
	PETZCOUNTER_BL_Theft = 0;
	PETZCOUNTER_BL_Attack = 0;
	ABSOLUTIONLEVEL_Monastery = ABSOLUTIONLEVEL_Monastery + 1;
	PETZCOUNTER_Monastery_Murder = 0;
	PETZCOUNTER_Monastery_Theft = 0;
	PETZCOUNTER_Monastery_Attack = 0;
	PETZCOUNTER_Monastery_Sheepkiller = 0;
	GLOBAL_MONASTERY_MURDER = 0;
	GLOBAL_MONASTERY_THEFT = 0;
	GLOBAL_MONASTERY_ATTACK = 0;
	GLOBAL_MAKE_BANDIT_FORMON = FALSE;
	B_LogEntry(TOPIC_DIPLOM,"Я восстановил свои отношения с Магами Огня.");
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_city_takeit()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_City_TakeIt_01_00");	//Хорошо! Вот золото.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	Npc_RemoveInvItems(self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_City_TakeIt_01_01");	//Можешь считать, что вопрос решен.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_City_TakeIt_01_02");	//И никому не говори об этом! Веди себя так, будто ничего не случилось.
	if(GARONDTROUBLE == TRUE)
	{
		B_GrantAbsolution(LOC_OLDCAMP);
		ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
		PETZCOUNTER_BL_Murder = 0;
		PETZCOUNTER_BL_Theft = 0;
		PETZCOUNTER_BL_Attack = 0;
		ABSOLUTIONLEVEL_OldCamp = ABSOLUTIONLEVEL_OldCamp + 1;
		PETZCOUNTER_OldCamp_Murder = 0;
		PETZCOUNTER_OldCamp_Theft = 0;
		PETZCOUNTER_OldCamp_Attack = 0;
		PETZCOUNTER_OldCamp_Sheepkiller = 0;
		GLOBAL_OLDCAMP_MURDER = 0;
		GLOBAL_OLDCAMP_THEFT = 0;
		GLOBAL_OLDCAMP_ATTACK = 0;
		GARONDTROUBLE = FALSE;
		B_LogEntry(TOPIC_DIPLOM,"Я восстановил свои отношения с паладинами в крепости.");
	}
	else
	{
		B_GrantAbsolution(LOC_CITY);
		ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
		PETZCOUNTER_BL_Murder = 0;
		PETZCOUNTER_BL_Theft = 0;
		PETZCOUNTER_BL_Attack = 0;
		ABSOLUTIONLEVEL_City = ABSOLUTIONLEVEL_City + 1;
		PETZCOUNTER_City_Murder = 0;
		PETZCOUNTER_City_Theft = 0;
		PETZCOUNTER_City_Attack = 0;
		PETZCOUNTER_City_Sheepkiller = 0;
		GLOBAL_CITY_MURDER = 0;
		GLOBAL_CITY_THEFT = 0;
		GLOBAL_CITY_ATTACK = 0;
		B_LogEntry(TOPIC_DIPLOM,"Я восстановил свои отношения с паладинами в городе.");
	};
	GLOBAL_MAKE_BANDIT_FORCITY = FALSE;
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_psicamp_takeit()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Psicamp_TakeIt_01_00");	//Хорошо! Вот золото.
	B_GiveInvItems(other,self,ItMi_Gold,4000);
	Npc_RemoveInvItems(self,ItMi_Gold,4000);
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Psicamp_TakeIt_01_01");	//Можешь считать, что вопрос решен.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Psicamp_TakeIt_01_02");	//И никому не говори об этом! Веди себя так, будто ничего не случилось.
	B_GrantAbsolution(LOC_PSICAMP);
	ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
	PETZCOUNTER_BL_Murder = 0;
	PETZCOUNTER_BL_Theft = 0;
	PETZCOUNTER_BL_Attack = 0;
	ABSOLUTIONLEVEL_PSICAMP = ABSOLUTIONLEVEL_PSICAMP + 1;
	PETZCOUNTER_PSICAMP_MURDER = 0;
	PETZCOUNTER_PSICAMP_THEFT = 0;
	PETZCOUNTER_PSICAMP_ATTACK = 0;
	GLOBAL_PSICAMP_MURDER = 0;
	GLOBAL_PSICAMP_THEFT = 0;
	GLOBAL_PSICAMP_ATTACK = 0;
	GLOBAL_MAKE_BANDIT_FORPSICAMP = FALSE;
	B_LogEntry(TOPIC_DIPLOM,"Я восстановил свои отношения с лагерем Братства.");
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_netbek_takeit()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Psicamp_NetBek_01_00");	//Хорошо! Вот золото.
	B_GiveInvItems(other,self,ItMi_Gold,4000);
	Npc_RemoveInvItems(self,ItMi_Gold,4000);
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Psicamp_NetBek_01_01");	//Можешь считать, что вопрос решен.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Psicamp_NetBek_01_02");	//И никому не говори об этом! Веди себя так, будто ничего не случилось.
	B_GrantAbsolution(LOC_COAST);
	ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
	PETZCOUNTER_BL_Murder = 0;
	PETZCOUNTER_BL_Theft = 0;
	PETZCOUNTER_BL_Attack = 0;
	ABSOLUTIONLEVEL_COAST = ABSOLUTIONLEVEL_COAST + 1;
	PETZCOUNTER_COAST_MURDER = 0;
	PETZCOUNTER_COAST_THEFT = 0;
	PETZCOUNTER_COAST_ATTACK = 0;
	GLOBAL_COAST_MURDER = 0;
	GLOBAL_COAST_THEFT = 0;
	GLOBAL_COAST_ATTACK = 0;
	GLOBAL_MAKE_BANDIT_FORCOAST = FALSE;
	B_LogEntry(TOPIC_DIPLOM,"Я восстановил свои отношения с лагерем Нетбека.");
	Info_ClearChoices(dia_gravo_helpangrynow);
};