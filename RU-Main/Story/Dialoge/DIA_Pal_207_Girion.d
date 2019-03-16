
instance DIA_Girion_EXIT(C_Info)
{
	npc = Pal_207_Girion;
	nr = 999;
	condition = DIA_Girion_EXIT_Condition;
	information = DIA_Girion_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Girion_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Girion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Girion_Hallo(C_Info)
{
	npc = Pal_207_Girion;
	nr = 2;
	condition = DIA_Girion_Hallo_Condition;
	information = DIA_Girion_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Girion_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ShipIsFree == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_Hallo_Info()
{
	AI_Output(self,other,"DIA_Girion_Hallo_08_00");	//Я Гирион, мастер боя двуручным оружием и паладин короля. По какому поводу ты беспокоишь меня?
};


instance DIA_Girion_CanTeach(C_Info)
{
	npc = Pal_207_Girion;
	nr = 5;
	condition = DIA_Girion_CanTeach_Condition;
	information = DIA_Girion_CanTeach_Info;
	permanent = TRUE;
	description = "Ты можешь обучить меня?";
};


func int DIA_Girion_CanTeach_Condition()
{
	if(Girion_Teach2H == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Girion_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Girion_CanTeach_15_00");	//Ты можешь обучить меня?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_01");	//Это хорошо, что ты хочешь обучиться самому благородному из всех боевых стилей. Как и подобает настоящему воину Инноса.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_02");	//Я обучу тебя. Обратись ко мне, когда будешь готов.
		Girion_Teach2H = TRUE;
		B_LogEntry(TOPIC_CityTeacher,"Паладин Гирион может обучить меня искусству сражения двуручным оружием.");
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_03");	//Если ты хочешь обучиться чему-нибудь, тебе лучше поискать учителя не из нашего ордена.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_04");	//Я воин, а не учитель.
	};
};


instance DIA_Girion_Teach(C_Info)
{
	npc = Pal_207_Girion;
	nr = 100;
	condition = DIA_Girion_Teach_Condition;
	information = DIA_Girion_Teach_Info;
	permanent = TRUE;
	description = "Я готов к обучению.";
};


var int DIA_Girion_Teach_permanent;

func int DIA_Girion_Teach_Condition()
{
	if((Girion_Teach2H == TRUE) && (DIA_Girion_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};


var int girion_merk2h;

func void DIA_Girion_Teach_Info()
{
	girion_merk2h = other.HitChance[NPC_TALENT_2H];
	AI_Output(other,self,"DIA_Girion_Teach_15_00");	//Я готов к обучению.
	Info_ClearChoices(DIA_Girion_Teach);
	Info_AddChoice(DIA_Girion_Teach,Dialog_Back,DIA_Girion_Teach_Back);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_Teach_2H_1);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_Teach_2H_5);
};

func void DIA_Girion_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_00");	//Вообще-то говоря, твое обучение еще не завершено, но я больше ничему не могу научить тебя.
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_01");	//Если ты хочешь отточить свое мастерство еще больше, тебе лучше поискать настоящего мастера меча.
		AI_Output(other,self,"DIA_DIA_Girion_Teach_15_02");	//Где мне найти такого человека?
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_03");	//Лорд Хаген - мастер-мечник. Он, наверняка сможет обучить тебя.
		DIA_Girion_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Girion_Teach);
};

func void DIA_Girion_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90);
	if(other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if(Girion_Labercount == 0)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_00");	//Сражайся с честью. Бой - наша жизнь, а что за жизнь без чести?
		};
		if(Girion_Labercount == 1)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_01");	//Будь осторожен и быстр в бою. Удивляй своего противника.
		};
		if(Girion_Labercount == 2)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_02");	//Никогда не вступай в бой неподготовленным. Неизвестно, сколько он будет длиться.
		};
		if(Girion_Labercount == 3)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_03");	//Паладин всегда готов к бою. Но никогда не начинает бой, в котором не может победить.
		};
		Girion_Labercount = Girion_Labercount + 1;
		if(Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;
		};
	};
	Info_ClearChoices(DIA_Girion_Teach);
	Info_AddChoice(DIA_Girion_Teach,Dialog_Back,DIA_Girion_Teach_Back);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_Teach_2H_1);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_Teach_2H_5);
};

func void DIA_Girion_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90);
	if(other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if(Girion_Labercount == 0)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_00");	//Паладин сражается не только мечом, но и головой.
		};
		if(Girion_Labercount == 1)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_01");	//Ты должен понимать, когда лучше отступить.
		};
		if(Girion_Labercount == 2)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_02");	//Помни, если ты сражаешься хорошо, ты контролируешь своего противника и не даешь ему шанса контролировать себя.
		};
		if(Girion_Labercount == 3)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_03");	//Отступление - это всегда потеря.
		};
		Girion_Labercount = Girion_Labercount + 1;
		if(Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;
		};
	};
	Info_ClearChoices(DIA_Girion_Teach);
	Info_AddChoice(DIA_Girion_Teach,Dialog_Back,DIA_Girion_Teach_Back);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_Teach_2H_1);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_Teach_2H_5);
};


instance DIA_Girion_CATCHPLAYERSTOLENSHIP(C_Info)
{
	npc = Pal_207_Girion;
	nr = 5;
	condition = DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition;
	information = DIA_Girion_CATCHPLAYERSTOLENSHIP_Info;
	important = TRUE;
};


func int DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition()
{
	if((Kapitel >= 5) && (MIS_ShipIsFree == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_25") < 1000) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_Info()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00");	//Эй! Ты можешь сказать мне, что ты делаешь здесь?
	Info_ClearChoices(DIA_Girion_CATCHPLAYERSTOLENSHIP);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP,"Я не знаю, о чем ты говоришь.",DIA_Girion_CATCHPLAYERSTOLENSHIP_no);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP,"Прочь с моей дороги, или мне придется убить тебя.",DIA_Girion_CATCHPLAYERSTOLENSHIP_weg);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP,"Мне нужен этот корабль.",DIA_Girion_CATCHPLAYERSTOLENSHIP_ship);
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_no()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00");	//Я не знаю, о чем ты говоришь.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01");	//Я говорю о том, что ты сделал с корабельной стражей. Это дело плохо пахнет.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02");	//Даже несмотря на то, что ты маг, я не доверяю тебе.
	};
};


var int Girion_WantstoKillSC;

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_weg()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00");	//Прочь с моей дороги, или мне придется убить тебя.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01");	//Возможно, тебе удалось обмануть охрану корабля, но со мной тебе так просто не справиться, мой маленький друг.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02");	//Даже хотя ты один из нас, это не дает тебе права воровать собственность короля. Умри, проклятый предатель.
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Girion_WantstoKillSC = TRUE;
};

func void B_GirionStayOnShip()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09");	//Когда мы покончим с этим делом, ты вернешь этот корабль обратно мне, понятно?
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_ship()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00");	//Мне нужен твой корабль. И я заберу его.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01");	//Ты не можешь сделать это. Транспортировка руды...
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02");	//Как ты смеешь?! Ты, вонючее отродье...
	};
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03");	//Руды в Долине Рудников недостаточно, чтобы удовлетворить потребности короля. Я был там. Там нечего делать. Миссия Хагена - фарс чистой воды.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04");	//Настоящий враг пустил свои корни на острове неподалеку отсюда. Я поплыву туда и положу конец этому всему.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05");	//Либо присоединяйся ко мне, либо мне придется разделаться с тобой. Выбирай.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06");	//М-м-м. Похоже, у меня нет выбора.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07");	//Правильно.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08");	//Ладно, хорошо. Я присоединюсь к тебе, но при одном условии.
	B_GirionStayOnShip();
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10");	//Я переживу это.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11");	//Тогда делай то, что должен. А я подожду тебя здесь.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	Crewmember_Count = Crewmember_Count + 1;
	Girion_IsOnBoard = LOG_SUCCESS;
};


instance DIA_Girion_Verrat(C_Info)
{
	npc = Pal_207_Girion;
	nr = 2;
	condition = DIA_Girion_Verrat_Condition;
	information = DIA_Girion_Verrat_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Girion_Verrat_Condition()
{
	if((Girion_WantstoKillSC == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_Verrat_Info()
{
	AI_Output(self,other,"DIA_Girion_Verrat_08_00");	//Предатель!
	AI_StopProcessInfos(self);
	self.aivar[AIV_DropDeadAndKill] = TRUE;
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Girion_OnShip(C_Info)
{
	npc = Pal_207_Girion;
	nr = 2;
	condition = DIA_Girion_OnShip_Condition;
	information = DIA_Girion_OnShip_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Girion_OnShip_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Girion_IsOnBoard == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_OnShip_Info()
{
	B_GirionStayOnShip();
	AI_StopProcessInfos(self);
};


instance DIA_Girion_PICKPOCKET(C_Info)
{
	npc = Pal_207_Girion;
	nr = 900;
	condition = DIA_Girion_PICKPOCKET_Condition;
	information = DIA_Girion_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Girion_PICKPOCKET_Condition()
{
	return C_Beklauen(73,280);
};

func void DIA_Girion_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
	Info_AddChoice(DIA_Girion_PICKPOCKET,Dialog_Back,DIA_Girion_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Girion_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Girion_PICKPOCKET_DoIt);
};

func void DIA_Girion_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
};

func void DIA_Girion_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
};


instance DIA_GIRION_NW_KAPITELORCATTACK(C_Info)
{
	npc = Pal_207_Girion;
	nr = 1;
	condition = dia_girion_nw_kapitelorcattack_condition;
	information = dia_girion_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Ты уже слышал - город захвачен!";
};


func int dia_girion_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (GIRIONBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_girion_nw_kapitelorcattack_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Girion_NW_KapitelOrcAttack_01_00");	//Ты уже слышал? Город захвачен!
	AI_Output(self,other,"DIA_Girion_NW_KapitelOrcAttack_01_01");	//(печально) Слышал. И очень сожалею, что меня не было в тот момент рядом с моими братьями.
	AI_Output(self,other,"DIA_Girion_NW_KapitelOrcAttack_01_03");	//Им нужна была моя помощь! А я их подвел...(обреченно)
	AI_Output(self,other,"DIA_Girion_NW_KapitelOrcAttack_01_06");	//Я готов отдать свою жизнь во славу Инноса и его величия. В особенности, сражаясь с такими мерзкими тварями, как эти орки!
	AI_Output(other,self,"DIA_Girion_NW_KapitelOrcAttack_01_07");	//Уверен, что у тебя еще будет хороший шанс доказать это.
	AI_Output(self,other,"DIA_Girion_NW_KapitelOrcAttack_01_11");	//Да. Я слышал, что несколько парней решили пробиваться из города с боем. Я решил к ним присоединиться!
	AI_Output(self,other,"DIA_Girion_NW_KapitelOrcAttack_01_12");	//Это хорошая возможность отомстить оркам за смерть моих братьев.
	AI_Output(other,self,"DIA_Girion_NW_KapitelOrcAttack_01_16");	//Тогда удачи тебе, Гирион! Надеюсь, что мы еще встретимся.
	B_LogEntry(TOPIC_HELPCREW,"Я не стал отговаривать паладина Гириона от его идеи выбираться из города через толпы орков. Похоже, после всего случившегося он просто сам ищет себе смерть! К таким людям обычно смерть равнодушна.");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	GIRIONBATTLETHROUGTH = TRUE;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_PAL_207_GIRION_FUCKOFF(C_Info)
{
	npc = Pal_207_Girion;
	nr = 2;
	condition = dia_pal_207_girion_fuckoff_condition;
	information = dia_pal_207_girion_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_207_girion_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GIRIONCAPTURED == TRUE) && (HORINISISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_207_girion_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_PAL_207_GIRION_YOURFREE(C_Info)
{
	npc = Pal_207_Girion;
	nr = 1;
	condition = dia_pal_207_girion_yourfree_condition;
	information = dia_pal_207_girion_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_207_girion_yourfree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GIRIONCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_207_girion_yourfree_info()
{
	AI_Output(self,other,"DIA_Pal_207_Girion_YourFree_01_08");	//(удивленно) Иннос праведный! Что все это значит?
	AI_Output(other,self,"DIA_Pal_207_Girion_YourFree_01_00");	//Ты свободен!
	AI_Output(self,other,"DIA_Pal_207_Girion_YourFree_01_01");	//Не может быть! Ты что, разобрался с орками в городе?
	AI_Output(other,self,"DIA_Pal_207_Girion_YourFree_01_02");	//Да, именно так.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other,"DIA_Pal_207_Girion_YourFree_01_03");	//Слава Инносу! Мы уж и не надеялись на спасение.
		AI_Output(self,other,"DIA_Pal_207_Girion_YourFree_01_04");	//Открой же скорее решетки, выпусти нас!
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_207_Girion_YourFree_01_05");	//Слава Инносу! Я уж и не надеялся на спасение.
		AI_Output(self,other,"DIA_Pal_207_Girion_YourFree_01_06");	//Открой же скорее решетку, выпусти меня!
	};
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_207_GIRION_OPENGATENOW(C_Info)
{
	npc = Pal_207_Girion;
	nr = 1;
	condition = dia_pal_207_girion_opengatenow_condition;
	information = dia_pal_207_girion_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_207_girion_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GIRIONCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (GIRIONISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_207_girion_opengatenow_info()
{
	AI_Output(self,other,"DIA_Pal_207_Girion_OpenGateNow_01_00");	//Давай уже! Открой эту решетку!
	AI_StopProcessInfos(self);
};

