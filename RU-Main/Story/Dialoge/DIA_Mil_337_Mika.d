
instance DIA_Mika_EXIT(C_Info)
{
	npc = Mil_337_Mika;
	nr = 999;
	condition = DIA_Mika_EXIT_Condition;
	information = DIA_Mika_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mika_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Mika_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mika_WOHIN(C_Info)
{
	npc = Mil_337_Mika;
	nr = 4;
	condition = DIA_Mika_WOHIN_Condition;
	information = DIA_Mika_WOHIN_Info;
	important = TRUE;
};


func int DIA_Mika_WOHIN_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mika_WOHIN_Info()
{
	AI_Output(self,other,"DIA_Mika_WOHIN_12_00");	//Эй, эй! Не так быстро. Прогуливаться здесь одному довольно опасно. Откуда ты идешь?
	Info_ClearChoices(DIA_Mika_WOHIN);
	Info_AddChoice(DIA_Mika_WOHIN,"Это не твое дело.",DIA_Mika_WOHIN_weg);
	Info_AddChoice(DIA_Mika_WOHIN,"С одной из ферм.",DIA_Mika_WOHIN_Bauern);
	Info_AddChoice(DIA_Mika_WOHIN,"Из города!",DIA_Mika_WOHIN_stadt);
};

func void DIA_Mika_WOHIN_stadt()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_stadt_15_00");	//Из города!
	AI_Output(self,other,"DIA_Mika_WOHIN_stadt_12_01");	//Так, так. Тогда что ты делаешь тут, так далеко от его защитных стен?
	Info_ClearChoices(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_Bauern()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_Bauern_15_00");	//С одной из ферм.
	AI_Output(self,other,"DIA_Mika_WOHIN_Bauern_12_01");	//Ты фермер, да? Хмм. Тогда тебе не стоит бродить по этим опасным тропам совсем одному. Кто знает, кто там может поджидать тебя.
	Info_ClearChoices(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_weg()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_weg_15_00");	//Это не твое дело.
	AI_Output(self,other,"DIA_Mika_WOHIN_weg_12_01");	//Как знаешь. Но не плачь потом, если кто-то снимет с тебя шкуру. Удачной прогулки.
	AI_StopProcessInfos(self);
};


instance DIA_Mika_WASGEFAEHRLICH(C_Info)
{
	npc = Mil_337_Mika;
	nr = 5;
	condition = DIA_Mika_WASGEFAEHRLICH_Condition;
	information = DIA_Mika_WASGEFAEHRLICH_Info;
	description = "А что такого опасного здесь?";
};

func int DIA_Mika_WASGEFAEHRLICH_Condition()
{
	return TRUE;
};

func void DIA_Mika_WASGEFAEHRLICH_Info()
{
	AI_Output(other,self,"DIA_Mika_WASGEFAEHRLICH_15_00");	//А что такого опасного здесь?
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_01");	//Много чего.
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_02");	//Ну, например, бандиты. Они только и ждут, когда к ним в лапы попадет кто-нибудь вроде тебя.
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_03");	//А если тебя не поймают бандиты, то дикие животные из леса или наемники, которые шляются вокруг, позаботятся о тебе.
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_04");	//Так что постарайся сначала хотя бы добыть приличные доспехи. Без них тут нечего делать.

	if(RealMode[2] == FALSE)
	{
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_05");	//Я уверен, что ты прибежишь за помощью ко мне, не успев даже дойти до следующего поворота этой дороги.
	};
};

instance DIA_Mika_WASKOSTETHILFE(C_Info)
{
	npc = Mil_337_Mika;
	nr = 6;
	condition = DIA_Mika_WASKOSTETHILFE_Condition;
	information = DIA_Mika_WASKOSTETHILFE_Info;
	description = "Ну, предположим, я обращусь к тебе за помощью.";
};


func int DIA_Mika_WASKOSTETHILFE_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Mika_WASGEFAEHRLICH) == TRUE) && (RealMode[2] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mika_WASKOSTETHILFE_Info()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_15_00");	//Ну, предположим, я обращусь к тебе за помощью. Сколько это будет мне стоить?
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_01");	//Я все го лишь скромный слуга короля и мне не к лицу обдирать беззащитных граждан нашего королевства.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_02");	//Но, знаешь, если уж ты так ставишь вопрос, то я бы не отказался от небольшой финансовой помощи. Это укрепит наши будущие деловые отношения.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_03");	//Сто золотых монет будет достаточно для начала. Что скажешь?
	Info_ClearChoices(DIA_Mika_WASKOSTETHILFE);
	Info_AddChoice(DIA_Mika_WASKOSTETHILFE,"Я подумаю над этим.",DIA_Mika_WASKOSTETHILFE_nochnicht);
	Info_AddChoice(DIA_Mika_WASKOSTETHILFE,"Почему бы и нет? Вот твои 100 монет.",DIA_Mika_WASKOSTETHILFE_ja);
};

func void DIA_Mika_WASKOSTETHILFE_ja()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_ja_15_00");	//Почему бы и нет? Вот твои сто монет.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_01");	//Потрясающе. Если тебе понадобится моя помощь, ты знаешь, где найти меня.
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_02");	//Но будь так любезен, не отвлекай меня по всяким пустякам. Я не выношу этого, ты слышишь?
		Mika_Helps = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_03");	//У тебя нет денег. Но, возможно, они у тебя найдутся, когда тебе действительно понадобится моя помощь.
	};
	AI_StopProcessInfos(self);
};

func void DIA_Mika_WASKOSTETHILFE_nochnicht()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_nochnicht_15_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_nochnicht_12_01");	//Как знаешь. Желаю удачно погибнуть.
	AI_StopProcessInfos(self);
};


instance DIA_Mika_UEBERLEGT(C_Info)
{
	npc = Mil_337_Mika;
	nr = 7;
	condition = DIA_Mika_UEBERLEGT_Condition;
	information = DIA_Mika_UEBERLEGT_Info;
	permanent = TRUE;
	description = "Я передумал! Я заплачу тебе сто золотых.";
};


func int DIA_Mika_UEBERLEGT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Mika_WASKOSTETHILFE) && (Mika_Helps == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mika_UEBERLEGT_Info()
{
	AI_Output(other,self,"DIA_Mika_UEBERLEGT_15_00");	//Я передумал! Я заплачу тебе сто золотых.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_01");	//Превосходно! Лучше поздно, чем никогда. И что теперь?
		Mika_Helps = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_02");	//(сердито) Возвращайся, когда у тебя будут деньги.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Mika_HILFE(C_Info)
{
	npc = Mil_337_Mika;
	nr = 8;
	condition = DIA_Mika_HILFE_Condition;
	information = DIA_Mika_HILFE_Info;
	permanent = TRUE;
	description = "Мне нужна твоя помощь.";
};

func int DIA_Mika_HILFE_Condition()
{
	if(Mika_Helps == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mika_HILFE_Info()
{
	AI_Output(other,self,"DIA_Mika_HILFE_15_00");	//Мне нужна твоя помощь.
	AI_Output(self,other,"DIA_Mika_HILFE_12_01");	//Ну, если это так необходимо. Что случилось?
	Info_ClearChoices(DIA_Mika_HILFE);
	Info_AddChoice(DIA_Mika_HILFE,"Меня преследуют бандиты.",DIA_Mika_HILFE_schongut);
	Info_AddChoice(DIA_Mika_HILFE,"На меня напали монстры.",DIA_Mika_HILFE_monster);
	if(!Npc_IsDead(Alvares) && !Npc_IsDead(Engardo) && (MIKAGOFARM == FALSE) && ((Akils_SLDStillthere == TRUE) || Npc_KnowsInfo(other,DIA_Sarah_Bauern)))
	{
		Info_AddChoice(DIA_Mika_HILFE,"На фермера Акила напали наемники.",DIA_Mika_HILFE_Akil);
	};
	if((MIS_SALANDRILHELP == LOG_Running) && (ORCWARRIORSALANDRILISDEAD == FALSE))
	{
		Info_AddChoice(DIA_Mika_HILFE,"Говорят, тут неподалеку есть орк.",dia_mika_hilfe_orcsalandril);
	};
};

func void DIA_Mika_HILFE_Akil()
{
	AI_Output(other,self,"DIA_Mika_HILFE_Akil_15_00");	//На фермера Акила напали наемники.
	AI_Output(self,other,"DIA_Mika_HILFE_Akil_12_01");	//Что?...(возбужденно) Этот сброд ошивается вокруг фермы Акила? Тогда не будем терять времени попусту. Идем за мной!
	AI_StopProcessInfos(self);
	MIKAGOFARM = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_GivePlayerXP(XP_Ambient);
	B_LogEntry(TOPIC_AkilsSLDStillthere,"Мика хочет помочь мне решить проблему с наемниками, которые напали на Акила.");
	Npc_ExchangeRoutine(self,"Akil");
};

func void DIA_Mika_HILFE_monster()
{
	AI_Output(other,self,"DIA_Mika_HILFE_monster_15_00");	//На меня напали монстры.
	AI_Output(self,other,"DIA_Mika_HILFE_monster_12_01");	//Но я не вижу никаких монстров. Я думаю, тебе померещилось.
	AI_StopProcessInfos(self);
};

func void DIA_Mika_HILFE_schongut()
{
	AI_Output(other,self,"DIA_Mika_HILFE_schongut_15_00");	//Меня преследуют бандиты.
	AI_Output(self,other,"DIA_Mika_HILFE_schongut_12_01");	//Да ну? И где же они? Если бы за тобой гнались, я бы видел хотя бы одного из них, правильно?
	AI_StopProcessInfos(self);
};

func void dia_mika_hilfe_orcsalandril()
{
	AI_Output(other,self,"DIA_Mika_HILFE_OrcSalandril_01_00");	//Говорят, тут неподалеку есть орк.
	AI_Output(self,other,"DIA_Mika_HILFE_OrcSalandril_01_01");	//Орк?! Хммм...(испуганно) Это серьезный противник!
	AI_Output(self,other,"DIA_Mika_HILFE_OrcSalandril_01_02");	//Полагаю, что сотней золотых тебе не обойтись.
	AI_Output(other,self,"DIA_Mika_HILFE_OrcSalandril_01_03");	//То есть как? Но мы же договорились!
	AI_Output(self,other,"DIA_Mika_HILFE_OrcSalandril_01_04");	//Парень, я не собираюсь рисковать своей жизнью ради пары монет, тем более сражаясь с орком!
	AI_Output(other,self,"DIA_Mika_HILFE_OrcSalandril_01_05");	//Ну, и сколько ты хочешь?
	AI_Output(self,other,"DIA_Mika_HILFE_OrcSalandril_01_06");	//Ммм...(задумался) Пятьсот золотых и ни монетой меньше!
	MIKATELLORKS = TRUE;
	Info_ClearChoices(DIA_Mika_HILFE);
};


instance DIA_MIKA_GOHUNT(C_Info)
{
	npc = Mil_337_Mika;
	nr = 1;
	condition = dia_mika_gohunt_condition;
	information = dia_mika_gohunt_info;
	permanent = TRUE;
	description = "Вот твои пятьсот монет. Теперь идем!";
};

func int dia_mika_gohunt_condition()
{
	if((MIS_SALANDRILHELP == LOG_Running) && (ORCWARRIORSALANDRILISDEAD == FALSE) && (MIKATELLORKS == TRUE) && (MIKATELLORKSGO == FALSE))
	{
		return TRUE;
	};
};

func void dia_mika_gohunt_info()
{
	AI_Output(other,self,"DIA_Mika_GoHunt_01_00");	//Вот твои пятьсот монет. Теперь идем!

	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		MIKATELLORKSGO = TRUE;
		AI_Output(self,other,"DIA_Mika_GoHunt_01_01");	//Эх. Ладно, пошли! Показывай, где этот твой орк.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Npc_ExchangeRoutine(self,"Follow");
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_GoHunt_01_02");	//И где они? У тебя же нет столько золота!
		AI_Output(self,other,"DIA_Mika_GoHunt_01_03");	//Так что лучше я останусь здесь. Подальше от орков!
		AI_StopProcessInfos(self);
	};
};


instance DIA_MIKA_GOHOME(C_Info)
{
	npc = Mil_337_Mika;
	nr = 1;
	condition = dia_mika_gohome_condition;
	information = dia_mika_gohome_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mika_gohome_condition()
{
	if((MIS_SALANDRILHELP == LOG_Running) && (MIKATELLORKSDONE == FALSE) && (ORCWARRIORSALANDRILISDEAD == FALSE) && (MIKATELLORKSGO == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_TO_FOREST_01") >= 10000))
	{
		return TRUE;
	};
};

func void dia_mika_gohome_info()
{
	AI_Output(self,other,"DIA_Mika_GoHome_01_00");	//Здесь нет никаких орков, приятель!
	AI_Output(self,other,"DIA_Mika_GoHome_01_01");	//Так что лучше я вернусь обратно в город.
	AI_Output(other,self,"DIA_Mika_GoHome_01_02");	//Эй, постой...
	MIKATELLORKSDONE = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Mika_Zack(C_Info)
{
	npc = Mil_337_Mika;
	nr = 8;
	condition = DIA_Mika_Zack_Condition;
	information = DIA_Mika_Zack_Info;
	important = TRUE;
};


func int DIA_Mika_Zack_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 500) && !Npc_IsDead(Alvares) && !Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Mika_Zack_Info()
{
	AI_Output(self,other,"DIA_Mika_Zack_12_00");	//Теперь смотри, как это делается.
	Info_AddChoice(DIA_Mika_Zack,Dialog_Ende,DIA_Mika_Zack_los);
};

func void DIA_Mika_Zack_los()
{
	AI_StopProcessInfos(self);
	if(!Npc_IsDead(Alvares))
	{
		Alvares.aivar[AIV_EnemyOverride] = FALSE;
	};
	if(!Npc_IsDead(Engardo))
	{
		Engardo.aivar[AIV_EnemyOverride] = FALSE;
	};
};

instance DIA_Mika_WIEDERNACHHAUSE(C_Info)
{
	npc = Mil_337_Mika;
	nr = 9;
	condition = DIA_Mika_WIEDERNACHHAUSE_Condition;
	information = DIA_Mika_WIEDERNACHHAUSE_Info;
	important = TRUE;
};

func int DIA_Mika_WIEDERNACHHAUSE_Condition()
{
	if((Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 10000) && Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Mika_WIEDERNACHHAUSE_Info()
{
	AI_Output(self,other,"DIA_Mika_WIEDERNACHHAUSE_12_00");	//Вот и все! Я могу возвращаться назад.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Mika_Kap3_EXIT(C_Info)
{
	npc = Mil_337_Mika;
	nr = 999;
	condition = DIA_Mika_Kap3_EXIT_Condition;
	information = DIA_Mika_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mika_Kap3_EXIT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Mika_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Mika_Kap3u4u5_PERM(C_Info)
{
	npc = Mil_337_Mika;
	nr = 39;
	condition = DIA_Mika_Kap3u4u5_PERM_Condition;
	information = DIA_Mika_Kap3u4u5_PERM_Info;
	permanent = TRUE;
	description = "Все тихо?";
};


func int DIA_Mika_Kap3u4u5_PERM_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Mika_WOHIN) && Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Mika_Kap3u4u5_PERM_Info()
{
	AI_Output(other,self,"DIA_Mika_Kap3u4u5_PERM_15_00");	//Все тихо?
	AI_Output(self,other,"DIA_Mika_Kap3u4u5_PERM_12_01");	//Ты все еще жив? Надо же!
};


instance DIA_Mika_PICKPOCKET(C_Info)
{
	npc = Mil_337_Mika;
	nr = 900;
	condition = DIA_Mika_PICKPOCKET_Condition;
	information = DIA_Mika_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Mika_PICKPOCKET_Condition()
{
	return C_Beklauen(65,75);
};

func void DIA_Mika_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
	Info_AddChoice(DIA_Mika_PICKPOCKET,Dialog_Back,DIA_Mika_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mika_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mika_PICKPOCKET_DoIt);
};

func void DIA_Mika_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
};

func void DIA_Mika_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
};

instance DIA_Mika_Key(C_Info)
{
	npc = Mil_337_Mika;
	nr = 8;
	condition = DIA_Mika_Key_Condition;
	information = DIA_Mika_Key_Info;
	permanent = FALSE;
	description = "Ты не находил тут никакого ключа?";
};

func int DIA_Mika_Key_Condition()
{
	if((MIS_Constantino_LostKey == LOG_Running) && (MikaHaveKey == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Mika_Key_Info()
{
	AI_Output(other,self,"DIA_Mika_Key_01_00");	//Ты не находил тут никакого ключа?
	AI_Output(self,other,"DIA_Mika_Key_01_01");	//Находил. Вон под той елкой валялся. Видать, кто-то обронил по неосторожности.
	AI_Output(other,self,"DIA_Mika_Key_01_02");	//А не мог бы ты отдать его мне?
	AI_Output(self,other,"DIA_Mika_Key_01_03");	//Конечно, приятель. О чем речь.
	AI_Output(self,other,"DIA_Mika_Key_01_04");	//Только за это ты мне заплатишь, скажем... пятьдесят золотых монет. Договорились?
	AI_Output(other,self,"DIA_Mika_Key_01_05");	//А не слишком ли много за какой-то там ключ?
	AI_Output(self,other,"DIA_Mika_Key_01_06");	//Дешевле я тебе его не отдам. Так что если он тебе действительно нужен, то придется раскошелиться.
	B_LogEntry(TOPIC_Constantino_LostKey,"Ключ Константино нашел Мика. Но он отдаст его мне только за полсотни монет.");
};

instance DIA_Mika_KeyDone(C_Info)
{
	npc = Mil_337_Mika;
	nr = 8;
	condition = DIA_Mika_KeyDone_Condition;
	information = DIA_Mika_KeyDone_Info;
	permanent = TRUE;
	description = "Давай сюда ключ.";
};

func int DIA_Mika_KeyDone_Condition()
{
	if((MIS_Constantino_LostKey == LOG_Running) && (MikaGiveKey == FALSE) && (Npc_KnowsInfo(other,DIA_Mika_Key) == TRUE) && (MikaHaveKey == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Mika_KeyDone_Info()
{
	AI_Output(other,self,"DIA_Mika_KeyDone_01_00");	//Давай сюда ключ.
	AI_Output(self,other,"DIA_Mika_KeyDone_01_01");	//А деньги?

	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		Npc_RemoveInvItems(self,ItMi_Gold,50);
		AI_Output(other,self,"DIA_Mika_KeyDone_01_02");	//Вот, тут полсотни золотых монет.
		AI_Output(self,other,"DIA_Mika_KeyDone_01_03");	//Хорошо. Тогда держи свой ключ.
		B_GiveInvItems(self,other,ItKe_Constantino,1);
		AI_Output(self,other,"DIA_Mika_KeyDone_01_04");	//Честная сделка, не правда ли?
		AI_Output(other,self,"DIA_Mika_KeyDone_01_05");	//Да уж.
		MikaGiveKey = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Mika_KeyDone_01_06");	//У меня пока нет столько денег.
		AI_Output(self,other,"DIA_Mika_KeyDone_01_07");	//Тогда найди их. А ключ пока побудет у меня.
	};
};

instance DIA_Mika_Werewolf(C_Info)
{
	npc = Mil_337_Mika;
	nr = 3;
	condition = DIA_Mika_Werewolf_Condition;
	information = DIA_Mika_Werewolf_Info;
	permanent = FALSE;
	description = "Ты что-нибудь слышал о нападениях на людей в последнее время?";
};

func int DIA_Mika_Werewolf_Condition()
{
	if(MIS_WolfAndMan == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Mika_Werewolf_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Mika_Werewolf_01_00");	//Ты что-нибудь слышал о нападениях на людей в последнее время?
	AI_Output(self,other,"DIA_Mika_Werewolf_01_01");	//Да, было дело. Недавно на ферме Акила какой-то зверь задрал одного из крестьян.
	AI_Output(other,self,"DIA_Mika_Werewolf_01_02");	//Вы что-то предприняли по этому случаю?
	AI_Output(self,other,"DIA_Mika_Werewolf_01_03");	//Ну, лорд Андрэ отправил туда несколько своих парней.
	AI_Output(self,other,"DIA_Mika_Werewolf_01_04");	//Но кроме следов крови и разорванной одежды они там ничего не нашли. 
	AI_Output(self,other,"DIA_Mika_Werewolf_01_05");	//По всей видимости, монстр унес свою добычу далеко в лес.
	B_LogEntry(TOPIC_WolfAndMan,"По словам Мики, недавно какой-то зверь задрал одного из крестьян на ферме Акила.");
};


//----------------------охрана----------------------------------------

const string Mil_360_Checkpoint = "NW_CASTLEMINE_PATH_02";

instance DIA_Mil_360_Miliz_EXIT(C_Info)
{
	npc = Mil_360_Miliz;
	nr = 999;
	condition = DIA_Mil_360_Miliz_EXIT_Condition;
	information = DIA_Mil_360_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_360_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_360_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_360_Miliz_FirstWarn(C_Info)
{
	npc = Mil_360_Miliz;
	nr = 1;
	condition = DIA_Mil_360_Miliz_FirstWarn_Condition;
	information = DIA_Mil_360_Miliz_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_360_Miliz_FirstWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (PasswordSet == FALSE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_360_Miliz_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_360_Miliz_FirstWarn_03_00");	//СТОЙ!
	AI_Output(self,other,"DIA_Mil_360_Miliz_FirstWarn_03_01");	//Дальше прохода нет! Это частные владения!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_360_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_360_Miliz_SecondWarn(C_Info)
{
	npc = Mil_360_Miliz;
	nr = 2;
	condition = DIA_Mil_360_Miliz_SecondWarn_Condition;
	information = DIA_Mil_360_Miliz_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_360_Miliz_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (PasswordSet == FALSE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_360_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_360_Miliz_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_360_Miliz_SecondWarn_03_00");	//Я последний раз предупреждаю тебя. Еще один шаг - и ты познакомишься с моим мечом.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_360_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_360_Miliz_Attack(C_Info)
{
	npc = Mil_360_Miliz;
	nr = 3;
	condition = DIA_Mil_360_Miliz_Attack_Condition;
	information = DIA_Mil_360_Miliz_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_360_Miliz_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (PasswordSet == FALSE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_360_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_360_Miliz_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_360_Miliz_Attack_03_00");	//Ты сам напросился...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

instance DIA_Mil_360_Miliz_FirstInTower(C_Info)
{
	npc = Mil_360_Miliz;
	nr = 3;
	condition = DIA_Mil_360_Miliz_FirstInTower_condition;
	information = DIA_Mil_360_Miliz_FirstInTower_info;
	permanent = TRUE;
	description = "Спокойно! Вот документы.";
};

func int DIA_Mil_360_Miliz_FirstInTower_condition()
{
	if((PasswordSet == FALSE) && (Npc_HasItems(other,ItWr_HagenLoanDocs) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Mil_360_Miliz_FirstInTower_info()
{
	AI_Output(other,self,"DIA_Mil_360_Miliz_FirstInTower_15_00");	//Спокойно! Вот документы.
	B_GiveInvItems(other,self,ItWr_HagenLoanDocs,1);
	AI_Output(self,other,"DIA_Mil_360_Miliz_FirstInTower_15_01");	//Ну давай взглянем на них.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Mil_360_Miliz_FirstInTower_15_02");	//Хммм... Вроде все в порядке! Так значит, это ты новый владелец?
	B_GiveInvItems(self,other,ItWr_HagenLoanDocs,1);
	AI_Output(other,self,"DIA_Mil_360_Miliz_FirstInTower_15_03");	//Там все написано. А теперь впусти меня в мою башню!
	AI_Output(self,other,"DIA_Mil_360_Miliz_FirstInTower_15_04");	//Конечно, проходи. Будут еще какие-нибудь распоряжения?
	AI_Output(other,self,"DIA_Mil_360_Miliz_FirstInTower_15_05");	//Хммм... Возможно, в дальнейшем сюда будут приходить другие люди. Ты будешь спрашивать у них пароль.
	AI_Output(other,self,"DIA_Mil_360_Miliz_FirstInTower_15_06");	//Паролем будет фраза - 'Драконовы сокровища'. Всех, кто будет знать пароль, ты пропустишь. Остальных - нет!
	AI_Output(self,other,"DIA_Mil_360_Miliz_FirstInTower_15_07");	//Хорошо. Будет сделано!
	PasswordSet = TRUE;
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Guard");
	B_StartOtherRoutine(Mil_361_Miliz,"Guard");
};

instance DIA_Mil_360_Miliz_PERM(C_Info)
{
	npc = Mil_360_Miliz;
	nr = 1;
	condition = DIA_Mil_360_Miliz_PERM_Condition;
	information = DIA_Mil_360_Miliz_PERM_Info;
	permanent = TRUE;
	description = "Как дела?";
};

func int DIA_Mil_360_Miliz_PERM_Condition()
{
	if(PasswordSet == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mil_360_Miliz_PERM_Info()
{
	AI_Output(other,self,"DIA_Mil_360_Miliz_PERM_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Mil_360_Miliz_PERM_03_01");	//Все хорошо, друг!
};

instance DIA_Mil_361_Miliz_EXIT(C_Info)
{
	npc = Mil_361_Miliz;
	nr = 999;
	condition = DIA_Mil_361_Miliz_EXIT_Condition;
	information = DIA_Mil_361_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_361_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_361_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_361_Miliz_Hallo(C_Info)
{
	npc = Mil_361_Miliz;
	nr = 2;
	condition = DIA_Mil_361_Miliz_Hallo_Condition;
	information = DIA_Mil_361_Miliz_Hallo_Info;
	permanent = TRUE;
	description = "Как дела?";
};

func int DIA_Mil_361_Miliz_Hallo_Condition()
{
	if(PasswordSet == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mil_361_Miliz_Hallo_Info()
{
	AI_Output(other,self,"DIA_Mil_309_Stadtwache_Hallo_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_01");	//Все в порядке! Но мы должны быть настороже.
};

instance DIA_Mil_363_Miliz_EXIT(C_Info)
{
	npc = Mil_363_Miliz;
	nr = 999;
	condition = DIA_Mil_363_Miliz_EXIT_Condition;
	information = DIA_Mil_363_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_363_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_363_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_362_Miliz_EXIT(C_Info)
{
	npc = Mil_362_Miliz;
	nr = 999;
	condition = DIA_Mil_362_Miliz_EXIT_Condition;
	information = DIA_Mil_362_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_362_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_362_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};